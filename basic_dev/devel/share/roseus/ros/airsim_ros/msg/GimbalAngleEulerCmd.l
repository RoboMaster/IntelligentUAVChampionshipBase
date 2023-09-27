;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::GimbalAngleEulerCmd)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'GimbalAngleEulerCmd (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::GIMBALANGLEEULERCMD")
  (make-package "AIRSIM_ROS::GIMBALANGLEEULERCMD"))

(in-package "ROS")
;;//! \htmlinclude GimbalAngleEulerCmd.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass airsim_ros::GimbalAngleEulerCmd
  :super ros::object
  :slots (_header _camera_name _vehicle_name _roll _pitch _yaw ))

(defmethod airsim_ros::GimbalAngleEulerCmd
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:camera_name __camera_name) "")
    ((:vehicle_name __vehicle_name) "")
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _camera_name (string __camera_name))
   (setq _vehicle_name (string __vehicle_name))
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:camera_name
   (&optional __camera_name)
   (if __camera_name (setq _camera_name __camera_name)) _camera_name)
  (:vehicle_name
   (&optional __vehicle_name)
   (if __vehicle_name (setq _vehicle_name __vehicle_name)) _vehicle_name)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _camera_name
    4 (length _camera_name)
    ;; string _vehicle_name
    4 (length _vehicle_name)
    ;; float64 _roll
    8
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _camera_name
       (write-long (length _camera_name) s) (princ _camera_name s)
     ;; string _vehicle_name
       (write-long (length _vehicle_name) s) (princ _vehicle_name s)
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _camera_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _camera_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _vehicle_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _vehicle_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get airsim_ros::GimbalAngleEulerCmd :md5sum-) "e806d02845eb5f1632f3c9f2e90c0519")
(setf (get airsim_ros::GimbalAngleEulerCmd :datatype-) "airsim_ros/GimbalAngleEulerCmd")
(setf (get airsim_ros::GimbalAngleEulerCmd :definition-)
      "std_msgs/Header header
string camera_name
string vehicle_name
float64 roll
float64 pitch
float64 yaw
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



(provide :airsim_ros/GimbalAngleEulerCmd "e806d02845eb5f1632f3c9f2e90c0519")


