# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "airsim_ros: 15 messages, 8 services")

set(MSG_I_FLAGS "-Iairsim_ros:/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Igeographic_msgs:/opt/ros/noetic/share/geographic_msgs/cmake/../msg;-Iuuid_msgs:/opt/ros/noetic/share/uuid_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(airsim_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleEulerCmd.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleEulerCmd.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleQuatCmd.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleQuatCmd.msg" "geometry_msgs/Quaternion:std_msgs/Header"
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GPSYaw.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GPSYaw.msg" ""
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmd.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmd.msg" "geometry_msgs/Twist:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmdGroup.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmdGroup.msg" "geometry_msgs/Twist:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarControls.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarControls.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarState.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarState.msg" "geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/Vector3:geometry_msgs/TwistWithCovariance:std_msgs/Header:geometry_msgs/Twist:geometry_msgs/Pose:geometry_msgs/PoseWithCovariance"
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Altimeter.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Altimeter.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Environment.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Environment.msg" "geometry_msgs/Vector3:std_msgs/Header:geographic_msgs/GeoPoint"
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/PoseCmd.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/PoseCmd.msg" ""
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/AngleRateThrottle.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/AngleRateThrottle.msg" ""
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CirclePoses.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CirclePoses.msg" "geometry_msgs/Vector3:airsim_ros/Circle:std_msgs/Header"
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/TreePoses.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/TreePoses.msg" "geometry_msgs/Vector3:std_msgs/Header"
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/RotorPWM.msg" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/RotorPWM.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetGPSPosition.srv" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetGPSPosition.srv" ""
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Takeoff.srv" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Takeoff.srv" ""
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TakeoffGroup.srv" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TakeoffGroup.srv" ""
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Land.srv" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Land.srv" ""
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/LandGroup.srv" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/LandGroup.srv" ""
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Reset.srv" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Reset.srv" ""
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetLocalPosition.srv" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetLocalPosition.srv" ""
)

get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TopicHz.srv" NAME_WE)
add_custom_target(_airsim_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "airsim_ros" "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TopicHz.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleEulerCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleQuatCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GPSYaw.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmdGroup.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarControls.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Altimeter.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Environment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/PoseCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/AngleRateThrottle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CirclePoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/TreePoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_msg_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/RotorPWM.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)

### Generating Services
_generate_srv_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetGPSPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_srv_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Takeoff.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_srv_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TakeoffGroup.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_srv_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Land.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_srv_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/LandGroup.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_srv_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_srv_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetLocalPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)
_generate_srv_cpp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TopicHz.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
)

### Generating Module File
_generate_module_cpp(airsim_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(airsim_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(airsim_ros_generate_messages airsim_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleEulerCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleQuatCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GPSYaw.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmdGroup.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarControls.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarState.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Altimeter.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Environment.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/PoseCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/AngleRateThrottle.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CirclePoses.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/TreePoses.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/RotorPWM.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetGPSPosition.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Takeoff.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TakeoffGroup.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Land.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/LandGroup.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Reset.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetLocalPosition.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TopicHz.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_cpp _airsim_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(airsim_ros_gencpp)
add_dependencies(airsim_ros_gencpp airsim_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS airsim_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleEulerCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleQuatCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GPSYaw.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmdGroup.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarControls.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Altimeter.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Environment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/PoseCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/AngleRateThrottle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CirclePoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/TreePoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_msg_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/RotorPWM.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)

### Generating Services
_generate_srv_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetGPSPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_srv_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Takeoff.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_srv_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TakeoffGroup.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_srv_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Land.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_srv_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/LandGroup.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_srv_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_srv_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetLocalPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)
_generate_srv_eus(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TopicHz.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
)

### Generating Module File
_generate_module_eus(airsim_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(airsim_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(airsim_ros_generate_messages airsim_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleEulerCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleQuatCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GPSYaw.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmdGroup.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarControls.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarState.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Altimeter.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Environment.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/PoseCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/AngleRateThrottle.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CirclePoses.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/TreePoses.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/RotorPWM.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetGPSPosition.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Takeoff.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TakeoffGroup.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Land.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/LandGroup.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Reset.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetLocalPosition.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TopicHz.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_eus _airsim_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(airsim_ros_geneus)
add_dependencies(airsim_ros_geneus airsim_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS airsim_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleEulerCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleQuatCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GPSYaw.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmdGroup.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarControls.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Altimeter.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Environment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/PoseCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/AngleRateThrottle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CirclePoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/TreePoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_msg_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/RotorPWM.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)

### Generating Services
_generate_srv_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetGPSPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_srv_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Takeoff.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_srv_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TakeoffGroup.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_srv_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Land.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_srv_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/LandGroup.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_srv_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_srv_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetLocalPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)
_generate_srv_lisp(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TopicHz.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
)

### Generating Module File
_generate_module_lisp(airsim_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(airsim_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(airsim_ros_generate_messages airsim_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleEulerCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleQuatCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GPSYaw.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmdGroup.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarControls.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarState.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Altimeter.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Environment.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/PoseCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/AngleRateThrottle.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CirclePoses.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/TreePoses.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/RotorPWM.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetGPSPosition.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Takeoff.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TakeoffGroup.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Land.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/LandGroup.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Reset.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetLocalPosition.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TopicHz.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_lisp _airsim_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(airsim_ros_genlisp)
add_dependencies(airsim_ros_genlisp airsim_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS airsim_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleEulerCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleQuatCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GPSYaw.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmdGroup.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarControls.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Altimeter.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Environment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/PoseCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/AngleRateThrottle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CirclePoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/TreePoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_msg_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/RotorPWM.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)

### Generating Services
_generate_srv_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetGPSPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_srv_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Takeoff.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_srv_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TakeoffGroup.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_srv_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Land.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_srv_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/LandGroup.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_srv_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_srv_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetLocalPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)
_generate_srv_nodejs(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TopicHz.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
)

### Generating Module File
_generate_module_nodejs(airsim_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(airsim_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(airsim_ros_generate_messages airsim_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleEulerCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleQuatCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GPSYaw.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmdGroup.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarControls.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarState.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Altimeter.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Environment.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/PoseCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/AngleRateThrottle.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CirclePoses.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/TreePoses.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/RotorPWM.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetGPSPosition.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Takeoff.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TakeoffGroup.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Land.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/LandGroup.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Reset.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetLocalPosition.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TopicHz.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_nodejs _airsim_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(airsim_ros_gennodejs)
add_dependencies(airsim_ros_gennodejs airsim_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS airsim_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleEulerCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleQuatCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GPSYaw.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmdGroup.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarControls.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Altimeter.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Environment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/PoseCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/AngleRateThrottle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CirclePoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/TreePoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_msg_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/RotorPWM.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)

### Generating Services
_generate_srv_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetGPSPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_srv_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Takeoff.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_srv_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TakeoffGroup.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_srv_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Land.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_srv_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/LandGroup.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_srv_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_srv_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetLocalPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)
_generate_srv_py(airsim_ros
  "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TopicHz.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
)

### Generating Module File
_generate_module_py(airsim_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(airsim_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(airsim_ros_generate_messages airsim_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleEulerCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GimbalAngleQuatCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/GPSYaw.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/VelCmdGroup.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarControls.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CarState.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Altimeter.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Environment.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/PoseCmd.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/AngleRateThrottle.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/Circle.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/CirclePoses.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/TreePoses.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/msg/RotorPWM.msg" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetGPSPosition.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Takeoff.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TakeoffGroup.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Land.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/LandGroup.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/Reset.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/SetLocalPosition.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jakeluo/Documents/IntelligentUAVChampionshipBase/basic_dev/src/airsim_ros/srv/TopicHz.srv" NAME_WE)
add_dependencies(airsim_ros_generate_messages_py _airsim_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(airsim_ros_genpy)
add_dependencies(airsim_ros_genpy airsim_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS airsim_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/airsim_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(airsim_ros_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(airsim_ros_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET geographic_msgs_generate_messages_cpp)
  add_dependencies(airsim_ros_generate_messages_cpp geographic_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/airsim_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(airsim_ros_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(airsim_ros_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET geographic_msgs_generate_messages_eus)
  add_dependencies(airsim_ros_generate_messages_eus geographic_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/airsim_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(airsim_ros_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(airsim_ros_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET geographic_msgs_generate_messages_lisp)
  add_dependencies(airsim_ros_generate_messages_lisp geographic_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/airsim_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(airsim_ros_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(airsim_ros_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET geographic_msgs_generate_messages_nodejs)
  add_dependencies(airsim_ros_generate_messages_nodejs geographic_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/airsim_ros
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(airsim_ros_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(airsim_ros_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET geographic_msgs_generate_messages_py)
  add_dependencies(airsim_ros_generate_messages_py geographic_msgs_generate_messages_py)
endif()
