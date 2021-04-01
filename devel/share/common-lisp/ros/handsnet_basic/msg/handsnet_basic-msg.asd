
(cl:in-package :asdf)

(defsystem "handsnet_basic-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "Image_array" :depends-on ("_package_Image_array"))
    (:file "_package_Image_array" :depends-on ("_package"))
  ))