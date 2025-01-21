#include "Eigen/Dense"
#include <mutex>
#include <iostream>

class ErrorStateKalmanFilter
{
public:
    //(重力， P_位置不确定度_std, P_速度不确定度_std, P_角度不确定度_std, P_角速度bias不确定度_std, P_加速度bias不确定度_std,
    //gpsx位置测量噪声_std, gpsy位置测量噪声_std, gpsz位置测量噪声_std, gpsz姿态测量噪声_std, imu角速度测量噪声_std, imu加速度测量噪声_std)
    ErrorStateKalmanFilter(double gravity, double pos_noise, double vel_noise, double ori_noise, 
        double gyr_bias_noise, double acc_bias_noise, double pos_std, double ori_std,
        double gyr_noise, double acc_noise);
    bool Init(Eigen::Matrix4d initPose, Eigen::Vector3d initVel,  long long tc);
    bool Predict(Eigen::Vector3d imu_acc, Eigen::Vector3d imu_gyr, Eigen::Vector3d& pos, Eigen::Vector3d& vel, Eigen::Vector3d& angle_vel, Eigen::Quaterniond& q,  long long tc);
    bool correct(Eigen::Vector3d gps_pos, Eigen::Quaterniond gps_q);
    bool m_isInitailed = false;
private:
    static const unsigned int DIM_STATE = 15;
    static const unsigned int DIM_STATE_NOISE = 6;
    static const unsigned int DIM_MEASUREMENT = 6;
    static const unsigned int DIM_MEASUREMENT_NOISE = 6;
    static const unsigned int INDEX_STATE_POSI = 0;
    static const unsigned int INDEX_STATE_VEL = 3;
    static const unsigned int INDEX_STATE_ORI = 6;
    static const unsigned int INDEX_STATE_GYRO_BIAS = 9;
    static const unsigned int INDEX_STATE_ACC_BIAS = 12;
    static const unsigned int INDEX_MEASUREMENT_POSI = 0;
    Eigen::Matrix<double, DIM_STATE, 1> m_X = Eigen::Matrix<double, DIM_STATE, 1>::Zero();
    Eigen::Matrix<double, DIM_MEASUREMENT, 1> m_Y = Eigen::Matrix<double, DIM_MEASUREMENT, 1>::Zero();
    Eigen::Matrix<double, DIM_STATE, DIM_STATE> m_F = Eigen::Matrix<double, DIM_STATE, DIM_STATE>::Zero();
    Eigen::Matrix<double, DIM_STATE, DIM_STATE_NOISE> m_B = Eigen::Matrix<double, DIM_STATE, DIM_STATE_NOISE>::Zero();
    Eigen::Matrix<double, DIM_STATE_NOISE, DIM_STATE_NOISE> m_Q = Eigen::Matrix<double, DIM_STATE_NOISE, DIM_STATE_NOISE>::Zero();
    Eigen::Matrix<double, DIM_STATE, DIM_STATE> m_P = Eigen::Matrix<double, DIM_STATE, DIM_STATE>::Zero();
    Eigen::Matrix<double, DIM_STATE, DIM_MEASUREMENT> m_K = Eigen::Matrix<double, DIM_STATE, DIM_MEASUREMENT>::Zero();
    Eigen::Matrix<double, DIM_MEASUREMENT_NOISE, DIM_MEASUREMENT_NOISE> m_C = Eigen::Matrix<double, DIM_MEASUREMENT_NOISE, DIM_MEASUREMENT_NOISE>::Zero();
    Eigen::Matrix<double, DIM_MEASUREMENT, DIM_STATE> m_G = Eigen::Matrix<double, DIM_MEASUREMENT, DIM_STATE>::Zero();
    Eigen::Matrix<double, DIM_MEASUREMENT, DIM_MEASUREMENT> m_R = Eigen::Matrix<double, DIM_MEASUREMENT, DIM_MEASUREMENT>::Zero();
    Eigen::Vector3d m_velocity = Eigen::Vector3d::Zero();
    Eigen::Vector3d m_gyro = Eigen::Vector3d::Zero();
    Eigen::Matrix4d m_pose = Eigen::Matrix4d::Identity();
    Eigen::Vector3d m_gyro_bias = Eigen::Vector3d::Zero();
    Eigen::Vector3d m_accel_bias = Eigen::Vector3d::Zero();
    Eigen::Vector3d m_g = Eigen::Vector3d::Zero();//重力加速度
    Eigen::Vector3d m_gps = Eigen::Vector3d::Zero();

    long long m_last_imu_tc = 0;
    Eigen::Vector3d m_last_unbias_acc;
    Eigen::Vector3d m_last_unbias_gyr;
    std::mutex m_mtx;
};