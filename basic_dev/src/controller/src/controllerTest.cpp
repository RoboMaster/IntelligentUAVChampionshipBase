#include "controllerTest.hpp"

int main(int argc, char** argv)
{
    ros::init(argc, argv, "controller_test"); // 初始化ros 节点，命名为 basic
    ros::NodeHandle n; // 创建node控制句柄
    //无人机信息通过如下命令订阅，当收到消息时自动回调对应的函数
    g_triggerport_client = n.serviceClient<airsim_ros::TriggerPort>("/airsim_node/drone_1/trigger_port");
    g_takeoff_client = n.serviceClient<airsim_ros::Takeoff>("/airsim_node/drone_1/takeoff");
    g_pwm_publisher = n.advertise<airsim_ros::RotorPWM>("/airsim_node/drone_1/rotor_pwm_cmd", 1);
    ros::Subscriber odom_suber = n.subscribe<nav_msgs::Odometry>("/eskf_odom", 1, odom_cb);
    // ros::Subscriber gt_suber = n.subscribe<geometry_msgs::PoseStamped>("/airsim_node/drone_1/debug/pose_gt", 1, gt_cb);
    ros::Subscriber init_pose_suber = n.subscribe<geometry_msgs::PoseStamped>("/airsim_node/initial_pose", 1, init_pose_cb);
    ros::Subscriber end_pose_suber = n.subscribe<geometry_msgs::PoseStamped>("/airsim_node/end_goal", 1, end_position_cb);
    ros::Timer timer = n.createTimer(ros::Duration(1.0), timeCB);
    airsim_ros::Takeoff  tf_cmd;
    tf_cmd.request.waitOnLastTask = 1;
    // g_takeoff_client.call(tf_cmd);
    ros::Rate loop_rate(200);
    while(ros::ok()){
        ros::spinOnce();
        loop_rate.sleep();
    }
    return 0;
}

void timeCB(const ros::TimerEvent& event)
{
    if(cb_cnt / 100 < 11)return;
    airsim_ros::TriggerPort cmd;
    cmd.request.port = trigger_port;
    cmd.request.enter = 1;
    g_triggerport_client.call(cmd);
    trigger_port += 1;
}

void init_pose_cb(const geometry_msgs::PoseStamped::ConstPtr& msg)
{
    Eigen::Quaternion Q(msg->pose.orientation.w, msg->pose.orientation.x, msg->pose.orientation.y, msg->pose.orientation.z);
    Eigen::Matrix3d rotationM = Q.normalized().toRotationMatrix();
    // std::cout<<"initial pose: \n"<<rotationM<<std::endl;
    Eigen::Vector3d pos(msg->pose.position.x, msg->pose.position.y, msg->pose.position.z);
    // std::cout<<"initial pos: "<<pos.transpose()<<std::endl;
    Tw0 = Eigen::Matrix4d::Identity();
    Tw0.block(0, 0, 3, 3)=rotationM;
    Tw0.block(0, 3, 3 ,1) = pos;
    Twb_last = Tw0;
    // std::cout<<"Tw0:\n"<<Tw0<<std::endl;
    get_init_pose = true;
}

void end_position_cb(const geometry_msgs::PoseStamped::ConstPtr& msg)
{
    Pwend = Eigen::Vector3d(msg->pose.position.x, msg->pose.position.y, msg->pose.position.z);
    // std::cout<<"end pos: "<<Pwend.transpose()<<std::endl;
    if(get_init_pose && !get_end_goal)
    {
        for(auto ps: globalPaths)
        {
            if((ps[0]-Tw0.block(0, 3, 3, 1)).norm() < 10)
            {
                for(int i = 0; i < ps.size(); i++)
                {
                    globalPath.emplace_back(ps[i]);
                }
                break;
            }
        }
        for(auto ps: globalPaths)
        {
            if((ps[0]-Pwend).norm() < 10)
            {
                for(int i = 0; i < ps.size(); i++)
                {
                    globalPath.emplace_back(ps[ps.size()-i]);
                }
                break;
            }
        }
        get_end_goal = true;
    }
}

void odom_cb(const nav_msgs::Odometry::ConstPtr& msg)
{
    cb_cnt ++;
    if(cb_cnt / 100 < 10)return;
    if(! get_init_pose)return;
    Eigen::Quaternion Q(msg->pose.pose.orientation.w, msg->pose.pose.orientation.x, msg->pose.pose.orientation.y, msg->pose.pose.orientation.z);
    Eigen::Matrix4d Twb = Eigen::Matrix4d::Identity();
    Twb.block(0, 0, 3 ,3) = Q.normalized().toRotationMatrix();
    Twb(0, 3) = msg->pose.pose.position.x;
    Twb(1, 3) = msg->pose.pose.position.y;
    Twb(2, 3) = msg->pose.pose.position.z;
    // std::cout<<"Twb rt:\n"<<Twb<<std::endl;
    // std::cout<<phi<<" "<<theta<<" "<<psi<<std::endl;
    Eigen::VectorXf X_des, X_real;
    X_des.resize(12);
    X_real.resize(12);
    // Twb_last = Twb;
    // std::cout<<"Tw0:\n"<<Tw0<<std::endl;
    Eigen::Matrix4d TWfluWned;
    TWfluWned << 1, 0, 0, 0, 
                0, -1, 0, 0,
                0, 0, -1, 0, 
                0, 0, 0, 1;
    Eigen::Matrix4d TWflu0 = TWfluWned * Tw0 * TWfluWned.inverse();
    Eigen::Matrix4d TWflub = TWfluWned * Twb * TWfluWned.inverse();
    Eigen::Matrix4d T0flub = TWflu0.inverse() * TWflub;
    Eigen::Vector3d VWned(msg->twist.twist.linear.x, msg->twist.twist.linear.y, msg->twist.twist.linear.z);
    Eigen::Vector3d VBned = Twb.block(0, 0, 3 ,3).inverse() * VWned;
    Eigen::Vector3d VBflu = TWfluWned.block<3, 3>(0, 0) * VBned;
    Eigen::Vector3d Wned(msg->twist.twist.angular.x, msg->twist.twist.angular.y, msg->twist.twist.angular.z);
    Eigen::Vector3d Wflu = TWfluWned.block<3, 3>(0, 0) * Wned;
    const float phi = std::asin(T0flub(2, 1));
    const float theta = std::atan2(-T0flub(2, 0)/std::cos(phi), T0flub(2, 2)/std::cos(phi));
    const float psi = std::atan2(-T0flub(0, 1)/std::cos(phi), T0flub(1, 1)/std::cos(phi));
    X_real<<T0flub(0, 3), T0flub(1, 3), T0flub(2, 3), 
        VBflu.x(), VBflu.y(), VBflu.z(), 
        phi, theta, psi, Wflu.x(), Wflu.y(), Wflu.z();
    X_des << 1.0, 1.0, 0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    Eigen::Vector4f output = g_PDcontroller.execute( X_des, X_real);
    airsim_ros::RotorPWM pwm_cmd;
    pwm_cmd.rotorPWM0 = output[0];
    pwm_cmd.rotorPWM1 = output[1];
    pwm_cmd.rotorPWM2 = output[2];
    pwm_cmd.rotorPWM3 = output[3];
    // // std::cout<<pwm_cmd.rotorPWM0<<" "<<pwm_cmd.rotorPWM1<<" "<<pwm_cmd.rotorPWM2<<" "<<pwm_cmd.rotorPWM3<<" "<<std::endl;
    if(X_real[0]<3.0)
    {
        g_pwm_publisher.publish(pwm_cmd);
    }else
    {
        if(trigger_port > 12)
            trigger_port = 0;
    }

}
