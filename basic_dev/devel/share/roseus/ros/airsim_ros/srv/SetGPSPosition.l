;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::SetGPSPosition)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'SetGPSPosition (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::SETGPSPOSITION")
  (make-package "AIRSIM_ROS::SETGPSPOSITION"))
(unless (find-package "AIRSIM_ROS::SETGPSPOSITIONREQUEST")
  (make-package "AIRSIM_ROS::SETGPSPOSITIONREQUEST"))
(unless (find-package "AIRSIM_ROS::SETGPSPOSITIONRESPONSE")
  (make-package "AIRSIM_ROS::SETGPSPOSITIONRESPONSE"))

(in-package "ROS")





(defclass airsim_ros::SetGPSPositionRequest
  :super ros::object
  :slots (_latitude _longitude _altitude _yaw _vehicle_name ))

(defmethod airsim_ros::SetGPSPositionRequest
  (:init
   (&key
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:altitude __altitude) 0.0)
    ((:yaw __yaw) 0.0)
    ((:vehicle_name __vehicle_name) "")
    )
   (send-super :init)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _altitude (float __altitude))
   (setq _yaw (float __yaw))
   (setq _vehicle_name (string __vehicle_name))
   self)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:altitude
   (&optional __altitude)
   (if __altitude (setq _altitude __altitude)) _altitude)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:vehicle_name
   (&optional __vehicle_name)
   (if __vehicle_name (setq _vehicle_name __vehicle_name)) _vehicle_name)
  (:serialization-length
   ()
   (+
    ;; float64 _latitude
    8
    ;; float64 _longitude
    8
    ;; float64 _altitude
    8
    ;; float64 _yaw
    8
    ;; string _vehicle_name
    4 (length _vehicle_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _altitude
       (sys::poke _altitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _vehicle_name
       (write-long (length _vehicle_name) s) (princ _vehicle_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _altitude
     (setq _altitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _vehicle_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _vehicle_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass airsim_ros::SetGPSPositionResponse
  :super ros::object
  :slots (_success ))

(defmethod airsim_ros::SetGPSPositionResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass airsim_ros::SetGPSPosition
  :super ros::object
  :slots ())

(setf (get airsim_ros::SetGPSPosition :md5sum-) "419da4302dcfe39986b1a614149a1599")
(setf (get airsim_ros::SetGPSPosition :datatype-) "airsim_ros/SetGPSPosition")
(setf (get airsim_ros::SetGPSPosition :request) airsim_ros::SetGPSPositionRequest)
(setf (get airsim_ros::SetGPSPosition :response) airsim_ros::SetGPSPositionResponse)

(defmethod airsim_ros::SetGPSPositionRequest
  (:response () (instance airsim_ros::SetGPSPositionResponse :init)))

(setf (get airsim_ros::SetGPSPositionRequest :md5sum-) "419da4302dcfe39986b1a614149a1599")
(setf (get airsim_ros::SetGPSPositionRequest :datatype-) "airsim_ros/SetGPSPositionRequest")
(setf (get airsim_ros::SetGPSPositionRequest :definition-)
      "float64 latitude
float64 longitude
float64 altitude
float64 yaw
string vehicle_name
---
#Response : return success=true, (if async=false && if setpoint reached before timeout = 30sec) || (if async=true && command sent to autopilot)
bool success
")

(setf (get airsim_ros::SetGPSPositionResponse :md5sum-) "419da4302dcfe39986b1a614149a1599")
(setf (get airsim_ros::SetGPSPositionResponse :datatype-) "airsim_ros/SetGPSPositionResponse")
(setf (get airsim_ros::SetGPSPositionResponse :definition-)
      "float64 latitude
float64 longitude
float64 altitude
float64 yaw
string vehicle_name
---
#Response : return success=true, (if async=false && if setpoint reached before timeout = 30sec) || (if async=true && command sent to autopilot)
bool success
")



(provide :airsim_ros/SetGPSPosition "419da4302dcfe39986b1a614149a1599")


