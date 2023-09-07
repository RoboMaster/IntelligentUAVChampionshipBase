#ifndef _KEY_CTRL_CPP_
#define _KEY_CTRL_CPP_

#include "kb_ctrl.hpp"

int main(int argc, char** argv)
{

    ros::init(argc, argv, "kb_dev"); // 初始化ros 节点，命名为 basic
    ros::NodeHandle n; // 创建node控制句柄
    KBCtrl go(&n);
    return 0;
}

KBCtrl::KBCtrl(ros::NodeHandle *nh)
{  
    it = std::make_unique<image_transport::ImageTransport>(*nh); 
    front_img = cv::Mat(480, 640, CV_8UC3, cv::Scalar(0));
    front_View_suber = it->subscribe("airsim_node/drone_1/front_left/Scene", 1, std::bind(&KBCtrl::front_view_cb, this,  std::placeholders::_1));

    // 使用publisher发布姿态指令需要定义 velcmd , 并赋予相应的值后，将他publish（）出去
    // velcmd.twist.linear.x = 0; 
    // velcmd.twist.linear.y = 0; 
    // velcmd.twist.linear.z = 0; 
    // velcmd.twist.angular.z = 0;

    // vel_publisher = nh->advertise<airsim_ros::VelCmd>("airsim_node/drone_1/vel_cmd_body_frame", 1);

    set_pos.request.x = 0;
    set_pos.request.y = 0;
    set_pos.request.z = 0;
    set_pos.request.yaw = 0;
    setGoalPosition = nh->serviceClient<airsim_ros::SetLocalPosition>("/airsim_node/local_position_goal/override");

    kb_t = std::thread(
        [&](){
        display = XOpenDisplay(0);
        if (display == 0) {
            fprintf(stderr, "unable to open display\n");
            return;
        };
        root = DefaultRootWindow(display);
        XGrabKeyboard(display, root, True, GrabModeAsync, GrabModeAsync, CurrentTime);
        XSelectInput(display, root, KeyPressMask);
        XAutoRepeatOff(display);
        for(int i = 0; i<key_status.size(); i++)
        {
            key_status[i] = false;
        }
        while (1) {
            XNextEvent(display, &event);
            if (event.type == KeyPress) 
            {
                KeySym keysym;
                char buffer[10];
                XLookupString(&event.xkey, buffer, 10, &keysym, NULL);
                //ROS_INFO("press %s", buffer);
                if(buffer[0] == 'q')
                {
                    key_status[0] = true;
                }else if(buffer[0] == 'w')
                {
                    key_status[1] = true;
                }else if(buffer[0] == 'e')
                {
                    key_status[2] = true;
                }else if(buffer[0] == ' ')
                {
                    key_status[3] = true;
                }else if(buffer[0] == 'a')
                {
                    key_status[4] = true;
                }else if(buffer[0] == 's')
                {
                    key_status[5] = true;
                }else if(buffer[0] == 'd')
                {
                    key_status[6] = true;
                }else if(buffer[0] == 'f')
                {
                    key_status[7] = true;
                }
            }
            else if (event.type == KeyRelease)
            {
                KeySym keysym;
                char buffer[10];
                XLookupString(&event.xkey, buffer, 10, &keysym, NULL);
                if(event.xkey.keycode == 0x09)break;
                //ROS_INFO("release %s", buffer);
                if(buffer[0] == 'q')
                {
                    key_status[0] = false;
                }else if(buffer[0] == 'w')
                {
                    key_status[1] = false;
                }else if(buffer[0] == 'e')
                {
                    key_status[2] = false;
                }else if(buffer[0] == ' ')
                {
                    key_status[3] = false;
                }else if(buffer[0] == 'a')
                {
                    key_status[4] = false;
                }else if(buffer[0] == 's')
                {
                    key_status[5] = false;
                }else if(buffer[0] == 'd')
                {
                    key_status[6] = false;
                }else if(buffer[0] == 'f')
                {
                    key_status[7] = false;
                }
            }
            }
        XAutoRepeatOn(display);
        XCloseDisplay(display);
        ros::shutdown();
        ros::waitForShutdown();
        //ROS_INFO("Break from x11");
        }
    );
    ros::Timer timer = nh->createTimer(ros::Duration(0.02), &KBCtrl::ctrl_cb, this);
    ros::spin();
}

KBCtrl::~KBCtrl()
{
    if(kb_t.joinable())kb_t.join();
}

void KBCtrl::ctrl_cb(const ros::TimerEvent&)
{
    if(key_status[0])delta_yaw = -0.01;
    else 
    {
        if(!key_status[2])delta_yaw = 0;
    }
    if(key_status[1])delta_x = 0.04;
    else 
    {
        if(!key_status[5])delta_x = 0;
    }
    if(key_status[2])delta_yaw = 0.01;
    else 
    {
        if(!key_status[0])delta_yaw = 0;
    }
    if(key_status[3])delta_z = -0.03;
    else 
    {
        if(!key_status[7])delta_z = 0;
    }
    if(key_status[4])delta_y = -0.04;
    else 
    {
        if(!key_status[6])delta_y = 0;
    }
    if(key_status[5])delta_x = -0.04;
    else 
    {
        if(!key_status[1])delta_x = 0;
    }
    if(key_status[6])delta_y = 0.04;
    else 
    {
        if(!key_status[4])delta_y = 0;
    }
    if(key_status[7])delta_z = 0.03;
    else 
    {
        if(!key_status[3])delta_z = 0;
    }
    set_pos.request.yaw += delta_yaw;
    if(set_pos.request.yaw < -3.14)set_pos.request.yaw += 6.28;
    if(set_pos.request.yaw > 3.14)set_pos.request.yaw -= 6.28;

    float new_yaw = set_pos.request.yaw + delta_yaw /2 *0.02;
    float delta_x_w = cosf64(new_yaw) * delta_x - sinf64(new_yaw) * delta_y;
    float delta_y_w = sinf64(new_yaw) * delta_x + cosf64(new_yaw) * delta_y;
    set_pos.request.x += delta_x_w;
    set_pos.request.y += delta_y_w;
    set_pos.request.z += delta_z;
    // ROS_INFO("velcmd: %f %f %f %f", velcmd.twist.linear.x, velcmd.twist.linear.y, velcmd.twist.linear.z, velcmd.twist.angular.z);
    // vel_publisher.publish(velcmd);
    // ROS_INFO("tar pos: %f %f %f %f", set_pos.request.x, set_pos.request.y, set_pos.request.z, set_pos.request.yaw);
    setGoalPosition.call(set_pos);
}

void KBCtrl::front_view_cb(const sensor_msgs::ImageConstPtr& msg)
{
    cv_front_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::TYPE_8UC3);
    cv::imshow("front_left", cv_front_ptr->image);
    cv::waitKey(10);
}

#endif