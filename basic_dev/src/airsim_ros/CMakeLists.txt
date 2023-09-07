cmake_minimum_required(VERSION 3.0.2)
project(airsim_ros)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
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
)


add_message_files(
  FILES
  GimbalAngleEulerCmd.msg
  GimbalAngleQuatCmd.msg
  GPSYaw.msg
  VelCmd.msg
  VelCmdGroup.msg
  CarControls.msg
  CarState.msg
  Altimeter.msg
  Environment.msg
  PoseCmd.msg
  AngleRateThrottle.msg
  Circle.msg
  CirclePoses.msg
  TreePoses.msg
  RotorPWM.msg
)

add_service_files(
  FILES
  SetGPSPosition.srv
  Takeoff.srv
  TakeoffGroup.srv
  Land.srv
  LandGroup.srv
  Reset.srv
  SetLocalPosition.srv
  TopicHz.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
  geographic_msgs
)

catkin_package(
  CATKIN_DEPENDS message_runtime roscpp std_msgs # nodelet 
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIRS}
)

add_library(pd_position_controller_simple src/pd_position_controller_simple.cpp)
add_dependencies(pd_position_controller_simple ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
add_dependencies(pd_position_controller_simple ${catkin_EXPORTED_TARGETS})

add_executable(pd_position_controller_simple_node src/pd_position_controller_simple_node.cpp)
target_link_libraries(pd_position_controller_simple_node pd_position_controller_simple ${catkin_LIBRARIES})

install(TARGETS
    #list of nodes
    pd_position_controller_simple_node
    DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(TARGETS 
    #list of shared libraries
    pd_position_controller_simple
    ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
    LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
)

install(FILES 
  #list of necessary files (xml...)
  README.md
  # settings.json
  # nodelet_plugins.xml
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
