; Auto-generated. Do not edit!


(cl:in-package airsim_ros-msg)


;//! \htmlinclude AngleRateThrottle.msg.html

(cl:defclass <AngleRateThrottle> (roslisp-msg-protocol:ros-message)
  ((rollRate
    :reader rollRate
    :initarg :rollRate
    :type cl:float
    :initform 0.0)
   (pitchRate
    :reader pitchRate
    :initarg :pitchRate
    :type cl:float
    :initform 0.0)
   (yawRate
    :reader yawRate
    :initarg :yawRate
    :type cl:float
    :initform 0.0)
   (throttle
    :reader throttle
    :initarg :throttle
    :type cl:float
    :initform 0.0))
)

(cl:defclass AngleRateThrottle (<AngleRateThrottle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AngleRateThrottle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AngleRateThrottle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-msg:<AngleRateThrottle> is deprecated: use airsim_ros-msg:AngleRateThrottle instead.")))

(cl:ensure-generic-function 'rollRate-val :lambda-list '(m))
(cl:defmethod rollRate-val ((m <AngleRateThrottle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:rollRate-val is deprecated.  Use airsim_ros-msg:rollRate instead.")
  (rollRate m))

(cl:ensure-generic-function 'pitchRate-val :lambda-list '(m))
(cl:defmethod pitchRate-val ((m <AngleRateThrottle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:pitchRate-val is deprecated.  Use airsim_ros-msg:pitchRate instead.")
  (pitchRate m))

(cl:ensure-generic-function 'yawRate-val :lambda-list '(m))
(cl:defmethod yawRate-val ((m <AngleRateThrottle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:yawRate-val is deprecated.  Use airsim_ros-msg:yawRate instead.")
  (yawRate m))

(cl:ensure-generic-function 'throttle-val :lambda-list '(m))
(cl:defmethod throttle-val ((m <AngleRateThrottle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-msg:throttle-val is deprecated.  Use airsim_ros-msg:throttle instead.")
  (throttle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AngleRateThrottle>) ostream)
  "Serializes a message object of type '<AngleRateThrottle>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'rollRate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pitchRate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'yawRate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'throttle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AngleRateThrottle>) istream)
  "Deserializes a message object of type '<AngleRateThrottle>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rollRate) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitchRate) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yawRate) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'throttle) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AngleRateThrottle>)))
  "Returns string type for a message object of type '<AngleRateThrottle>"
  "airsim_ros/AngleRateThrottle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AngleRateThrottle)))
  "Returns string type for a message object of type 'AngleRateThrottle"
  "airsim_ros/AngleRateThrottle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AngleRateThrottle>)))
  "Returns md5sum for a message object of type '<AngleRateThrottle>"
  "93bb283398a326cfc4d5e3c6a992ff87")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AngleRateThrottle)))
  "Returns md5sum for a message object of type 'AngleRateThrottle"
  "93bb283398a326cfc4d5e3c6a992ff87")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AngleRateThrottle>)))
  "Returns full string definition for message of type '<AngleRateThrottle>"
  (cl:format cl:nil "float64 rollRate~%float64 pitchRate~%float64 yawRate~%float64 throttle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AngleRateThrottle)))
  "Returns full string definition for message of type 'AngleRateThrottle"
  (cl:format cl:nil "float64 rollRate~%float64 pitchRate~%float64 yawRate~%float64 throttle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AngleRateThrottle>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AngleRateThrottle>))
  "Converts a ROS message object to a list"
  (cl:list 'AngleRateThrottle
    (cl:cons ':rollRate (rollRate msg))
    (cl:cons ':pitchRate (pitchRate msg))
    (cl:cons ':yawRate (yawRate msg))
    (cl:cons ':throttle (throttle msg))
))
