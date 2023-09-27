;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::Altimeter)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'Altimeter (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::ALTIMETER")
  (make-package "AIRSIM_ROS::ALTIMETER"))

(in-package "ROS")
;;//! \htmlinclude Altimeter.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass airsim_ros::Altimeter
  :super ros::object
  :slots (_header _altitude _pressure _qnh ))

(defmethod airsim_ros::Altimeter
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:altitude __altitude) 0.0)
    ((:pressure __pressure) 0.0)
    ((:qnh __qnh) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _altitude (float __altitude))
   (setq _pressure (float __pressure))
   (setq _qnh (float __qnh))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:altitude
   (&optional __altitude)
   (if __altitude (setq _altitude __altitude)) _altitude)
  (:pressure
   (&optional __pressure)
   (if __pressure (setq _pressure __pressure)) _pressure)
  (:qnh
   (&optional __qnh)
   (if __qnh (setq _qnh __qnh)) _qnh)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _altitude
    4
    ;; float32 _pressure
    4
    ;; float32 _qnh
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _altitude
       (sys::poke _altitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pressure
       (sys::poke _pressure (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _qnh
       (sys::poke _qnh (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _altitude
     (setq _altitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pressure
     (setq _pressure (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _qnh
     (setq _qnh (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get airsim_ros::Altimeter :md5sum-) "c785451e2f67a76b902818138e9b53c6")
(setf (get airsim_ros::Altimeter :datatype-) "airsim_ros/Altimeter")
(setf (get airsim_ros::Altimeter :definition-)
      "Header header
float32 altitude
float32 pressure
float32 qnh
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

")



(provide :airsim_ros/Altimeter "c785451e2f67a76b902818138e9b53c6")


