;; Auto-generated. Do not edit!


(when (boundp 'handsnet_time::Image_array)
  (if (not (find-package "HANDSNET_TIME"))
    (make-package "HANDSNET_TIME"))
  (shadow 'Image_array (find-package "HANDSNET_TIME")))
(unless (find-package "HANDSNET_TIME::IMAGE_ARRAY")
  (make-package "HANDSNET_TIME::IMAGE_ARRAY"))

(in-package "ROS")
;;//! \htmlinclude Image_array.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass handsnet_time::Image_array
  :super ros::object
  :slots (_tactile_image ))

(defmethod handsnet_time::Image_array
  (:init
   (&key
    ((:tactile_image __tactile_image) (let (r) (dotimes (i 4) (push (instance sensor_msgs::Image :init) r)) r))
    )
   (send-super :init)
   (setq _tactile_image __tactile_image)
   self)
  (:tactile_image
   (&rest __tactile_image)
   (if (keywordp (car __tactile_image))
       (send* _tactile_image __tactile_image)
     (progn
       (if __tactile_image (setq _tactile_image (car __tactile_image)))
       _tactile_image)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image[4] _tactile_image
    (apply #'+ (send-all _tactile_image :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image[4] _tactile_image
     (dolist (elem _tactile_image)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image[4] _tactile_image
   (dotimes (i 4)
     (send (elt _tactile_image i) :deserialize buf ptr-) (incf ptr- (send (elt _tactile_image i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get handsnet_time::Image_array :md5sum-) "4119a40ad0cb1a1445d6afd1577b843a")
(setf (get handsnet_time::Image_array :datatype-) "handsnet_time/Image_array")
(setf (get handsnet_time::Image_array :definition-)
      "sensor_msgs/Image[4] tactile_image

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

")



(provide :handsnet_time/Image_array "4119a40ad0cb1a1445d6afd1577b843a")


