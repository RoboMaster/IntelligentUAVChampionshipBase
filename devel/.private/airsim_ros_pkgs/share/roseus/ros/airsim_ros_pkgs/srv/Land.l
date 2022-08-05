;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros_pkgs::Land)
  (if (not (find-package "AIRSIM_ROS_PKGS"))
    (make-package "AIRSIM_ROS_PKGS"))
  (shadow 'Land (find-package "AIRSIM_ROS_PKGS")))
(unless (find-package "AIRSIM_ROS_PKGS::LAND")
  (make-package "AIRSIM_ROS_PKGS::LAND"))
(unless (find-package "AIRSIM_ROS_PKGS::LANDREQUEST")
  (make-package "AIRSIM_ROS_PKGS::LANDREQUEST"))
(unless (find-package "AIRSIM_ROS_PKGS::LANDRESPONSE")
  (make-package "AIRSIM_ROS_PKGS::LANDRESPONSE"))

(in-package "ROS")





(defclass airsim_ros_pkgs::LandRequest
  :super ros::object
  :slots (_waitOnLastTask ))

(defmethod airsim_ros_pkgs::LandRequest
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

(defclass airsim_ros_pkgs::LandResponse
  :super ros::object
  :slots (_success ))

(defmethod airsim_ros_pkgs::LandResponse
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

(defclass airsim_ros_pkgs::Land
  :super ros::object
  :slots ())

(setf (get airsim_ros_pkgs::Land :md5sum-) "3a122444608b7d9984b24a10fba10ac1")
(setf (get airsim_ros_pkgs::Land :datatype-) "airsim_ros_pkgs/Land")
(setf (get airsim_ros_pkgs::Land :request) airsim_ros_pkgs::LandRequest)
(setf (get airsim_ros_pkgs::Land :response) airsim_ros_pkgs::LandResponse)

(defmethod airsim_ros_pkgs::LandRequest
  (:response () (instance airsim_ros_pkgs::LandResponse :init)))

(setf (get airsim_ros_pkgs::LandRequest :md5sum-) "3a122444608b7d9984b24a10fba10ac1")
(setf (get airsim_ros_pkgs::LandRequest :datatype-) "airsim_ros_pkgs/LandRequest")
(setf (get airsim_ros_pkgs::LandRequest :definition-)
      "bool waitOnLastTask 
---
bool success
")

(setf (get airsim_ros_pkgs::LandResponse :md5sum-) "3a122444608b7d9984b24a10fba10ac1")
(setf (get airsim_ros_pkgs::LandResponse :datatype-) "airsim_ros_pkgs/LandResponse")
(setf (get airsim_ros_pkgs::LandResponse :definition-)
      "bool waitOnLastTask 
---
bool success
")



(provide :airsim_ros_pkgs/Land "3a122444608b7d9984b24a10fba10ac1")


