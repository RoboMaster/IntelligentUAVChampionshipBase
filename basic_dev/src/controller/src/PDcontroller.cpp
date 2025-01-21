#include "PDcontroller.hpp"
#include <iostream>

Eigen::Vector4f UAVLinearController::execute(Eigen::VectorXf& X_des, Eigen::VectorXf& X_real)
{
    float cur_e_z = X_des[2]-X_real[2];
    float u1 = m_mass * m_gravity + m_mass*(m_Kdz * (cur_e_z-m_last_e_z) + m_Kpz * cur_e_z);
    m_last_e_z = cur_e_z;
    if(u1 > m_Fmax * 4)u1 = m_Fmax * 4;
    float cur_e_x = X_des[0] - X_real[0];
    float vxd = std::min<float>(m_max_v, m_Kdx * (cur_e_x - m_last_e_x) + m_Kpx * cur_e_x);
    vxd = std::max<float>(vxd, -m_max_v);
    m_last_e_x = cur_e_x;
    float cur_e_vx = vxd - X_real[3];
    float axd = std::min<float>(m_max_acc, m_Kdvx * (cur_e_vx - m_last_e_vx) + m_Kpvx * cur_e_vx);
    axd = std::max<float>(axd, -m_max_acc);
    m_last_e_vx = cur_e_vx;

    float cur_e_y = X_des[1] - X_real[1];
    float vyd = std::min<float>(m_max_v, m_Kdy * (cur_e_y - m_last_e_y) + m_Kpy * cur_e_y);
    vyd = std::max<float>(vyd, -m_max_v);
    m_last_e_y = cur_e_y;
    float cur_e_vy = vyd - X_real[4];
    float ayd = std::min<float>(m_max_acc, m_Kdvy * (cur_e_vy - m_last_e_vy) + m_Kpvy * cur_e_vy);
    ayd = std::max<float>(ayd, -m_max_acc);
    m_last_e_vy = cur_e_vy;

    float phid = std::min<float>(m_mass / u1 * (axd*sinf(X_des[8]) - ayd*cosf(X_des[8])), m_max_ang);
    float thetad = std::min<float>(m_mass / u1 * (axd*cosf(X_des[8]) + ayd*sinf(X_des[8])), m_max_ang);
    phid = std::max<float>(phid, -m_max_ang);
    thetad = std::max<float>(thetad, -m_max_ang);

    float cur_e_phi = phid - X_real[6];
    if(m_last_e_phi == 0)m_last_e_phi = cur_e_phi;
    float torquex = std::min<float>(2, m_Ixx * (m_Kpphi * cur_e_phi + m_Kdphi * (cur_e_phi - m_last_e_phi)));
    torquex = std::max<float>(-2, torquex);
    m_last_e_phi = cur_e_phi;
    float cur_e_theta = (thetad - X_real[7]);
    if(m_last_e_theta == 0) m_last_e_theta = cur_e_theta;
    float torquey = std::min<float>(2, m_Iyy * (m_Kptheta * cur_e_theta + m_Kdtheta * (cur_e_theta - m_last_e_theta)));
    torquey = std::max<float>(-2, torquey);
    m_last_e_theta = cur_e_theta;
    std::cout<<m_cnt<<", des z: "<<X_des[2]<<" , real z: "<< X_real[2]<<std::endl;
    std::cout<<m_cnt<<", des x: "<<X_des[0]<<" , real x: "<< X_real[0]<<
        ", des vx: "<< vxd<<", real vx: "<<X_real[3]<<", des ax: "<<axd <<", des thata: "<<thetad<<", real theta: "<<X_real[7]
        <<", ty: "<<torquey<< std::endl;
    std::cout<<m_cnt<<", des y: "<<X_des[1]<<" , real y: "<< X_real[1]<<
        ", des vy: "<< vyd<<", real vy: "<<X_real[4]<<", des ay: "<<ayd <<", des phi: "<< phid<<", real phi: "<<X_real[6]
        <<", tx: "<<torquex<< std::endl;

    m_cnt ++;
    float cur_e_psi = X_des[8] - X_real[8];
    float torquez = m_Izz * (m_Kppsi *  cur_e_psi + m_Kdpsi * (cur_e_psi - m_last_e_psi));
    m_last_e_psi = cur_e_psi;
    Eigen::Matrix4f M;
    M << 1, 1, 1, 1,
     -1, 1, 1, -1, 
     -1, 1, -1, 1, 
     -1, -1, 1, 1;
    Eigen::Vector4f u = Eigen::Vector4f(u1/m_Ct, torquex/(m_armlength*m_Ct*0.707), torquey/(m_armlength*m_Ct*0.707), torquez/m_Cq);
    Eigen::Vector4f thrust = m_Ct * M.inverse() * u;
    float max_output = 0;
    float min_output = 999;
    Eigen::Vector4f pwm;
    for(int i = 0;i<thrust.size();++i){
        pwm[i] = std::max<float>(0.1,thrust[i]/m_Fmax);
        if(pwm[i]>max_output)max_output = pwm[i];
        if(pwm[i]<min_output)min_output = pwm[i];
    }
    if(max_output > 1.0)
    {
        for(int i = 0;i<thrust.size();++i){
            pwm[i] = std::max<float>(0.1, pwm[i]/max_output);
        }
    }

    return pwm;
}