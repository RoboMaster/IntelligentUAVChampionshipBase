;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::GimbalAngleQuatCmd)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'GimbalAngleQuatCmd (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::GIMBALANGLEQUATCMD")
  (make-package "AIRSIM_ROS::GIMBALANGLEQUATCMD"))

(in-package "ROS")
;;//! \htmlinclude GimbalAngleQuatCmd.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass airsim_ros::GimbalAngleQuatCmd
  :super ros::object
  :slots (_header _camera_name _vehicle_name _orientation ))

(defmethod airsim_ros::GimbalAngleQuatCmd
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:camera_name __camera_name) "")
    ((:vehicle_name __vehicle_name) "")
    ((:orientation __orientation) (instance geometry_msgs::Quaternion :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _camera_name (string __camera_name))
   (setq _vehicle_name (string __vehicle_name))
   (setq _orientation __orientation)
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
  (:orientation
   (&rest __orientation)
   (if (keywordp (car __orientation))
       (send* _orientation __orientation)
     (progn
       (if __orientation (setq _orientation (car __orientation)))
       _orientation)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _camera_name
    4 (length _camera_name)
    ;; string _vehicle_name
    4 (length _vehicle_name)
    ;; geometry_msgs/Quaternion _orientation
    (send _orientation :serialization-length)
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
     ;; geometry_msgs/Quaternion _orientation
       (send _orientation :serialize s)
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
   ;; geometry_msgs/Quaternion _orientation
     (send _orientation :deserialize buf ptr-) (incf ptr- (send _orientation :serialization-length))
   ;;
   self)
  )

(setf (get airsim_ros::GimbalAngleQuatCmd :md5sum-) "26f3bc8337157b61ae91ea421cb25a16")
(setf (get airsim_ros::GimbalAngleQuatCmd :datatype-) "airsim_ros/GimbalAngleQuatCmd")
(setf (get airsim_ros::GimbalAngleQuatCmd :definition-)
      "std_msgs/Header header
string camera_name
string vehicle_name
geometry_msgs/Quaternion orientation
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
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :airsim_ros/GimbalAngleQuatCmd "26f3bc8337157b61ae91ea421cb25a16")


