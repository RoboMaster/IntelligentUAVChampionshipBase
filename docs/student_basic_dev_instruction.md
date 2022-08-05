# __自主无人机竞速基本开发教程__  
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
    `cd \path\to\student_basic_dev`
    ----
    >下载并导入镜像  
    >+ `wget https://stg-robomasters-hz-q0o2.oss-cn-hangzhou.aliyuncs.com/student_image/student_basic_dev_0729.tar`  
    
    >+ `docker load < student_basic_dev_0729.tar`
    ----
    >使用脚本启动镜像  
    `./student_image.sh`
    ----
    >当看到如下图的标题为 ***student_image*** 空白终端，说明容器启动成功，样例程序启动
    ![pic](./2022-07-31%2001-49-52%20%E7%9A%84%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE.png)
    ---
    >样例提供了使用键盘操作模拟器中无人机的功能，按键为：
    >+ **ws** 控制无人机前后移动
    >+ **ad** 控制无人机左右移动
    >+ **qe** 控制无人机左右转动
    >+ **rf** 控制无人机上下移动
    >+ **`**  退出控制程序(退出容器前必须使用这个命令结束程序，否则会在后台持续对无人机进行控制)

4. ## 基于docker镜像的控制程序开发流程
    本次比赛中的模拟器使用 ***ROS*** 进行通讯，选手需要编写含有控制程序的ros功能包操控无人机完成目标。该ros功能包需要封装在docker镜像中进行提交，流程如下
    >下载 ***student_basic_dev*** 文件,并进入该文件目录  
    `cd /path/to/student_basic_dev`  
    ----
    >基于开发案例完成功能设计与程序开发后，编译程序
    >+ `source /opt/ros/noetic/setup.bash`  
    >+ `rm -rf devel build`  
    >+ `carkin build`  
    >**注意**，功能包的名称及节点名称不能变更，均限定为 ***basic***
    ----
    > 验证程序
    >+ 参考 ***自主无人机竞速模拟器使用说明*** 配置好模拟器并启动
    >+ `cd /path/to/student_basic_dev`  
    >+ `source devel/setup.bash`  
    >+ `rosrun basic basic`    
    ----
    >将程序封装入镜像中
    >+ 完成第3步中的镜像导入后，使用如下指令打开一个容器  
    `docker run -it -v /home/$USER/Documents/student_basic_dev/:/home/tmp   student_basic_dev:0729`  
    >+ 在容器终端中进入 ***/home*** 目录  
    `cd /home`  
    >+ 将 ***/home/tmp*** 中的文件覆盖 ***/home/student_basic_dev*** 的文件  
    `cp -r ./tmp/* ./student_basic_dev/`  
    >+ 删除已编译的内容后重新编译  
    `cd student_basic_dev/`  
    `rm -rf devel/ build/ logs/`  
    `source /opt/ros/noetic/setup.bash `  
    `catkin build`   
    出现 ***airsim_ros_pkgs*** 缺失的错误只需要重新编译一次即可
    >+ 先开一个终端，查看容器号并导出新镜像  
    `docker ps -aq`  
    `docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]`  
    其中 ***[OPTIONS]*** 是可选项， ***CONTAINER*** 输入上一步中获得的容器ID, ***[REPOSITORY:TAG]*** 是导出的镜像名称及版本号，可随意填写， 例如：
    `docker commit 694861df819c myimages:v0.1`
    ----
    > 测试镜像
    >+ 参考 ***自主无人机竞速模拟器使用说明*** 配置好模拟器并启动
    >+ 将如下指令中的 [镜像：TAG] 换成自己的对应名称即可启动测试
    `docker run --rm -i -t -e ROS_IP='172.17.0.2' -e ROS_MASTER_URI='http://172.17.0.1:11311'  [镜像：TAG] bash -c 'source /opt/ros/noetic/setup.sh&&source /home/student_basic_dev/devel/setup.bash&&rosrun basic basic&&exec bash';exec bash`
    ----
    >至此，一个完整的可提交的镜像制作完成

5. ## roa数据交互
    ros可交互数据可以在启动模拟器后，通过`rosrun rqt_topic rqt_topic`指令查看，如图所示，具体的数据结构也可以查询
    ![pic](./2022-07-31%2002-57-58%20%E7%9A%84%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE.png)
    >用于获取数据的可订阅的主题
    >+ 下视相机（所有赛项可用）   
    `/airsim_node/drone_1/bottem_center/Scene` 
    >+ 深度相机的深度数据（与双目二选一）   
    `/airsim_node/drone_1/front_center/DepthPerspective`
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
