#ifndef _KEY_CTRL_HPP_
#define _KEY_CTRL_HPP_

#include <ros/ros.h>
#include "airsim_ros/VelCmd.h"
#include <chrono>
#include <thread>
#include "cv_bridge/cv_bridge.h"
#include "opencv2/opencv.hpp"
#include <X11/Xlibint.h>
#include <X11/Xlib.h>
#include <X11/Xresource.h>
#include <X11/Xutil.h>
#include <airsim_ros/SetLocalPosition.h>
#include <image_transport/image_transport.h>
#endif

class KBCtrl
{
private:
    // 使用publisher发布姿态指令需要定义 Velcmd , 并赋予相应的值后，将他publish（）出去
    airsim_ros::VelCmd velcmd;

    ros::Publisher vel_publisher;

    Display* display;
    XEvent event;
    KeySym keysym;
    Window root;
    std::thread kb_t;
    char text[255];
    std::array<bool, 8> key_status;//qwe ' ' asdf

    airsim_ros::SetLocalPosition set_pos;
    ros::ServiceClient setGoalPosition;

    void ctrl_cb(const ros::TimerEvent&);

    float delta_x, delta_y, delta_z, delta_yaw;

    std::unique_ptr<image_transport::ImageTransport> it;
    image_transport::Subscriber front_View_suber;
    cv_bridge::CvImageConstPtr cv_front_ptr;
    cv::Mat front_img;

    void front_view_cb(const sensor_msgs::ImageConstPtr& msg);
    
public:
    KBCtrl(ros::NodeHandle *nh);
    ~KBCtrl();

};





