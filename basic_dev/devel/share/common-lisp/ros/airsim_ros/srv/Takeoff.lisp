; Auto-generated. Do not edit!


(cl:in-package airsim_ros-srv)


;//! \htmlinclude Takeoff-request.msg.html

(cl:defclass <Takeoff-request> (roslisp-msg-protocol:ros-message)
  ((waitOnLastTask
    :reader waitOnLastTask
    :initarg :waitOnLastTask
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Takeoff-request (<Takeoff-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Takeoff-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Takeoff-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-srv:<Takeoff-request> is deprecated: use airsim_ros-srv:Takeoff-request instead.")))

(cl:ensure-generic-function 'waitOnLastTask-val :lambda-list '(m))
(cl:defmethod waitOnLastTask-val ((m <Takeoff-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:waitOnLastTask-val is deprecated.  Use airsim_ros-srv:waitOnLastTask instead.")
  (waitOnLastTask m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Takeoff-request>) ostream)
  "Serializes a message object of type '<Takeoff-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'waitOnLastTask) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Takeoff-request>) istream)
  "Deserializes a message object of type '<Takeoff-request>"
    (cl:setf (cl:slot-value msg 'waitOnLastTask) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Takeoff-request>)))
  "Returns string type for a service object of type '<Takeoff-request>"
  "airsim_ros/TakeoffRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Takeoff-request)))
  "Returns string type for a service object of type 'Takeoff-request"
  "airsim_ros/TakeoffRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Takeoff-request>)))
  "Returns md5sum for a message object of type '<Takeoff-request>"
  "3a122444608b7d9984b24a10fba10ac1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Takeoff-request)))
  "Returns md5sum for a message object of type 'Takeoff-request"
  "3a122444608b7d9984b24a10fba10ac1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Takeoff-request>)))
  "Returns full string definition for message of type '<Takeoff-request>"
  (cl:format cl:nil "bool waitOnLastTask ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Takeoff-request)))
  "Returns full string definition for message of type 'Takeoff-request"
  (cl:format cl:nil "bool waitOnLastTask ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Takeoff-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Takeoff-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Takeoff-request
    (cl:cons ':waitOnLastTask (waitOnLastTask msg))
))
;//! \htmlinclude Takeoff-response.msg.html

(cl:defclass <Takeoff-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Takeoff-response (<Takeoff-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Takeoff-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Takeoff-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros-srv:<Takeoff-response> is deprecated: use airsim_ros-srv:Takeoff-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Takeoff-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros-srv:success-val is deprecated.  Use airsim_ros-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Takeoff-response>) ostream)
  "Serializes a message object of type '<Takeoff-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Takeoff-response>) istream)
  "Deserializes a message object of type '<Takeoff-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Takeoff-response>)))
  "Returns string type for a service object of type '<Takeoff-response>"
  "airsim_ros/TakeoffResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Takeoff-response)))
  "Returns string type for a service object of type 'Takeoff-response"
  "airsim_ros/TakeoffResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Takeoff-response>)))
  "Returns md5sum for a message object of type '<Takeoff-response>"
  "3a122444608b7d9984b24a10fba10ac1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Takeoff-response)))
  "Returns md5sum for a message object of type 'Takeoff-response"
  "3a122444608b7d9984b24a10fba10ac1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Takeoff-response>)))
  "Returns full string definition for message of type '<Takeoff-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Takeoff-response)))
  "Returns full string definition for message of type 'Takeoff-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Takeoff-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Takeoff-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Takeoff-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Takeoff)))
  'Takeoff-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Takeoff)))
  'Takeoff-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Takeoff)))
  "Returns string type for a service object of type '<Takeoff>"
  "airsim_ros/Takeoff")