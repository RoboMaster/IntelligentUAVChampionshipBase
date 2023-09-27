;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::RotorPWM)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'RotorPWM (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::ROTORPWM")
  (make-package "AIRSIM_ROS::ROTORPWM"))

(in-package "ROS")
;;//! \htmlinclude RotorPWM.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass airsim_ros::RotorPWM
  :super ros::object
  :slots (_header _rotorPWM0 _rotorPWM1 _rotorPWM2 _rotorPWM3 ))

(defmethod airsim_ros::RotorPWM
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:rotorPWM0 __rotorPWM0) 0.0)
    ((:rotorPWM1 __rotorPWM1) 0.0)
    ((:rotorPWM2 __rotorPWM2) 0.0)
    ((:rotorPWM3 __rotorPWM3) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _rotorPWM0 (float __rotorPWM0))
   (setq _rotorPWM1 (float __rotorPWM1))
   (setq _rotorPWM2 (float __rotorPWM2))
   (setq _rotorPWM3 (float __rotorPWM3))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:rotorPWM0
   (&optional __rotorPWM0)
   (if __rotorPWM0 (setq _rotorPWM0 __rotorPWM0)) _rotorPWM0)
  (:rotorPWM1
   (&optional __rotorPWM1)
   (if __rotorPWM1 (setq _rotorPWM1 __rotorPWM1)) _rotorPWM1)
  (:rotorPWM2
   (&optional __rotorPWM2)
   (if __rotorPWM2 (setq _rotorPWM2 __rotorPWM2)) _rotorPWM2)
  (:rotorPWM3
   (&optional __rotorPWM3)
   (if __rotorPWM3 (setq _rotorPWM3 __rotorPWM3)) _rotorPWM3)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _rotorPWM0
    8
    ;; float64 _rotorPWM1
    8
    ;; float64 _rotorPWM2
    8
    ;; float64 _rotorPWM3
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _rotorPWM0
       (sys::poke _rotorPWM0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _rotorPWM1
       (sys::poke _rotorPWM1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _rotorPWM2
       (sys::poke _rotorPWM2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _rotorPWM3
       (sys::poke _rotorPWM3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _rotorPWM0
     (setq _rotorPWM0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _rotorPWM1
     (setq _rotorPWM1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _rotorPWM2
     (setq _rotorPWM2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _rotorPWM3
     (setq _rotorPWM3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get airsim_ros::RotorPWM :md5sum-) "4967432b608c06d70b17be20124fa258")
(setf (get airsim_ros::RotorPWM :datatype-) "airsim_ros/RotorPWM")
(setf (get airsim_ros::RotorPWM :definition-)
      "std_msgs/Header header
float64 rotorPWM0
float64 rotorPWM1
float64 rotorPWM2
float64 rotorPWM3
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



(provide :airsim_ros/RotorPWM "4967432b608c06d70b17be20124fa258")


