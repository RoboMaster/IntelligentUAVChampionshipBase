;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::CarControls)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'CarControls (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::CARCONTROLS")
  (make-package "AIRSIM_ROS::CARCONTROLS"))

(in-package "ROS")
;;//! \htmlinclude CarControls.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass airsim_ros::CarControls
  :super ros::object
  :slots (_header _throttle _brake _steering _handbrake _manual _manual_gear _gear_immediate ))

(defmethod airsim_ros::CarControls
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:throttle __throttle) 0.0)
    ((:brake __brake) 0.0)
    ((:steering __steering) 0.0)
    ((:handbrake __handbrake) nil)
    ((:manual __manual) nil)
    ((:manual_gear __manual_gear) 0)
    ((:gear_immediate __gear_immediate) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _throttle (float __throttle))
   (setq _brake (float __brake))
   (setq _steering (float __steering))
   (setq _handbrake __handbrake)
   (setq _manual __manual)
   (setq _manual_gear (round __manual_gear))
   (setq _gear_immediate __gear_immediate)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:throttle
   (&optional __throttle)
   (if __throttle (setq _throttle __throttle)) _throttle)
  (:brake
   (&optional __brake)
   (if __brake (setq _brake __brake)) _brake)
  (:steering
   (&optional __steering)
   (if __steering (setq _steering __steering)) _steering)
  (:handbrake
   (&optional (__handbrake :null))
   (if (not (eq __handbrake :null)) (setq _handbrake __handbrake)) _handbrake)
  (:manual
   (&optional (__manual :null))
   (if (not (eq __manual :null)) (setq _manual __manual)) _manual)
  (:manual_gear
   (&optional __manual_gear)
   (if __manual_gear (setq _manual_gear __manual_gear)) _manual_gear)
  (:gear_immediate
   (&optional (__gear_immediate :null))
   (if (not (eq __gear_immediate :null)) (setq _gear_immediate __gear_immediate)) _gear_immediate)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _throttle
    4
    ;; float32 _brake
    4
    ;; float32 _steering
    4
    ;; bool _handbrake
    1
    ;; bool _manual
    1
    ;; int8 _manual_gear
    1
    ;; bool _gear_immediate
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _throttle
       (sys::poke _throttle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _brake
       (sys::poke _brake (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steering
       (sys::poke _steering (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _handbrake
       (if _handbrake (write-byte -1 s) (write-byte 0 s))
     ;; bool _manual
       (if _manual (write-byte -1 s) (write-byte 0 s))
     ;; int8 _manual_gear
       (write-byte _manual_gear s)
     ;; bool _gear_immediate
       (if _gear_immediate (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _throttle
     (setq _throttle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _brake
     (setq _brake (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steering
     (setq _steering (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _handbrake
     (setq _handbrake (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _manual
     (setq _manual (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int8 _manual_gear
     (setq _manual_gear (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _manual_gear 127) (setq _manual_gear (- _manual_gear 256)))
   ;; bool _gear_immediate
     (setq _gear_immediate (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get airsim_ros::CarControls :md5sum-) "2cf7bae5e8a409a1c310bfb0435ad4b6")
(setf (get airsim_ros::CarControls :datatype-) "airsim_ros/CarControls")
(setf (get airsim_ros::CarControls :definition-)
      "std_msgs/Header header
float32 throttle
float32 brake
float32 steering
bool handbrake
bool manual
int8 manual_gear
bool gear_immediate
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



(provide :airsim_ros/CarControls "2cf7bae5e8a409a1c310bfb0435ad4b6")


