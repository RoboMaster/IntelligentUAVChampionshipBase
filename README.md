# __自主无人机竞速基本开发教程__  
## 更新说明
### 参考案例由无人机键盘控制更改为了针对赛道一（seed值为1）的基本PD路径控制
### 修改了镜像启动方式，提交镜像需要在启动文件中添加相应的启动命令，细节参考 *4. ## 基于docker镜像的控制程序开发流程*  
### 数据交互中新增加 **角速度推力控制**

1. ## 启动模拟器 
    参考 ***自主无人机竞速模拟器使用说明*** 配置好模拟器并启动

2. ## 安装Nvidia-Docker
    >确保已安装了 Nvidia 驱动
    ----
    >安装docker
    >+ `sudo apt-get install ca-certificates gnupg lsb-release`
    >+ `sudo mkdir -p /etc/apt/keyrings`
    >+ `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`
    >+ `echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
    >+ `sudo apt-get update`
    >+ `sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin`
    ----
    >安装nvidia-container-toolkit
    >+ `distribution=$(. /etc/os-release;echo $ID$VERSION_ID)`
    >+ `curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -`
    >+ `curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list`
    >+ `sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit`
    >+ `sudo systemctl restart docker`
    ---
    >设置用户组，消除 *sudo* 限制  
    >+ `sudo groupadd docker`  
    >+ `$ sudo gpasswd -a $USER docker`  
    >+ 注销账户并重新登录使新的用户组生效
    >+ sudo service docker restart

3. ## 开发环境基础镜像案例的使用
    >进入文件目录  
    `cd /pat/to/IntelligentUAVChampionshipBase`
    ----
    >下载并导入镜像  
    >+ `wget https://stg-robomasters-hz-q0o2.oss-cn-hangzhou.aliyuncs.com/student_image/student_basic_dev_0825.tar`  
    
    >+ `docker load < student_basic_dev_0825.tar`
    ----
    >启动docker镜像  
    `docker run --rm -i -t -e ROS_IP='172.17.0.2' -e ROS_MASTER_URI='http://172.17.0.1:11311' student_basic_dev_0825`
    ----
    >当看到如下图，说明容器启动成功，样例程序启动
    ![pic](./docs/Screenshot%20from%202022-08-25%2017-00-06.png)
    ----
    >样例提供了提供了基本的PD控制，可完成急速穿圈赛项（seed值为1时）

4. ## 基于docker镜像的控制程序开发流程
    本次比赛中的模拟器使用 ***ROS*** 进行通讯，选手需要编写含有控制程序的ros功能包操控无人机完成目标,该ros功能包需要封装在docker镜像中进行提交。建议先在主机下开发完相应程序后在进行程序的docker封装，流程如下：
    >进入文件目录  
    `cd /path/to/IntelligentUAVChampionshipBase`
    ----
    >在LINUX端中基于开发案例完成功能设计与程序开发后，编译程序
    >+ `source /opt/ros/noetic/setup.bash`  
    >+ `rm -rf devel build`  
    >+ `carkin build`  
    出现 ***airsim_ros_pkgs*** 缺失的错误只需要重新编译一次即可
    ----
    > 在LINUX端验证程序
    >+ 参考 ***自主无人机竞速模拟器使用说明*** 配置好模拟器并启动
    >+ `cd /path/to/IntelligentUAVChampionshipBase`
    >+ `source devel/setup.bash`  
    >+ `roslaunch go go.launch`    
    ----
    >在LINUX端将程序封装入镜像中
    >+ 完成第3步中的镜像导入后，使用如下指令打开一个容器，*-v* 指令会将主机中的 *IntelligentUAVChampionshipBase*  文件夹挂载到容器中的 */home/tmp* 中，使得容器可以访问主机文件夹的文件  
    `docker run -it -v /path/to/IntelligentUAVChampionshipBase/:/home/tmp   student_basic_dev_0825`  
    >+ 在容器终端中进入 ***/home*** 目录  
    `cd /home`  
    >+ 在容器终端中用 ***/home/tmp*** 中的src文件夹覆盖 ***/home/student_basic_dev*** 的src文件夹  
    `rm -r ./student_basic_dev/*`  
    `cp -r ./tmp/src ./student_basic_dev/`  
    >+ 在容器终端中删除已编译的内容后重新编译    
    `cd student_basic_dev/`  
    `rm -r devel/ build/ logs/`  
    `source /opt/ros/noetic/setup.bash `  
    `catkin build`   
    出现 ***airsim_ros_pkgs*** 缺失的错误只需要重新编译一次即可
    >+ 在容器终端中添加自动启动命令  
    `sudo apt install vim`
    `vim /etc/bash.bashrc `   
    按 i 建进入编辑模式， 在最下面添加程序启动命令，例如：  
    `source /home/student_basic_dev/devel/setup.bash`  
    `roslaunch go go.launch`  
    按 esc 退出编辑模式后，输入 `:wq` 退出编辑器
    >+ 在主机中打开另一个终端，查看容器号并导出新镜像  
    `docker ps -aq`  
    `docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]`  
    其中 ***[OPTIONS]*** 是可选项， ***CONTAINER*** 输入上一步中获得的容器ID, ***[REPOSITORY:TAG]*** 是导出的镜像名称及版本号，可随意填写， 例如：
    `docker commit 694861df819c myimages:v0.1`
    ----
    > 在主机中测试镜像
    >+ 参考 ***自主无人机竞速模拟器使用说明*** 配置好模拟器并启动
    >+ 将如下指令中的 [镜像：TAG] 换成自己的对应名称即可启动测试  
    `docker run --rm -i -t -e ROS_IP='172.17.0.2' -e ROS_MASTER_URI='http://172.17.0.1:11311'  [镜像：TAG]`
    ----
    >当容器启动后，模拟器运作正常时，一个完整的可提交的镜像制作完成,导出镜像即可   
    `docker image save [镜像：TAG] > test.tar`  
    在主机工作目录下会出现 test.tar 文件，该文件即为可提交镜像

5. ## roa数据交互
    ros可交互数据可以在启动模拟器后，通过`rosrun rqt_topic rqt_topic`指令查看，如图所示，具体的数据结构也可以查询
    ![pic](./docs/Screenshot%20from%202022-08-25%2017-27-11.png)
    >用于获取数据的可订阅的主题
    >+ 下视相机（所有赛项可用）   
    `/airsim_node/drone_1/bottom_center/Scene` 
    >+ 深度相机的深度数据（与双目二选一）   
    `/airsim_node/drone_1/front_center/DepthPlanar`
    >+ 深度相机的rgb图（与双目二选一）   
    `/airsim_node/drone_1/front_center/Scene`
    >+ 双目左rgb图（与RGBD二选一）   
    `/airsim_node/drone_1/front_left/Scene`
    >+ 双目右rgb图（与RGBD二选一）    
    `/airsim_node/drone_1/front_right/Scene`
    >+ imu数据（所有赛项可用）  
    `/airsim_node/drone_1/imu/imu`
    >+ 无人机状态真值（仅赛项一可用）  
    `/airsim_node/drone_1/odom_local_ned`
    ----
    >用于发送指令的主题
    >+ 姿态控制（所有赛项可用）  
    `/airsim_node/drone_1/pose_cmd_body_frame` 
    >+ 速度控制（所有赛项可用）  
    `/airsim_node/drone_1/vel_cmd_body_frame`
    >+ 角速度推力控制（所有赛项可用）  
    `/airsim_node/drone_1/angle_rate_throttle_frame`
