#include "mapmanager.hpp"

MapManager::MapManager()
{
    // m_Vertex_Cnt = 0;
    m_optimizer_ptr = std::make_unique<g2o::SparseOptimizer>();
    g2o::OptimizationAlgorithmLevenberg* solver;
    solver = new g2o::OptimizationAlgorithmLevenberg(
        std::make_unique<g2o::BlockSolver_6_3>(std::make_unique<g2o::LinearSolverCholmod<g2o::BlockSolver_6_3::PoseMatrixType>>()));
    m_optimizer_ptr->setAlgorithm(solver);
    m_optimizer_ptr->setVerbose(false);
    std::cout<<"Create Mapmanager success.\n";
}

MapManager::~MapManager()
{
    std::cout<<"Deconstruct Mapmanager success.\n";
}

void MapManager::startOptimal()
{
    g2o::CameraParameters* camera = new g2o::CameraParameters( 
        m_CamL_Intrinsic(0, 0), 
        Eigen::Vector2d(m_CamL_Intrinsic(0, 2), 
        m_CamL_Intrinsic(1, 2)), 0 );
    camera->setId(0);
    m_optimizer_ptr->addParameter( camera );
    std::thread t = std::thread([this](){
        while(1)
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(200));
            if(m_keyframes.size()==0)
            {
                std::this_thread::sleep_for(std::chrono::milliseconds(10));
                continue;
            }
            m_optimizer_ptr->clear();
            int start = 0;
            int end = m_keyframes.size() - 1;
            if(m_keyframes.size()<10)start = 0;
            else start = m_keyframes.size() - 10;
            std::vector<g2o::VertexSE3Expmap*> vcs;
            std::vector<g2o::EdgeProjectXYZ2UV*> edges;
            
            for(int i = start ; i < m_keyframes.size(); i++)
            {
                g2o::VertexSE3Expmap* vc = new g2o::VertexSE3Expmap();
                vcs.emplace_back(vc);
                vc->setId(i);
                // m_Vertex_Cnt ++;
                std::cout<<m_keyframes[i].m_Tc0ccur<<std::endl;
                vc->setEstimate(g2o::SE3Quat(m_keyframes[i].m_Tc0ccur.block(0, 0, 3, 3), m_keyframes[i].m_Tc0ccur.topRightCorner<3, 1>()));
                // if(i == start)vc->setFixed(true);
                m_optimizer_ptr->addVertex(vc);
                for(int j = 0 ;j < m_keyframes[i].m_kf_feats_l.size(); j ++)
                {
                    int idx = m_keyframes[i].m_kf_feats_l[j].corespondPCLIdx;
                    if(idx == -1)continue;
                    g2o::VertexPointXYZ* vp = new g2o::VertexPointXYZ();
                    vp->setId(j+i*j);
                    pcl::PointXYZ p = m_global_PCL[idx];
                    vp->setEstimate(Eigen::Vector3d(p.x, p.y, p.z));
                    vp->setFixed(true);
                    vp->setMarginalized(true);
                    m_optimizer_ptr->addVertex(vp);
                    g2o::EdgeProjectXYZ2UV* edge = new g2o::EdgeProjectXYZ2UV();
                    edge->setInformation(Eigen::Matrix2d::Identity());
                    edge->setMeasurement(m_keyframes[i].m_kf_feats_l[j].ptl);
                    edge->setVertex(0, dynamic_cast<g2o::VertexPointXYZ*>(vp));
                    edge->setVertex(1, dynamic_cast<g2o::VertexSE3Expmap*>(vc));
                    edge->setRobustKernel(new g2o::RobustKernelHuber());
                    edge->setParameterId(0, 0);
                    m_optimizer_ptr->addEdge(edge);
                    edges.push_back(edge);
                }
            }

            m_optimizer_ptr->initializeOptimization();
            m_optimizer_ptr->optimize(6);
            // std::cout<<"vcs size: "<<vcs.size()<<std::endl;
            std::cout<<"backend:\n"<<vcs[0]->estimate().rotation().matrix()<<"\n"<<vcs[0]->estimate().translation()<<std::endl;
            // }
        }
    });
    t.detach();
}

void MapManager::insertKF(KeyFrame& kf)
{
    m_kf_mtx.lock();
    kf.m_KFID = m_KFCount;
    m_keyframes[m_KFCount] = kf;
    m_curKFIdx = m_KFCount;
    triangulatePointsOnCamLCurKF();
    m_KFCount ++;
    m_kf_mtx.unlock();
}

void MapManager::getLastRTFrameImgAndFeats(cv::Mat& img, cv::Mat& img_bgr, std::vector<RealTimeFrameFeature>& realf_feat_l)
{
    m_keyframes[m_curKFIdx].m_rtf_mtx.lock();
    img = m_keyframes[m_curKFIdx].m_img_l_realf;
    realf_feat_l = m_keyframes[m_curKFIdx].m_realf_feats_l;
    img_bgr = m_keyframes[m_curKFIdx].m_img_l_realf_bgr;
    m_keyframes[m_curKFIdx].m_rtf_mtx.unlock();
}

void MapManager::updateFrame(cv::Mat& img,  cv::Mat& img_bgr, std::vector<RealTimeFrameFeature>& realf_feat_l)
{
    m_keyframes[m_curKFIdx].m_rtf_mtx.lock();
    m_keyframes[m_curKFIdx].m_img_l_realf = img;
    m_keyframes[m_curKFIdx].m_realf_feats_l = realf_feat_l;
    m_keyframes[m_curKFIdx].m_img_l_realf_bgr = img_bgr;
    m_keyframes[m_curKFIdx].m_rtf_mtx.unlock();
}

void MapManager::updateUsefulRTFrame(Eigen::Vector3d& gps_position, long long timecode)
{
    m_keyframes[m_curKFIdx].m_rtf_mtx.lock();
    RTFrame f;
    f.gps_position = gps_position;
    f.realf_feats_l = m_keyframes[m_curKFIdx].m_realf_feats_l;
    f.Tc0crt = m_keyframes[m_curKFIdx].m_Tc0crt;
    f.timecode = timecode;
    m_keyframes[m_curKFIdx].m_UseFul_RTFrames.push_back(f);
    if(m_keyframes[m_curKFIdx].m_UseFul_RTFrames.size() > 20)m_keyframes[m_curKFIdx].m_UseFul_RTFrames.erase(m_keyframes[m_curKFIdx].m_UseFul_RTFrames.begin());
    m_keyframes[m_curKFIdx].m_rtf_mtx.unlock();
}

KeyFrame& MapManager::curKeyFrame()
{
    return m_keyframes[m_curKFIdx];
}

void MapManager::setCamParameter(Eigen::Matrix4d& Trl, Eigen::Matrix4d& caml_intrinsic, Eigen::Matrix4d& camr_intrinsic, Eigen::Vector4d& caml_distor, Eigen::Vector4d& cmar_distor)
{
    m_Cam_Trl = Trl;
    m_CamL_Intrinsic = caml_intrinsic;
    m_CamR_Intrinsic = camr_intrinsic;
    m_CamL_Distor = caml_distor;
    m_CamR_Distor = cmar_distor;
}

void MapManager::distortion(const Eigen::Vector2d &p_u, Eigen::Vector2d &d_u, bool is_caml) const
{
    double k1 = m_CamL_Distor[0];
    double k2 = m_CamL_Distor[1];
    double p1 = m_CamL_Distor[2];
    double p2 = m_CamL_Distor[3];
    if(!is_caml)
    {
        k1 = m_CamR_Distor[0];
        k2 = m_CamR_Distor[1];
        p1 = m_CamR_Distor[2];
        p2 = m_CamR_Distor[3];
    }

    double mx2_u, my2_u, mxy_u, rho2_u, rad_dist_u;

    mx2_u = p_u(0) * p_u(0); //x^2
    my2_u = p_u(1) * p_u(1); //y^2
    mxy_u = p_u(0) * p_u(1); //xy
    rho2_u = mx2_u + my2_u;  //r^2=x^2+y^2
    rad_dist_u = k1 * rho2_u + k2 * rho2_u * rho2_u; // k1 * r^2 + k2 * r^4
    d_u << p_u(0) * rad_dist_u + 2.0 * p1 * mxy_u + p2 * (rho2_u + 2.0 * mx2_u),// \Delta x = x(k1 * r^2 + k2 * r^4)+2 * p1 * xy +p2(r^2+2x^2)
    p_u(1) * rad_dist_u + 2.0 * p2 * mxy_u + p1 * (rho2_u + 2.0 * my2_u);   // \Delta y = y(k1 * r^2 + k2 * r^4)+2 * p2 * xy +p1(r^2+2y^2)
}

//输入是一个二维的像素坐标，输出是一个三维的无畸变的归一化坐标
void MapManager::liftProjective(const Eigen::Vector2d &p, Eigen::Vector3d &P, bool is_caml) const
{
    double mx_d, my_d, mx2_d, mxy_d, my2_d, mx_u, my_u;
    double rho2_d, rho4_d, radDist_d, Dx_d, Dy_d, inv_denom_d;
    // double lambda;
    // Lift points to normalised plane
    // 这里的mx_d和my_d就是最初的、有畸变的归一化坐标[x_d,y_d]^T
    mx_d = (p[0] - m_CamL_Intrinsic(0, 2)) / m_CamL_Intrinsic(0, 0);
    my_d = (p[1] - m_CamL_Intrinsic(1, 2)) / m_CamL_Intrinsic(1, 1); // y_d = (v - cy)/ fy
    // 递归失真模型
    int n = 8; //迭代8次
    Eigen::Vector2d d_u;
    // distortion()函数的作用是计算公式 \Delta x 和 \Delta x; d_u=[\Delta x,\Delta y]
    distortion(Eigen::Vector2d(mx_d, my_d), d_u, is_caml);
    // 近似值
    // 此处的mx_d和my_d相当A_d，它们在迭代过程保持不变
    mx_u = mx_d - d_u(0); //x = x_d - \Delta x
    my_u = my_d - d_u(1); //y = y_d - \Delta y
    for (int i = 1; i < n; ++i)
    { //上面已经迭代了1次，for循环中迭代7次
        distortion(Eigen::Vector2d(mx_u, my_u), d_u, is_caml);  
        mx_u = mx_d - d_u(0);
        my_u = my_d - d_u(1);
    }
    // Obtain a projective ray
    P << mx_u, my_u, 1.0;
}

void MapManager::triangulatePointsOnCamLCurKF()
{
    // auto t_a = std::chrono::high_resolution_clock::now();
    cv::Mat disparity_sgbm(m_keyframes[m_curKFIdx].m_img_l.size(), CV_16S);
    cv::cuda::GpuMat cudaDisparityMap(m_keyframes[m_curKFIdx].m_img_l.size(), CV_16S);
    cv::cuda::GpuMat cudaDrawColorDisparity(m_keyframes[m_curKFIdx].m_img_l.size(), CV_8UC4);
    cv::cuda::GpuMat cudaLeftFrame, cudaRightFrame;
    cudaLeftFrame.upload(m_keyframes[m_curKFIdx].m_img_l);
    cudaRightFrame.upload(m_keyframes[m_curKFIdx].m_img_r);
    m_sgbm_ptr->compute(cudaLeftFrame, cudaRightFrame, cudaDisparityMap);
    cudaDisparityMap.download(disparity_sgbm);
    // Eigen::Matrix4d Tl = Eigen::Matrix4d::Identity();
    cv::Mat disparity;
    disparity_sgbm.convertTo(disparity, CV_32F, 1.0 / 16.0f);
    // auto t_b = std::chrono::high_resolution_clock::now();
    // std::cout<<"with cuda:"<< std::chrono::duration_cast<std::chrono::milliseconds>(t_b-t_a).count()<<"ms"<<std::endl;
    // cv::imwrite("disparity.jpg", disparity_sgbm);
    for(int i = 0 ; i < m_keyframes[m_curKFIdx].m_kf_feats_l.size();i++)
    {
        if(m_keyframes[m_curKFIdx].m_kf_feats_l[i].corespondPCLIdx != -1)continue;
        double ptl_x = m_keyframes[m_curKFIdx].m_kf_feats_l[i].ptl.x();
        double ptl_y = m_keyframes[m_curKFIdx].m_kf_feats_l[i].ptl.y();
        double depth = 0.301922 * 833.8 / disparity.at<float>(ptl_y, ptl_x);
        if(depth > 50 || depth < 0.1)continue;
        // std::cout<<"disp: "<<disparity.at<float>(ptl_y, ptl_x)<<" depth: "<<depth<<std::endl;
        Eigen::Vector4d p3d;
        p3d[0] = (ptl_x - m_CamL_Intrinsic(0, 2)) / m_CamL_Intrinsic(0, 0) * depth;
        p3d[1] = (ptl_y - m_CamL_Intrinsic(1, 2)) / m_CamL_Intrinsic(1, 1) * depth;
        p3d[2] = depth;
        p3d[3] = 1.0;
        // std::cout<<"ptl: "<<ptl_x<<" "<<ptl_y<<", "<<p3d.transpose()<<std::endl;
        Eigen::Vector4d cam0_p3d = m_keyframes[m_curKFIdx].m_Tc0ccur * p3d;
        m_global_PCL.emplace_back(cam0_p3d.x(), cam0_p3d.y(), cam0_p3d.z());
        m_keyframes[m_curKFIdx].m_kf_feats_l[i].corespondPCLIdx = m_global_PCL.size() - 1;
        m_pcl_is_optimal.emplace_back(false);     
        // g2o::VertexPointXYZ* vp = new g2o::VertexPointXYZ();
        // vp->setId(m_Vertex_Cnt);
        // vp->setEstimate(Eigen::Vector3d(p3d[0], p3d[1], p3d[2]));
        // m_Vertex_Cnt ++;
        // m_pcl_coresponed_vertexs_id.emplace_back(m_Vertex_Cnt);
        // m_pcl_coresponed_vertexs.emplace_back(vp);
        // if(m_keyframes[m_curKFIdx].m_kf_feats_l[i].ptr.x() == 0)continue;
        // double ptl_x = m_keyframes[m_curKFIdx].m_kf_feats_l[i].ptl.x();
        // double ptl_y = m_keyframes[m_curKFIdx].m_kf_feats_l[i].ptl.y();
        // double ptr_x = m_keyframes[m_curKFIdx].m_kf_feats_l[i].ptr.x();
        // double ptr_y = m_keyframes[m_curKFIdx].m_kf_feats_l[i].ptr.y();
        // Eigen::Vector3d Pl, Pr;
        // liftProjective(Eigen::Vector2d(ptl_x, ptl_y), Pl, true);
        // liftProjective(Eigen::Vector2d(ptr_x, ptr_y), Pr, true);
        // Eigen::Matrix4d design_matrix = Eigen::Matrix4d::Zero();
        // design_matrix.row(0) = Pl[0]*Tl.row(2) - Tl.row(0);
        // design_matrix.row(1) = Pl[1]*Tl.row(2) - Tl.row(1);
        // design_matrix.row(2) = Pr[0]*m_Cam_Trl.row(2) - m_Cam_Trl.row(0);
        // design_matrix.row(3) = Pr[1]*m_Cam_Trl.row(2) - m_Cam_Trl.row(1);
        // Eigen::Vector4d triangulated_point;
        // triangulated_point = design_matrix.jacobiSvd(Eigen::ComputeFullV).matrixV().rightCols<1>();
        // Eigen::Vector4d point_3d;
        // point_3d(0) = triangulated_point(0) / triangulated_point(3);
        // point_3d(1) = triangulated_point(1) / triangulated_point(3);
        // point_3d(2) = triangulated_point(2) / triangulated_point(3);
        // point_3d(3) = 1.0;
        // if(point_3d(2)>0.1 && point_3d(2)<100)//960*720 0.3m base下30米远误差为<10% 50米 <16%
        // {
        //     std::cout<<ptl_x<<" "<<ptr_x<<" "<<point_3d.transpose()<<std::endl;
        //     double depth = 0.301922 * 833.8 / disparity.at<float>(ptl_y, ptl_x);
        //     std::cout<<"disp: "<<disparity.at<float>(ptl_y, ptl_x)<<" depth: "<<depth<<std::endl;
        //     Eigen::Vector4d cam0_p3d = m_keyframes[m_curKFIdx].m_Tc0ccur * point_3d;
        //     m_global_PCL.emplace_back(cam0_p3d.x(), cam0_p3d.y(), cam0_p3d.z());
        //     m_keyframes[m_curKFIdx].m_kf_feats_l[i].corespondPCLIdx = m_global_PCL.size() - 1;
        //     cv::putText(m_keyframes[m_curKFIdx].m_img_l_bgr, std::to_string(int(ptl_x)), cv::Point2f(ptl_x, ptl_y-10), 1, 2, cv::Scalar(0, 0, 255));
        //     cv::circle(m_keyframes[m_curKFIdx].m_img_l_bgr, cv::Point2f(ptl_x, ptl_y), 5, cv::Scalar(0, 0, 255), 2);
        // }
    }
    // cv::imwrite("imgl.jpg", m_keyframes[m_curKFIdx].m_img_l_bgr);
}

// void MapManager::triangulatePointsOnCamL(Eigen::Matrix4d& Tlr,
//     std::vector<Eigen::Vector2d>& pointls, std::vector<Eigen::Vector2d>& pointrs, std::vector<Eigen::Vector3d>& point_3ds)
// {
//     Eigen::Matrix4d Pose0 = Eigen::Matrix4d::Identity();
//     for(int i = 0; i < pointls.size(); i++)
//     {
//         Eigen::Vector2d point0 = pointls[i];
//         Eigen::Vector2d point1 = pointrs[i];
//         Eigen::Matrix4d design_matrix = Eigen::Matrix4d::Zero();
//         design_matrix.row(0) = point0[0] * Pose0.row(2) - Pose0.row(0);
//         design_matrix.row(1) = point0[1] * Pose0.row(2) - Pose0.row(1);
//         design_matrix.row(2) = point1[0] * Tlr.row(2) - Tlr.row(0);
//         design_matrix.row(3) = point1[1] * Tlr.row(2) - Tlr.row(1);
//         Eigen::Vector4d triangulated_point;
//         triangulated_point =
//                 design_matrix.jacobiSvd(Eigen::ComputeFullV).matrixV().rightCols<1>();
//         Eigen::Vector3d point_3d;
//         point_3d(0) = triangulated_point(0) / triangulated_point(3);
//         point_3d(1) = triangulated_point(1) / triangulated_point(3);
//         point_3d(2) = triangulated_point(2) / triangulated_point(3);
//         point_3ds.emplace_back(point_3d);
//     }
// }