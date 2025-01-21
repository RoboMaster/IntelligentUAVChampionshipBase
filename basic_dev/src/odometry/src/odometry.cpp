#include "odometry.hpp"

int main(int argc, char** argv)
{
    g_Twc0 << 0.0, 0.0, 1.0, 0.0,
        1.0, 0.0, 0.0 ,0.0, 
        0.0, 1.0, 0.0, 0.0, 
        0.0, 0.0 ,0.0, 1.0;
    g_Camera_Intrinsic_l <<
        833.8, 0.0, 481.6, 0.0,
        0.0, 835.27, 360.766, 0.0, 
        0.0, 0.0, 1.0, 0.0,
        0.0, 0.0, 0.0, 1.0;
    g_Camera_Intrinsic_r <<
        832.287, 0.0, 481.66, 0.0,
        0.0, 833.94, 359.45, 0.0, 
        0.0, 0.0, 1.0, 0.0,
        0.0, 0.0, 0.0, 1.0;
    g_Camera_Tlr<<
        1.0, 0.0,0.0, 0.301922, 
        0.0, 1.0, 0.0, -0.00150702, 
        0.0, 0.0, 1.0, 0.00211,
        0.0, 0.0, 0.0, 1.0;
    g_Camera_Trl <<
        1.0, 0.0,0.0, -0.301922,
        0.0, 1.0, 0.0, 0.00150702, 
        0.0, 0.0, 1.0, -0.00211,
        0.0, 0.0, 0.0, 1.0;
    g_Camera_Distor_l << -0.00170596, -0.00124899, 0.00007559, -0.00017225;
    g_Camera_Distor_r << -0.00567839, 0.01405329, 0.00025239, -0.00037066;
    g_map_manager.setCamParameter(g_Camera_Trl, g_Camera_Intrinsic_l, g_Camera_Intrinsic_r, g_Camera_Distor_l, g_Camera_Distor_r);
    g_map_manager.startOptimal();
    ros::init(argc, argv, "odometry"); // 初始化ros 节点，命名为 basic
    ros::NodeHandle n; // 创建node控制句柄
    image_transport::ImageTransport it(n); //创建图像传输控制句柄

    g_img_publisher = n.advertise<sensor_msgs::Image>("/display_image", 1000);
    g_cur_pcl_publisher = n.advertise<sensor_msgs::PointCloud2>("/cur_frame_pcl", 1000);
    g_local_map_pcl_publisher = n.advertise<sensor_msgs::PointCloud2>("/local_map_pcl", 1000);
    //无人机信息通过如下命令订阅，当收到消息时自动回调对应的函数
    ros::Subscriber odom_suber = n.subscribe<geometry_msgs::PoseStamped>("/airsim_node/drone_1/pose", 1, odom_local_ned_cb);//状态真值，用于赛道一
    ros::Subscriber imu_suber = n.subscribe<sensor_msgs::Imu>("airsim_node/drone_1/imu/imu", 1, imu_cb);//imu数据
    message_filters::Subscriber<sensor_msgs::Image> fl_image_suber(n, "airsim_node/drone_1/front_left/Scene", 1);
    message_filters::Subscriber<sensor_msgs::Image> fr_image_suber(n, "airsim_node/drone_1/front_right/Scene", 1);
    message_filters::Synchronizer<message_filters::sync_policies::ExactTime<sensor_msgs::Image, sensor_msgs::Image>> 
        sync_handler(message_filters::sync_policies::ExactTime<sensor_msgs::Image, sensor_msgs::Image>(10), fl_image_suber, fr_image_suber);
    sync_handler.registerCallback(std::bind(front_stereo_view_cb, std::placeholders::_1, std::placeholders::_2));
    ros::Rate loop_rate(100);
    while(ros::ok()){
        ros::spinOnce();
        loop_rate.sleep();
    }
    return 0;
}

void odom_local_ned_cb(const geometry_msgs::PoseStamped::ConstPtr& msg)
{
    Eigen::Vector3d p(msg->pose.position.x, msg->pose.position.y,msg->pose.position.z);
    g_map_manager.updateUsefulRTFrame(p, msg->header.stamp.toNSec());
}

void imu_cb(const sensor_msgs::Imu::ConstPtr& msg)
{
    // ROS_INFO("Get imu data.\n %f %f %f \n %f %f %f", msg->angular_velocity.x, msg->angular_velocity.y,
    // msg->angular_velocity.z, msg->linear_acceleration.x, msg->linear_acceleration.y, msg->linear_acceleration.z);
    double sample = gauss_dist(gen);
    imudata.imu_acc[0] = msg->linear_acceleration.x + imudata.acc_n_d*sample + (imudata.acc_w_d*sample + imudata.last_acc_w_d);
    imudata.imu_acc[1] = msg->linear_acceleration.y + imudata.acc_n_d*sample + (imudata.acc_w_d*sample + imudata.last_acc_w_d);
    imudata.imu_acc[2] = msg->linear_acceleration.z + imudata.acc_n_d*sample + (imudata.acc_w_d*sample + imudata.last_acc_w_d);
    imudata.imu_gyr[0] = msg->angular_velocity.x + imudata.gyr_n_d*sample+(imudata.gyr_w_d*sample+imudata.last_gyr_w_d);
    imudata.imu_gyr[1] = msg->angular_velocity.y + imudata.gyr_n_d*sample+(imudata.gyr_w_d*sample+imudata.last_gyr_w_d);
    imudata.imu_gyr[2] = msg->angular_velocity.z + imudata.gyr_n_d*sample+(imudata.gyr_w_d*sample+imudata.last_gyr_w_d);
    imudata.last_acc_w_d = imudata.acc_w_d*sample + imudata.last_acc_w_d;
    imudata.last_gyr_w_d = imudata.gyr_w_d*sample + imudata.last_gyr_w_d;

    imudata.phi = (imudata.last_gyr + imudata.imu_gyr)/2*(imudata.imu_delta_t);
    double phi_norm = imudata.phi.norm();
    Eigen::Matrix3d skew_sym_m_phi;
    skew_sym_m_phi << 
    0.0, -imudata.phi[2], imudata.phi[1], 
    imudata.phi[2], 0.0, -imudata.phi[0],
    -imudata.phi[1], imudata.phi[0], 0.0;
    imudata.R_i0_i1 = Eigen::Matrix3d::Identity() + sinf64(phi_norm)/phi_norm * 
            skew_sym_m_phi + (1-cosf64(phi_norm))/(phi_norm*phi_norm)*skew_sym_m_phi*skew_sym_m_phi;
    imudata.R_w_i = imudata.R_w_i * imudata.R_i0_i1;
    imudata.speed = imudata.last_speed + ((imudata.R_w_i*imudata.imu_acc+imudata.last_R_w_i*imudata.last_acc) / 2.0 + imudata.gravity_vec)*imudata.imu_delta_t;
    imudata.pos = imudata.last_pos + imudata.last_speed*imudata.imu_delta_t+ 0.5*imudata.imu_delta_t * imudata.imu_delta_t * ((imudata.R_w_i*imudata.imu_acc+imudata.last_R_w_i*imudata.last_acc) / 2.0 + imudata.gravity_vec); 

    imudata.last_R_w_i = imudata.R_w_i;
    imudata.last_gyr = imudata.imu_gyr;
    imudata.last_pos = imudata.pos;
    imudata.last_acc = imudata.imu_acc;
    imudata.last_speed = imudata.speed;

    imudata_seg.imu_mtx.lock();
    imudata_seg.imu_acc = imudata.imu_acc;
    imudata_seg.imu_gyr = imudata.imu_gyr;
    imudata_seg.last_acc_w_d = imudata_seg.acc_w_d*sample + imudata_seg.last_acc_w_d;
    imudata_seg.last_gyr_w_d = imudata_seg.gyr_w_d*sample + imudata_seg.last_gyr_w_d;
    imudata_seg.phi = (imudata_seg.last_gyr + imudata_seg.imu_gyr)/2*(imudata_seg.imu_delta_t);
    double phi_norm_seg = imudata_seg.phi.norm();
    Eigen::Matrix3d skew_sym_m_phi_seg;
    skew_sym_m_phi_seg << 
    0.0, -imudata_seg.phi[2], imudata_seg.phi[1], 
    imudata_seg.phi[2], 0.0, -imudata_seg.phi[0],
    -imudata_seg.phi[1], imudata_seg.phi[0], 0.0;
    imudata_seg.R_i0_i1 = Eigen::Matrix3d::Identity() + sinf64(phi_norm_seg)/phi_norm_seg * 
            skew_sym_m_phi_seg + (1-cosf64(phi_norm_seg))/(phi_norm_seg*phi_norm_seg)*skew_sym_m_phi_seg*skew_sym_m_phi_seg;
    imudata_seg.R_w_i = imudata_seg.R_w_i * imudata_seg.R_i0_i1;
    imudata_seg.R_i0_i1_sum = imudata_seg.R_i0_i1_sum * imudata_seg.R_i0_i1;
    imudata_seg.speed = imudata_seg.last_speed + ((imudata_seg.R_w_i*imudata_seg.imu_acc+imudata_seg.last_R_w_i*imudata_seg.last_acc) / 2.0 + imudata_seg.gravity_vec)*imudata_seg.imu_delta_t;
    imudata_seg.pos = imudata_seg.last_pos + imudata_seg.last_speed*imudata_seg.imu_delta_t+ 0.5*imudata_seg.imu_delta_t * imudata_seg.imu_delta_t * ((imudata_seg.R_w_i*imudata_seg.imu_acc+imudata_seg.last_R_w_i*imudata_seg.last_acc) / 2.0 + imudata_seg.gravity_vec); 
    imudata_seg.last_R_w_i = imudata_seg.R_w_i;
    imudata_seg.last_gyr = imudata_seg.imu_gyr;
    imudata_seg.last_pos = imudata_seg.pos;
    imudata_seg.last_acc = imudata_seg.imu_acc;
    imudata_seg.last_speed = imudata_seg.speed;


    imudata_seg.imu_mtx.unlock();
    if(msg->header.stamp.sec == 0 || msg->header.stamp.nsec==0)
    {
        std::cout<<"error, get 0 time stamp."<<std::endl;
        exit(0);
    }
}

void front_left_view_cb(const sensor_msgs::ImageConstPtr& msg)
{
    ROS_INFO("Get fl view image\n height: %d\n weight: %d\n size: %ld",
    msg->height, msg->width, msg->data.size());//图像高度宽度以及数据大小， size = height*weight*3 (8bit3通道)
}

void front_right_view_cb(const sensor_msgs::ImageConstPtr& msg)
{
    ROS_INFO("Get fr view image\n height: %d\n weight: %d\n size: %ld",
    msg->height, msg->width, msg->data.size());//图像高度宽度以及数据大小， size = height*weight*3 (8bit3通道)
}

void estimatePoseOnly(Eigen::Matrix4d& origin_T_c1c0, Eigen::Matrix4d& opt_T_c1c0, std::vector<RealTimeFrameFeature>& cur_RT_feats)
{
    std::vector<Eigen::Vector3d> cam0_frame_points;
    std::vector<Eigen::Vector2d> cur_frame_pts;
    std::vector<int> corespond_kf_pt_idxs;
    for(int i = 0; i< cur_RT_feats.size(); i++)
    {
        int kf_idx = cur_RT_feats[i].corespondKFPtIdx;
        if(g_map_manager.curKeyFrame().m_kf_feats_l[kf_idx].corespondPCLIdx != -1)
        {
            corespond_kf_pt_idxs.emplace_back(kf_idx);
            cur_frame_pts.emplace_back(cur_RT_feats[i].pt);
            int pcl_idx = g_map_manager.curKeyFrame().m_kf_feats_l[kf_idx].corespondPCLIdx;
            double p_kf_cur_x = g_map_manager.curKeyFrame().m_Tccurc0(0, 0) * g_map_manager.m_global_PCL[pcl_idx].x + g_map_manager.curKeyFrame().m_Tccurc0(0, 1) * g_map_manager.m_global_PCL[pcl_idx].y
                + g_map_manager.curKeyFrame().m_Tccurc0(0, 2) * g_map_manager.m_global_PCL[pcl_idx].z + g_map_manager.curKeyFrame().m_Tccurc0(0, 3);
            double p_kf_cur_y = g_map_manager.curKeyFrame().m_Tccurc0(1, 0) * g_map_manager.m_global_PCL[pcl_idx].x + g_map_manager.curKeyFrame().m_Tccurc0(1, 1) * g_map_manager.m_global_PCL[pcl_idx].y
                + g_map_manager.curKeyFrame().m_Tccurc0(1, 2) * g_map_manager.m_global_PCL[pcl_idx].z + g_map_manager.curKeyFrame().m_Tccurc0(1, 3);
            double p_kf_cur_z = g_map_manager.curKeyFrame().m_Tccurc0(2, 0) * g_map_manager.m_global_PCL[pcl_idx].x + g_map_manager.curKeyFrame().m_Tccurc0(2, 1) * g_map_manager.m_global_PCL[pcl_idx].y
                + g_map_manager.curKeyFrame().m_Tccurc0(2, 2) * g_map_manager.m_global_PCL[pcl_idx].z + g_map_manager.curKeyFrame().m_Tccurc0(2, 3);
            cam0_frame_points.emplace_back(p_kf_cur_x, p_kf_cur_y, p_kf_cur_z);
        }else
        {
            g_map_manager.curKeyFrame().m_kf_feats_l[kf_idx].is_outlier = true;
        }
    }
    g2o::SparseOptimizer optimizer;
    g2o::OptimizationAlgorithmLevenberg* solver = nullptr;
    solver = new g2o::OptimizationAlgorithmLevenberg(
        std::make_unique<g2o::BlockSolver_6_3>(std::make_unique<g2o::LinearSolverCholmod<g2o::BlockSolver_6_3::PoseMatrixType>>()));
    optimizer.setAlgorithm(solver);
    optimizer.setVerbose(false);
    g2o::CameraParameters* camera = new g2o::CameraParameters( 
        g_Camera_Intrinsic_l(0, 0), 
        Eigen::Vector2d(g_Camera_Intrinsic_l(0, 2), 
        g_Camera_Intrinsic_l(1, 2)), 0 );
    camera->setId(0);
    optimizer.addParameter( camera );
    g2o::VertexSE3Expmap* vc = new g2o::VertexSE3Expmap();
    vc->setId(0);
    vc->setEstimate(g2o::SE3Quat(origin_T_c1c0.block(0, 0, 3, 3), origin_T_c1c0.topRightCorner<3, 1>()));
    optimizer.addVertex(vc);
    int index = 1;
    std::vector<g2o::EdgeProjectXYZ2UV*> edges;
    for(int i = 0 ;i < cam0_frame_points.size(); i ++)
    {
        g2o::VertexPointXYZ* vp = new g2o::VertexPointXYZ();
        vp->setId(index);
        vp->setEstimate(cam0_frame_points[i]);
        vp->setFixed(true);
        vp->setMarginalized(true);
        optimizer.addVertex(vp);

        g2o::EdgeProjectXYZ2UV* edge = new g2o::EdgeProjectXYZ2UV();
        edge->setInformation(Eigen::Matrix2d::Identity());
        edge->setMeasurement(cur_frame_pts[i]);
        edge->setVertex(0, dynamic_cast<g2o::VertexPointXYZ*>(vp));
        edge->setVertex(1, dynamic_cast<g2o::VertexSE3Expmap*>(vc));
        edge->setRobustKernel(new g2o::RobustKernelHuber());
        edge->setParameterId(0, 0);
        optimizer.addEdge(edge);

        index++;
        edges.push_back(edge);
    }
    // std::cout<<"edge size: "<<edges.size()<<std::endl;
    const double chi2_th = 5.991;
    int cntOutliers = 0;
    int numIterations = 3;
    for(int iteration = 0; iteration < numIterations; iteration++){
    optimizer.setVerbose(false);
    optimizer.initializeOptimization();
    optimizer.optimize(6);
    cntOutliers = 0;
    for(size_t i = 0, N = edges.size(); i < N; i++){
        auto e = edges[i];
        e->computeError();
        if(e->chi2() > chi2_th){
            e->setLevel(1);
            cntOutliers++;
            int idx = corespond_kf_pt_idxs[i];
            g_map_manager.curKeyFrame().m_kf_feats_l[idx].is_outlier = true;
        } else{
            e->setLevel(0);
            int idx = corespond_kf_pt_idxs[i];
            g_map_manager.curKeyFrame().m_kf_feats_l[idx].is_outlier = false;
        }
        // remove the robust kernel to see if it's outlier
        if(iteration == numIterations - 1){
            e->setRobustKernel(nullptr);
        }
    }
    }
    // std::cout<<"outlier: "<<cntOutliers<<std::endl;
    opt_T_c1c0 = Eigen::Matrix4d::Identity();
    opt_T_c1c0 .block(0, 0, 3, 3) = vc->estimate().rotation().matrix();
    opt_T_c1c0 .block(0, 3, 3, 1) = vc->estimate().translation();
}

void pnpSolve(std::vector<cv::Point3f>& p3ds, std::vector<cv::Point2f>& pixelPts, Eigen::Matrix4d cur_Tc1c0)
{
    cv::Mat rvec, tvec;
    if(p3ds.size() < 4)
    {
        exit(0);
        std::cout<<"Not enough match points to pnp\n";
        return;
    } 
    bool res = cv::solvePnPRansac(p3ds, pixelPts, g_Camera_Intrinsic_l_3x3_cv, cv::Mat::zeros(cv::Size(4,1), CV_32F), 
        rvec, tvec, false);
    cv::Mat rotation_matrix;
    cv::Rodrigues(rvec, rotation_matrix);
    if(!res)
    {
        std::cout<<"pnp failed!\n";
        exit(0);
    }
    cur_Tc1c0 << rotation_matrix.at<double>(0, 0), rotation_matrix.at<double>(0, 1), rotation_matrix.at<double>(0, 2), tvec.at<double>(0, 0),
                rotation_matrix.at<double>(1, 0), rotation_matrix.at<double>(1, 1), rotation_matrix.at<double>(1, 2), tvec.at<double>(0, 1),
                rotation_matrix.at<double>(2, 0), rotation_matrix.at<double>(2, 1), rotation_matrix.at<double>(2, 2), tvec.at<double>(0, 2),
                0.0, 0.0, 0.0, 1.0;
    std::cout<<"pnp  Tcur_last\n"<<cur_Tc1c0<<std::endl;
}

void imuSegUpdate(Eigen::Vector3d& last_opt_speed, Eigen::Matrix4d& T_last_cur)
{
    T_last_cur = Eigen::Matrix4d::Identity();
    imudata_seg.imu_mtx.lock();
    T_last_cur.block(0, 0 ,3, 3)=imudata_seg.R_i0_i1_sum;
    T_last_cur.block(0, 3, 3, 1) = imudata_seg.pos;
    imudata_seg.reset(last_opt_speed);
    imudata_seg.imu_mtx.unlock();
}

void front_stereo_view_cb(const sensor_msgs::ImageConstPtr& fl_img_msg, const sensor_msgs::ImageConstPtr& fr_img_msg)
{
    auto t_a = std::chrono::high_resolution_clock::now();
    try
    {
        auto cv_ptrl = cv_bridge::toCvCopy(fl_img_msg, sensor_msgs::image_encodings::BGR8);
        auto cv_ptrr = cv_bridge::toCvCopy(fr_img_msg, sensor_msgs::image_encodings::BGR8); 
        cv::Mat img_l_gray, img_r_gray;
        cv::cvtColor(cv_ptrl->image, img_l_gray, cv::COLOR_BGR2GRAY);
        cv::cvtColor(cv_ptrr->image, img_r_gray, cv::COLOR_BGR2GRAY);

        if(!g_initial)
        {
            KeyFrame kf(img_l_gray, img_r_gray, cv_ptrl->image, cv_ptrl->header.stamp.toNSec());
            g_map_manager.insertKF(kf);
            std::vector<cv::Mat> imgs;
            imgs.emplace_back(g_map_manager.curKeyFrame().m_img_l_bgr);
            imgs.emplace_back(cv_ptrl->image);
            cv::Mat v_image;
            cv::vconcat(imgs, v_image);
            cv::Mat kf_h_image;
            imgs.clear();
            imgs.emplace_back(g_map_manager.curKeyFrame().m_img_l_bgr);
            imgs.emplace_back(cv_ptrr->image);
            cv::hconcat(imgs, kf_h_image);
            for(int i = 0; i<g_map_manager.curKeyFrame().m_kf_feats_l.size();i++)
            {
                cv::Point2f pl, pr;
                pl.x = g_map_manager.curKeyFrame().m_kf_feats_l[i].ptl[0];
                pl.y = g_map_manager.curKeyFrame().m_kf_feats_l[i].ptl[1];
                pr.x = g_map_manager.curKeyFrame().m_kf_feats_l[i].ptr[0];
                pr.y = g_map_manager.curKeyFrame().m_kf_feats_l[i].ptr[1];
                cv::circle(kf_h_image,pl, 5.0, cv::Scalar(0, 0, 255), 2.5);
            }
            cv::resize(kf_h_image, kf_h_image, cv::Size(1920*0.75, 720*0.75));
            sensor_msgs::ImagePtr cv_hconate_msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", kf_h_image).toImageMsg();
            cv_hconate_msg->header = fl_img_msg->header;
            g_img_publisher.publish(cv_hconate_msg);
            g_initial = true;
            // exit(0);
            // std::cout<<"gmap vec inittial : "<<g_map_manager.curKeyFrame().m_RT_Vec.transpose()<<std::endl;
        }else
        {
            // std::cout<<"-------------------------------------------------------------\n";
            Eigen::Matrix4d imu_T_last_cur, cam_T_last_cur;
            imuSegUpdate(g_map_manager.curKeyFrame().m_RT_Vec, imu_T_last_cur);
            cam_T_last_cur = g_Twc0.inverse() *  imu_T_last_cur * g_Twc0;
            Eigen::Matrix4d Tckfcrt_predict = g_map_manager.curKeyFrame().m_Tckfcrt * cam_T_last_cur;
            Eigen::Matrix4d Tcrtckf_predict = Tckfcrt_predict.inverse();
            std::vector<RealTimeFrameFeature> last_frame_feats;
            cv::Mat last_frame_img, last_frame_img_bgr;
            g_map_manager.getLastRTFrameImgAndFeats(last_frame_img, last_frame_img_bgr, last_frame_feats);
            std::vector<cv::Point2f> cur_frame_pts, cur_frame_vecs, last_frame_pts, predict_frame_pts;
            for(int i = 0; i < last_frame_feats.size(); i++)
            {
                last_frame_pts.emplace_back(last_frame_feats[i].pt[0], last_frame_feats[i].pt[1]);
                int kf_feat_idx = last_frame_feats[i].corespondKFPtIdx;
                if(kf_feat_idx == -1)
                {
                    cur_frame_pts.emplace_back(last_frame_pts.back());
                    predict_frame_pts.emplace_back(last_frame_pts.back());
                }else
                {
                    pcl::PointXYZ kf_p3d = g_map_manager.m_global_PCL[g_map_manager.curKeyFrame().m_kf_feats_l[kf_feat_idx].corespondPCLIdx];
                    double p_kf_cur_x = g_map_manager.curKeyFrame().m_Tccurc0(0, 0) * kf_p3d.x + g_map_manager.curKeyFrame().m_Tccurc0(0, 1) * kf_p3d.y
                        + g_map_manager.curKeyFrame().m_Tccurc0(0, 2) * kf_p3d.z + g_map_manager.curKeyFrame().m_Tccurc0(0, 3);
                    double p_kf_cur_y = g_map_manager.curKeyFrame().m_Tccurc0(1, 0) * kf_p3d.x + g_map_manager.curKeyFrame().m_Tccurc0(1, 1) * kf_p3d.y
                        + g_map_manager.curKeyFrame().m_Tccurc0(1, 2) * kf_p3d.z + g_map_manager.curKeyFrame().m_Tccurc0(1, 3);
                    double p_kf_cur_z = g_map_manager.curKeyFrame().m_Tccurc0(2, 0) * kf_p3d.x + g_map_manager.curKeyFrame().m_Tccurc0(2, 1) * kf_p3d.y
                        + g_map_manager.curKeyFrame().m_Tccurc0(2, 2) * kf_p3d.z + g_map_manager.curKeyFrame().m_Tccurc0(2, 3);
                    double p_rt_cur_z = Tcrtckf_predict(2, 0) * p_kf_cur_x + Tcrtckf_predict(2, 1) * p_kf_cur_y + Tcrtckf_predict(2, 2) * p_kf_cur_z + Tcrtckf_predict(2, 3);
                    double p_rt_cur_x = (Tcrtckf_predict(0, 0) * p_kf_cur_x + Tcrtckf_predict(0, 1) * p_kf_cur_y + Tcrtckf_predict(0, 2) * p_kf_cur_z + Tcrtckf_predict(0, 3))/p_rt_cur_z;
                    double p_rt_cur_y = (Tcrtckf_predict(1, 0) * p_kf_cur_x + Tcrtckf_predict(1, 1) * p_kf_cur_y + Tcrtckf_predict(1, 2) * p_kf_cur_z + Tcrtckf_predict(1, 3))/p_rt_cur_z;
                    double pt_x_predict = g_Camera_Intrinsic_l(0, 0) * p_rt_cur_x +  g_Camera_Intrinsic_l(0, 2);
                    double pt_y_predict = g_Camera_Intrinsic_l(1, 1) * p_rt_cur_y +  g_Camera_Intrinsic_l(1, 2);
                    cur_frame_pts.emplace_back(pt_x_predict, pt_y_predict);
                    predict_frame_pts.emplace_back(cur_frame_pts.back());
                }
            }        
            std::vector<uchar> lk_match_status;
            std::vector<float> lk_match_err;
            int cntMatch1 = 0;
            cv::calcOpticalFlowPyrLK(last_frame_img, img_l_gray, last_frame_pts, cur_frame_pts, lk_match_status,
                lk_match_err, cv::Size(50, 50), 2, cv::TermCriteria((cv::TermCriteria::COUNT) + (cv::TermCriteria::EPS), 30, (0.01)), cv::OPTFLOW_USE_INITIAL_FLOW);
            std::vector<cv::Mat> imgs;
            cv::Mat v_image;
            imgs.emplace_back(g_map_manager.curKeyFrame().m_img_l_bgr);
            imgs.emplace_back(cv_ptrl->image);
            cv::hconcat(imgs, v_image);
            std::vector<int> cur_matched_pt_corespond_kf_pt_idxs;
            std::vector<cv::Point2f> cur_matched_pt, coresponed_kf_pts;
            int closeP3dMatchCnt = 0;
            int matchCnt = 0;
            float min_x = 999;
            float max_x = 0;
            float min_y = 999;
            float max_y = 0;
            for(int i = 0; i < lk_match_err.size(); i++)
            {
                if(lk_match_status[i] && lk_match_err[i] < 30.0)
                {
                    matchCnt++;
                    int kf_pt_idx = last_frame_feats[i].corespondKFPtIdx;
                    Eigen::Vector2d kf_pt = g_map_manager.curKeyFrame().m_kf_feats_l[kf_pt_idx].ptl;
                    if(g_map_manager.curKeyFrame().m_kf_feats_l[kf_pt_idx].corespondPCLIdx != -1)
                    {
                        min_x = (min_x < last_frame_pts[i].x)?min_x:last_frame_pts[i].x;
                        max_x = (max_x > last_frame_pts[i].x)?max_x:last_frame_pts[i].x;
                        min_y = (min_y < last_frame_pts[i].y)?min_y:last_frame_pts[i].y;
                        max_y = (max_y > last_frame_pts[i].y)?max_y:last_frame_pts[i].y;
                        cv::circle(v_image, cv::Point2f(kf_pt.x(), kf_pt.y()), 5, cv::Scalar(0, 0, 255), 2);
                        if(g_map_manager.curKeyFrame().m_kf_feats_l[kf_pt_idx].is_outlier)
                            cv::circle(v_image, cur_frame_pts[i]+cv::Point2f(960, 00), 5, cv::Scalar(255, 255, 0), 2);
                        else
                        {
                            cv::circle(v_image, cur_frame_pts[i]+cv::Point2f(960, 00), 5, cv::Scalar(0, 255, 0), 2);
                            closeP3dMatchCnt++;
                        }

                    }
                    cv::putText(v_image, std::to_string(g_map_manager.curKeyFrame().m_KFID), cv::Point2f(30, 80), 3, 3, cv::Scalar(0, 0, 255), 3);
                    cur_matched_pt_corespond_kf_pt_idxs.emplace_back(last_frame_feats[i].corespondKFPtIdx);
                    cur_matched_pt.emplace_back(cur_frame_pts[i].x, cur_frame_pts[i].y);
                    coresponed_kf_pts.emplace_back(kf_pt.x(), kf_pt.y());
                }
            }
            cv::calcOpticalFlowPyrLK(g_map_manager.curKeyFrame().m_img_l, img_l_gray, coresponed_kf_pts, cur_matched_pt, lk_match_status,
                lk_match_err, cv::Size(50, 50), 0, cv::TermCriteria((cv::TermCriteria::COUNT) + (cv::TermCriteria::EPS), 30, (0.01)), cv::OPTFLOW_USE_INITIAL_FLOW);
            std::vector<RealTimeFrameFeature> cur_RT_feats;
            for(int i = 0; i < cur_matched_pt.size(); i++)
            {
                // std::cout<<lk_match_err[i]<<" ";
                if(lk_match_status[i] && lk_match_err[i] < 50.0)
                    cur_RT_feats.emplace_back(Eigen::Vector2d(cur_matched_pt[i].x, cur_matched_pt[i].y), 
                        cur_matched_pt_corespond_kf_pt_idxs[i]);
            }
            // std::cout<<std::endl;
            sensor_msgs::ImagePtr cv_vconate_msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", v_image).toImageMsg();
            cv_vconate_msg->header = fl_img_msg->header;
            g_img_publisher.publish(cv_vconate_msg);
            sensor_msgs::PointCloud2 cur_frame_pcl_msg;
            pcl::toROSMsg(g_map_manager.m_global_PCL, cur_frame_pcl_msg);
            cur_frame_pcl_msg.header = fl_img_msg->header;
            cur_frame_pcl_msg.header.frame_id = "odometry";
            g_local_map_pcl_publisher.publish(cur_frame_pcl_msg);
            if(closeP3dMatchCnt < 30 || max_x - min_x < 480 || max_y - min_y < 360)
            {
                std::cout<<"Match "<<cur_RT_feats.size()<<" feats to kf, insert new kf.\n";
                KeyFrame kf(img_l_gray, img_r_gray, cv_ptrl->image, cur_RT_feats, g_map_manager.curKeyFrame(), cv_ptrl->header.stamp.toNSec());
                std::cout<<"Last kf Tc0ckf:\n"<<g_map_manager.curKeyFrame().m_Tc0ccur<<std::endl;
                Eigen::Matrix4d opt_Tccurckf, opt_Tckfccur;
                estimatePoseOnly(Tcrtckf_predict, opt_Tccurckf, cur_RT_feats);
                opt_Tckfccur = opt_Tccurckf.inverse();
                Eigen::Vector3d vec = opt_Tckfccur.block(0, 3, 3, 1) - opt_Tckfccur.block(0, 3, 3, 1);
                kf.m_RT_Vec = vec;
                kf.m_Tc0ccur = g_map_manager.curKeyFrame().m_Tc0ccur * opt_Tckfccur;
                kf.m_Tccurc0 = kf.m_Tc0ccur.inverse();
                kf.m_Tclastccur = opt_Tckfccur;
                kf.m_Tccurclast = opt_Tckfccur.inverse();
                kf.m_Tckfcrt = Eigen::Matrix4d::Identity();
                kf.m_Tc0crt = kf.m_Tc0ccur * kf.m_Tckfcrt;
                g_map_manager.insertKF(kf);
                std::cout<<"new KF Tc0ccur: \n"<<g_map_manager.curKeyFrame().m_Tc0ccur<<std::endl;
                std::cout<<"Tlastkfnewkf:\n "<<opt_Tckfccur<<std::endl;
                if(cur_RT_feats.size()<8)
                {
                    std::cout<<"Match "<<cur_RT_feats.size()<<", exit.\n";
                    exit(0);
                }
                g_insert_KF = true;
            }else
            {
                g_map_manager.updateFrame(img_l_gray, cv_ptrl->image, cur_RT_feats);
                Eigen::Matrix4d opt_Tccurckf, opt_Tckfccur;
                estimatePoseOnly(Tcrtckf_predict, opt_Tccurckf, cur_RT_feats);
                opt_Tckfccur = opt_Tccurckf.inverse();
                g_map_manager.curKeyFrame().m_RT_Vec = opt_Tckfccur.block(0, 3, 3, 1) - opt_Tckfccur.block(0, 3, 3, 1);
                g_map_manager.curKeyFrame().m_Tckfcrt = opt_Tckfccur;
                g_map_manager.curKeyFrame().m_Tc0crt = g_map_manager.curKeyFrame().m_Tc0ccur * g_map_manager.curKeyFrame().m_Tckfcrt;
                std::cout<<"TC0Crt:\n"<<g_map_manager.curKeyFrame().m_Tc0crt<<std::endl;
            }
        }
    }
    catch(const std::exception& e)
    {
        ROS_ERROR("cv_bridge exception %s", e.what());
    }
    auto t_b = std::chrono::high_resolution_clock::now();
    std::cout<<"odom:"<< std::chrono::duration_cast<std::chrono::milliseconds>(t_b-t_a).count()<<"ms"<<std::endl;
}