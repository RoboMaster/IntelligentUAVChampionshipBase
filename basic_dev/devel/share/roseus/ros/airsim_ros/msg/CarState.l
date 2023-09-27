;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::CarState)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'CarState (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::CARSTATE")
  (make-package "AIRSIM_ROS::CARSTATE"))

(in-package "ROS")
;;//! \htmlinclude CarState.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass airsim_ros::CarState
  :super ros::object
  :slots (_header _pose _twist _speed _gear _rpm _maxrpm _handbrake ))

(defmethod airsim_ros::CarState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pose __pose) (instance geometry_msgs::PoseWithCovariance :init))
    ((:twist __twist) (instance geometry_msgs::TwistWithCovariance :init))
    ((:speed __speed) 0.0)
    ((:gear __gear) 0)
    ((:rpm __rpm) 0.0)
    ((:maxrpm __maxrpm) 0.0)
    ((:handbrake __handbrake) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _pose __pose)
   (setq _twist __twist)
   (setq _speed (float __speed))
   (setq _gear (round __gear))
   (setq _rpm (float __rpm))
   (setq _maxrpm (float __maxrpm))
   (setq _handbrake __handbrake)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:twist
   (&rest __twist)
   (if (keywordp (car __twist))
       (send* _twist __twist)
     (progn
       (if __twist (setq _twist (car __twist)))
       _twist)))
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:gear
   (&optional __gear)
   (if __gear (setq _gear __gear)) _gear)
  (:rpm
   (&optional __rpm)
   (if __rpm (setq _rpm __rpm)) _rpm)
  (:maxrpm
   (&optional __maxrpm)
   (if __maxrpm (setq _maxrpm __maxrpm)) _maxrpm)
  (:handbrake
   (&optional (__handbrake :null))
   (if (not (eq __handbrake :null)) (setq _handbrake __handbrake)) _handbrake)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/PoseWithCovariance _pose
    (send _pose :serialization-length)
    ;; geometry_msgs/TwistWithCovariance _twist
    (send _twist :serialization-length)
    ;; float32 _speed
    4
    ;; int8 _gear
    1
    ;; float32 _rpm
    4
    ;; float32 _maxrpm
    4
    ;; bool _handbrake
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/PoseWithCovariance _pose
       (send _pose :serialize s)
     ;; geometry_msgs/TwistWithCovariance _twist
       (send _twist :serialize s)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8 _gear
       (write-byte _gear s)
     ;; float32 _rpm
       (sys::poke _rpm (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _maxrpm
       (sys::poke _maxrpm (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _handbrake
       (if _handbrake (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/PoseWithCovariance _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; geometry_msgs/TwistWithCovariance _twist
     (send _twist :deserialize buf ptr-) (incf ptr- (send _twist :serialization-length))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8 _gear
     (setq _gear (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _gear 127) (setq _gear (- _gear 256)))
   ;; float32 _rpm
     (setq _rpm (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _maxrpm
     (setq _maxrpm (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _handbrake
     (setq _handbrake (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get airsim_ros::CarState :md5sum-) "df8351642cffc332932a7deda26a94b4")
(setf (get airsim_ros::CarState :datatype-) "airsim_ros/CarState")
(setf (get airsim_ros::CarState :definition-)
      "std_msgs/Header header
geometry_msgs/PoseWithCovariance pose
geometry_msgs/TwistWithCovariance twist
float32 speed
int8 gear
float32 rpm
float32 maxrpm
bool handbrake
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/PoseWithCovariance
# This represents a pose in free space with uncertainty.

Pose pose

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/TwistWithCovariance
# This expresses velocity in free space with uncertainty.

Twist twist

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :airsim_ros/CarState "df8351642cffc332932a7deda26a94b4")


