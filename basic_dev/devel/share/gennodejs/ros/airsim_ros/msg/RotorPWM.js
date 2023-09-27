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

//-----------------------------------------------------------

class RotorPWM {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.rotorPWM0 = null;
      this.rotorPWM1 = null;
      this.rotorPWM2 = null;
      this.rotorPWM3 = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('rotorPWM0')) {
        this.rotorPWM0 = initObj.rotorPWM0
      }
      else {
        this.rotorPWM0 = 0.0;
      }
      if (initObj.hasOwnProperty('rotorPWM1')) {
        this.rotorPWM1 = initObj.rotorPWM1
      }
      else {
        this.rotorPWM1 = 0.0;
      }
      if (initObj.hasOwnProperty('rotorPWM2')) {
        this.rotorPWM2 = initObj.rotorPWM2
      }
      else {
        this.rotorPWM2 = 0.0;
      }
      if (initObj.hasOwnProperty('rotorPWM3')) {
        this.rotorPWM3 = initObj.rotorPWM3
      }
      else {
        this.rotorPWM3 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RotorPWM
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [rotorPWM0]
    bufferOffset = _serializer.float64(obj.rotorPWM0, buffer, bufferOffset);
    // Serialize message field [rotorPWM1]
    bufferOffset = _serializer.float64(obj.rotorPWM1, buffer, bufferOffset);
    // Serialize message field [rotorPWM2]
    bufferOffset = _serializer.float64(obj.rotorPWM2, buffer, bufferOffset);
    // Serialize message field [rotorPWM3]
    bufferOffset = _serializer.float64(obj.rotorPWM3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RotorPWM
    let len;
    let data = new RotorPWM(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [rotorPWM0]
    data.rotorPWM0 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [rotorPWM1]
    data.rotorPWM1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [rotorPWM2]
    data.rotorPWM2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [rotorPWM3]
    data.rotorPWM3 = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'airsim_ros/RotorPWM';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4967432b608c06d70b17be20124fa258';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    float64 rotorPWM0
    float64 rotorPWM1
    float64 rotorPWM2
    float64 rotorPWM3
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RotorPWM(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.rotorPWM0 !== undefined) {
      resolved.rotorPWM0 = msg.rotorPWM0;
    }
    else {
      resolved.rotorPWM0 = 0.0
    }

    if (msg.rotorPWM1 !== undefined) {
      resolved.rotorPWM1 = msg.rotorPWM1;
    }
    else {
      resolved.rotorPWM1 = 0.0
    }

    if (msg.rotorPWM2 !== undefined) {
      resolved.rotorPWM2 = msg.rotorPWM2;
    }
    else {
      resolved.rotorPWM2 = 0.0
    }

    if (msg.rotorPWM3 !== undefined) {
      resolved.rotorPWM3 = msg.rotorPWM3;
    }
    else {
      resolved.rotorPWM3 = 0.0
    }

    return resolved;
    }
};

module.exports = RotorPWM;
