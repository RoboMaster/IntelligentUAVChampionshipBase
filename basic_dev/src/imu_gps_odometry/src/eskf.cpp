#include "eskf.hpp"

ErrorStateKalmanFilter::ErrorStateKalmanFilter(double gravity, double pos_noise, double vel_noise, double ori_noise, 
    double gyr_bias_noise, double acc_bias_noise, double pos_std, double ori_std,
    double gyr_noise, double acc_noise)
{
    m_g = Eigen::Vector3d(0.0, 0.0, gravity);
    m_P.block<3, 3>(INDEX_STATE_POSI, INDEX_STATE_POSI) = Eigen::Matrix3d::Identity() * pos_noise * pos_noise;
    m_P.block<3, 3>(INDEX_STATE_VEL, INDEX_STATE_VEL) = Eigen::Matrix3d::Identity() * vel_noise * vel_noise;
    m_P.block<3, 3>(INDEX_STATE_ORI, INDEX_STATE_ORI) = Eigen::Matrix3d::Identity() * ori_noise * ori_noise;
    m_P.block<3, 3>(INDEX_STATE_GYRO_BIAS, INDEX_STATE_GYRO_BIAS) =
            Eigen::Matrix3d::Identity() * gyr_bias_noise * gyr_bias_noise;
    m_P.block<3, 3>(INDEX_STATE_ACC_BIAS, INDEX_STATE_ACC_BIAS) =
            Eigen::Matrix3d::Identity() * acc_bias_noise * acc_bias_noise;
    m_R(0, 0) = pos_std * pos_std;
    m_R(1, 1) = pos_std * pos_std;
    m_R(2, 2) = pos_std * pos_std;
    m_R(3, 3) = ori_std * ori_std;
    m_R(4, 4) = ori_std * ori_std;
    m_R(5, 5) = ori_std * ori_std;
    m_Q.block<3, 3>(0, 0) = Eigen::Matrix3d::Identity() * gyr_noise * gyr_noise;
    m_Q.block<3, 3>(3, 3) = Eigen::Matrix3d::Identity() * acc_noise * acc_noise;
    m_X = Eigen::Matrix<double, DIM_STATE, 1>::Zero();
    m_F = Eigen::Matrix<double, DIM_STATE, DIM_STATE>::Zero();
    m_C = Eigen::Matrix<double, DIM_MEASUREMENT_NOISE, DIM_MEASUREMENT_NOISE>::Identity();
    m_G.block<3, 3>(INDEX_MEASUREMENT_POSI, INDEX_MEASUREMENT_POSI) = Eigen::Matrix3d::Identity();
    m_G.block<3, 3>(3, 6) = Eigen::Matrix3d::Identity();
}

bool ErrorStateKalmanFilter::Init(Eigen::Matrix4d initPose, Eigen::Vector3d initVel, long long tc)
{
    m_pose = initPose;
    m_velocity = initVel;
    m_last_imu_tc = tc;
    m_last_unbias_acc = Eigen::Vector3d::Zero();
    m_last_unbias_gyr = Eigen::Vector3d::Zero();
    std::cout<<"init pose: \n"<<m_pose<<std::endl;
    return true;
}

bool ErrorStateKalmanFilter::Predict(Eigen::Vector3d imu_acc, Eigen::Vector3d imu_gyr, Eigen::Vector3d& pos, Eigen::Vector3d& vel, Eigen::Vector3d& angle_vel, Eigen::Quaterniond& q,  long long tc)
{
    double delta_t = (tc - m_last_imu_tc) / 1000000000.0;
    if(delta_t < 0.005 || delta_t > 0.015)
    {
        m_last_imu_tc = tc;
        return false;
    }
    m_mtx.lock();
    std::cout<<"delta sec: "<<delta_t<<std::endl;
    Eigen::Vector3d unbias_gyr = imu_gyr - m_gyro_bias;
    Eigen::Vector3d phi = (unbias_gyr +m_last_unbias_gyr) / 2.0 * delta_t;
    double phi_norm = phi.norm();
    Eigen::Matrix3d skew_sym_m_phi;
    skew_sym_m_phi << 
        0.0, -phi[2], phi[1], 
        phi[2], 0.0, -phi[0],
        -phi[1], phi[0], 0.0;
    Eigen::Matrix3d R_i0_i1 = Eigen::Matrix3d::Identity() + sinf64(phi_norm)/phi_norm * 
            skew_sym_m_phi + (1-cosf64(phi_norm))/(phi_norm*phi_norm)*skew_sym_m_phi*skew_sym_m_phi;
    Eigen::Matrix3d last_pose = m_pose.block<3, 3>(0, 0);
    m_pose.block<3, 3>(0, 0) =  last_pose * R_i0_i1;
    Eigen::Vector3d unbias_acc = imu_acc - m_accel_bias - m_g;
    Eigen::Vector3d last_vel = m_velocity;
    m_velocity = last_vel + ((m_pose.block<3, 3>(0, 0) * unbias_acc + last_pose * m_last_unbias_acc)/2.0) * delta_t;
    m_pose.block<3, 1>(0, 3) += (last_vel + m_velocity)/2.0 * delta_t + 
        0.25 * (last_pose * m_last_unbias_acc + m_pose.block<3, 3>(0, 0) * unbias_acc) * delta_t * delta_t;
    Eigen::Matrix3d tmpr = m_pose.block<3, 3>(0, 0);
    Eigen::Quaterniond tmpq(tmpr);
    std::cout<<"Q: "<<tmpq.coeffs().transpose()<<std::endl;
    std::cout<<"posi: "<<m_pose.block<3, 1>(0, 3).transpose()<<std::endl;
    std::cout<<"vel: " << m_velocity.transpose()<<std::endl;
    std::cout<<"gyr: "<<m_last_unbias_gyr.transpose()<<std::endl;
    Eigen::Vector3d cur_acc_NED = m_pose.block<3, 3>(0, 0) * (imu_acc - m_accel_bias);
    Eigen::Matrix3d F_23;
    F_23 << 0, -cur_acc_NED[2], cur_acc_NED[1], 
            cur_acc_NED[2], 0, -cur_acc_NED[0],
            -cur_acc_NED[1], cur_acc_NED[0], 0; 
    m_F.block<3, 3>(INDEX_STATE_POSI, INDEX_STATE_VEL) = Eigen::Matrix3d::Identity();
    m_F.block<3, 3>(INDEX_STATE_VEL, INDEX_STATE_ORI) = F_23;
    m_F.block<3, 3>(INDEX_STATE_ORI, INDEX_STATE_ORI) = Eigen::Matrix3d::Zero();
    m_F.block<3, 3>(INDEX_STATE_VEL, INDEX_STATE_ACC_BIAS) = m_pose.block<3, 3>(0, 0);
    m_F.block<3, 3>(INDEX_STATE_ORI, INDEX_STATE_GYRO_BIAS) = -m_pose.block<3, 3>(0, 0);
    m_B.block<3, 3>(INDEX_STATE_VEL, 3) = m_pose.block<3, 3>(0, 0);
    m_B.block<3, 3>(INDEX_STATE_ORI, 0) = -m_pose.block<3, 3>(0, 0);
    Eigen::Matrix<double, DIM_STATE, DIM_STATE> Fk =  Eigen::Matrix<double, DIM_STATE, DIM_STATE>::Identity() + m_F * delta_t;
    Eigen::Matrix<double, DIM_STATE, DIM_STATE_NOISE> Bk = m_B * delta_t;
    m_X = Fk * m_X;
    m_P = Fk * m_P*Fk.transpose()+m_B*m_Q*m_B.transpose();

    m_last_imu_tc = tc;
    m_last_unbias_gyr = unbias_gyr;
    m_last_unbias_acc = unbias_acc;

    pos = m_pose.block<3, 1>(0, 3);
    vel = m_velocity;
    angle_vel = m_last_unbias_gyr;
    q = tmpq;

    m_mtx.unlock();
    return true;
}

bool ErrorStateKalmanFilter::correct(Eigen::Vector3d gps_pos, Eigen::Quaterniond gps_q)
{
    m_mtx.lock();
    m_Y.block(0, 0, 3, 1) = gps_pos - m_pose.block<3, 1>(0, 3);
    Eigen::Matrix3d measure_q = gps_q.matrix();
    Eigen::Matrix3d err_q = measure_q.inverse() * m_pose.block<3, 3>(0, 0);
    Eigen::AngleAxisd rotation_vector(err_q);
    m_Y.block(3, 0, 3, 1) = rotation_vector.axis() * rotation_vector.angle();
    m_K = m_P * m_G.transpose()*(m_G*m_P*m_G.transpose() + m_C * m_R*m_C.transpose()).inverse();
    m_P = (Eigen::Matrix<double, DIM_STATE, DIM_STATE>::Identity() - m_K * m_G) * m_P;
    m_X = m_X + m_K *(m_Y - m_G*m_X);
    m_pose.block<3, 1>(0, 3) = m_pose.block<3, 1>(0, 3) + m_X.block<3, 1>(INDEX_STATE_POSI, 0);
    m_velocity = (m_velocity + m_X.block<3, 1>(INDEX_STATE_VEL, 0));
    Eigen::Matrix3d phi_hat;
    phi_hat << 0, - m_X(8, 0), m_X(7, 0), 
            m_X(8, 0), 0,  -m_X(6, 0),
            -m_X(7, 0), m_X(6, 0), 0;
    Eigen::AngleAxisd tmp22;
    tmp22.angle() = m_X.block<3, 1>(6, 0).norm();
    tmp22.axis() = m_X.block<3, 1>(6, 0).normalized();
    Eigen::Matrix3d err_r(tmp22);
    m_pose.block<3, 3>(0, 0) =  m_pose.block<3, 3>(0, 0) * err_r.inverse() ;
    Eigen::Matrix3d tmpr2 = m_pose.block<3, 3>(0, 0);
    Eigen::Quaterniond tmpq2(tmpr2);
    m_gyro_bias += m_X.block<3, 1>(INDEX_STATE_GYRO_BIAS, 0);
    m_accel_bias += m_X.block<3, 1>(INDEX_STATE_ACC_BIAS, 0);
    m_X = Eigen::Matrix<double, DIM_STATE, 1>::Zero();
    m_mtx.unlock();
    return true;
}