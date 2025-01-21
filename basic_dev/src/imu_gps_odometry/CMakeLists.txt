cmake_minimum_required(VERSION 3.0.2)
project(imu_gps_odometry)
set(CMAKE_CXX_STANDARD 17)
## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
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
tf2
tf2_ros
tf2_sensor_msgs
tf2_geometry_msgs
image_transport
)

catkin_package(
  CATKIN_DEPENDS message_runtime roscpp std_msgs
)

set(UTILS_PATH ${PROJECT_SOURCE_DIR}/../utils)

include_directories(include ${catkin_INCLUDE_DIRS} ${UTILS_PATH})


add_executable(imu_gps_odometry src/imu_gps_odometry.cpp src/eskf.cpp)
target_link_libraries(imu_gps_odometry
  ${catkin_LIBRARIES})