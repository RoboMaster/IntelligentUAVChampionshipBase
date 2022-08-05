#include "basic.hpp"

int main(int argc, char** argv)
{
    system("stty raw -echo -F" "/dev/tty"); //用于启动键盘监听
    ros::init(argc, argv, "basic"); // 初始化ros 节点，命名为 basic
    ros::NodeHandle n; // 创建node控制句柄
    image_transport::ImageTransport it(n); //创建图像传输控制句柄

    //无人机信息通过如下命令订阅，当收到消息时自动回调对应的函数
    // ros::Subscriber GPSYaw_suber = n.subscribe<airsim_ros_pkgs::GPSYaw>("/airsim_node/origin_geo_point", 1, origin_geo_point_cb);//无人机起点(经纬度)
    // ros::Subscriber odom_suber = n.subscribe<nav_msgs::Odometry>("/airsim_node/drone_1/odom_local_ned", 1, odom_local_ned_cb);//状态真值，用于赛道一
    // ros::Subscriber imu_suber = n.subscribe<sensor_msgs::Imu>("airsim_node/drone_1/imu/imu", 1, imu_cb);//imu数据
    // image_transport::Subscriber bottom_View_suber = it.subscribe("airsim_node/drone_1/front_center/Scene", 1, bottom_view_cb);

    //通过这两个服务可以调用模拟器中的无人机起飞和降落命令
    ros::ServiceClient takeoff_client = n.serviceClient<airsim_ros_pkgs::Takeoff>("/airsim_node/drone_1/takeoff");
    ros::ServiceClient land_client = n.serviceClient<airsim_ros_pkgs::Takeoff>("/airsim_node/drone_1/land");

    // 调用服务前需要定义特定的调用参数
    airsim_ros_pkgs::Takeoff takeoff;
    takeoff.request.waitOnLastTask = 1;
    airsim_ros_pkgs::Land land;
    land.request.waitOnLastTask = 1;

    //通过这两个publisher实现对无人机的速度控制和姿态控制
    ros::Publisher vel_publisher = n.advertise<airsim_ros_pkgs::VelCmd>("airsim_node/drone_1/vel_cmd_body_frame", 1);
    ros::Publisher pose_publisher = n.advertise<airsim_ros_pkgs::PoseCmd>("airsim_node/drone_1/pose_cmd_body_frame", 1);

    // 使用publisher发布速度指令需要定义 Velcmd , 并赋予相应的值后，将他publish（）出去
    airsim_ros_pkgs::VelCmd velcmd;
    velcmd.twist.angular.z = 0;//z方向角速度(yaw, deg)
    velcmd.twist.linear.x = 0.5; //x方向线速度(m/s)
    velcmd.twist.linear.y = 0.0;//y方向线速度(m/s)
    velcmd.twist.linear.z = -0.5;//z方向线速度(m/s)

    // 使用publisher发布速度指令需要定义 Velcmd , 并赋予相应的值后，将他publish（）出去
    airsim_ros_pkgs::PoseCmd posecmd;
    posecmd.roll = 0; //x方向姿态(rad)
    posecmd.pitch = 0;//y方向姿态(rad)
    posecmd.yaw = 0;//z方向姿态(rad)
    posecmd.throttle = 0.596;//油门， （0.0-1.0）


    ros::Rate loop_rate(50);
    while(ros::ok()){

        //通过publish命令发布控制指令给模拟器
        // vel_publisher.publish(velcmd);
        // pose_publisher.publish(posecmd);

        //键盘控制无人机
        kb = scanKeyboard();
        switch (kb)
        {
        case '`':
            exit_flag = 1;
            break;
        case 't':    
        // 通过 .call(参数) 的函数对模拟器中的服务发起起飞请求，程序暂停直到该服务返回结果
            if(takeoff_client.call(takeoff)){
                ROS_INFO("Takeoff Succeed!");
            }else{
                ROS_ERROR("Failed to takeoff, exit!");\
                return 0;
            }
            break;
        case 'l':
        // 通过 .call(参数) 的函数对模拟器中的服务发起降落请求，程序暂停直到该服务返回结果
            if(land_client.call(land)){
                ROS_INFO("Land Succeed!");
            }else{
                ROS_ERROR("Failed to land, exit!");\
                return 0;
            }
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
        }
        if(exit_flag == 1) break;
        vel_publisher.publish(velcmd);
        ros::spinOnce();
        loop_rate.sleep();
    }

    system("stty -raw echo -F" "/dev/tty");
    return 0;
}

void origin_geo_point_cb(const airsim_ros_pkgs::GPSYaw::ConstPtr& msg)
{
    ROS_INFO("Get origin_geo_point: %f-%f-%f-%f", msg->altitude, msg->latitude, msg->longitude, msg->yaw); //海拔-维度-经度-偏航角
}

void odom_local_ned_cb(const nav_msgs::Odometry::ConstPtr& msg)
{
    ROS_INFO("Get odom_local_ned_cd\n  orientation: %f-%f-%f-%f\n  position: %f-%f-%f\n  linear velocity: %f-%f-%f\n  angular velocity: %f-%f-%f", 
    msg->pose.pose.orientation.w, msg->pose.pose.orientation.x, msg->pose.pose.orientation.y, msg->pose.pose.orientation.z, //姿态四元数
    msg->pose.pose.position.x, msg->pose.pose.position.y,msg->pose.pose.position.z,//位置
    msg->twist.twist.linear.x, msg->twist.twist.linear.y, msg->twist.twist.linear.z, //线速度
    msg->twist.twist.angular.x,  msg->twist.twist.angular.y,  msg->twist.twist.angular.z );//角速度 
}

void imu_cb(const sensor_msgs::Imu::ConstPtr& msg)
{
    ROS_INFO("Get imu data\n  orientation: %f-%f-%f-%f\n  linear accelaration: %f-%f-%f\n  angular accelaration: %f-%f-%f", 
    msg->orientation.w, msg->orientation.x,msg->orientation.y,msg->orientation.z,//姿态四元数
    msg->linear_acceleration.x, msg->linear_acceleration.y,msg->linear_acceleration.z,//线加速度
    msg->angular_velocity.x, msg->angular_velocity.y, msg->angular_velocity.z);//角加速度
}

void bottom_view_cb(const sensor_msgs::ImageConstPtr& msg)
{
    ROS_INFO("Get bottom view image\n height: %d\n weight: %d\n size: %d",
    msg->height, msg->width, msg->data.size());//图像高度宽度以及数据大小， size = height*weight*3 (8bit3通道)
}

int scanKeyboard()
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

template <typename T> int sgn(T val) {
    return (T(0) < val) - (val < T(0));
}