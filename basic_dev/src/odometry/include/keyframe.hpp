#include <Eigen/Dense>
#include <opencv2/core.hpp>
#include <opencv2/opencv.hpp>
#include <mutex>

struct RealTimeFrameFeature
{
    Eigen::Vector2d pt;
    int corespondKFPtIdx;//对应的关键帧的特征点索引；
    RealTimeFrameFeature(Eigen::Vector2d _pt, int _idx)
    {
        pt = _pt;
        corespondKFPtIdx = _idx;
    }
};

struct KeyFrameFeature
{
    Eigen::Vector2d ptl;
    Eigen::Vector2d ptr;
    int corespondPCLIdx;//对应的点云路标索引；
    bool is_outlier = false;
    KeyFrameFeature(Eigen::Vector2d _ptl, Eigen::Vector2d _ptr, int _idx)
    {
        ptl = _ptl;
        ptr = _ptr;
        corespondPCLIdx = _idx;
    }
};

struct RTFrame
{
    long long timecode;
    // cv::Mat imgl;
    std::vector<RealTimeFrameFeature> realf_feats_l;
    Eigen::Vector3d gps_position;
    Eigen::Matrix4d Tc0crt;
};


class KeyFrame
{
public:
    KeyFrame();
    ~KeyFrame();
    KeyFrame(KeyFrame&& src);
    KeyFrame(cv::Mat& img_l_gray, cv::Mat& img_r_gray, cv::Mat& img_l_bgr, long long tc);
    KeyFrame(cv::Mat& img_l_gray, cv::Mat& img_r_gray, cv::Mat& img_l_bgr, std::vector<RealTimeFrameFeature>& cur_RT_feats, KeyFrame& lastKF, long long tc);
    KeyFrame& operator=(const KeyFrame& src);
    int m_KFID;
    long long m_TimeCode; //时间戳
    Eigen::Matrix4d m_Tc0ccur; //cam下下的 c0 -> c1的变换矩阵
    Eigen::Matrix4d m_Tccurc0; 
    Eigen::Matrix4d m_Tclastccur; //cam下下的 上一关键帧到这一关键帧的变换矩阵
    Eigen::Matrix4d m_Tccurclast; //cam下下的 这一关键帧到上一关键帧的变换矩阵
    Eigen::Matrix4d m_Tckfcrt; //cam下下的 本关键帧到最新的实时帧的变换矩阵
    Eigen::Matrix4d m_Tc0crt; //c0下的实时帧位姿
    Eigen::Vector3d m_RT_Vec; //cam下的最新的实时帧的平移速度，用于更新imu_seg;
    std::vector<KeyFrameFeature> m_kf_feats_l;//本关键帧的特征点
    std::vector<std::tuple<int, int>> m_corespond_other_kf_pt_l_idx;//<kfid, ptidx>, size与m_kf_pt_l对应，没有的值为-1；
    std::vector<RealTimeFrameFeature> m_realf_feats_l;//本关键帧下的最新的实时帧特征点,关键帧创建时就是他自己；
    std::vector<RTFrame> m_UseFul_RTFrames;
    cv::Mat m_img_l_realf;//本关键帧下的最新的实时帧图像,关键帧创建时就是他自己；
    cv::Mat m_img_l;
    cv::Mat m_img_l_bgr;
    cv::Mat m_img_l_realf_bgr;
    cv::Mat m_img_r;
    std::mutex m_rtf_mtx;
};