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
#include <random>
#include <mutex>
#include "eskf.hpp"

std::random_device rd{};
std::mt19937 gen{rd()};
std::normal_distribution<double> gauss_dist{0.0, 1.0};
ErrorStateKalmanFilter* g_eskf_ptr;
int odo_cnt = 0;
ros::Publisher g_eskf_odom_puber;
void odom_local_ned_cb(const geometry_msgs::PoseStamped::ConstPtr& msg);
void init_pose_ned_cb(const geometry_msgs::PoseStamped::ConstPtr& msg);
void imu_cb(const sensor_msgs::Imu::ConstPtr& msg);