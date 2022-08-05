; Auto-generated. Do not edit!


(cl:in-package airsim_ros_pkgs-msg)


;//! \htmlinclude VelCmd.msg.html

(cl:defclass <VelCmd> (roslisp-msg-protocol:ros-message)
  ((twist
    :reader twist
    :initarg :twist
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist)))
)

(cl:defclass VelCmd (<VelCmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VelCmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VelCmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros_pkgs-msg:<VelCmd> is deprecated: use airsim_ros_pkgs-msg:VelCmd instead.")))

(cl:ensure-generic-function 'twist-val :lambda-list '(m))
(cl:defmethod twist-val ((m <VelCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros_pkgs-msg:twist-val is deprecated.  Use airsim_ros_pkgs-msg:twist instead.")
  (twist m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VelCmd>) ostream)
  "Serializes a message object of type '<VelCmd>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'twist) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VelCmd>) istream)
  "Deserializes a message object of type '<VelCmd>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'twist) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VelCmd>)))
  "Returns string type for a message object of type '<VelCmd>"
  "airsim_ros_pkgs/VelCmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VelCmd)))
  "Returns string type for a message object of type 'VelCmd"
  "airsim_ros_pkgs/VelCmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VelCmd>)))
  "Returns md5sum for a message object of type '<VelCmd>"
  "a787b2802160dcc7fe02d089e10afe56")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VelCmd)))
  "Returns md5sum for a message object of type 'VelCmd"
  "a787b2802160dcc7fe02d089e10afe56")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VelCmd>)))
  "Returns full string definition for message of type '<VelCmd>"
  (cl:format cl:nil "geometry_msgs/Twist twist~%# string vehicle_name~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VelCmd)))
  "Returns full string definition for message of type 'VelCmd"
  (cl:format cl:nil "geometry_msgs/Twist twist~%# string vehicle_name~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VelCmd>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'twist))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VelCmd>))
  "Converts a ROS message object to a list"
  (cl:list 'VelCmd
    (cl:cons ':twist (twist msg))
))
