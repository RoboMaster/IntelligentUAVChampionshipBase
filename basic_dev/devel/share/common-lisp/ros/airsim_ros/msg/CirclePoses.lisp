; Auto-generated. Do not edit!


(cl:in-package airsim_ros-msg)


;//! \htmlinclude CirclePoses.msg.html

(cl:defclass <CirclePoses> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (poses
    :reader poses
    :initarg :poses
    :type (cl:vector airsim_ros-msg:Circle)
   :initform (cl:make-array 0 :element-type 'airsim_ros-msg:Circle :initial-element (cl:make-instance 'airsim_ros-msg:Circle))))
)

(cl:defclass CirclePoses (<CirclePoses>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CirclePoses>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CirclePoses)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-msg:<CirclePoses> is deprecated: use airsim_ros-msg:CirclePoses instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CirclePoses>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:header-val is deprecated.  Use airsim_ros-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'poses-val :lambda-list '(m))
(cl:defmethod poses-val ((m <CirclePoses>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:poses-val is deprecated.  Use airsim_ros-msg:poses instead.")
  (poses m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CirclePoses>) ostream)
  "Serializes a message object of type '<CirclePoses>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'poses))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'poses))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CirclePoses>) istream)
  "Deserializes a message object of type '<CirclePoses>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'poses) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'poses)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'airsim_ros-msg:Circle))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CirclePoses>)))
  "Returns string type for a message object of type '<CirclePoses>"
  "airsim_ros/CirclePoses")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CirclePoses)))
  "Returns string type for a message object of type 'CirclePoses"
  "airsim_ros/CirclePoses")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CirclePoses>)))
  "Returns md5sum for a message object of type '<CirclePoses>"
  "fc5e78a66530b8c9f75a9952468f11a4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CirclePoses)))
  "Returns md5sum for a message object of type 'CirclePoses"
  "fc5e78a66530b8c9f75a9952468f11a4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CirclePoses>)))
  "Returns full string definition for message of type '<CirclePoses>"
  (cl:format cl:nil "std_msgs/Header header~%Circle[] poses~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: airsim_ros/Circle~%uint8 index~%geometry_msgs/Vector3 position~%float64 yaw~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CirclePoses)))
  "Returns full string definition for message of type 'CirclePoses"
  (cl:format cl:nil "std_msgs/Header header~%Circle[] poses~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: airsim_ros/Circle~%uint8 index~%geometry_msgs/Vector3 position~%float64 yaw~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CirclePoses>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'poses) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CirclePoses>))
  "Converts a ROS message object to a list"
  (cl:list 'CirclePoses
    (cl:cons ':header (header msg))
    (cl:cons ':poses (poses msg))
))
