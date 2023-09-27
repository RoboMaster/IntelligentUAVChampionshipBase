; Auto-generated. Do not edit!


(cl:in-package airsim_ros-msg)


;//! \htmlinclude GimbalAngleQuatCmd.msg.html

(cl:defclass <GimbalAngleQuatCmd> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (camera_name
    :reader camera_name
    :initarg :camera_name
    :type cl:string
    :initform "")
   (vehicle_name
    :reader vehicle_name
    :initarg :vehicle_name
    :type cl:string
    :initform "")
   (orientation
    :reader orientation
    :initarg :orientation
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion)))
)

(cl:defclass GimbalAngleQuatCmd (<GimbalAngleQuatCmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalAngleQuatCmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalAngleQuatCmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-msg:<GimbalAngleQuatCmd> is deprecated: use airsim_ros-msg:GimbalAngleQuatCmd instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <GimbalAngleQuatCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:header-val is deprecated.  Use airsim_ros-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'camera_name-val :lambda-list '(m))
(cl:defmethod camera_name-val ((m <GimbalAngleQuatCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:camera_name-val is deprecated.  Use airsim_ros-msg:camera_name instead.")
  (camera_name m))

(cl:ensure-generic-function 'vehicle_name-val :lambda-list '(m))
(cl:defmethod vehicle_name-val ((m <GimbalAngleQuatCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:vehicle_name-val is deprecated.  Use airsim_ros-msg:vehicle_name instead.")
  (vehicle_name m))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <GimbalAngleQuatCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:orientation-val is deprecated.  Use airsim_ros-msg:orientation instead.")
  (orientation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalAngleQuatCmd>) ostream)
  "Serializes a message object of type '<GimbalAngleQuatCmd>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'camera_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'camera_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'vehicle_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'vehicle_name))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'orientation) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalAngleQuatCmd>) istream)
  "Deserializes a message object of type '<GimbalAngleQuatCmd>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'camera_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'camera_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vehicle_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'vehicle_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'orientation) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalAngleQuatCmd>)))
  "Returns string type for a message object of type '<GimbalAngleQuatCmd>"
  "airsim_ros/GimbalAngleQuatCmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalAngleQuatCmd)))
  "Returns string type for a message object of type 'GimbalAngleQuatCmd"
  "airsim_ros/GimbalAngleQuatCmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalAngleQuatCmd>)))
  "Returns md5sum for a message object of type '<GimbalAngleQuatCmd>"
  "26f3bc8337157b61ae91ea421cb25a16")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalAngleQuatCmd)))
  "Returns md5sum for a message object of type 'GimbalAngleQuatCmd"
  "26f3bc8337157b61ae91ea421cb25a16")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalAngleQuatCmd>)))
  "Returns full string definition for message of type '<GimbalAngleQuatCmd>"
  (cl:format cl:nil "std_msgs/Header header~%string camera_name~%string vehicle_name~%geometry_msgs/Quaternion orientation~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalAngleQuatCmd)))
  "Returns full string definition for message of type 'GimbalAngleQuatCmd"
  (cl:format cl:nil "std_msgs/Header header~%string camera_name~%string vehicle_name~%geometry_msgs/Quaternion orientation~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalAngleQuatCmd>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'camera_name))
     4 (cl:length (cl:slot-value msg 'vehicle_name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'orientation))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalAngleQuatCmd>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalAngleQuatCmd
    (cl:cons ':header (header msg))
    (cl:cons ':camera_name (camera_name msg))
    (cl:cons ':vehicle_name (vehicle_name msg))
    (cl:cons ':orientation (orientation msg))
))
