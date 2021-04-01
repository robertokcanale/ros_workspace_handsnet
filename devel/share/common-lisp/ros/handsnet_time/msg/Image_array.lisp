; Auto-generated. Do not edit!


(cl:in-package handsnet_time-msg)


;//! \htmlinclude Image_array.msg.html

(cl:defclass <Image_array> (roslisp-msg-protocol:ros-message)
  ((tactile_image
    :reader tactile_image
    :initarg :tactile_image
    :type (cl:vector sensor_msgs-msg:Image)
   :initform (cl:make-array 4 :element-type 'sensor_msgs-msg:Image :initial-element (cl:make-instance 'sensor_msgs-msg:Image))))
)

(cl:defclass Image_array (<Image_array>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Image_array>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Image_array)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name handsnet_time-msg:<Image_array> is deprecated: use handsnet_time-msg:Image_array instead.")))

(cl:ensure-generic-function 'tactile_image-val :lambda-list '(m))
(cl:defmethod tactile_image-val ((m <Image_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader handsnet_time-msg:tactile_image-val is deprecated.  Use handsnet_time-msg:tactile_image instead.")
  (tactile_image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Image_array>) ostream)
  "Serializes a message object of type '<Image_array>"
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'tactile_image))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Image_array>) istream)
  "Deserializes a message object of type '<Image_array>"
  (cl:setf (cl:slot-value msg 'tactile_image) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'tactile_image)))
    (cl:dotimes (i 4)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sensor_msgs-msg:Image))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Image_array>)))
  "Returns string type for a message object of type '<Image_array>"
  "handsnet_time/Image_array")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Image_array)))
  "Returns string type for a message object of type 'Image_array"
  "handsnet_time/Image_array")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Image_array>)))
  "Returns md5sum for a message object of type '<Image_array>"
  "4119a40ad0cb1a1445d6afd1577b843a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Image_array)))
  "Returns md5sum for a message object of type 'Image_array"
  "4119a40ad0cb1a1445d6afd1577b843a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Image_array>)))
  "Returns full string definition for message of type '<Image_array>"
  (cl:format cl:nil "sensor_msgs/Image[4] tactile_image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Image_array)))
  "Returns full string definition for message of type 'Image_array"
  (cl:format cl:nil "sensor_msgs/Image[4] tactile_image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Image_array>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'tactile_image) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Image_array>))
  "Converts a ROS message object to a list"
  (cl:list 'Image_array
    (cl:cons ':tactile_image (tactile_image msg))
))
