;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros_pkgs::VelCmd)
  (if (not (find-package "AIRSIM_ROS_PKGS"))
    (make-package "AIRSIM_ROS_PKGS"))
  (shadow 'VelCmd (find-package "AIRSIM_ROS_PKGS")))
(unless (find-package "AIRSIM_ROS_PKGS::VELCMD")
  (make-package "AIRSIM_ROS_PKGS::VELCMD"))

(in-package "ROS")
;;//! \htmlinclude VelCmd.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass airsim_ros_pkgs::VelCmd
  :super ros::object
  :slots (_twist ))

(defmethod airsim_ros_pkgs::VelCmd
  (:init
   (&key
    ((:twist __twist) (instance geometry_msgs::Twist :init))
    )
   (send-super :init)
   (setq _twist __twist)
   self)
  (:twist
   (&rest __twist)
   (if (keywordp (car __twist))
       (send* _twist __twist)
     (progn
       (if __twist (setq _twist (car __twist)))
       _twist)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Twist _twist
    (send _twist :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Twist _twist
       (send _twist :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Twist _twist
     (send _twist :deserialize buf ptr-) (incf ptr- (send _twist :serialization-length))
   ;;
   self)
  )

(setf (get airsim_ros_pkgs::VelCmd :md5sum-) "a787b2802160dcc7fe02d089e10afe56")
(setf (get airsim_ros_pkgs::VelCmd :datatype-) "airsim_ros_pkgs/VelCmd")
(setf (get airsim_ros_pkgs::VelCmd :definition-)
      "geometry_msgs/Twist twist
# string vehicle_name
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



(provide :airsim_ros_pkgs/VelCmd "a787b2802160dcc7fe02d089e10afe56")


