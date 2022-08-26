#ifndef _GO_HPP_
#define _GO_HPP_

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
#include "Eigen/Dense"
#include "cv_bridge/cv_bridge.h"
#include "opencv2/opencv.hpp"
#include <ros/callback_queue.h>
#include <boost/thread/thread.hpp>
#include <airsim_ros_pkgs/SetLocalPosition.h>
#endif


#define circlesCount 8

class Go
{
private:
    char kb=0;
    bool exit_flag = 0;
    Eigen::Quaternion<float> q0;
    cv_bridge::CvImageConstPtr cv_bottom_ptr, cv_front_ptr;
    cv::Mat tmp_img3;
    cv::Mat tmp_img1;
    bool takeoffflag = 0;

    float Pose[4] = {0, 0, 0,0};

    int goalIdx = 0;
    float goalpath[circlesCount][3] = {{14.8715, -0.7906, -2.6}, {37.0, -12, -0.5}, {68, -13, 0}, {95, -8, 0.5},{110, -15, 0},
                                         {114.5, -36, 0}, {121.5, -67.7, -3.5}, {121.5, -96, -7}};

    boost::thread kb_thread;
    std::unique_ptr<image_transport::ImageTransport> it;
    ros::Timer go_timer;
    ros::CallbackQueue go_queue;
    ros::CallbackQueue front_img_queue;

    // 调用服务前需要定义特定的调用参数
    airsim_ros_pkgs::Takeoff takeoff;
    airsim_ros_pkgs::Land land;

    // 使用publisher发布速度指令需要定义 Velcmd , 并赋予相应的值后，将他publish（）出去
    airsim_ros_pkgs::VelCmd velcmd;

    // 使用publisher发布速度指令需要定义 Velcmd , 并赋予相应的值后，将他publish（）出去
    airsim_ros_pkgs::PoseCmd posecmd;

    //无人机信息通过如下命令订阅，当收到消息时自动回调对应的函数
    ros::Subscriber odom_suber;//状态真值，用于赛道一
    // ros::Subscriber imu_suber;//imu数据
    // image_transport::Subscriber bottom_View_suber;
    image_transport::Subscriber front_View_suber;

    //通过这两个服务可以调用模拟器中的无人机起飞和降落命令
    ros::ServiceClient takeoff_client;
    ros::ServiceClient land_client;
    ros::ServiceClient setGoalPosition;

    //通过这两个publisher实现对无人机的速度控制和姿态控制
    ros::Publisher vel_publisher;
    ros::Publisher pose_publisher;

    void origin_geo_point_cb(const airsim_ros_pkgs::GPSYaw::ConstPtr& msg);

    void odom_local_ned_cb(const nav_msgs::Odometry::ConstPtr& msg);

    void imu_cb(const sensor_msgs::Imu::ConstPtr& msg);

    void setPosition_cb(const ros::TimerEvent&);

    airsim_ros_pkgs::SetLocalPosition request11_;

    void bottom_view_cb(const sensor_msgs::ImageConstPtr& msg);
    void front_view_cb(const sensor_msgs::ImageConstPtr& msg);

    void keyboard_cb(const ros::ServiceClient& takeoff_client, const ros::ServiceClient& land_client, const ros::Publisher& vel_publisher);

    int scanKeyboard();

    template <typename T> int sgn(T val) ;

    void go();

    void go_to(float x, float y, float z, float yaw);

public:
    Go(ros::NodeHandle *nh);
    ~Go();

};





