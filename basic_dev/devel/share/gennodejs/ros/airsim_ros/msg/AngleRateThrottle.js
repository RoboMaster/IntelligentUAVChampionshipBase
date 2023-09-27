// Auto-generated. Do not edit!

// (in-package airsim_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class AngleRateThrottle {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rollRate = null;
      this.pitchRate = null;
      this.yawRate = null;
      this.throttle = null;
    }
    else {
      if (initObj.hasOwnProperty('rollRate')) {
        this.rollRate = initObj.rollRate
      }
      else {
        this.rollRate = 0.0;
      }
      if (initObj.hasOwnProperty('pitchRate')) {
        this.pitchRate = initObj.pitchRate
      }
      else {
        this.pitchRate = 0.0;
      }
      if (initObj.hasOwnProperty('yawRate')) {
        this.yawRate = initObj.yawRate
      }
      else {
        this.yawRate = 0.0;
      }
      if (initObj.hasOwnProperty('throttle')) {
        this.throttle = initObj.throttle
      }
      else {
        this.throttle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AngleRateThrottle
    // Serialize message field [rollRate]
    bufferOffset = _serializer.float64(obj.rollRate, buffer, bufferOffset);
    // Serialize message field [pitchRate]
    bufferOffset = _serializer.float64(obj.pitchRate, buffer, bufferOffset);
    // Serialize message field [yawRate]
    bufferOffset = _serializer.float64(obj.yawRate, buffer, bufferOffset);
    // Serialize message field [throttle]
    bufferOffset = _serializer.float64(obj.throttle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AngleRateThrottle
    let len;
    let data = new AngleRateThrottle(null);
    // Deserialize message field [rollRate]
    data.rollRate = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pitchRate]
    data.pitchRate = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yawRate]
    data.yawRate = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [throttle]
    data.throttle = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'airsim_ros/AngleRateThrottle';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '93bb283398a326cfc4d5e3c6a992ff87';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 rollRate
    float64 pitchRate
    float64 yawRate
    float64 throttle
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AngleRateThrottle(null);
    if (msg.rollRate !== undefined) {
      resolved.rollRate = msg.rollRate;
    }
    else {
      resolved.rollRate = 0.0
    }

    if (msg.pitchRate !== undefined) {
      resolved.pitchRate = msg.pitchRate;
    }
    else {
      resolved.pitchRate = 0.0
    }

    if (msg.yawRate !== undefined) {
      resolved.yawRate = msg.yawRate;
    }
    else {
      resolved.yawRate = 0.0
    }

    if (msg.throttle !== undefined) {
      resolved.throttle = msg.throttle;
    }
    else {
      resolved.throttle = 0.0
    }

    return resolved;
    }
};

module.exports = AngleRateThrottle;
