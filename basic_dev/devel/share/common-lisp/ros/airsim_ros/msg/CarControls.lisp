; Auto-generated. Do not edit!


(cl:in-package airsim_ros-msg)


;//! \htmlinclude CarControls.msg.html

(cl:defclass <CarControls> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (throttle
    :reader throttle
    :initarg :throttle
    :type cl:float
    :initform 0.0)
   (brake
    :reader brake
    :initarg :brake
    :type cl:float
    :initform 0.0)
   (steering
    :reader steering
    :initarg :steering
    :type cl:float
    :initform 0.0)
   (handbrake
    :reader handbrake
    :initarg :handbrake
    :type cl:boolean
    :initform cl:nil)
   (manual
    :reader manual
    :initarg :manual
    :type cl:boolean
    :initform cl:nil)
   (manual_gear
    :reader manual_gear
    :initarg :manual_gear
    :type cl:fixnum
    :initform 0)
   (gear_immediate
    :reader gear_immediate
    :initarg :gear_immediate
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass CarControls (<CarControls>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CarControls>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CarControls)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-msg:<CarControls> is deprecated: use airsim_ros-msg:CarControls instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CarControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:header-val is deprecated.  Use airsim_ros-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'throttle-val :lambda-list '(m))
(cl:defmethod throttle-val ((m <CarControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:throttle-val is deprecated.  Use airsim_ros-msg:throttle instead.")
  (throttle m))

(cl:ensure-generic-function 'brake-val :lambda-list '(m))
(cl:defmethod brake-val ((m <CarControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:brake-val is deprecated.  Use airsim_ros-msg:brake instead.")
  (brake m))

(cl:ensure-generic-function 'steering-val :lambda-list '(m))
(cl:defmethod steering-val ((m <CarControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:steering-val is deprecated.  Use airsim_ros-msg:steering instead.")
  (steering m))

(cl:ensure-generic-function 'handbrake-val :lambda-list '(m))
(cl:defmethod handbrake-val ((m <CarControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:handbrake-val is deprecated.  Use airsim_ros-msg:handbrake instead.")
  (handbrake m))

(cl:ensure-generic-function 'manual-val :lambda-list '(m))
(cl:defmethod manual-val ((m <CarControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:manual-val is deprecated.  Use airsim_ros-msg:manual instead.")
  (manual m))

(cl:ensure-generic-function 'manual_gear-val :lambda-list '(m))
(cl:defmethod manual_gear-val ((m <CarControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:manual_gear-val is deprecated.  Use airsim_ros-msg:manual_gear instead.")
  (manual_gear m))

(cl:ensure-generic-function 'gear_immediate-val :lambda-list '(m))
(cl:defmethod gear_immediate-val ((m <CarControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:gear_immediate-val is deprecated.  Use airsim_ros-msg:gear_immediate instead.")
  (gear_immediate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CarControls>) ostream)
  "Serializes a message object of type '<CarControls>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'throttle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'brake))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'steering))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'handbrake) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'manual) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'manual_gear)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gear_immediate) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CarControls>) istream)
  "Deserializes a message object of type '<CarControls>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'throttle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'brake) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'handbrake) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'manual) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'manual_gear) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'gear_immediate) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CarControls>)))
  "Returns string type for a message object of type '<CarControls>"
  "airsim_ros/CarControls")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CarControls)))
  "Returns string type for a message object of type 'CarControls"
  "airsim_ros/CarControls")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CarControls>)))
  "Returns md5sum for a message object of type '<CarControls>"
  "2cf7bae5e8a409a1c310bfb0435ad4b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CarControls)))
  "Returns md5sum for a message object of type 'CarControls"
  "2cf7bae5e8a409a1c310bfb0435ad4b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CarControls>)))
  "Returns full string definition for message of type '<CarControls>"
  (cl:format cl:nil "std_msgs/Header header~%float32 throttle~%float32 brake~%float32 steering~%bool handbrake~%bool manual~%int8 manual_gear~%bool gear_immediate~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CarControls)))
  "Returns full string definition for message of type 'CarControls"
  (cl:format cl:nil "std_msgs/Header header~%float32 throttle~%float32 brake~%float32 steering~%bool handbrake~%bool manual~%int8 manual_gear~%bool gear_immediate~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CarControls>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CarControls>))
  "Converts a ROS message object to a list"
  (cl:list 'CarControls
    (cl:cons ':header (header msg))
    (cl:cons ':throttle (throttle msg))
    (cl:cons ':brake (brake msg))
    (cl:cons ':steering (steering msg))
    (cl:cons ':handbrake (handbrake msg))
    (cl:cons ':manual (manual msg))
    (cl:cons ':manual_gear (manual_gear msg))
    (cl:cons ':gear_immediate (gear_immediate msg))
))
