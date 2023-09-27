// Generated by gencpp from file airsim_ros/Land.msg
// DO NOT EDIT!


#ifndef AIRSIM_ROS_MESSAGE_LAND_H
#define AIRSIM_ROS_MESSAGE_LAND_H

#include <ros/service_traits.h>


#include <airsim_ros/LandRequest.h>
#include <airsim_ros/LandResponse.h>


namespace airsim_ros
{

struct Land
{

typedef LandRequest Request;
typedef LandResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Land
} // namespace airsim_ros


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::airsim_ros::Land > {
  static const char* value()
  {
    return "3a122444608b7d9984b24a10fba10ac1";
  }

  static const char* value(const ::airsim_ros::Land&) { return value(); }
};

template<>
struct DataType< ::airsim_ros::Land > {
  static const char* value()
  {
    return "airsim_ros/Land";
  }

  static const char* value(const ::airsim_ros::Land&) { return value(); }
};


// service_traits::MD5Sum< ::airsim_ros::LandRequest> should match
// service_traits::MD5Sum< ::airsim_ros::Land >
template<>
struct MD5Sum< ::airsim_ros::LandRequest>
{
  static const char* value()
  {
    return MD5Sum< ::airsim_ros::Land >::value();
  }
  static const char* value(const ::airsim_ros::LandRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::airsim_ros::LandRequest> should match
// service_traits::DataType< ::airsim_ros::Land >
template<>
struct DataType< ::airsim_ros::LandRequest>
{
  static const char* value()
  {
    return DataType< ::airsim_ros::Land >::value();
  }
  static const char* value(const ::airsim_ros::LandRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::airsim_ros::LandResponse> should match
// service_traits::MD5Sum< ::airsim_ros::Land >
template<>
struct MD5Sum< ::airsim_ros::LandResponse>
{
  static const char* value()
  {
    return MD5Sum< ::airsim_ros::Land >::value();
  }
  static const char* value(const ::airsim_ros::LandResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::airsim_ros::LandResponse> should match
// service_traits::DataType< ::airsim_ros::Land >
template<>
struct DataType< ::airsim_ros::LandResponse>
{
  static const char* value()
  {
    return DataType< ::airsim_ros::Land >::value();
  }
  static const char* value(const ::airsim_ros::LandResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // AIRSIM_ROS_MESSAGE_LAND_H
