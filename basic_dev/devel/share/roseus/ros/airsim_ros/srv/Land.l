;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::Land)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'Land (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::LAND")
  (make-package "AIRSIM_ROS::LAND"))
(unless (find-package "AIRSIM_ROS::LANDREQUEST")
  (make-package "AIRSIM_ROS::LANDREQUEST"))
(unless (find-package "AIRSIM_ROS::LANDRESPONSE")
  (make-package "AIRSIM_ROS::LANDRESPONSE"))

(in-package "ROS")





(defclass airsim_ros::LandRequest
  :super ros::object
  :slots (_waitOnLastTask ))

(defmethod airsim_ros::LandRequest
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

(defclass airsim_ros::LandResponse
  :super ros::object
  :slots (_success ))

(defmethod airsim_ros::LandResponse
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

(defclass airsim_ros::Land
  :super ros::object
  :slots ())

(setf (get airsim_ros::Land :md5sum-) "3a122444608b7d9984b24a10fba10ac1")
(setf (get airsim_ros::Land :datatype-) "airsim_ros/Land")
(setf (get airsim_ros::Land :request) airsim_ros::LandRequest)
(setf (get airsim_ros::Land :response) airsim_ros::LandResponse)

(defmethod airsim_ros::LandRequest
  (:response () (instance airsim_ros::LandResponse :init)))

(setf (get airsim_ros::LandRequest :md5sum-) "3a122444608b7d9984b24a10fba10ac1")
(setf (get airsim_ros::LandRequest :datatype-) "airsim_ros/LandRequest")
(setf (get airsim_ros::LandRequest :definition-)
      "bool waitOnLastTask 
---
bool success
")

(setf (get airsim_ros::LandResponse :md5sum-) "3a122444608b7d9984b24a10fba10ac1")
(setf (get airsim_ros::LandResponse :datatype-) "airsim_ros/LandResponse")
(setf (get airsim_ros::LandResponse :definition-)
      "bool waitOnLastTask 
---
bool success
")



(provide :airsim_ros/Land "3a122444608b7d9984b24a10fba10ac1")


