#include <chrono>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <iostream>
#include <string.h>
#include <fstream>
#include <memory>
#include <thread>
#include "crc.h"
#include <sstream>
#include <iomanip>
#include <vector>

constexpr int UDPSERVERPORT=60001;
constexpr char UDPSERVERIP[]="127.0.0.1";
constexpr int UDPPACKETSIZE=65000;
constexpr int DATASIZEPERSIZE=81840000;
struct DecodedData
{
    char header;
    double timestamp;
    double px;
    double py;
    double pz;
    double vx;
    double vy;
    double vz; 
    uint32_t crc;
}decodeddata;

int main(int argc, char* argv[])
{
    std::vector<std::array<double, 7>> m_ground_true;
    std::fstream f("/basic_dev/gt.txt", std::ios::in);
    if(!f.is_open())
    {
        std::cout<<"Can not open gt file";
        exit;
    }
    std::string sa, ssa;
    std::array<double, 7> tmp_data;
    while(std::getline(f, sa))
    {
        int dex = 0;
        int end = sa.find(','); 
        std::stringstream tmp_ss;
        while (end != -1) {
            ssa = sa.substr(0, end);
            tmp_ss << ssa;
            tmp_ss >> std::setprecision(16) >> tmp_data[dex]; 
            tmp_ss.clear();
            dex += 1;
            sa.erase(sa.begin(), sa.begin() + end + 1);
            end = sa.find(',');
        }
        ssa = sa.substr(0, end);
        tmp_data[dex] = std::stof(ssa);
        m_ground_true.emplace_back(tmp_data);
    }
    int64_t start_timestamp = 0;
    int socket_handler = socket(AF_INET, SOCK_DGRAM, 0);
    if(socket_handler==-1)
    {
        std::cout<<"Can not create socket\n";
        return -1;
    }
    struct sockaddr_in sock_client;
    bzero(&sock_client, (uint)sizeof(sock_client));
    sock_client.sin_family = AF_INET;
    sock_client.sin_addr.s_addr = inet_addr("127.0.0.1");
    sock_client.sin_port = htons(9005);
    struct timeval read_timeout;
    read_timeout.tv_sec = 10;
    read_timeout.tv_usec =  0;
    setsockopt(socket_handler, SOL_SOCKET, SO_RCVTIMEO, &read_timeout, sizeof(read_timeout));
    if(bind(socket_handler,(struct sockaddr*)&sock_client, sizeof(sock_client))==-1)
    {
        std::cout<<"Can not bind UDP server at 127.0.0.1:9005\n";
        return -1;
    }
    else
        std::cout<<"Bind UDP server at 127.0.0.1:9005\n";

    struct sockaddr_in sock_ser;
    bzero(&sock_ser, (uint)sizeof(sock_ser));
    sock_ser.sin_family = AF_INET;
    sock_ser.sin_addr.s_addr = inet_addr(UDPSERVERIP);
    sock_ser.sin_port = htons(UDPSERVERPORT);

    std::string gameStart{"gameStart"};
    if(sendto(socket_handler, gameStart.data(), gameStart.size(), 0, (struct sockaddr*)&sock_ser,sizeof(sock_ser))==-1)
    {
        std::cout<<"Send failed.\n";
        return -1;
    }
    int receive_bytes_count = 0, ret = 0;
    char* udp_rec_buf_ptr;
    udp_rec_buf_ptr = new char[DATASIZEPERSIZE];
    int idx = 0;

    while(1)
    {
        ret = recvfrom(socket_handler, udp_rec_buf_ptr+receive_bytes_count, UDPPACKETSIZE, 0, 0, 0);
        if(ret == -1)break;
        receive_bytes_count += ret;
        if(receive_bytes_count==DATASIZEPERSIZE)
        {
            std::cout<<"Receive "<<receive_bytes_count<<" bytes data.\n";
            receive_bytes_count=0;  
            for(int i = 0; i< 5; i++)
            {
                decodeddata.header = 0xAA;
                decodeddata.timestamp = m_ground_true[idx][0];
                decodeddata.px = m_ground_true[idx][1]+1;
                decodeddata.py = m_ground_true[idx][2]+1;
                decodeddata.pz=m_ground_true[idx][3]+1;
                decodeddata.vx = m_ground_true[idx][4]+1;
                decodeddata.vy=m_ground_true[idx][5]+1;
                decodeddata.vz=m_ground_true[idx][6]+1;
                decodeddata.crc = crc32((uint8_t*)&decodeddata, 57);
                std::cout<<"Data: "<<std::fixed << std::setprecision(5) <<decodeddata.timestamp<<" "<<decodeddata.px<<" "<<decodeddata.py<<" "<<decodeddata.pz<<
                " "<<decodeddata.vx<<" "<<decodeddata.vy<<" "<<decodeddata.vz<<" "<<decodeddata.crc<<"\n";
                if(m_ground_true[idx][0]==0)
                {
                    idx += 1;
                    continue;
                };
                if(sendto(socket_handler, &decodeddata, sizeof(decodeddata), 0, (struct sockaddr*)&sock_ser,sizeof(sock_ser))==-1)
                {
                    std::cout<<"Send failed.\n";
                    return -1;
                }
                idx += 1;
            }
        }
        // }
    }
    f.close();

    delete[] udp_rec_buf_ptr;

    while(1)
    {
        std::cout<<"Decoder died!"<<std::endl;
        std::this_thread::sleep_for(std::chrono::seconds(10));
    }

    return 0;   
}
