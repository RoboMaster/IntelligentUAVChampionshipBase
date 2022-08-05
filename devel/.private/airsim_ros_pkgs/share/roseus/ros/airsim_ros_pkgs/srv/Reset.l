;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros_pkgs::Reset)
  (if (not (find-package "AIRSIM_ROS_PKGS"))
    (make-package "AIRSIM_ROS_PKGS"))
  (shadow 'Reset (find-package "AIRSIM_ROS_PKGS")))
(unless (find-package "AIRSIM_ROS_PKGS::RESET")
  (make-package "AIRSIM_ROS_PKGS::RESET"))
(unless (find-package "AIRSIM_ROS_PKGS::RESETREQUEST")
  (make-package "AIRSIM_ROS_PKGS::RESETREQUEST"))
(unless (find-package "AIRSIM_ROS_PKGS::RESETRESPONSE")
  (make-package "AIRSIM_ROS_PKGS::RESETRESPONSE"))

(in-package "ROS")





(defclass airsim_ros_pkgs::ResetRequest
  :super ros::object
  :slots (_waitOnLastTask ))

(defmethod airsim_ros_pkgs::ResetRequest
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

(defclass airsim_ros_pkgs::ResetResponse
  :super ros::object
  :slots (_success ))

(defmethod airsim_ros_pkgs::ResetResponse
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

(defclass airsim_ros_pkgs::Reset
  :super ros::object
  :slots ())

(setf (get airsim_ros_pkgs::Reset :md5sum-) "3a122444608b7d9984b24a10fba10ac1")
(setf (get airsim_ros_pkgs::Reset :datatype-) "airsim_ros_pkgs/Reset")
(setf (get airsim_ros_pkgs::Reset :request) airsim_ros_pkgs::ResetRequest)
(setf (get airsim_ros_pkgs::Reset :response) airsim_ros_pkgs::ResetResponse)

(defmethod airsim_ros_pkgs::ResetRequest
  (:response () (instance airsim_ros_pkgs::ResetResponse :init)))

(setf (get airsim_ros_pkgs::ResetRequest :md5sum-) "3a122444608b7d9984b24a10fba10ac1")
(setf (get airsim_ros_pkgs::ResetRequest :datatype-) "airsim_ros_pkgs/ResetRequest")
(setf (get airsim_ros_pkgs::ResetRequest :definition-)
      "# string vehicle_name
bool waitOnLastTask 
---
bool success
")

(setf (get airsim_ros_pkgs::ResetResponse :md5sum-) "3a122444608b7d9984b24a10fba10ac1")
(setf (get airsim_ros_pkgs::ResetResponse :datatype-) "airsim_ros_pkgs/ResetResponse")
(setf (get airsim_ros_pkgs::ResetResponse :definition-)
      "# string vehicle_name
bool waitOnLastTask 
---
bool success
")



(provide :airsim_ros_pkgs/Reset "3a122444608b7d9984b24a10fba10ac1")


