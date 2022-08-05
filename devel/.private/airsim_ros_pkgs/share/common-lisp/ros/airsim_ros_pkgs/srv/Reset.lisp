; Auto-generated. Do not edit!


(cl:in-package airsim_ros_pkgs-srv)


;//! \htmlinclude Reset-request.msg.html

(cl:defclass <Reset-request> (roslisp-msg-protocol:ros-message)
  ((waitOnLastTask
    :reader waitOnLastTask
    :initarg :waitOnLastTask
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Reset-request (<Reset-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Reset-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Reset-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros_pkgs-srv:<Reset-request> is deprecated: use airsim_ros_pkgs-srv:Reset-request instead.")))

(cl:ensure-generic-function 'waitOnLastTask-val :lambda-list '(m))
(cl:defmethod waitOnLastTask-val ((m <Reset-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros_pkgs-srv:waitOnLastTask-val is deprecated.  Use airsim_ros_pkgs-srv:waitOnLastTask instead.")
  (waitOnLastTask m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Reset-request>) ostream)
  "Serializes a message object of type '<Reset-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'waitOnLastTask) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Reset-request>) istream)
  "Deserializes a message object of type '<Reset-request>"
    (cl:setf (cl:slot-value msg 'waitOnLastTask) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Reset-request>)))
  "Returns string type for a service object of type '<Reset-request>"
  "airsim_ros_pkgs/ResetRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Reset-request)))
  "Returns string type for a service object of type 'Reset-request"
  "airsim_ros_pkgs/ResetRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Reset-request>)))
  "Returns md5sum for a message object of type '<Reset-request>"
  "3a122444608b7d9984b24a10fba10ac1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Reset-request)))
  "Returns md5sum for a message object of type 'Reset-request"
  "3a122444608b7d9984b24a10fba10ac1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Reset-request>)))
  "Returns full string definition for message of type '<Reset-request>"
  (cl:format cl:nil "# string vehicle_name~%bool waitOnLastTask ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Reset-request)))
  "Returns full string definition for message of type 'Reset-request"
  (cl:format cl:nil "# string vehicle_name~%bool waitOnLastTask ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Reset-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Reset-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Reset-request
    (cl:cons ':waitOnLastTask (waitOnLastTask msg))
))
;//! \htmlinclude Reset-response.msg.html

(cl:defclass <Reset-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Reset-response (<Reset-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Reset-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Reset-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros_pkgs-srv:<Reset-response> is deprecated: use airsim_ros_pkgs-srv:Reset-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Reset-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros_pkgs-srv:success-val is deprecated.  Use airsim_ros_pkgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Reset-response>) ostream)
  "Serializes a message object of type '<Reset-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Reset-response>) istream)
  "Deserializes a message object of type '<Reset-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Reset-response>)))
  "Returns string type for a service object of type '<Reset-response>"
  "airsim_ros_pkgs/ResetResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Reset-response)))
  "Returns string type for a service object of type 'Reset-response"
  "airsim_ros_pkgs/ResetResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Reset-response>)))
  "Returns md5sum for a message object of type '<Reset-response>"
  "3a122444608b7d9984b24a10fba10ac1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Reset-response)))
  "Returns md5sum for a message object of type 'Reset-response"
  "3a122444608b7d9984b24a10fba10ac1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Reset-response>)))
  "Returns full string definition for message of type '<Reset-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Reset-response)))
  "Returns full string definition for message of type 'Reset-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Reset-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Reset-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Reset-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Reset)))
  'Reset-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Reset)))
  'Reset-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Reset)))
  "Returns string type for a service object of type '<Reset>"
  "airsim_ros_pkgs/Reset")