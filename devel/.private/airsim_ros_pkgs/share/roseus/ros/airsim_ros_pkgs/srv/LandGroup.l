;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros_pkgs::LandGroup)
  (if (not (find-package "AIRSIM_ROS_PKGS"))
    (make-package "AIRSIM_ROS_PKGS"))
  (shadow 'LandGroup (find-package "AIRSIM_ROS_PKGS")))
(unless (find-package "AIRSIM_ROS_PKGS::LANDGROUP")
  (make-package "AIRSIM_ROS_PKGS::LANDGROUP"))
(unless (find-package "AIRSIM_ROS_PKGS::LANDGROUPREQUEST")
  (make-package "AIRSIM_ROS_PKGS::LANDGROUPREQUEST"))
(unless (find-package "AIRSIM_ROS_PKGS::LANDGROUPRESPONSE")
  (make-package "AIRSIM_ROS_PKGS::LANDGROUPRESPONSE"))

(in-package "ROS")





(defclass airsim_ros_pkgs::LandGroupRequest
  :super ros::object
  :slots (_vehicle_names _waitOnLastTask ))

(defmethod airsim_ros_pkgs::LandGroupRequest
  (:init
   (&key
    ((:vehicle_names __vehicle_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:waitOnLastTask __waitOnLastTask) nil)
    )
   (send-super :init)
   (setq _vehicle_names __vehicle_names)
   (setq _waitOnLastTask __waitOnLastTask)
   self)
  (:vehicle_names
   (&optional __vehicle_names)
   (if __vehicle_names (setq _vehicle_names __vehicle_names)) _vehicle_names)
  (:waitOnLastTask
   (&optional (__waitOnLastTask :null))
   (if (not (eq __waitOnLastTask :null)) (setq _waitOnLastTask __waitOnLastTask)) _waitOnLastTask)
  (:serialization-length
   ()
   (+
    ;; string[] _vehicle_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _vehicle_names)) 4
    ;; bool _waitOnLastTask
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _vehicle_names
     (write-long (length _vehicle_names) s)
     (dolist (elem _vehicle_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; bool _waitOnLastTask
       (if _waitOnLastTask (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _vehicle_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _vehicle_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _vehicle_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; bool _waitOnLastTask
     (setq _waitOnLastTask (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass airsim_ros_pkgs::LandGroupResponse
  :super ros::object
  :slots (_success ))

(defmethod airsim_ros_pkgs::LandGroupResponse
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

(defclass airsim_ros_pkgs::LandGroup
  :super ros::object
  :slots ())

(setf (get airsim_ros_pkgs::LandGroup :md5sum-) "1c93c56d4ef2aa094d01d2de52397e67")
(setf (get airsim_ros_pkgs::LandGroup :datatype-) "airsim_ros_pkgs/LandGroup")
(setf (get airsim_ros_pkgs::LandGroup :request) airsim_ros_pkgs::LandGroupRequest)
(setf (get airsim_ros_pkgs::LandGroup :response) airsim_ros_pkgs::LandGroupResponse)

(defmethod airsim_ros_pkgs::LandGroupRequest
  (:response () (instance airsim_ros_pkgs::LandGroupResponse :init)))

(setf (get airsim_ros_pkgs::LandGroupRequest :md5sum-) "1c93c56d4ef2aa094d01d2de52397e67")
(setf (get airsim_ros_pkgs::LandGroupRequest :datatype-) "airsim_ros_pkgs/LandGroupRequest")
(setf (get airsim_ros_pkgs::LandGroupRequest :definition-)
      "string[] vehicle_names
bool waitOnLastTask 
---
bool success
")

(setf (get airsim_ros_pkgs::LandGroupResponse :md5sum-) "1c93c56d4ef2aa094d01d2de52397e67")
(setf (get airsim_ros_pkgs::LandGroupResponse :datatype-) "airsim_ros_pkgs/LandGroupResponse")
(setf (get airsim_ros_pkgs::LandGroupResponse :definition-)
      "string[] vehicle_names
bool waitOnLastTask 
---
bool success
")



(provide :airsim_ros_pkgs/LandGroup "1c93c56d4ef2aa094d01d2de52397e67")


