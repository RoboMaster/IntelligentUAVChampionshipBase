// Generated by gencpp from file airsim_ros/SetLocalPosition.msg
// DO NOT EDIT!


#ifndef AIRSIM_ROS_MESSAGE_SETLOCALPOSITION_H
#define AIRSIM_ROS_MESSAGE_SETLOCALPOSITION_H

#include <ros/service_traits.h>


#include <airsim_ros/SetLocalPositionRequest.h>
#include <airsim_ros/SetLocalPositionResponse.h>


namespace airsim_ros
{

struct SetLocalPosition
{

typedef SetLocalPositionRequest Request;
typedef SetLocalPositionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetLocalPosition
} // namespace airsim_ros


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::airsim_ros::SetLocalPosition > {
  static const char* value()
  {
    return "23cc107c6db5068a5234b2dfe0bcf0bb";
  }

  static const char* value(const ::airsim_ros::SetLocalPosition&) { return value(); }
};

template<>
struct DataType< ::airsim_ros::SetLocalPosition > {
  static const char* value()
  {
    return "airsim_ros/SetLocalPosition";
  }

  static const char* value(const ::airsim_ros::SetLocalPosition&) { return value(); }
};


// service_traits::MD5Sum< ::airsim_ros::SetLocalPositionRequest> should match
// service_traits::MD5Sum< ::airsim_ros::SetLocalPosition >
template<>
struct MD5Sum< ::airsim_ros::SetLocalPositionRequest>
{
  static const char* value()
  {
    return MD5Sum< ::airsim_ros::SetLocalPosition >::value();
  }
  static const char* value(const ::airsim_ros::SetLocalPositionRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::airsim_ros::SetLocalPositionRequest> should match
// service_traits::DataType< ::airsim_ros::SetLocalPosition >
template<>
struct DataType< ::airsim_ros::SetLocalPositionRequest>
{
  static const char* value()
  {
    return DataType< ::airsim_ros::SetLocalPosition >::value();
  }
  static const char* value(const ::airsim_ros::SetLocalPositionRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::airsim_ros::SetLocalPositionResponse> should match
// service_traits::MD5Sum< ::airsim_ros::SetLocalPosition >
template<>
struct MD5Sum< ::airsim_ros::SetLocalPositionResponse>
{
  static const char* value()
  {
    return MD5Sum< ::airsim_ros::SetLocalPosition >::value();
  }
  static const char* value(const ::airsim_ros::SetLocalPositionResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::airsim_ros::SetLocalPositionResponse> should match
// service_traits::DataType< ::airsim_ros::SetLocalPosition >
template<>
struct DataType< ::airsim_ros::SetLocalPositionResponse>
{
  static const char* value()
  {
    return DataType< ::airsim_ros::SetLocalPosition >::value();
  }
  static const char* value(const ::airsim_ros::SetLocalPositionResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // AIRSIM_ROS_MESSAGE_SETLOCALPOSITION_H
