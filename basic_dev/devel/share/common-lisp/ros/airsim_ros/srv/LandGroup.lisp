; Auto-generated. Do not edit!


(cl:in-package airsim_ros-srv)


;//! \htmlinclude LandGroup-request.msg.html

(cl:defclass <LandGroup-request> (roslisp-msg-protocol:ros-message)
  ((vehicle_names
    :reader vehicle_names
    :initarg :vehicle_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (waitOnLastTask
    :reader waitOnLastTask
    :initarg :waitOnLastTask
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LandGroup-request (<LandGroup-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LandGroup-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LandGroup-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-srv:<LandGroup-request> is deprecated: use airsim_ros-srv:LandGroup-request instead.")))

(cl:ensure-generic-function 'vehicle_names-val :lambda-list '(m))
(cl:defmethod vehicle_names-val ((m <LandGroup-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:vehicle_names-val is deprecated.  Use airsim_ros-srv:vehicle_names instead.")
  (vehicle_names m))

(cl:ensure-generic-function 'waitOnLastTask-val :lambda-list '(m))
(cl:defmethod waitOnLastTask-val ((m <LandGroup-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:waitOnLastTask-val is deprecated.  Use airsim_ros-srv:waitOnLastTask instead.")
  (waitOnLastTask m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LandGroup-request>) ostream)
  "Serializes a message object of type '<LandGroup-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vehicle_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'vehicle_names))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'waitOnLastTask) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LandGroup-request>) istream)
  "Deserializes a message object of type '<LandGroup-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'vehicle_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vehicle_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
    (cl:setf (cl:slot-value msg 'waitOnLastTask) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LandGroup-request>)))
  "Returns string type for a service object of type '<LandGroup-request>"
  "airsim_ros/LandGroupRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LandGroup-request)))
  "Returns string type for a service object of type 'LandGroup-request"
  "airsim_ros/LandGroupRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LandGroup-request>)))
  "Returns md5sum for a message object of type '<LandGroup-request>"
  "1c93c56d4ef2aa094d01d2de52397e67")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LandGroup-request)))
  "Returns md5sum for a message object of type 'LandGroup-request"
  "1c93c56d4ef2aa094d01d2de52397e67")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LandGroup-request>)))
  "Returns full string definition for message of type '<LandGroup-request>"
  (cl:format cl:nil "string[] vehicle_names~%bool waitOnLastTask ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LandGroup-request)))
  "Returns full string definition for message of type 'LandGroup-request"
  (cl:format cl:nil "string[] vehicle_names~%bool waitOnLastTask ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LandGroup-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vehicle_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LandGroup-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LandGroup-request
    (cl:cons ':vehicle_names (vehicle_names msg))
    (cl:cons ':waitOnLastTask (waitOnLastTask msg))
))
;//! \htmlinclude LandGroup-response.msg.html

(cl:defclass <LandGroup-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LandGroup-response (<LandGroup-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LandGroup-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LandGroup-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-srv:<LandGroup-response> is deprecated: use airsim_ros-srv:LandGroup-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <LandGroup-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:success-val is deprecated.  Use airsim_ros-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LandGroup-response>) ostream)
  "Serializes a message object of type '<LandGroup-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LandGroup-response>) istream)
  "Deserializes a message object of type '<LandGroup-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LandGroup-response>)))
  "Returns string type for a service object of type '<LandGroup-response>"
  "airsim_ros/LandGroupResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LandGroup-response)))
  "Returns string type for a service object of type 'LandGroup-response"
  "airsim_ros/LandGroupResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LandGroup-response>)))
  "Returns md5sum for a message object of type '<LandGroup-response>"
  "1c93c56d4ef2aa094d01d2de52397e67")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LandGroup-response)))
  "Returns md5sum for a message object of type 'LandGroup-response"
  "1c93c56d4ef2aa094d01d2de52397e67")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LandGroup-response>)))
  "Returns full string definition for message of type '<LandGroup-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LandGroup-response)))
  "Returns full string definition for message of type 'LandGroup-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LandGroup-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LandGroup-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LandGroup-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LandGroup)))
  'LandGroup-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LandGroup)))
  'LandGroup-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LandGroup)))
  "Returns string type for a service object of type '<LandGroup>"
  "airsim_ros/LandGroup")