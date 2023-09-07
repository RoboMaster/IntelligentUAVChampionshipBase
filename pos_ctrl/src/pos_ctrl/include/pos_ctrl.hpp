#ifndef _POS_CTRL_HPP_
#define _POS_CTRL_HPP_

#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include "airsim_ros/VelCmd.h"
#include "airsim_ros/PoseCmd.h"
#include "airsim_ros/Takeoff.h"
#include "airsim_ros/Reset.h"
#include "airsim_ros/Land.h"
#include "airsim_ros/GPSYaw.h"
#include "nav_msgs/Odometry.h"
#include "geometry_msgs/Pose.h"
#include  "sensor_msgs/Imu.h"
#include <time.h>
#include <stdlib.h>
#include "Eigen/Dense"
#include "cv_bridge/cv_bridge.h"
#include "opencv2/opencv.hpp"
#include <ros/callback_queue.h>
#include <boost/thread/thread.hpp>
#include <airsim_ros/SetLocalPosition.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#endif


#define circlesCount 17

class POSCtrl
{
private:
    char kb=0;
    bool exit_flag = 0;
    Eigen::Quaternion<float> q0;
    cv_bridge::CvImageConstPtr cv_front_ptr;
    cv::Mat front_img;
    bool takeoffflag = 0;

    float Pose[4] = {0, 0, 0,0};

    int goalIdx = 0;
    // float goalpath[circlesCount][4] = {{17, 6, -7, 0}, {35,7,-7,0}, {66,4,-7,0.12},{85,10,-7,0.65}, {96, 15,-7, 1.1}, 
    //                                 {103, 28, -7,1.67},{99,41,-7,2.6}, {88,47,-7,3.14}, {71,45,-7,3.04},
    //                                 {49,48,-7,-2.94}, {28,39,-7,2.76},{1,50,-7,3.14},{-50,49,-7,3}, {-65,48,-7,1.337},
    //                                 {-62,63,-9,1.337}, {-59,75,-15,1.337}, {-50,102,-25,0.567}, 
    //                                 {-55,118,-45,0.567}, {-27,138,-58, -0.87}, {-5,114,-58, -0.87}, {17, 6, -50, 0}}; 
    float goalpath[circlesCount][4] = {{17, 6, -1.5, 0}, {35,7,-1.5,0}, {66,4,-2,0.12},{85,10,-2,0.65}, {96, 15,-2, 1.1}, 
                                    {103, 28, -2,1.67},{99,41,-2,2.2}, {88,47,-2,2.8}, {71,45,-2,3.14},
                                    {49,48,-2,3.14}, {28,49,-2, 3.14},{24,50,-5,3.14}, {20,49,-11,-3},
                                    {18,30,-11,-2.5}, {15,15,-11,-2}, {16, 5,-8, -1.5}, {16, 5,-8, -0.8}}; 
    // float goalpath[circlesCount][4] = {{17, 0, -2, 0}, {35,0,-2,0}, {66,1,-2,0.12},{85,3,-2,0.65}}; 
    boost::thread kb_thread;
    std::unique_ptr<image_transport::ImageTransport> it;
    ros::Timer go_timer;
    ros::CallbackQueue go_queue;
    ros::CallbackQueue front_img_queue;

    // 调用服务前需要定义特定的调用参数
    airsim_ros::Takeoff takeoff;
    airsim_ros::Land land;
    airsim_ros::Reset reset;

    // 使用publisher发布速度指令需要定义 Velcmd , 并赋予相应的值后，将他publish（）出去
    airsim_ros::VelCmd velcmd;

    // 使用publisher发布速度指令需要定义 Velcmd , 并赋予相应的值后，将他publish（）出去
    airsim_ros::PoseCmd posecmd;

    //无人机信息通过如下命令订阅，当收到消息时自动回调对应的函数
    ros::Subscriber odom_suber;//状态真值，用于赛道一
    // ros::Subscriber imu_suber;//imu数据
    // image_transport::Subscriber bottom_View_suber;
    image_transport::Subscriber front_View_suber;

    //通过这两个服务可以调用模拟器中的无人机起飞和降落命令
    ros::ServiceClient takeoff_client;
    ros::ServiceClient land_client;
    ros::ServiceClient setGoalPosition;
    ros::ServiceClient reset_client;

    //通过这两个publisher实现对无人机的速度控制和姿态控制
    ros::Publisher vel_publisher;
    ros::Publisher pose_publisher;

    void odom_local_ned_cb(const geometry_msgs::Pose::ConstPtr& msg);

    void setPosition_cb(const ros::TimerEvent&);

    airsim_ros::SetLocalPosition request11_;

    void front_view_cb(const sensor_msgs::ImageConstPtr& msg);

    template <typename T> int sgn(T val) ;

    void go();

    void go_to(float x, float y, float z, float yaw);

public:
    POSCtrl(ros::NodeHandle *nh);
    ~POSCtrl();

};





