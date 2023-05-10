// Auto-generated. Do not edit!

// (in-package kinematics_legged.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class bezier {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.z = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = [];
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = [];
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type bezier
    // Serialize message field [x]
    // Serialize the length for message field [x]
    bufferOffset = _serializer.uint32(obj.x.length, buffer, bufferOffset);
    obj.x.forEach((val) => {
      bufferOffset = std_msgs.msg.Float32.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [y]
    // Serialize the length for message field [y]
    bufferOffset = _serializer.uint32(obj.y.length, buffer, bufferOffset);
    obj.y.forEach((val) => {
      bufferOffset = std_msgs.msg.Float32.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [z]
    // Serialize the length for message field [z]
    bufferOffset = _serializer.uint32(obj.z.length, buffer, bufferOffset);
    obj.z.forEach((val) => {
      bufferOffset = std_msgs.msg.Float32.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type bezier
    let len;
    let data = new bezier(null);
    // Deserialize message field [x]
    // Deserialize array length for message field [x]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.x = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.x[i] = std_msgs.msg.Float32.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [y]
    // Deserialize array length for message field [y]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.y = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.y[i] = std_msgs.msg.Float32.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [z]
    // Deserialize array length for message field [z]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.z = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.z[i] = std_msgs.msg.Float32.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.x.length;
    length += 4 * object.y.length;
    length += 4 * object.z.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kinematics_legged/bezier';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '091cca004b733810eb3a4ffef5db3158';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Float32[] x
    std_msgs/Float32[] y
    std_msgs/Float32[] z
    
    ================================================================================
    MSG: std_msgs/Float32
    float32 data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new bezier(null);
    if (msg.x !== undefined) {
      resolved.x = new Array(msg.x.length);
      for (let i = 0; i < resolved.x.length; ++i) {
        resolved.x[i] = std_msgs.msg.Float32.Resolve(msg.x[i]);
      }
    }
    else {
      resolved.x = []
    }

    if (msg.y !== undefined) {
      resolved.y = new Array(msg.y.length);
      for (let i = 0; i < resolved.y.length; ++i) {
        resolved.y[i] = std_msgs.msg.Float32.Resolve(msg.y[i]);
      }
    }
    else {
      resolved.y = []
    }

    if (msg.z !== undefined) {
      resolved.z = new Array(msg.z.length);
      for (let i = 0; i < resolved.z.length; ++i) {
        resolved.z[i] = std_msgs.msg.Float32.Resolve(msg.z[i]);
      }
    }
    else {
      resolved.z = []
    }

    return resolved;
    }
};

module.exports = bezier;
