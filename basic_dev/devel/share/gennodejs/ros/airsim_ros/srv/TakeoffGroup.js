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

class TakeoffGroupRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vehicle_names = null;
      this.waitOnLastTask = null;
    }
    else {
      if (initObj.hasOwnProperty('vehicle_names')) {
        this.vehicle_names = initObj.vehicle_names
      }
      else {
        this.vehicle_names = [];
      }
      if (initObj.hasOwnProperty('waitOnLastTask')) {
        this.waitOnLastTask = initObj.waitOnLastTask
      }
      else {
        this.waitOnLastTask = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TakeoffGroupRequest
    // Serialize message field [vehicle_names]
    bufferOffset = _arraySerializer.string(obj.vehicle_names, buffer, bufferOffset, null);
    // Serialize message field [waitOnLastTask]
    bufferOffset = _serializer.bool(obj.waitOnLastTask, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TakeoffGroupRequest
    let len;
    let data = new TakeoffGroupRequest(null);
    // Deserialize message field [vehicle_names]
    data.vehicle_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [waitOnLastTask]
    data.waitOnLastTask = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.vehicle_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'airsim_ros/TakeoffGroupRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '93573f0951a404e62756fb4ba226140a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] vehicle_names
    bool waitOnLastTask 
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TakeoffGroupRequest(null);
    if (msg.vehicle_names !== undefined) {
      resolved.vehicle_names = msg.vehicle_names;
    }
    else {
      resolved.vehicle_names = []
    }

    if (msg.waitOnLastTask !== undefined) {
      resolved.waitOnLastTask = msg.waitOnLastTask;
    }
    else {
      resolved.waitOnLastTask = false
    }

    return resolved;
    }
};

class TakeoffGroupResponse {
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
    // Serializes a message object of type TakeoffGroupResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TakeoffGroupResponse
    let len;
    let data = new TakeoffGroupResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'airsim_ros/TakeoffGroupResponse';
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
    const resolved = new TakeoffGroupResponse(null);
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
  Request: TakeoffGroupRequest,
  Response: TakeoffGroupResponse,
  md5sum() { return '1c93c56d4ef2aa094d01d2de52397e67'; },
  datatype() { return 'airsim_ros/TakeoffGroup'; }
};
