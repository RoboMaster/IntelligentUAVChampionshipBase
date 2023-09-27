;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::Takeoff)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'Takeoff (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::TAKEOFF")
  (make-package "AIRSIM_ROS::TAKEOFF"))
(unless (find-package "AIRSIM_ROS::TAKEOFFREQUEST")
  (make-package "AIRSIM_ROS::TAKEOFFREQUEST"))
(unless (find-package "AIRSIM_ROS::TAKEOFFRESPONSE")
  (make-package "AIRSIM_ROS::TAKEOFFRESPONSE"))

(in-package "ROS")





(defclass airsim_ros::TakeoffRequest
  :super ros::object
  :slots (_waitOnLastTask ))

(defmethod airsim_ros::TakeoffRequest
  (:init
   (&key
    ((:waitOnLastTask __waitOnLastTask) nil)
    )
   (send-super :init)
   (setq _waitOnLastTask __waitOnLastTask)
   self)
  (:waitOnLastTask
   (&optional (__waitOnLastTask :null))
   (if (not (eq __waitOnLastTask :null)) (setq _waitOnLastTask __waitOnLastTask)) _waitOnLastTask)
  (:serialization-length
   ()
   (+
    ;; bool _waitOnLastTask
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _waitOnLastTask
       (if _waitOnLastTask (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _waitOnLastTask
     (setq _waitOnLastTask (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass airsim_ros::TakeoffResponse
  :super ros::object
  :slots (_success ))

(defmethod airsim_ros::TakeoffResponse
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

(defclass airsim_ros::Takeoff
  :super ros::object
  :slots ())

(setf (get airsim_ros::Takeoff :md5sum-) "3a122444608b7d9984b24a10fba10ac1")
(setf (get airsim_ros::Takeoff :datatype-) "airsim_ros/Takeoff")
(setf (get airsim_ros::Takeoff :request) airsim_ros::TakeoffRequest)
(setf (get airsim_ros::Takeoff :response) airsim_ros::TakeoffResponse)

(defmethod airsim_ros::TakeoffRequest
  (:response () (instance airsim_ros::TakeoffResponse :init)))

(setf (get airsim_ros::TakeoffRequest :md5sum-) "3a122444608b7d9984b24a10fba10ac1")
(setf (get airsim_ros::TakeoffRequest :datatype-) "airsim_ros/TakeoffRequest")
(setf (get airsim_ros::TakeoffRequest :definition-)
      "bool waitOnLastTask 
---
bool success
")

(setf (get airsim_ros::TakeoffResponse :md5sum-) "3a122444608b7d9984b24a10fba10ac1")
(setf (get airsim_ros::TakeoffResponse :datatype-) "airsim_ros/TakeoffResponse")
(setf (get airsim_ros::TakeoffResponse :definition-)
      "bool waitOnLastTask 
---
bool success
")



(provide :airsim_ros/Takeoff "3a122444608b7d9984b24a10fba10ac1")


