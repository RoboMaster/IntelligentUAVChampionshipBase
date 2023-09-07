cmake_minimum_required(VERSION 3.0.2)
project(kb_ctrl)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
set(OpenCV_DIR /usr/lib/x86_64-linux-gnu/cmake/opencv4/)

find_package(catkin REQUIRED COMPONENTS
airsim_ros
message_generation
nav_msgs
roscpp
rospy
sensor_msgs
std_msgs
geographic_msgs
geometry_msgs
std_srvs
image_transport
OpenCV
cv_bridge
)

catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS message_runtime roscpp std_msgs # nodelet 
)

include_directories(include ${catkin_INCLUDE_DIRS} ${OpenCv_INCLUDE_DIRS})


add_executable(kb_ctrl src/kb_ctrl.cpp )
target_link_libraries(kb_ctrl ${catkin_LIBRARIES}  X11 ${OpenCv_LIBS})

install(DIRECTORY
  launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
  # PATTERN ".git" EXCLUDE
)