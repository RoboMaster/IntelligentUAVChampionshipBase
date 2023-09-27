;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::Circle)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'Circle (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::CIRCLE")
  (make-package "AIRSIM_ROS::CIRCLE"))

(in-package "ROS")
;;//! \htmlinclude Circle.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass airsim_ros::Circle
  :super ros::object
  :slots (_index _position _yaw ))

(defmethod airsim_ros::Circle
  (:init
   (&key
    ((:index __index) 0)
    ((:position __position) (instance geometry_msgs::Vector3 :init))
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _index (round __index))
   (setq _position __position)
   (setq _yaw (float __yaw))
   self)
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; uint8 _index
    1
    ;; geometry_msgs/Vector3 _position
    (send _position :serialization-length)
    ;; float64 _yaw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _index
       (write-byte _index s)
     ;; geometry_msgs/Vector3 _position
       (send _position :serialize s)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _index
     (setq _index (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; geometry_msgs/Vector3 _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get airsim_ros::Circle :md5sum-) "182de38a68dfb7440273ce21ac6bad6d")
(setf (get airsim_ros::Circle :datatype-) "airsim_ros/Circle")
(setf (get airsim_ros::Circle :definition-)
      "uint8 index
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



(provide :airsim_ros/Circle "182de38a68dfb7440273ce21ac6bad6d")


