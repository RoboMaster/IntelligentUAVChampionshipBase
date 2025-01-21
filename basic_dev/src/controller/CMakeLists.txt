cmake_minimum_required(VERSION 3.0.2)
project(controller_test)
set(CMAKE_CXX_STANDARD 17)
## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
set(cv_bridge_DIR /usr/local/share/cv_bridge/cmake)
set(pcl_conversions_DIR /usr/local/share/pcl_conversions/cmake)
set(pcl_ros_DIR /usr/local/share/pcl_ros/cmake)
find_package(catkin REQUIRED COMPONENTS
airsim_ros
message_generation
nav_msgs
# nodelet
roscpp
rospy
sensor_msgs
std_msgs
geographic_msgs
geometry_msgs
std_srvs
tf2
tf2_ros
tf2_sensor_msgs
tf2_geometry_msgs
image_transport
cv_bridge
pcl_conversions
pcl_ros
)

find_package(OpenCV 4.10.0 EXACT)

catkin_package(
  CATKIN_DEPENDS message_runtime roscpp std_msgs
)

include_directories(include ${catkin_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS})

add_executable(controller_test src/controllerTest.cpp src/PDcontroller.cpp)
target_link_libraries(controller_test
  ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})