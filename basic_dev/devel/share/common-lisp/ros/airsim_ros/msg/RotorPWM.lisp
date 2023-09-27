; Auto-generated. Do not edit!


(cl:in-package airsim_ros-msg)


;//! \htmlinclude RotorPWM.msg.html

(cl:defclass <RotorPWM> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (rotorPWM0
    :reader rotorPWM0
    :initarg :rotorPWM0
    :type cl:float
    :initform 0.0)
   (rotorPWM1
    :reader rotorPWM1
    :initarg :rotorPWM1
    :type cl:float
    :initform 0.0)
   (rotorPWM2
    :reader rotorPWM2
    :initarg :rotorPWM2
    :type cl:float
    :initform 0.0)
   (rotorPWM3
    :reader rotorPWM3
    :initarg :rotorPWM3
    :type cl:float
    :initform 0.0))
)

(cl:defclass RotorPWM (<RotorPWM>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RotorPWM>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RotorPWM)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-msg:<RotorPWM> is deprecated: use airsim_ros-msg:RotorPWM instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RotorPWM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:header-val is deprecated.  Use airsim_ros-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'rotorPWM0-val :lambda-list '(m))
(cl:defmethod rotorPWM0-val ((m <RotorPWM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:rotorPWM0-val is deprecated.  Use airsim_ros-msg:rotorPWM0 instead.")
  (rotorPWM0 m))

(cl:ensure-generic-function 'rotorPWM1-val :lambda-list '(m))
(cl:defmethod rotorPWM1-val ((m <RotorPWM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:rotorPWM1-val is deprecated.  Use airsim_ros-msg:rotorPWM1 instead.")
  (rotorPWM1 m))

(cl:ensure-generic-function 'rotorPWM2-val :lambda-list '(m))
(cl:defmethod rotorPWM2-val ((m <RotorPWM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:rotorPWM2-val is deprecated.  Use airsim_ros-msg:rotorPWM2 instead.")
  (rotorPWM2 m))

(cl:ensure-generic-function 'rotorPWM3-val :lambda-list '(m))
(cl:defmethod rotorPWM3-val ((m <RotorPWM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:rotorPWM3-val is deprecated.  Use airsim_ros-msg:rotorPWM3 instead.")
  (rotorPWM3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RotorPWM>) ostream)
  "Serializes a message object of type '<RotorPWM>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'rotorPWM0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'rotorPWM1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'rotorPWM2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'rotorPWM3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RotorPWM>) istream)
  "Deserializes a message object of type '<RotorPWM>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rotorPWM0) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rotorPWM1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rotorPWM2) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rotorPWM3) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RotorPWM>)))
  "Returns string type for a message object of type '<RotorPWM>"
  "airsim_ros/RotorPWM")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RotorPWM)))
  "Returns string type for a message object of type 'RotorPWM"
  "airsim_ros/RotorPWM")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RotorPWM>)))
  "Returns md5sum for a message object of type '<RotorPWM>"
  "4967432b608c06d70b17be20124fa258")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RotorPWM)))
  "Returns md5sum for a message object of type 'RotorPWM"
  "4967432b608c06d70b17be20124fa258")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RotorPWM>)))
  "Returns full string definition for message of type '<RotorPWM>"
  (cl:format cl:nil "std_msgs/Header header~%float64 rotorPWM0~%float64 rotorPWM1~%float64 rotorPWM2~%float64 rotorPWM3~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RotorPWM)))
  "Returns full string definition for message of type 'RotorPWM"
  (cl:format cl:nil "std_msgs/Header header~%float64 rotorPWM0~%float64 rotorPWM1~%float64 rotorPWM2~%float64 rotorPWM3~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RotorPWM>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RotorPWM>))
  "Converts a ROS message object to a list"
  (cl:list 'RotorPWM
    (cl:cons ':header (header msg))
    (cl:cons ':rotorPWM0 (rotorPWM0 msg))
    (cl:cons ':rotorPWM1 (rotorPWM1 msg))
    (cl:cons ':rotorPWM2 (rotorPWM2 msg))
    (cl:cons ':rotorPWM3 (rotorPWM3 msg))
))
