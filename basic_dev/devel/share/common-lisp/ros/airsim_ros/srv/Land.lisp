; Auto-generated. Do not edit!


(cl:in-package airsim_ros-srv)


;//! \htmlinclude Land-request.msg.html

(cl:defclass <Land-request> (roslisp-msg-protocol:ros-message)
  ((waitOnLastTask
    :reader waitOnLastTask
    :initarg :waitOnLastTask
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Land-request (<Land-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Land-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Land-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-srv:<Land-request> is deprecated: use airsim_ros-srv:Land-request instead.")))

(cl:ensure-generic-function 'waitOnLastTask-val :lambda-list '(m))
(cl:defmethod waitOnLastTask-val ((m <Land-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:waitOnLastTask-val is deprecated.  Use airsim_ros-srv:waitOnLastTask instead.")
  (waitOnLastTask m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Land-request>) ostream)
  "Serializes a message object of type '<Land-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'waitOnLastTask) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Land-request>) istream)
  "Deserializes a message object of type '<Land-request>"
    (cl:setf (cl:slot-value msg 'waitOnLastTask) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Land-request>)))
  "Returns string type for a service object of type '<Land-request>"
  "airsim_ros/LandRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Land-request)))
  "Returns string type for a service object of type 'Land-request"
  "airsim_ros/LandRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Land-request>)))
  "Returns md5sum for a message object of type '<Land-request>"
  "3a122444608b7d9984b24a10fba10ac1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Land-request)))
  "Returns md5sum for a message object of type 'Land-request"
  "3a122444608b7d9984b24a10fba10ac1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Land-request>)))
  "Returns full string definition for message of type '<Land-request>"
  (cl:format cl:nil "bool waitOnLastTask ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Land-request)))
  "Returns full string definition for message of type 'Land-request"
  (cl:format cl:nil "bool waitOnLastTask ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Land-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Land-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Land-request
    (cl:cons ':waitOnLastTask (waitOnLastTask msg))
))
;//! \htmlinclude Land-response.msg.html

(cl:defclass <Land-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Land-response (<Land-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Land-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Land-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-srv:<Land-response> is deprecated: use airsim_ros-srv:Land-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Land-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:success-val is deprecated.  Use airsim_ros-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Land-response>) ostream)
  "Serializes a message object of type '<Land-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Land-response>) istream)
  "Deserializes a message object of type '<Land-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Land-response>)))
  "Returns string type for a service object of type '<Land-response>"
  "airsim_ros/LandResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Land-response)))
  "Returns string type for a service object of type 'Land-response"
  "airsim_ros/LandResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Land-response>)))
  "Returns md5sum for a message object of type '<Land-response>"
  "3a122444608b7d9984b24a10fba10ac1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Land-response)))
  "Returns md5sum for a message object of type 'Land-response"
  "3a122444608b7d9984b24a10fba10ac1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Land-response>)))
  "Returns full string definition for message of type '<Land-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Land-response)))
  "Returns full string definition for message of type 'Land-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Land-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Land-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Land-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Land)))
  'Land-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Land)))
  'Land-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Land)))
  "Returns string type for a service object of type '<Land>"
  "airsim_ros/Land")