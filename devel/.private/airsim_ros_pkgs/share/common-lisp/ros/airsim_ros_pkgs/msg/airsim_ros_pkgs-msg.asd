
(cl:in-package :asdf)

(defsystem "airsim_ros_pkgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geographic_msgs-msg
               :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Altimeter" :depends-on ("_package_Altimeter"))
    (:file "_package_Altimeter" :depends-on ("_package"))
    (:file "CarControls" :depends-on ("_package_CarControls"))
    (:file "_package_CarControls" :depends-on ("_package"))
    (:file "CarState" :depends-on ("_package_CarState"))
    (:file "_package_CarState" :depends-on ("_package"))
    (:file "Environment" :depends-on ("_package_Environment"))
    (:file "_package_Environment" :depends-on ("_package"))
    (:file "GPSYaw" :depends-on ("_package_GPSYaw"))
    (:file "_package_GPSYaw" :depends-on ("_package"))
    (:file "GimbalAngleEulerCmd" :depends-on ("_package_GimbalAngleEulerCmd"))
    (:file "_package_GimbalAngleEulerCmd" :depends-on ("_package"))
    (:file "GimbalAngleQuatCmd" :depends-on ("_package_GimbalAngleQuatCmd"))
    (:file "_package_GimbalAngleQuatCmd" :depends-on ("_package"))
    (:file "PoseCmd" :depends-on ("_package_PoseCmd"))
    (:file "_package_PoseCmd" :depends-on ("_package"))
    (:file "VelCmd" :depends-on ("_package_VelCmd"))
    (:file "_package_VelCmd" :depends-on ("_package"))
    (:file "VelCmdGroup" :depends-on ("_package_VelCmdGroup"))
    (:file "_package_VelCmdGroup" :depends-on ("_package"))
  ))