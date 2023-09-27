// Auto-generated. Do not edit!

// (in-package airsim_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');
let geometry_msgs = _finder('geometry_msgs');
let geographic_msgs = _finder('geographic_msgs');

//-----------------------------------------------------------

class Environment {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.position = null;
      this.geo_point = null;
      this.gravity = null;
      this.air_pressure = null;
      this.temperature = null;
      this.air_density = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('geo_point')) {
        this.geo_point = initObj.geo_point
      }
      else {
        this.geo_point = new geographic_msgs.msg.GeoPoint();
      }
      if (initObj.hasOwnProperty('gravity')) {
        this.gravity = initObj.gravity
      }
      else {
        this.gravity = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('air_pressure')) {
        this.air_pressure = initObj.air_pressure
      }
      else {
        this.air_pressure = 0.0;
      }
      if (initObj.hasOwnProperty('temperature')) {
        this.temperature = initObj.temperature
      }
      else {
        this.temperature = 0.0;
      }
      if (initObj.hasOwnProperty('air_density')) {
        this.air_density = initObj.air_density
      }
      else {
        this.air_density = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Environment
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [geo_point]
    bufferOffset = geographic_msgs.msg.GeoPoint.serialize(obj.geo_point, buffer, bufferOffset);
    // Serialize message field [gravity]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.gravity, buffer, bufferOffset);
    // Serialize message field [air_pressure]
    bufferOffset = _serializer.float32(obj.air_pressure, buffer, bufferOffset);
    // Serialize message field [temperature]
    bufferOffset = _serializer.float32(obj.temperature, buffer, bufferOffset);
    // Serialize message field [air_density]
    bufferOffset = _serializer.float32(obj.air_density, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Environment
    let len;
    let data = new Environment(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [geo_point]
    data.geo_point = geographic_msgs.msg.GeoPoint.deserialize(buffer, bufferOffset);
    // Deserialize message field [gravity]
    data.gravity = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [air_pressure]
    data.air_pressure = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [temperature]
    data.temperature = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [air_density]
    data.air_density = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 84;
  }

  static datatype() {
    // Returns string type for a message object
    return 'airsim_ros/Environment';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c546730bd6237a77064d600afdebc59a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Environment(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.position !== undefined) {
      resolved.position = geometry_msgs.msg.Vector3.Resolve(msg.position)
    }
    else {
      resolved.position = new geometry_msgs.msg.Vector3()
    }

    if (msg.geo_point !== undefined) {
      resolved.geo_point = geographic_msgs.msg.GeoPoint.Resolve(msg.geo_point)
    }
    else {
      resolved.geo_point = new geographic_msgs.msg.GeoPoint()
    }

    if (msg.gravity !== undefined) {
      resolved.gravity = geometry_msgs.msg.Vector3.Resolve(msg.gravity)
    }
    else {
      resolved.gravity = new geometry_msgs.msg.Vector3()
    }

    if (msg.air_pressure !== undefined) {
      resolved.air_pressure = msg.air_pressure;
    }
    else {
      resolved.air_pressure = 0.0
    }

    if (msg.temperature !== undefined) {
      resolved.temperature = msg.temperature;
    }
    else {
      resolved.temperature = 0.0
    }

    if (msg.air_density !== undefined) {
      resolved.air_density = msg.air_density;
    }
    else {
      resolved.air_density = 0.0
    }

    return resolved;
    }
};

module.exports = Environment;
