#!/usr/bin/env python3
import rospy
#import tensorflow as tf
from PIL import Image
from sensor_msgs.msg import Image as TactileImage
from handsnet_time.msg import Image_array
import numpy as np

#I can make a message of this type
#sensor_msgs/Image[] data

if __name__ == '__main__':

    pub = rospy.Publisher('tactile_image_array', Image_array, queue_size=10)
    rospy.init_node('tactile_image_publisher5')
    rate = rospy.Rate(1000) # 1hz

    contacts = Image_array()
    #print(contacts.tactile_image[1])
    while not rospy.is_shutdown():
        for i in range(0, 4):
            im_name='src/handsnet_time/data/'+str(i+1)+'.png'
            #PIL image
            im = Image.open(im_name)
            im = im.convert('RGB')
            im = im.resize((68,100), Image.ANTIALIAS) 
            #sensor_msgs.msg.Image
            contacts.tactile_image[i] = TactileImage()
            contacts.tactile_image[i].header.stamp = rospy.Time.now()
            contacts.tactile_image[i].height = im.height
            contacts.tactile_image[i].width = im.width
            contacts.tactile_image[i].encoding = "rgb8"
            contacts.tactile_image[i].is_bigendian = False
            contacts.tactile_image[i].step = 3 * im.width # Full row length in bytes
            contacts.tactile_image[i].data = np.array(im).tobytes()            

        pub.publish(contacts)
        rate.sleep()
    #also, I need something of the kind    PIL.Image.Image
    #tested it, and it wants a PIL image, don't forget to place the GPU stuff
    #model = tf.keras.models.load_model('src/handsnet/data/HandsNet_2_97.h5')
    #input_arr= tf.keras.preprocessing.image.img_to_array(im)
    #input_arr = np.array([input_arr])  
    #predictions = model.predict(input_arr)
    #print(predictions)



