;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::CirclePoses)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'CirclePoses (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::CIRCLEPOSES")
  (make-package "AIRSIM_ROS::CIRCLEPOSES"))

(in-package "ROS")
;;//! \htmlinclude CirclePoses.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass airsim_ros::CirclePoses
  :super ros::object
  :slots (_header _poses ))

(defmethod airsim_ros::CirclePoses
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:poses __poses) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _poses __poses)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:poses
   (&rest __poses)
   (if (keywordp (car __poses))
       (send* _poses __poses)
     (progn
       (if __poses (setq _poses (car __poses)))
       _poses)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; airsim_ros/Circle[] _poses
    (apply #'+ (send-all _poses :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; airsim_ros/Circle[] _poses
     (write-long (length _poses) s)
     (dolist (elem _poses)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; airsim_ros/Circle[] _poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _poses (let (r) (dotimes (i n) (push (instance airsim_ros::Circle :init) r)) r))
     (dolist (elem- _poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get airsim_ros::CirclePoses :md5sum-) "fc5e78a66530b8c9f75a9952468f11a4")
(setf (get airsim_ros::CirclePoses :datatype-) "airsim_ros/CirclePoses")
(setf (get airsim_ros::CirclePoses :definition-)
      "std_msgs/Header header
Circle[] poses
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
MSG: airsim_ros/Circle
uint8 index
geometry_msgs/Vector3 position
float64 yaw
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



(provide :airsim_ros/CirclePoses "fc5e78a66530b8c9f75a9952468f11a4")


