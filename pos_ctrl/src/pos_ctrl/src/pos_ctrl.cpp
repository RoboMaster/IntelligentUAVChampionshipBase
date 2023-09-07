#ifndef _POS_CTRL_CPP_
#define _POS_CTRL_CPP_

#include "pos_ctrl.hpp"

int main(int argc, char** argv)
{

    ros::init(argc, argv, "pos_ctrl"); // 初始化ros 节点，命名为 basic
    ros::NodeHandle n; // 创建node控制句柄
    POSCtrl go(&n);
    return 0;
}

POSCtrl::POSCtrl(ros::NodeHandle *nh)
{  
    //创建图像传输控制句柄
    it = std::make_unique<image_transport::ImageTransport>(*nh); 
    front_img = cv::Mat(480, 640, CV_8UC3, cv::Scalar(0));

    takeoff.request.waitOnLastTask = 1;
    land.request.waitOnLastTask = 1;

    // 使用publisher发布速度指令需要定义 Velcmd , 并赋予相应的值后，将他publish（）出去
    velcmd.twist.angular.z = 0;//z方向角速度(yaw, deg)
    velcmd.twist.linear.x = 0.5; //x方向线速度(m/s)
    velcmd.twist.linear.y = 0.0;//y方向线速度(m/s)
    velcmd.twist.linear.z = -0.5;//z方向线速度(m/s)

    // 使用publisher发布速度指令需要定义 Velcmd , 并赋予相应的值后，将他publish（）出去
    posecmd.roll = 0; //x方向姿态(rad)
    posecmd.pitch = 0;//y方向姿态(rad)
    posecmd.yaw = 0;//z方向姿态(rad)
    posecmd.throttle = 0.596;//油门， （0.0-1.0）

    //无人机信息通过如下命令订阅，当收到消息时自动回调对应的函数
    odom_suber = nh->subscribe<geometry_msgs::Pose>("/airsim_node/drone_1/debug/pose_gt", 1, std::bind(&POSCtrl::odom_local_ned_cb, this, std::placeholders::_1));//状态真值，用于赛道一
    front_View_suber = it->subscribe("airsim_node/drone_1/front_left/Scene", 1, std::bind(&POSCtrl::front_view_cb, this,  std::placeholders::_1));

    //通过这两个服务可以调用模拟器中的无人机起飞和降落命令
    takeoff_client = nh->serviceClient<airsim_ros::Takeoff>("/airsim_node/drone_1/takeoff");
    land_client = nh->serviceClient<airsim_ros::Takeoff>("/airsim_node/drone_1/land");
    reset_client = nh->serviceClient<airsim_ros::Reset>("/airsim_node/reset");
    setGoalPosition = nh->serviceClient<airsim_ros::SetLocalPosition>("/airsim_node/local_position_goal/override");
    //通过这两个publisher实现对无人机的速度控制和姿态控制
    vel_publisher = nh->advertise<airsim_ros::VelCmd>("airsim_node/drone_1/vel_cmd_body_frame", 1);
    pose_publisher = nh->advertise<airsim_ros::PoseCmd>("airsim_node/drone_1/pose_cmd_body_frame", 1);

    ros::Timer timer = nh->createTimer(ros::Duration(0.5), &POSCtrl::setPosition_cb, this);
    ros::spin();
}

void POSCtrl::setPosition_cb(const ros::TimerEvent&)
{
    if(!takeoffflag)
        takeoff_client.call(takeoff);
        takeoffflag = 1;
    request11_.request.vehicle_name = "drone_1";
    request11_.request.x = goalpath[goalIdx][0];
    request11_.request.y = goalpath[goalIdx][1]; 
    request11_.request.z = goalpath[goalIdx][2];
    request11_.request.yaw = goalpath[goalIdx][3];
    float d = sqrtf32(powf32((goalpath[goalIdx][0] - Pose[0]),2)+powf32((goalpath[goalIdx][1] - Pose[1]),2)+powf32((goalpath[goalIdx][2] - Pose[2]),2));
    //ROS_INFO("dis to goal: %f", d);
    //ROS_INFO("goal : %f %f %f %f", goalpath[goalIdx][0], goalpath[goalIdx][1], goalpath[goalIdx][2], goalpath[goalIdx][3]);
    if(d < 2)
        goalIdx += 1;
        goalIdx %= circlesCount;
    setGoalPosition.call(request11_);
}

POSCtrl::~POSCtrl()
{
    // cv::destroyAllWindows();
}

void POSCtrl::odom_local_ned_cb(const geometry_msgs::Pose::ConstPtr& msg)
{
    // ROS_INFO("Get odom_local_ned_cd\n\r  orientation: %f-%f-%f-%f\n\r  position: %f-%f-%f\n\r", 
    // msg->orientation.w, msg->orientation.x, msg->orientation.y, msg->orientation.z, //姿态四元数
    // msg->position.x, msg->position.y,msg->position.z);//位置)
    tf2::Quaternion quat_tf;
    double roll, pitch, yaw;
    tf2::fromMsg(msg->orientation, quat_tf);
    tf2::Matrix3x3(quat_tf).getRPY(roll, pitch, yaw);
    Pose[0] = msg->position.x;
    Pose[1] = msg->position.y;
    Pose[2] = msg->position.z;
    Pose[3] = yaw;
}


void POSCtrl::front_view_cb(const sensor_msgs::ImageConstPtr& msg)
{
    cv_front_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::TYPE_8UC3);
    cv::imshow("front_left", cv_front_ptr->image);
    cv::waitKey(10);
}


template <typename T> int POSCtrl::sgn(T val) {
    return (T(0) < val) - (val < T(0));
}

void POSCtrl::go_to(float x, float y, float z, float yaw)
{
    ROS_INFO("get updating pose:%f, %f, %f, %f", Pose[0], Pose[1], Pose[2], Pose[3]);
    // double cout = cpid.caculate(10, Pose[2]);
    velcmd.twist.linear.x =0;
    velcmd.twist.linear.y =0;
    velcmd.twist.angular.z = 0;
    velcmd.twist.linear.z = 0;
    // ROS_INFO("output:%f, %f, %f, %f", 0, 0, velcmd.twist.linear.z, 0);
    vel_publisher.publish(velcmd);
}

void POSCtrl::go()
{
    go_to(0, 0, 50, 0);
}

#endif