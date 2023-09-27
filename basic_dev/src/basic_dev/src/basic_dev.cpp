#ifndef _BASIC_DEV_CPP_
#define _BASIC_DEV_CPP_

#include "basic_dev.hpp"

int main(int argc, char** argv)
{

    ros::init(argc, argv, "basic_dev"); // 初始化ros 节点，命名为 basic
    ros::NodeHandle n; // 创建node控制句柄
    BasicDev go(&n);
    return 0;
}

BasicDev::BasicDev(ros::NodeHandle *nh)
{  
    //创建图像传输控制句柄
    it = std::make_unique<image_transport::ImageTransport>(*nh); 
    front_img = cv::Mat(480, 640, CV_8UC3, cv::Scalar(0));

    takeoff.request.waitOnLastTask = 1;
    land.request.waitOnLastTask = 1;


    // 使用publisher发布角速度指令需要定义 AngleRateThrottle , 并赋予相应的值后，将他publish（）出去
    arthrcmd.rollRate = 0; //roll 角速度（rad/s）
    arthrcmd.pitchRate = 0;//pitch 角速度 （rad/s）
    arthrcmd.yawRate = 0;//yaw 角速度 （rad/s）
    arthrcmd.throttle = 0;//油门， （0.0-1.0）

    // 使用publisher发布pwm控制指令需要定义 RotorPWM, 并赋予相应的值后，将他publish（）出去
    pwmcmd.rotorPWM0 = 0.6015;// rt（0.0-1.0）
    pwmcmd.rotorPWM1 = 0.6015;// lb（0.0-1.0）
    pwmcmd.rotorPWM2 = 0.6015;// lt（0.0-1.0）
    pwmcmd.rotorPWM3 = 0.6015;// rb（0.0-1.0）

    //无人机信息通过如下命令订阅，当收到消息时自动回调对应的函数
    odom_suber = nh->subscribe<geometry_msgs::PoseStamped>("/airsim_node/drone_1/pose_gt", 1, std::bind(&BasicDev::pose_cb, this, std::placeholders::_1));//状态真值，用于赛道一
    imu_suber = nh->subscribe<sensor_msgs::Imu>("airsim_node/drone_1/imu/imu", 1, std::bind(&BasicDev::imu_cb, this, std::placeholders::_1));//imu数据
    circles_suber = nh->subscribe<airsim_ros::CirclePoses>("airsim_node/drone_1/circle_poses_gt", 1, std::bind(&BasicDev::circles_cb, this, std::placeholders::_1));//障碍圈数据
    front_view_suber = it->subscribe("airsim_node/drone_1/front_center/Scene", 1, std::bind(&BasicDev::front_view_cb, this,  std::placeholders::_1));
    front_depth_suber = it->subscribe("airsim_node/drone_1/front_center/DepthPlanar", 1, std::bind(&BasicDev::front_depth_cb, this,  std::placeholders::_1));

    //通过这两个服务可以调用模拟器中的无人机起飞和降落命令
    takeoff_client = nh->serviceClient<airsim_ros::Takeoff>("/airsim_node/drone_1/takeoff");
    land_client = nh->serviceClient<airsim_ros::Takeoff>("/airsim_node/drone_1/land");
    reset_client = nh->serviceClient<airsim_ros::Reset>("/airsim_node/reset");
    //通过publisher实现对无人机的速度控制和姿态控制和角速度控制
    anglerate_publisher = nh->advertise<airsim_ros::AngleRateThrottle>("airsim_node/drone_1/angle_rate_throttle_frame", 1);

    // takeoff_client.call(takeoff); //起飞
    // land_client.call(land); //降落
    // reset_client.call(reset); //重置

    ros::spin();
}

BasicDev::~BasicDev()
{
}

void BasicDev::pose_cb(const geometry_msgs::PoseStamped::ConstPtr& msg)
{
    ROS_INFO("Get pose data.");
}


void BasicDev::imu_cb(const sensor_msgs::Imu::ConstPtr& msg)
{
    ROS_INFO("Get imu data.");
}

void BasicDev::circles_cb(const airsim_ros::CirclePoses::ConstPtr& msg)
{
    ROS_INFO("Get circle poses data.");
}

void BasicDev::front_view_cb(const sensor_msgs::ImageConstPtr& msg)
{
    cv_front_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::TYPE_8UC3);
    if(!cv_front_ptr->image.empty())
    {
        ROS_INFO("Get front image.");
    }
}

void BasicDev::front_depth_cb(const sensor_msgs::ImageConstPtr& msg)
{
    cv_front_depth_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::TYPE_32FC1);
    if(!cv_front_depth_ptr->image.empty())
    {
        ROS_INFO("Get front depth image.");
    }
}


#endif