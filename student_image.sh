#!/bin/bash
gnome-terminal --tab --title="Student_image"  -- /bin/bash -c\
 "docker run --rm -i -t -e ROS_IP='172.17.0.2' -e ROS_MASTER_URI='http://172.17.0.1:11311'  student_basic_dev:0729 bash -c 'source /opt/ros/noetic/setup.sh&&source /home/student_basic_dev/devel/setup.bash&&rosrun basic basic'"
