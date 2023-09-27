// Auto-generated. Do not edit!

// (in-package airsim_ros.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class TopicHzRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.get = null;
    }
    else {
      if (initObj.hasOwnProperty('get')) {
        this.get = initObj.get
      }
      else {
        this.get = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TopicHzRequest
    // Serialize message field [get]
    bufferOffset = _serializer.int64(obj.get, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TopicHzRequest
    let len;
    let data = new TopicHzRequest(null);
    // Deserialize message field [get]
    data.get = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'airsim_ros/TopicHzRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1a514c24c167567fafb0a99dffb52d0a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 get
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TopicHzRequest(null);
    if (msg.get !== undefined) {
      resolved.get = msg.get;
    }
    else {
      resolved.get = 0
    }

    return resolved;
    }
};

class TopicHzResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vel_cmd_hz = null;
      this.pose_cmd_hz = null;
      this.angle_cmd_hz = null;
      this.imu_hz = null;
      this.image_hz = null;
      this.pose_err_hz = null;
      this.rotor_pwm_hz = null;
    }
    else {
      if (initObj.hasOwnProperty('vel_cmd_hz')) {
        this.vel_cmd_hz = initObj.vel_cmd_hz
      }
      else {
        this.vel_cmd_hz = 0.0;
      }
      if (initObj.hasOwnProperty('pose_cmd_hz')) {
        this.pose_cmd_hz = initObj.pose_cmd_hz
      }
      else {
        this.pose_cmd_hz = 0.0;
      }
      if (initObj.hasOwnProperty('angle_cmd_hz')) {
        this.angle_cmd_hz = initObj.angle_cmd_hz
      }
      else {
        this.angle_cmd_hz = 0.0;
      }
      if (initObj.hasOwnProperty('imu_hz')) {
        this.imu_hz = initObj.imu_hz
      }
      else {
        this.imu_hz = 0.0;
      }
      if (initObj.hasOwnProperty('image_hz')) {
        this.image_hz = initObj.image_hz
      }
      else {
        this.image_hz = 0.0;
      }
      if (initObj.hasOwnProperty('pose_err_hz')) {
        this.pose_err_hz = initObj.pose_err_hz
      }
      else {
        this.pose_err_hz = 0.0;
      }
      if (initObj.hasOwnProperty('rotor_pwm_hz')) {
        this.rotor_pwm_hz = initObj.rotor_pwm_hz
      }
      else {
        this.rotor_pwm_hz = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TopicHzResponse
    // Serialize message field [vel_cmd_hz]
    bufferOffset = _serializer.float64(obj.vel_cmd_hz, buffer, bufferOffset);
    // Serialize message field [pose_cmd_hz]
    bufferOffset = _serializer.float64(obj.pose_cmd_hz, buffer, bufferOffset);
    // Serialize message field [angle_cmd_hz]
    bufferOffset = _serializer.float64(obj.angle_cmd_hz, buffer, bufferOffset);
    // Serialize message field [imu_hz]
    bufferOffset = _serializer.float64(obj.imu_hz, buffer, bufferOffset);
    // Serialize message field [image_hz]
    bufferOffset = _serializer.float64(obj.image_hz, buffer, bufferOffset);
    // Serialize message field [pose_err_hz]
    bufferOffset = _serializer.float64(obj.pose_err_hz, buffer, bufferOffset);
    // Serialize message field [rotor_pwm_hz]
    bufferOffset = _serializer.float64(obj.rotor_pwm_hz, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TopicHzResponse
    let len;
    let data = new TopicHzResponse(null);
    // Deserialize message field [vel_cmd_hz]
    data.vel_cmd_hz = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pose_cmd_hz]
    data.pose_cmd_hz = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angle_cmd_hz]
    data.angle_cmd_hz = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [imu_hz]
    data.imu_hz = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [image_hz]
    data.image_hz = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pose_err_hz]
    data.pose_err_hz = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [rotor_pwm_hz]
    data.rotor_pwm_hz = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a service object
    return 'airsim_ros/TopicHzResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9cbf4860726dd4f0468dbc6bcf0a1d2e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 vel_cmd_hz
    float64 pose_cmd_hz
    float64 angle_cmd_hz
    float64 imu_hz
    float64 image_hz
    float64 pose_err_hz
    float64 rotor_pwm_hz
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TopicHzResponse(null);
    if (msg.vel_cmd_hz !== undefined) {
      resolved.vel_cmd_hz = msg.vel_cmd_hz;
    }
    else {
      resolved.vel_cmd_hz = 0.0
    }

    if (msg.pose_cmd_hz !== undefined) {
      resolved.pose_cmd_hz = msg.pose_cmd_hz;
    }
    else {
      resolved.pose_cmd_hz = 0.0
    }

    if (msg.angle_cmd_hz !== undefined) {
      resolved.angle_cmd_hz = msg.angle_cmd_hz;
    }
    else {
      resolved.angle_cmd_hz = 0.0
    }

    if (msg.imu_hz !== undefined) {
      resolved.imu_hz = msg.imu_hz;
    }
    else {
      resolved.imu_hz = 0.0
    }

    if (msg.image_hz !== undefined) {
      resolved.image_hz = msg.image_hz;
    }
    else {
      resolved.image_hz = 0.0
    }

    if (msg.pose_err_hz !== undefined) {
      resolved.pose_err_hz = msg.pose_err_hz;
    }
    else {
      resolved.pose_err_hz = 0.0
    }

    if (msg.rotor_pwm_hz !== undefined) {
      resolved.rotor_pwm_hz = msg.rotor_pwm_hz;
    }
    else {
      resolved.rotor_pwm_hz = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: TopicHzRequest,
  Response: TopicHzResponse,
  md5sum() { return '685d1f21c0a32ce2836c18711bcaeaff'; },
  datatype() { return 'airsim_ros/TopicHz'; }
};
