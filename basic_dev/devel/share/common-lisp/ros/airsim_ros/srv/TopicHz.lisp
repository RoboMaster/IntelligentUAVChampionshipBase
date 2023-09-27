; Auto-generated. Do not edit!


(cl:in-package airsim_ros-srv)


;//! \htmlinclude TopicHz-request.msg.html

(cl:defclass <TopicHz-request> (roslisp-msg-protocol:ros-message)
  ((get
    :reader get
    :initarg :get
    :type cl:integer
    :initform 0))
)

(cl:defclass TopicHz-request (<TopicHz-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TopicHz-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TopicHz-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-srv:<TopicHz-request> is deprecated: use airsim_ros-srv:TopicHz-request instead.")))

(cl:ensure-generic-function 'get-val :lambda-list '(m))
(cl:defmethod get-val ((m <TopicHz-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:get-val is deprecated.  Use airsim_ros-srv:get instead.")
  (get m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TopicHz-request>) ostream)
  "Serializes a message object of type '<TopicHz-request>"
  (cl:let* ((signed (cl:slot-value msg 'get)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TopicHz-request>) istream)
  "Deserializes a message object of type '<TopicHz-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'get) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TopicHz-request>)))
  "Returns string type for a service object of type '<TopicHz-request>"
  "airsim_ros/TopicHzRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TopicHz-request)))
  "Returns string type for a service object of type 'TopicHz-request"
  "airsim_ros/TopicHzRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TopicHz-request>)))
  "Returns md5sum for a message object of type '<TopicHz-request>"
  "685d1f21c0a32ce2836c18711bcaeaff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TopicHz-request)))
  "Returns md5sum for a message object of type 'TopicHz-request"
  "685d1f21c0a32ce2836c18711bcaeaff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TopicHz-request>)))
  "Returns full string definition for message of type '<TopicHz-request>"
  (cl:format cl:nil "int64 get~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TopicHz-request)))
  "Returns full string definition for message of type 'TopicHz-request"
  (cl:format cl:nil "int64 get~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TopicHz-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TopicHz-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TopicHz-request
    (cl:cons ':get (get msg))
))
;//! \htmlinclude TopicHz-response.msg.html

(cl:defclass <TopicHz-response> (roslisp-msg-protocol:ros-message)
  ((vel_cmd_hz
    :reader vel_cmd_hz
    :initarg :vel_cmd_hz
    :type cl:float
    :initform 0.0)
   (pose_cmd_hz
    :reader pose_cmd_hz
    :initarg :pose_cmd_hz
    :type cl:float
    :initform 0.0)
   (angle_cmd_hz
    :reader angle_cmd_hz
    :initarg :angle_cmd_hz
    :type cl:float
    :initform 0.0)
   (imu_hz
    :reader imu_hz
    :initarg :imu_hz
    :type cl:float
    :initform 0.0)
   (image_hz
    :reader image_hz
    :initarg :image_hz
    :type cl:float
    :initform 0.0)
   (pose_err_hz
    :reader pose_err_hz
    :initarg :pose_err_hz
    :type cl:float
    :initform 0.0)
   (rotor_pwm_hz
    :reader rotor_pwm_hz
    :initarg :rotor_pwm_hz
    :type cl:float
    :initform 0.0))
)

(cl:defclass TopicHz-response (<TopicHz-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TopicHz-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TopicHz-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-srv:<TopicHz-response> is deprecated: use airsim_ros-srv:TopicHz-response instead.")))

(cl:ensure-generic-function 'vel_cmd_hz-val :lambda-list '(m))
(cl:defmethod vel_cmd_hz-val ((m <TopicHz-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:vel_cmd_hz-val is deprecated.  Use airsim_ros-srv:vel_cmd_hz instead.")
  (vel_cmd_hz m))

(cl:ensure-generic-function 'pose_cmd_hz-val :lambda-list '(m))
(cl:defmethod pose_cmd_hz-val ((m <TopicHz-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:pose_cmd_hz-val is deprecated.  Use airsim_ros-srv:pose_cmd_hz instead.")
  (pose_cmd_hz m))

(cl:ensure-generic-function 'angle_cmd_hz-val :lambda-list '(m))
(cl:defmethod angle_cmd_hz-val ((m <TopicHz-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:angle_cmd_hz-val is deprecated.  Use airsim_ros-srv:angle_cmd_hz instead.")
  (angle_cmd_hz m))

(cl:ensure-generic-function 'imu_hz-val :lambda-list '(m))
(cl:defmethod imu_hz-val ((m <TopicHz-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:imu_hz-val is deprecated.  Use airsim_ros-srv:imu_hz instead.")
  (imu_hz m))

(cl:ensure-generic-function 'image_hz-val :lambda-list '(m))
(cl:defmethod image_hz-val ((m <TopicHz-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:image_hz-val is deprecated.  Use airsim_ros-srv:image_hz instead.")
  (image_hz m))

(cl:ensure-generic-function 'pose_err_hz-val :lambda-list '(m))
(cl:defmethod pose_err_hz-val ((m <TopicHz-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:pose_err_hz-val is deprecated.  Use airsim_ros-srv:pose_err_hz instead.")
  (pose_err_hz m))

(cl:ensure-generic-function 'rotor_pwm_hz-val :lambda-list '(m))
(cl:defmethod rotor_pwm_hz-val ((m <TopicHz-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:rotor_pwm_hz-val is deprecated.  Use airsim_ros-srv:rotor_pwm_hz instead.")
  (rotor_pwm_hz m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TopicHz-response>) ostream)
  "Serializes a message object of type '<TopicHz-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vel_cmd_hz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pose_cmd_hz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle_cmd_hz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'imu_hz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'image_hz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pose_err_hz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'rotor_pwm_hz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TopicHz-response>) istream)
  "Deserializes a message object of type '<TopicHz-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_cmd_hz) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_cmd_hz) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_cmd_hz) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imu_hz) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'image_hz) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_err_hz) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rotor_pwm_hz) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TopicHz-response>)))
  "Returns string type for a service object of type '<TopicHz-response>"
  "airsim_ros/TopicHzResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TopicHz-response)))
  "Returns string type for a service object of type 'TopicHz-response"
  "airsim_ros/TopicHzResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TopicHz-response>)))
  "Returns md5sum for a message object of type '<TopicHz-response>"
  "685d1f21c0a32ce2836c18711bcaeaff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TopicHz-response)))
  "Returns md5sum for a message object of type 'TopicHz-response"
  "685d1f21c0a32ce2836c18711bcaeaff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TopicHz-response>)))
  "Returns full string definition for message of type '<TopicHz-response>"
  (cl:format cl:nil "float64 vel_cmd_hz~%float64 pose_cmd_hz~%float64 angle_cmd_hz~%float64 imu_hz~%float64 image_hz~%float64 pose_err_hz~%float64 rotor_pwm_hz~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TopicHz-response)))
  "Returns full string definition for message of type 'TopicHz-response"
  (cl:format cl:nil "float64 vel_cmd_hz~%float64 pose_cmd_hz~%float64 angle_cmd_hz~%float64 imu_hz~%float64 image_hz~%float64 pose_err_hz~%float64 rotor_pwm_hz~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TopicHz-response>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TopicHz-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TopicHz-response
    (cl:cons ':vel_cmd_hz (vel_cmd_hz msg))
    (cl:cons ':pose_cmd_hz (pose_cmd_hz msg))
    (cl:cons ':angle_cmd_hz (angle_cmd_hz msg))
    (cl:cons ':imu_hz (imu_hz msg))
    (cl:cons ':image_hz (image_hz msg))
    (cl:cons ':pose_err_hz (pose_err_hz msg))
    (cl:cons ':rotor_pwm_hz (rotor_pwm_hz msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TopicHz)))
  'TopicHz-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TopicHz)))
  'TopicHz-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TopicHz)))
  "Returns string type for a service object of type '<TopicHz>"
  "airsim_ros/TopicHz")