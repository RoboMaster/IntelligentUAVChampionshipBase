// Generated by gencpp from file airsim_ros/TopicHzResponse.msg
// DO NOT EDIT!


#ifndef AIRSIM_ROS_MESSAGE_TOPICHZRESPONSE_H
#define AIRSIM_ROS_MESSAGE_TOPICHZRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace airsim_ros
{
template <class ContainerAllocator>
struct TopicHzResponse_
{
  typedef TopicHzResponse_<ContainerAllocator> Type;

  TopicHzResponse_()
    : vel_cmd_hz(0.0)
    , pose_cmd_hz(0.0)
    , angle_cmd_hz(0.0)
    , imu_hz(0.0)
    , image_hz(0.0)
    , pose_err_hz(0.0)
    , rotor_pwm_hz(0.0)  {
    }
  TopicHzResponse_(const ContainerAllocator& _alloc)
    : vel_cmd_hz(0.0)
    , pose_cmd_hz(0.0)
    , angle_cmd_hz(0.0)
    , imu_hz(0.0)
    , image_hz(0.0)
    , pose_err_hz(0.0)
    , rotor_pwm_hz(0.0)  {
  (void)_alloc;
    }



   typedef double _vel_cmd_hz_type;
  _vel_cmd_hz_type vel_cmd_hz;

   typedef double _pose_cmd_hz_type;
  _pose_cmd_hz_type pose_cmd_hz;

   typedef double _angle_cmd_hz_type;
  _angle_cmd_hz_type angle_cmd_hz;

   typedef double _imu_hz_type;
  _imu_hz_type imu_hz;

   typedef double _image_hz_type;
  _image_hz_type image_hz;

   typedef double _pose_err_hz_type;
  _pose_err_hz_type pose_err_hz;

   typedef double _rotor_pwm_hz_type;
  _rotor_pwm_hz_type rotor_pwm_hz;





  typedef boost::shared_ptr< ::airsim_ros::TopicHzResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::airsim_ros::TopicHzResponse_<ContainerAllocator> const> ConstPtr;

}; // struct TopicHzResponse_

typedef ::airsim_ros::TopicHzResponse_<std::allocator<void> > TopicHzResponse;

typedef boost::shared_ptr< ::airsim_ros::TopicHzResponse > TopicHzResponsePtr;
typedef boost::shared_ptr< ::airsim_ros::TopicHzResponse const> TopicHzResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::airsim_ros::TopicHzResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::airsim_ros::TopicHzResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::airsim_ros::TopicHzResponse_<ContainerAllocator1> & lhs, const ::airsim_ros::TopicHzResponse_<ContainerAllocator2> & rhs)
{
  return lhs.vel_cmd_hz == rhs.vel_cmd_hz &&
    lhs.pose_cmd_hz == rhs.pose_cmd_hz &&
    lhs.angle_cmd_hz == rhs.angle_cmd_hz &&
    lhs.imu_hz == rhs.imu_hz &&
    lhs.image_hz == rhs.image_hz &&
    lhs.pose_err_hz == rhs.pose_err_hz &&
    lhs.rotor_pwm_hz == rhs.rotor_pwm_hz;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::airsim_ros::TopicHzResponse_<ContainerAllocator1> & lhs, const ::airsim_ros::TopicHzResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace airsim_ros

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::airsim_ros::TopicHzResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::airsim_ros::TopicHzResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::airsim_ros::TopicHzResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::airsim_ros::TopicHzResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::airsim_ros::TopicHzResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::airsim_ros::TopicHzResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::airsim_ros::TopicHzResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9cbf4860726dd4f0468dbc6bcf0a1d2e";
  }

  static const char* value(const ::airsim_ros::TopicHzResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9cbf4860726dd4f0ULL;
  static const uint64_t static_value2 = 0x468dbc6bcf0a1d2eULL;
};

template<class ContainerAllocator>
struct DataType< ::airsim_ros::TopicHzResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "airsim_ros/TopicHzResponse";
  }

  static const char* value(const ::airsim_ros::TopicHzResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::airsim_ros::TopicHzResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 vel_cmd_hz\n"
"float64 pose_cmd_hz\n"
"float64 angle_cmd_hz\n"
"float64 imu_hz\n"
"float64 image_hz\n"
"float64 pose_err_hz\n"
"float64 rotor_pwm_hz\n"
;
  }

  static const char* value(const ::airsim_ros::TopicHzResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::airsim_ros::TopicHzResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.vel_cmd_hz);
      stream.next(m.pose_cmd_hz);
      stream.next(m.angle_cmd_hz);
      stream.next(m.imu_hz);
      stream.next(m.image_hz);
      stream.next(m.pose_err_hz);
      stream.next(m.rotor_pwm_hz);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TopicHzResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::airsim_ros::TopicHzResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::airsim_ros::TopicHzResponse_<ContainerAllocator>& v)
  {
    s << indent << "vel_cmd_hz: ";
    Printer<double>::stream(s, indent + "  ", v.vel_cmd_hz);
    s << indent << "pose_cmd_hz: ";
    Printer<double>::stream(s, indent + "  ", v.pose_cmd_hz);
    s << indent << "angle_cmd_hz: ";
    Printer<double>::stream(s, indent + "  ", v.angle_cmd_hz);
    s << indent << "imu_hz: ";
    Printer<double>::stream(s, indent + "  ", v.imu_hz);
    s << indent << "image_hz: ";
    Printer<double>::stream(s, indent + "  ", v.image_hz);
    s << indent << "pose_err_hz: ";
    Printer<double>::stream(s, indent + "  ", v.pose_err_hz);
    s << indent << "rotor_pwm_hz: ";
    Printer<double>::stream(s, indent + "  ", v.rotor_pwm_hz);
  }
};

} // namespace message_operations
} // namespace ros

#endif // AIRSIM_ROS_MESSAGE_TOPICHZRESPONSE_H
