; Auto-generated. Do not edit!


(cl:in-package airsim_ros-srv)


;//! \htmlinclude TakeoffGroup-request.msg.html

(cl:defclass <TakeoffGroup-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass TakeoffGroup-request (<TakeoffGroup-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TakeoffGroup-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TakeoffGroup-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-srv:<TakeoffGroup-request> is deprecated: use airsim_ros-srv:TakeoffGroup-request instead.")))

(cl:ensure-generic-function 'vehicle_names-val :lambda-list '(m))
(cl:defmethod vehicle_names-val ((m <TakeoffGroup-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:vehicle_names-val is deprecated.  Use airsim_ros-srv:vehicle_names instead.")
  (vehicle_names m))

(cl:ensure-generic-function 'waitOnLastTask-val :lambda-list '(m))
(cl:defmethod waitOnLastTask-val ((m <TakeoffGroup-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:waitOnLastTask-val is deprecated.  Use airsim_ros-srv:waitOnLastTask instead.")
  (waitOnLastTask m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TakeoffGroup-request>) ostream)
  "Serializes a message object of type '<TakeoffGroup-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TakeoffGroup-request>) istream)
  "Deserializes a message object of type '<TakeoffGroup-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TakeoffGroup-request>)))
  "Returns string type for a service object of type '<TakeoffGroup-request>"
  "airsim_ros/TakeoffGroupRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TakeoffGroup-request)))
  "Returns string type for a service object of type 'TakeoffGroup-request"
  "airsim_ros/TakeoffGroupRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TakeoffGroup-request>)))
  "Returns md5sum for a message object of type '<TakeoffGroup-request>"
  "1c93c56d4ef2aa094d01d2de52397e67")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TakeoffGroup-request)))
  "Returns md5sum for a message object of type 'TakeoffGroup-request"
  "1c93c56d4ef2aa094d01d2de52397e67")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TakeoffGroup-request>)))
  "Returns full string definition for message of type '<TakeoffGroup-request>"
  (cl:format cl:nil "string[] vehicle_names~%bool waitOnLastTask ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TakeoffGroup-request)))
  "Returns full string definition for message of type 'TakeoffGroup-request"
  (cl:format cl:nil "string[] vehicle_names~%bool waitOnLastTask ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TakeoffGroup-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vehicle_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TakeoffGroup-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TakeoffGroup-request
    (cl:cons ':vehicle_names (vehicle_names msg))
    (cl:cons ':waitOnLastTask (waitOnLastTask msg))
))
;//! \htmlinclude TakeoffGroup-response.msg.html

(cl:defclass <TakeoffGroup-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass TakeoffGroup-response (<TakeoffGroup-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TakeoffGroup-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TakeoffGroup-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-srv:<TakeoffGroup-response> is deprecated: use airsim_ros-srv:TakeoffGroup-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <TakeoffGroup-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:success-val is deprecated.  Use airsim_ros-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TakeoffGroup-response>) ostream)
  "Serializes a message object of type '<TakeoffGroup-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TakeoffGroup-response>) istream)
  "Deserializes a message object of type '<TakeoffGroup-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TakeoffGroup-response>)))
  "Returns string type for a service object of type '<TakeoffGroup-response>"
  "airsim_ros/TakeoffGroupResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TakeoffGroup-response)))
  "Returns string type for a service object of type 'TakeoffGroup-response"
  "airsim_ros/TakeoffGroupResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TakeoffGroup-response>)))
  "Returns md5sum for a message object of type '<TakeoffGroup-response>"
  "1c93c56d4ef2aa094d01d2de52397e67")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TakeoffGroup-response)))
  "Returns md5sum for a message object of type 'TakeoffGroup-response"
  "1c93c56d4ef2aa094d01d2de52397e67")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TakeoffGroup-response>)))
  "Returns full string definition for message of type '<TakeoffGroup-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TakeoffGroup-response)))
  "Returns full string definition for message of type 'TakeoffGroup-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TakeoffGroup-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TakeoffGroup-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TakeoffGroup-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TakeoffGroup)))
  'TakeoffGroup-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TakeoffGroup)))
  'TakeoffGroup-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TakeoffGroup)))
  "Returns string type for a service object of type '<TakeoffGroup>"
  "airsim_ros/TakeoffGroup")