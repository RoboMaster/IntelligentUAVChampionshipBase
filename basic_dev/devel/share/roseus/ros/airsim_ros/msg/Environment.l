;; Auto-generated. Do not edit!


(when (boundp 'airsim_ros::Environment)
  (if (not (find-package "AIRSIM_ROS"))
    (make-package "AIRSIM_ROS"))
  (shadow 'Environment (find-package "AIRSIM_ROS")))
(unless (find-package "AIRSIM_ROS::ENVIRONMENT")
  (make-package "AIRSIM_ROS::ENVIRONMENT"))

(in-package "ROS")
;;//! \htmlinclude Environment.msg.html
(if (not (find-package "GEOGRAPHIC_MSGS"))
  (ros::roseus-add-msgs "geographic_msgs"))
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass airsim_ros::Environment
  :super ros::object
  :slots (_header _position _geo_point _gravity _air_pressure _temperature _air_density ))

(defmethod airsim_ros::Environment
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:position __position) (instance geometry_msgs::Vector3 :init))
    ((:geo_point __geo_point) (instance geographic_msgs::GeoPoint :init))
    ((:gravity __gravity) (instance geometry_msgs::Vector3 :init))
    ((:air_pressure __air_pressure) 0.0)
    ((:temperature __temperature) 0.0)
    ((:air_density __air_density) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _position __position)
   (setq _geo_point __geo_point)
   (setq _gravity __gravity)
   (setq _air_pressure (float __air_pressure))
   (setq _temperature (float __temperature))
   (setq _air_density (float __air_density))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:geo_point
   (&rest __geo_point)
   (if (keywordp (car __geo_point))
       (send* _geo_point __geo_point)
     (progn
       (if __geo_point (setq _geo_point (car __geo_point)))
       _geo_point)))
  (:gravity
   (&rest __gravity)
   (if (keywordp (car __gravity))
       (send* _gravity __gravity)
     (progn
       (if __gravity (setq _gravity (car __gravity)))
       _gravity)))
  (:air_pressure
   (&optional __air_pressure)
   (if __air_pressure (setq _air_pressure __air_pressure)) _air_pressure)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:air_density
   (&optional __air_density)
   (if __air_density (setq _air_density __air_density)) _air_density)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3 _position
    (send _position :serialization-length)
    ;; geographic_msgs/GeoPoint _geo_point
    (send _geo_point :serialization-length)
    ;; geometry_msgs/Vector3 _gravity
    (send _gravity :serialization-length)
    ;; float32 _air_pressure
    4
    ;; float32 _temperature
    4
    ;; float32 _air_density
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3 _position
       (send _position :serialize s)
     ;; geographic_msgs/GeoPoint _geo_point
       (send _geo_point :serialize s)
     ;; geometry_msgs/Vector3 _gravity
       (send _gravity :serialize s)
     ;; float32 _air_pressure
       (sys::poke _air_pressure (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _temperature
       (sys::poke _temperature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _air_density
       (sys::poke _air_density (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3 _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; geographic_msgs/GeoPoint _geo_point
     (send _geo_point :deserialize buf ptr-) (incf ptr- (send _geo_point :serialization-length))
   ;; geometry_msgs/Vector3 _gravity
     (send _gravity :deserialize buf ptr-) (incf ptr- (send _gravity :serialization-length))
   ;; float32 _air_pressure
     (setq _air_pressure (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _temperature
     (setq _temperature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _air_density
     (setq _air_density (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get airsim_ros::Environment :md5sum-) "c546730bd6237a77064d600afdebc59a")
(setf (get airsim_ros::Environment :datatype-) "airsim_ros/Environment")
(setf (get airsim_ros::Environment :definition-)
      "Header header
geometry_msgs/Vector3 position
geographic_msgs/GeoPoint geo_point
geometry_msgs/Vector3 gravity
float32 air_pressure
float32 temperature
float32 air_density


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

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geographic_msgs/GeoPoint
# Geographic point, using the WGS 84 reference ellipsoid.

# Latitude [degrees]. Positive is north of equator; negative is south
# (-90 <= latitude <= +90).
float64 latitude

# Longitude [degrees]. Positive is east of prime meridian; negative is
# west (-180 <= longitude <= +180). At the poles, latitude is -90 or
# +90, and longitude is irrelevant, but must be in range.
float64 longitude

# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).
float64 altitude

")



(provide :airsim_ros/Environment "c546730bd6237a77064d600afdebc59a")


