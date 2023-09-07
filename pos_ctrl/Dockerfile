FROM osrf/ros:noetic-desktop-full-focal
ADD src /pos_ctrl/src/
ADD setup.bash /

RUN chmod +x /setup.bash

USER root

RUN apt update && apt install python3-catkin-tools -y
RUN apt install ros-noetic-geographic-msgs -y
RUN apt install ros-noetic-tf2-sensor-msgs -y
RUN apt install ros-noetic-tf2-geometry-msgs -y
RUN apt install ros-noetic-image-transport -y

ENV ROS_DISTRO noetic

WORKDIR /pos_ctrl/
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && catkin_make --only-pkg-with-deps airsim_ros && . devel/setup.sh && catkin_make --only-pkg-with-deps pos_ctrl

ENTRYPOINT [ "/setup.bash" ]