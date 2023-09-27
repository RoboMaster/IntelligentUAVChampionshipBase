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

class CarControls {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.throttle = null;
      this.brake = null;
      this.steering = null;
      this.handbrake = null;
      this.manual = null;
      this.manual_gear = null;
      this.gear_immediate = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('throttle')) {
        this.throttle = initObj.throttle
      }
      else {
        this.throttle = 0.0;
      }
      if (initObj.hasOwnProperty('brake')) {
        this.brake = initObj.brake
      }
      else {
        this.brake = 0.0;
      }
      if (initObj.hasOwnProperty('steering')) {
        this.steering = initObj.steering
      }
      else {
        this.steering = 0.0;
      }
      if (initObj.hasOwnProperty('handbrake')) {
        this.handbrake = initObj.handbrake
      }
      else {
        this.handbrake = false;
      }
      if (initObj.hasOwnProperty('manual')) {
        this.manual = initObj.manual
      }
      else {
        this.manual = false;
      }
      if (initObj.hasOwnProperty('manual_gear')) {
        this.manual_gear = initObj.manual_gear
      }
      else {
        this.manual_gear = 0;
      }
      if (initObj.hasOwnProperty('gear_immediate')) {
        this.gear_immediate = initObj.gear_immediate
      }
      else {
        this.gear_immediate = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CarControls
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [throttle]
    bufferOffset = _serializer.float32(obj.throttle, buffer, bufferOffset);
    // Serialize message field [brake]
    bufferOffset = _serializer.float32(obj.brake, buffer, bufferOffset);
    // Serialize message field [steering]
    bufferOffset = _serializer.float32(obj.steering, buffer, bufferOffset);
    // Serialize message field [handbrake]
    bufferOffset = _serializer.bool(obj.handbrake, buffer, bufferOffset);
    // Serialize message field [manual]
    bufferOffset = _serializer.bool(obj.manual, buffer, bufferOffset);
    // Serialize message field [manual_gear]
    bufferOffset = _serializer.int8(obj.manual_gear, buffer, bufferOffset);
    // Serialize message field [gear_immediate]
    bufferOffset = _serializer.bool(obj.gear_immediate, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CarControls
    let len;
    let data = new CarControls(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [throttle]
    data.throttle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [brake]
    data.brake = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [steering]
    data.steering = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [handbrake]
    data.handbrake = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [manual]
    data.manual = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [manual_gear]
    data.manual_gear = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [gear_immediate]
    data.gear_immediate = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'airsim_ros/CarControls';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2cf7bae5e8a409a1c310bfb0435ad4b6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    float32 throttle
    float32 brake
    float32 steering
    bool handbrake
    bool manual
    int8 manual_gear
    bool gear_immediate
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
    const resolved = new CarControls(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.throttle !== undefined) {
      resolved.throttle = msg.throttle;
    }
    else {
      resolved.throttle = 0.0
    }

    if (msg.brake !== undefined) {
      resolved.brake = msg.brake;
    }
    else {
      resolved.brake = 0.0
    }

    if (msg.steering !== undefined) {
      resolved.steering = msg.steering;
    }
    else {
      resolved.steering = 0.0
    }

    if (msg.handbrake !== undefined) {
      resolved.handbrake = msg.handbrake;
    }
    else {
      resolved.handbrake = false
    }

    if (msg.manual !== undefined) {
      resolved.manual = msg.manual;
    }
    else {
      resolved.manual = false
    }

    if (msg.manual_gear !== undefined) {
      resolved.manual_gear = msg.manual_gear;
    }
    else {
      resolved.manual_gear = 0
    }

    if (msg.gear_immediate !== undefined) {
      resolved.gear_immediate = msg.gear_immediate;
    }
    else {
      resolved.gear_immediate = false
    }

    return resolved;
    }
};

module.exports = CarControls;
