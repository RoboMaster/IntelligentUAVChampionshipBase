// Auto-generated. Do not edit!

// (in-package airsim_ros_pkgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class VelCmdGroup {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.twist = null;
      this.vehicle_names = null;
    }
    else {
      if (initObj.hasOwnProperty('twist')) {
        this.twist = initObj.twist
      }
      else {
        this.twist = new geometry_msgs.msg.Twist();
      }
      if (initObj.hasOwnProperty('vehicle_names')) {
        this.vehicle_names = initObj.vehicle_names
      }
      else {
        this.vehicle_names = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VelCmdGroup
    // Serialize message field [twist]
    bufferOffset = geometry_msgs.msg.Twist.serialize(obj.twist, buffer, bufferOffset);
    // Serialize message field [vehicle_names]
    bufferOffset = _arraySerializer.string(obj.vehicle_names, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VelCmdGroup
    let len;
    let data = new VelCmdGroup(null);
    // Deserialize message field [twist]
    data.twist = geometry_msgs.msg.Twist.deserialize(buffer, bufferOffset);
    // Deserialize message field [vehicle_names]
    data.vehicle_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.vehicle_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'airsim_ros_pkgs/VelCmdGroup';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8799472a9188ceedb7e4a4fc4acaa96d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Twist twist
    string[] vehicle_names
    ================================================================================
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VelCmdGroup(null);
    if (msg.twist !== undefined) {
      resolved.twist = geometry_msgs.msg.Twist.Resolve(msg.twist)
    }
    else {
      resolved.twist = new geometry_msgs.msg.Twist()
    }

    if (msg.vehicle_names !== undefined) {
      resolved.vehicle_names = msg.vehicle_names;
    }
    else {
      resolved.vehicle_names = []
    }

    return resolved;
    }
};

module.exports = VelCmdGroup;
