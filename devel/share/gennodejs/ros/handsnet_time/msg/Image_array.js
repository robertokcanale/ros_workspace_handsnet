// Auto-generated. Do not edit!

// (in-package handsnet_time.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class Image_array {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tactile_image = null;
    }
    else {
      if (initObj.hasOwnProperty('tactile_image')) {
        this.tactile_image = initObj.tactile_image
      }
      else {
        this.tactile_image = new Array(4).fill(new sensor_msgs.msg.Image());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Image_array
    // Check that the constant length array field [tactile_image] has the right length
    if (obj.tactile_image.length !== 4) {
      throw new Error('Unable to serialize array field tactile_image - length must be 4')
    }
    // Serialize message field [tactile_image]
    obj.tactile_image.forEach((val) => {
      bufferOffset = sensor_msgs.msg.Image.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Image_array
    let len;
    let data = new Image_array(null);
    // Deserialize message field [tactile_image]
    len = 4;
    data.tactile_image = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.tactile_image[i] = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.tactile_image.forEach((val) => {
      length += sensor_msgs.msg.Image.getMessageSize(val);
    });
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'handsnet_time/Image_array';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4119a40ad0cb1a1445d6afd1577b843a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    sensor_msgs/Image[4] tactile_image
    
    ================================================================================
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
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
    const resolved = new Image_array(null);
    if (msg.tactile_image !== undefined) {
      resolved.tactile_image = new Array(4)
      for (let i = 0; i < resolved.tactile_image.length; ++i) {
        if (msg.tactile_image.length > i) {
          resolved.tactile_image[i] = sensor_msgs.msg.Image.Resolve(msg.tactile_image[i]);
        }
        else {
          resolved.tactile_image[i] = new sensor_msgs.msg.Image();
        }
      }
    }
    else {
      resolved.tactile_image = new Array(4).fill(new sensor_msgs.msg.Image())
    }

    return resolved;
    }
};

module.exports = Image_array;
