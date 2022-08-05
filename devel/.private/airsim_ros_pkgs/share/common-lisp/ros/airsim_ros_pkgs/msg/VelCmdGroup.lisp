; Auto-generated. Do not edit!


(cl:in-package airsim_ros_pkgs-msg)


;//! \htmlinclude VelCmdGroup.msg.html

(cl:defclass <VelCmdGroup> (roslisp-msg-protocol:ros-message)
  ((twist
    :reader twist
    :initarg :twist
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist))
   (vehicle_names
    :reader vehicle_names
    :initarg :vehicle_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass VelCmdGroup (<VelCmdGroup>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VelCmdGroup>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VelCmdGroup)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name airsim_ros_pkgs-msg:<VelCmdGroup> is deprecated: use airsim_ros_pkgs-msg:VelCmdGroup instead.")))

(cl:ensure-generic-function 'twist-val :lambda-list '(m))
(cl:defmethod twist-val ((m <VelCmdGroup>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros_pkgs-msg:twist-val is deprecated.  Use airsim_ros_pkgs-msg:twist instead.")
  (twist m))

(cl:ensure-generic-function 'vehicle_names-val :lambda-list '(m))
(cl:defmethod vehicle_names-val ((m <VelCmdGroup>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader airsim_ros_pkgs-msg:vehicle_names-val is deprecated.  Use airsim_ros_pkgs-msg:vehicle_names instead.")
  (vehicle_names m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VelCmdGroup>) ostream)
  "Serializes a message object of type '<VelCmdGroup>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'twist) ostream)
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VelCmdGroup>) istream)
  "Deserializes a message object of type '<VelCmdGroup>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'twist) istream)
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VelCmdGroup>)))
  "Returns string type for a message object of type '<VelCmdGroup>"
  "airsim_ros_pkgs/VelCmdGroup")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VelCmdGroup)))
  "Returns string type for a message object of type 'VelCmdGroup"
  "airsim_ros_pkgs/VelCmdGroup")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VelCmdGroup>)))
  "Returns md5sum for a message object of type '<VelCmdGroup>"
  "8799472a9188ceedb7e4a4fc4acaa96d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VelCmdGroup)))
  "Returns md5sum for a message object of type 'VelCmdGroup"
  "8799472a9188ceedb7e4a4fc4acaa96d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VelCmdGroup>)))
  "Returns full string definition for message of type '<VelCmdGroup>"
  (cl:format cl:nil "geometry_msgs/Twist twist~%string[] vehicle_names~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VelCmdGroup)))
  "Returns full string definition for message of type 'VelCmdGroup"
  (cl:format cl:nil "geometry_msgs/Twist twist~%string[] vehicle_names~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VelCmdGroup>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'twist))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vehicle_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VelCmdGroup>))
  "Converts a ROS message object to a list"
  (cl:list 'VelCmdGroup
    (cl:cons ':twist (twist msg))
    (cl:cons ':vehicle_names (vehicle_names msg))
))
