#ifndef _GO_CPP_
#define _GO_CPP_

#include "go.hpp"

int main(int argc, char** argv)
{

    ros::init(argc, argv, "stage1_RGBD_go"); // 初始化ros 节点，命名为 basic
    ros::NodeHandle n; // 创建node控制句柄
    Go go(&n);
    return 0;
}

Go::Go(ros::NodeHandle *nh)
{  
    //创建图像传输控制句柄
    it = std::make_unique<image_transport::ImageTransport>(*nh); 
    tmp_img3 = cv::Mat(480, 640, CV_8UC3, cv::Scalar(0));
    tmp_img1 = cv::Mat(480, 640, CV_8UC1, cv::Scalar(0));

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
    odom_suber = nh->subscribe<nav_msgs::Odometry>("/airsim_node/drone_1/odom_local_ned", 1, std::bind(&Go::odom_local_ned_cb, this, std::placeholders::_1));//状态真值，用于赛道一
    // ros::Subscriber imu_suber = n.subscribe<sensor_msgs::Imu>("airsim_node/drone_1/imu/imu", 1, imu_cb);//imu数据
    // image_transport::Subscriber bottom_View_suber = it.subscribe("airsim_node/drone_1/bottom_center/Scene", 1, bottom_view_cb);
    // front_View_suber = it->subscribe("airsim_node/drone_1/front_center/Scene", 1, std::bind(&Go::front_view_cb, this,  std::placeholders::_1));

    //通过这两个服务可以调用模拟器中的无人机起飞和降落命令
    takeoff_client = nh->serviceClient<airsim_ros_pkgs::Takeoff>("/airsim_node/drone_1/takeoff");
    land_client = nh->serviceClient<airsim_ros_pkgs::Takeoff>("/airsim_node/drone_1/land");
    setGoalPosition = nh->serviceClient<airsim_ros_pkgs::SetLocalPosition>("/airsim_node/local_position_goal/override");
    //通过这两个publisher实现对无人机的速度控制和姿态控制
    vel_publisher = nh->advertise<airsim_ros_pkgs::VelCmd>("airsim_node/drone_1/vel_cmd_body_frame", 1);
    pose_publisher = nh->advertise<airsim_ros_pkgs::PoseCmd>("airsim_node/drone_1/pose_cmd_body_frame", 1);

    ros::Timer timer = nh->createTimer(ros::Duration(0.5), &Go::setPosition_cb, this);

    // boost::thread t(&Go::keyboard_cb, this, takeoff_client, land_client, vel_publisher);
    // t.detach();
    ros::spin();
}

void Go::setPosition_cb(const ros::TimerEvent&)
{
    if(!takeoffflag)
        takeoff_client.call(takeoff);
        takeoffflag = 1;
    request11_.request.vehicle_name = "drone_1";
    request11_.request.x = goalpath[goalIdx][0];
    request11_.request.y = goalpath[goalIdx][1]; 
    request11_.request.z = goalpath[goalIdx][2];
    request11_.request.yaw = 0;
    float d = sqrtf32(powf32((goalpath[goalIdx][0] - Pose[0]),2)+powf32((goalpath[goalIdx][1] - Pose[1]),2)+powf32((goalpath[goalIdx][1] - Pose[1]),2));
    ROS_INFO("dis to goal: %f", d);
    ROS_INFO("goal : %f %f %f", goalpath[goalIdx][0], goalpath[goalIdx][1], goalpath[goalIdx][2]);
    if(d < 0.5)
        goalIdx += 1;
        if(goalIdx == circlesCount)
            goalIdx -= 1;
    setGoalPosition.call(request11_);
}

Go::~Go()
{
    cv::destroyAllWindows();
}

void Go::odom_local_ned_cb(const nav_msgs::Odometry::ConstPtr& msg)
{
    // ROS_INFO("Get odom_local_ned_cd\n\r  orientation: %f-%f-%f-%f\n\r  position: %f-%f-%f\n\r  linear velocity: %f-%f-%f\n\r  angular velocity: %f-%f-%f\n\r", 
    // msg->pose.pose.orientation.w, msg->pose.pose.orientation.x, msg->pose.pose.orientation.y, msg->pose.pose.orientation.z, //姿态四元数
    // msg->pose.pose.position.x, msg->pose.pose.position.y,msg->pose.pose.position.z,//位置
    // msg->twist.twist.linear.x, msg->twist.twist.linear.y, msg->twist.twist.linear.z, //线速度
    // msg->twist.twist.angular.x,  msg->twist.twist.angular.y,  msg->twist.twist.angular.z );//角速度 
    Eigen::Quaternion<float> q(msg->pose.pose.orientation.w, msg->pose.pose.orientation.x, msg->pose.pose.orientation.y, msg->pose.pose.orientation.z);
    auto euler = q.toRotationMatrix().eulerAngles(2, 1, 0);//转换成x-y-z外旋欧拉角
    Pose[0] = msg->pose.pose.position.x;
    Pose[1] = msg->pose.pose.position.y;
    Pose[2] = msg->pose.pose.position.z;
    Pose[3] = euler[0];
}

void Go::bottom_view_cb(const sensor_msgs::ImageConstPtr& msg)
{
    cv_bottom_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::TYPE_8UC3);
    cv::GaussianBlur(cv_bottom_ptr->image, cv_bottom_ptr->image, cv::Size(25, 25), 0);
    cv::erode(cv_bottom_ptr->image, cv_bottom_ptr->image, cv::getStructuringElement(cv::MORPH_ELLIPSE, cv::Size(25, 25)));
    cv::cvtColor(cv_bottom_ptr->image, tmp_img1, CV_BGR2GRAY);
    cv::threshold(tmp_img1, tmp_img1, 110, 255, CV_THRESH_BINARY_INV);
    cv::imshow("123", tmp_img1);
    cv::waitKey(5);
}

void Go::front_view_cb(const sensor_msgs::ImageConstPtr& msg)
{
    cv_front_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::TYPE_8UC3);
    cv::erode(cv_front_ptr->image, cv_front_ptr->image, cv::getStructuringElement(cv::MORPH_ELLIPSE, cv::Size(25, 25)));
    cv::inRange(cv_front_ptr->image, cv::Scalar(0, 40, 40), cv::Scalar(0, 100, 100), tmp_img3);
    cv::imshow("123", tmp_img3);
    cv::waitKey(10);
}

int Go::scanKeyboard()
{
    fd_set rfds;
    struct timeval tv;
    FD_ZERO(&rfds);
    FD_SET(0, &rfds);
    tv.tv_sec = 0;
    tv.tv_usec = 10;
    if(select(1, &rfds, NULL, NULL, &tv)>0) 
        return getchar();
    else 
        return 0;
}

template <typename T> int Go::sgn(T val) {
    return (T(0) < val) - (val < T(0));
}

void Go::go_to(float x, float y, float z, float yaw)
{
    ROS_INFO("get upodating pose:%f, %f, %f, %f", Pose[0], Pose[1], Pose[2], Pose[3]);
    // double cout = cpid.caculate(10, Pose[2]);
    velcmd.twist.linear.x =0;
    velcmd.twist.linear.y =0;
    velcmd.twist.angular.z = 0;
    velcmd.twist.linear.z = 0;
    // ROS_INFO("output:%f, %f, %f, %f", 0, 0, velcmd.twist.linear.z, 0);
    vel_publisher.publish(velcmd);
}

void Go::go()
{
    go_to(0, 0, 50, 0);
}

void Go::keyboard_cb(const ros::ServiceClient& takeoff_client, const ros::ServiceClient& land_client, const ros::Publisher& vel_publisher)
{
    system("stty raw -echo -F" "/dev/tty"); //用于启动键盘监听
    ros::Rate loop_rate(50);
    bool exit_flag = 0;
    while(exit_flag == 0)
    {
        kb = scanKeyboard();
        switch (kb)
        {
            case '`':
                exit_flag = 1;
                ROS_INFO("keyboard control exit.");
                break;
            case 'w':
                velcmd.twist.linear.y =0;
                velcmd.twist.angular.z =0;
                velcmd.twist.linear.z =0;
                velcmd.twist.linear.x += 0.1;
                if(velcmd.twist.linear.x>5) velcmd.twist.linear.x=5;
                break;
            case 's':
                velcmd.twist.linear.y =0;
                velcmd.twist.angular.z =0;
                velcmd.twist.linear.z =0;
                velcmd.twist.linear.x -= 0.1;
                if(velcmd.twist.linear.x<-5) velcmd.twist.linear.x=-5;
                break;
            case 'd':
                velcmd.twist.linear.x =0;
                velcmd.twist.angular.z =0;
                velcmd.twist.linear.z =0;
                velcmd.twist.linear.y += 0.1;
                if(velcmd.twist.linear.y>5) velcmd.twist.linear.y=5;
                break;
            case 'a':
                velcmd.twist.linear.x =0;
                velcmd.twist.angular.z =0;
                velcmd.twist.linear.z =0;
                velcmd.twist.linear.y -= 0.1;
                if(velcmd.twist.linear.y<-5) velcmd.twist.linear.y=-5;
                break;
            case 'e':
                velcmd.twist.linear.x =0;
                velcmd.twist.linear.y =0;
                velcmd.twist.linear.z =0;
                velcmd.twist.angular.z += 0.1;
                if(velcmd.twist.angular.z>1) velcmd.twist.angular.z=1;
                posecmd.roll =0;
                break;
            case 'q':
                velcmd.twist.linear.x =0;
                velcmd.twist.linear.y =0;
                velcmd.twist.linear.z =0;
                velcmd.twist.angular.z -= 0.1;
                if(velcmd.twist.angular.z<-1) velcmd.twist.angular.z=-1;
                posecmd.roll =0;
                break;
            case 'f':
                velcmd.twist.linear.x =0;
                velcmd.twist.linear.y =0;
                velcmd.twist.angular.z =0;
                velcmd.twist.linear.z += 0.1;
                if(velcmd.twist.linear.z>2) velcmd.twist.linear.z=2;
                break;
            case 'r':
                velcmd.twist.linear.x =0;
                velcmd.twist.linear.y =0;
                velcmd.twist.angular.z =0;
                velcmd.twist.linear.z -= 0.1;
                if(velcmd.twist.linear.z<-2) velcmd.twist.linear.z=-2;
                break;
            default:
                velcmd.twist.linear.x -=sgn<double>(velcmd.twist.linear.x)*0.1;
                velcmd.twist.linear.y -=sgn<double>(velcmd.twist.linear.y)*0.1;
                velcmd.twist.linear.z -=sgn<double>(velcmd.twist.linear.z)*0.1;
                velcmd.twist.angular.z -=sgn<double>(velcmd.twist.angular.z)*0.03;
                break;
        };
        vel_publisher.publish(velcmd);
        loop_rate.sleep();
    }
    system("stty -raw echo -F" "/dev/tty");
}

#endif