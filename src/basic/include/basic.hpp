#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include "airsim_ros_pkgs/VelCmd.h"
#include "airsim_ros_pkgs/PoseCmd.h"
#include "airsim_ros_pkgs/Takeoff.h"
#include "airsim_ros_pkgs/Land.h"
#include "airsim_ros_pkgs/GPSYaw.h"
#include "nav_msgs/Odometry.h"
#include  "sensor_msgs/Imu.h"
#include <time.h>
#include <stdlib.h>

char kb=0;
bool exit_flag = 0;

void origin_geo_point_cb(const airsim_ros_pkgs::GPSYaw::ConstPtr& msg);

void odom_local_ned_cb(const nav_msgs::Odometry::ConstPtr& msg);

void imu_cb(const sensor_msgs::Imu::ConstPtr& msg);

void bottom_view_cb(const sensor_msgs::ImageConstPtr& msg);

int scanKeyboard();

template <typename T> int sgn(T val) ;