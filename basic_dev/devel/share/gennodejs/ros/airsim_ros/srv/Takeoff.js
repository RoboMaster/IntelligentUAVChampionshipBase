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

class TakeoffRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.waitOnLastTask = null;
    }
    else {
      if (initObj.hasOwnProperty('waitOnLastTask')) {
        this.waitOnLastTask = initObj.waitOnLastTask
      }
      else {
        this.waitOnLastTask = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TakeoffRequest
    // Serialize message field [waitOnLastTask]
    bufferOffset = _serializer.bool(obj.waitOnLastTask, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TakeoffRequest
    let len;
    let data = new TakeoffRequest(null);
    // Deserialize message field [waitOnLastTask]
    data.waitOnLastTask = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'airsim_ros/TakeoffRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '79b3eea4e90fd67af16afc9085f08e12';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool waitOnLastTask 
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TakeoffRequest(null);
    if (msg.waitOnLastTask !== undefined) {
      resolved.waitOnLastTask = msg.waitOnLastTask;
    }
    else {
      resolved.waitOnLastTask = false
    }

    return resolved;
    }
};

class TakeoffResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TakeoffResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TakeoffResponse
    let len;
    let data = new TakeoffResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'airsim_ros/TakeoffResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TakeoffResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: TakeoffRequest,
  Response: TakeoffResponse,
  md5sum() { return '3a122444608b7d9984b24a10fba10ac1'; },
  datatype() { return 'airsim_ros/Takeoff'; }
};
