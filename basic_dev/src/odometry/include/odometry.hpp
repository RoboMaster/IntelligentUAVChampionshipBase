#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include "airsim_ros/VelCmd.h"
#include "airsim_ros/PoseCmd.h"
#include "airsim_ros/Takeoff.h"
#include "airsim_ros/Land.h"
#include "airsim_ros/GPSYaw.h"
#include "nav_msgs/Odometry.h"
#include "sensor_msgs/Imu.h"
#include <geometry_msgs/PoseStamped.h>
#include <time.h>
#include <stdlib.h>
#include <opencv2/cudaoptflow.hpp>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/opencv.hpp>
#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <message_filters/sync_policies/exact_time.h>
#include <message_filters/time_synchronizer.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
// #include "map_manager/map_manager.hpp"
#include <random>
#include <mutex>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/common/transforms.h>
#include <g2o/core/sparse_optimizer.h>
#include <g2o/core/block_solver.h>
#include <g2o/core/robust_kernel.h>
#include <g2o/core/robust_kernel_impl.h>
#include <g2o/core/optimization_algorithm_levenberg.h>
#include <g2o/solvers/cholmod/linear_solver_cholmod.h>
#include <g2o/types/slam3d/se3quat.h>
#include <g2o/types/sba/types_six_dof_expmap.h>
#include "mapmanager.hpp"

Eigen::Matrix4d g_Camera_Intrinsic_l;
Eigen::Matrix4d g_Camera_Intrinsic_r;
Eigen::Matrix4d g_Camera_Tlr;
Eigen::Matrix4d g_Camera_Trl;
Eigen::Vector4d g_Camera_Distor_l;
Eigen::Vector4d g_Camera_Distor_r;
//960*480-60fov
cv::Mat g_Camera_Intrinsic_l_cv = (cv::Mat_<double>(4, 4)<<
    833.8, 0.0, 481.6, 0.0,
    0.0, 835.27, 360.766, 0.0, 
    0.0, 0.0, 1.0, 0.0,
    0.0, 0.0, 0.0, 1.0
    );
cv::Mat g_Camera_Intrinsic_l_3x3_cv = (cv::Mat_<double>(3, 3)<<
    833.8, 0.0, 481.6, 
    0.0, 835.27, 360.766, 
    0.0, 0.0, 1.0
    );
cv::Mat g_Camera_Intrinsic_r_cv = (cv::Mat_<double>(4, 4)<<
    832.287, 0.0, 481.66, 0.0,
    0.0, 833.94, 359.45, 0.0, 
    0.0, 0.0, 1.0, 0.0,
    0.0, 0.0, 0.0, 1.0
    );
cv::Mat g_Camera_Intrinsic_r_3x3_cv = (cv::Mat_<double>(3, 3)<<
    832.287, 0.0, 481.66, 
    0.0, 833.94, 359.45, 
    0.0, 0.0, 1.0
    );
cv::Mat g_Camera_Tlr_cv = (cv::Mat_<double>(3, 4)<<
    1.0, 0.0,0.0, 0.301922,
    0.0, 1.0, 0.0, -0.00150702, 
    0.0, 0.0, 1.0, 0.00211
    );
cv::Mat g_Camera_Trl_cv = (cv::Mat_<double>(3, 4)<<
    1.0, 0.0,0.0, -0.301922,
    0.0, 1.0, 0.0, 0.00150702, 
    0.0, 0.0, 1.0, -0.00211
    );
Eigen::Matrix4d g_Twc0; // 相机系与NED系转换

// MapManager g_map_manager(5);
// Backend g_back_end;

MapManager g_map_manager;
// MapFrame g_last_mapframe;

pcl::PointCloud<pcl::PointXYZ> g_local_map_pcl;//世界系描述
bool g_initial=false;

struct IMUData
{
    double imu_delta_t = 0.01;
    double gravity_mag = 9.805;
    double acc_n_d = 0.02353596;
    double acc_w_d = 1.2481827e-6;
    double gyr_n_d = 8.7266462e-4;
    double gyr_w_d = 9.9735023e-8;
    double last_acc_w_d = 0.0;
    double last_gyr_w_d = 0.0;
    Eigen::Matrix3d R_w_i = Eigen::Matrix3d::Identity();
    Eigen::Matrix3d last_R_w_i = Eigen::Matrix3d::Identity();
    Eigen::Matrix3d R_i0_i1 = Eigen::Matrix3d::Identity();
    Eigen::Matrix3d R_i0_i1_sum = Eigen::Matrix3d::Identity();
    Eigen::Vector3d phi = Eigen::Vector3d::Zero();
    Eigen::Vector3d last_gyr = Eigen::Vector3d::Zero();
    Eigen::Vector3d last_acc = Eigen::Vector3d::Zero();
    Eigen::Vector3d speed = Eigen::Vector3d::Zero();
    Eigen::Vector3d last_speed = Eigen::Vector3d::Zero();
    Eigen::Vector3d gravity_vec = {0, 0, gravity_mag};
    Eigen::Vector3d last_pos = Eigen::Vector3d::Zero();
    Eigen::Vector3d pos = Eigen::Vector3d::Zero();
    Eigen::Vector3d acc = Eigen::Vector3d::Zero();
    Eigen::Vector3d imu_acc;
    Eigen::Vector3d imu_gyr;
    std::mutex imu_mtx;
    void reset(Eigen::Vector3d& update_speed)
    {
        R_i0_i1 = Eigen::Matrix3d::Identity();
        R_i0_i1_sum = Eigen::Matrix3d::Identity();
        phi = Eigen::Vector3d::Zero();
        last_speed = update_speed;
        last_pos = Eigen::Vector3d::Zero();
    }
}imudata, imudata_seg;

std::random_device rd{};
std::mt19937 gen{rd()};
std::normal_distribution<double> gauss_dist{0.0, 1.0};
bool g_insert_KF=false;
ros::Publisher g_img_publisher;
ros::Publisher g_cur_pcl_publisher;
ros::Publisher g_local_map_pcl_publisher;

void estimatePoseOnly(Eigen::Matrix4d& origin_T_c1c0, Eigen::Matrix4d& opt_T_c1c0, std::vector<Eigen::Vector3d>& last_cam_frame_points, 
    std::vector<Eigen::Vector2d>& cur_frame_pts);
void odom_local_ned_cb(const geometry_msgs::PoseStamped::ConstPtr& msg);
void imu_cb(const sensor_msgs::Imu::ConstPtr& msg);
void front_left_view_cb(const sensor_msgs::ImageConstPtr& msg);
void front_left_view_cb(const sensor_msgs::ImageConstPtr& msg);
void front_right_view_cb(const sensor_msgs::ImageConstPtr& msg);
void front_stereo_view_cb(const sensor_msgs::ImageConstPtr& fl_img, const sensor_msgs::ImageConstPtr& fr_img);