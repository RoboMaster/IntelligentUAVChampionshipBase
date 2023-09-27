;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::Reset)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'Reset (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::RESET")
  (make-package "AIRSIM_ROS::RESET"))
(unless (find-package "AIRSIM_ROS::RESETREQUEST")
  (make-package "AIRSIM_ROS::RESETREQUEST"))
(unless (find-package "AIRSIM_ROS::RESETRESPONSE")
  (make-package "AIRSIM_ROS::RESETRESPONSE"))

(in-package "ROS")





(defclass airsim_ros::ResetRequest
  :super ros::object
  :slots ())

(defmethod airsim_ros::ResetRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass airsim_ros::ResetResponse
  :super ros::object
  :slots (_success ))

(defmethod airsim_ros::ResetResponse
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

(defclass airsim_ros::Reset
  :super ros::object
  :slots ())

(setf (get airsim_ros::Reset :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get airsim_ros::Reset :datatype-) "airsim_ros/Reset")
(setf (get airsim_ros::Reset :request) airsim_ros::ResetRequest)
(setf (get airsim_ros::Reset :response) airsim_ros::ResetResponse)

(defmethod airsim_ros::ResetRequest
  (:response () (instance airsim_ros::ResetResponse :init)))

(setf (get airsim_ros::ResetRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get airsim_ros::ResetRequest :datatype-) "airsim_ros/ResetRequest")
(setf (get airsim_ros::ResetRequest :definition-)
      "---
bool success
")

(setf (get airsim_ros::ResetResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get airsim_ros::ResetResponse :datatype-) "airsim_ros/ResetResponse")
(setf (get airsim_ros::ResetResponse :definition-)
      "---
bool success
")



(provide :airsim_ros/Reset "358e233cde0c8a8bcfea4ce193f8fc15")


