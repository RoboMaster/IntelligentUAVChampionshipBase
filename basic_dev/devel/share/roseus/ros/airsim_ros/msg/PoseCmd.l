;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::PoseCmd)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'PoseCmd (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::POSECMD")
  (make-package "AIRSIM_ROS::POSECMD"))

(in-package "ROS")
;;//! \htmlinclude PoseCmd.msg.html


(defclass airsim_ros::PoseCmd
  :super ros::object
  :slots (_roll _pitch _yaw _throttle ))

(defmethod airsim_ros::PoseCmd
  (:init
   (&key
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:throttle __throttle) 0.0)
    )
   (send-super :init)
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _throttle (float __throttle))
   self)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:throttle
   (&optional __throttle)
   (if __throttle (setq _throttle __throttle)) _throttle)
  (:serialization-length
   ()
   (+
    ;; float64 _roll
    8
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ;; float64 _throttle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _throttle
       (sys::poke _throttle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _throttle
     (setq _throttle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get airsim_ros::PoseCmd :md5sum-) "e72209c904ce31f554c4e432ab36c226")
(setf (get airsim_ros::PoseCmd :datatype-) "airsim_ros/PoseCmd")
(setf (get airsim_ros::PoseCmd :definition-)
      "float64 roll
float64 pitch
float64 yaw
float64 throttle
")



(provide :airsim_ros/PoseCmd "e72209c904ce31f554c4e432ab36c226")


