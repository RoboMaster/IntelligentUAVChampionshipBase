#include "keyframe.hpp"

KeyFrame::KeyFrame(){};
KeyFrame::~KeyFrame(){};

KeyFrame::KeyFrame(KeyFrame&& src)
{
    m_Tc0ccur = src.m_Tc0ccur;
    m_Tccurc0 = src.m_Tccurc0; 
    m_Tclastccur = src.m_Tclastccur;
    m_Tccurclast = src.m_Tccurclast;
    m_kf_feats_l = src.m_kf_feats_l;
    m_realf_feats_l = src.m_realf_feats_l;
    m_img_l_realf = src.m_img_l_realf;
    m_img_l = src.m_img_l;
    m_img_l_bgr = src.m_img_l_bgr;
    m_img_r = src.m_img_r;
    m_img_l_realf_bgr = src.m_img_l_realf_bgr;
    m_KFID = src.m_KFID;
    m_corespond_other_kf_pt_l_idx = src.m_corespond_other_kf_pt_l_idx;
    m_Tckfcrt = src.m_Tckfcrt;
    m_RT_Vec = src.m_RT_Vec;
    m_Tc0crt = src.m_Tc0crt;
    m_TimeCode = src.m_TimeCode;
}

KeyFrame& KeyFrame::operator=(const KeyFrame& src)
{
    if(this == &src)return *this;
    this->m_Tc0ccur = src.m_Tc0ccur;
    this->m_Tccurc0 = src.m_Tccurc0; 
    this->m_Tclastccur = src.m_Tclastccur;
    this->m_Tccurclast = src.m_Tccurclast;
    this->m_kf_feats_l = src.m_kf_feats_l;
    this->m_realf_feats_l = src.m_realf_feats_l;
    this->m_img_l_realf = src.m_img_l_realf;
    this->m_img_l = src.m_img_l;
    this->m_img_l_bgr = src.m_img_l_bgr;
    this->m_img_r = src.m_img_r;
    this->m_img_l_realf_bgr = src.m_img_l_realf_bgr;
    this->m_KFID = src.m_KFID;
    this->m_corespond_other_kf_pt_l_idx = src.m_corespond_other_kf_pt_l_idx;
    this->m_Tckfcrt = src.m_Tckfcrt;
    this->m_RT_Vec = src.m_RT_Vec;
    this->m_Tc0crt = src.m_Tc0crt;
    this->m_TimeCode = src.m_TimeCode;
    return *this;
}

KeyFrame::KeyFrame(cv::Mat& img_l_gray, cv::Mat& img_r_gray, cv::Mat& img_l_bgr, long long tc)
{
    m_TimeCode = tc;
    std::vector<cv::Point2f> good_feature_points;
    cv::goodFeaturesToTrack(img_l_gray, good_feature_points, 400, 0.001, 20);
    m_img_l = img_l_gray;
    m_img_r = img_r_gray;
    m_img_l_bgr = img_l_bgr;
    m_img_l_realf_bgr = m_img_l_bgr;
    m_img_l_realf = img_l_gray;
    for(int i = 0; i < good_feature_points.size(); i++)
    {
        m_kf_feats_l.emplace_back(Eigen::Vector2d(good_feature_points[i].x, good_feature_points[i].y), 
                Eigen::Vector2d(good_feature_points[i].x, good_feature_points[i].y), -1);
        m_corespond_other_kf_pt_l_idx.emplace_back(-1, -1);
        m_realf_feats_l.emplace_back(Eigen::Vector2d(good_feature_points[i].x, good_feature_points[i].y), i);
    }
    m_Tc0ccur = Eigen::Matrix4d::Identity();
    m_Tccurc0 = Eigen::Matrix4d::Identity();
    m_Tccurclast = Eigen::Matrix4d::Identity();
    m_Tclastccur = Eigen::Matrix4d::Identity();
    m_Tckfcrt = Eigen::Matrix4d::Identity();
    m_RT_Vec = Eigen::Vector3d::Zero();
    m_Tc0crt = m_Tc0ccur * m_Tckfcrt;
}

KeyFrame::KeyFrame(cv::Mat& img_l_gray, cv::Mat& img_r_gray, cv::Mat& img_l_bgr, std::vector<RealTimeFrameFeature>& cur_RT_feats, KeyFrame& lastKF, long long tc)
{
    m_TimeCode = tc;
    cv::Mat mask = cv::Mat::ones(img_l_gray.size(), CV_8UC1);
    for(auto p : cur_RT_feats)
        cv::circle(mask, cv::Point2f(p.pt[0], p.pt[1]), 30, cv::Scalar(0), cv::FILLED);    
    std::vector<cv::Point2f> good_feature_points, good_feature_points_lk_match_r;
    cv::goodFeaturesToTrack(img_l_gray, good_feature_points, 400, 0.001, 20, mask);
    m_img_l = img_l_gray;
    m_img_r = img_r_gray;
    m_img_l_bgr = img_l_bgr;
    m_img_l_realf_bgr = m_img_l_bgr;
    m_img_l_realf = img_l_gray;
    int idx = 0;
    for(auto p : cur_RT_feats)
    {
        m_kf_feats_l.emplace_back(p.pt, p.pt, lastKF.m_kf_feats_l[p.corespondKFPtIdx].corespondPCLIdx);
        m_corespond_other_kf_pt_l_idx.emplace_back(lastKF.m_KFID, p.corespondKFPtIdx);
        m_realf_feats_l.emplace_back(p.pt, idx);
        idx++;
    }
    for(auto p : good_feature_points)
    {
        m_kf_feats_l.emplace_back(Eigen::Vector2d(p.x, p.y), Eigen::Vector2d(p.x, p.y), -1);
        m_corespond_other_kf_pt_l_idx.emplace_back(-1, -1);
        m_realf_feats_l.emplace_back(Eigen::Vector2d(p.x, p.y), idx);
        idx ++;
    }
    m_Tc0ccur = Eigen::Matrix4d::Identity();
    m_Tccurc0 = Eigen::Matrix4d::Identity();
    m_Tccurclast = Eigen::Matrix4d::Identity();
    m_Tclastccur = Eigen::Matrix4d::Identity();
    m_Tckfcrt = Eigen::Matrix4d::Identity();
    m_RT_Vec = Eigen::Vector3d::Zero();
    m_Tc0crt = m_Tc0ccur * m_Tckfcrt;
}

