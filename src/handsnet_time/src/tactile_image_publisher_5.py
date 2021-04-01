#!/usr/bin/env python
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
        for j in range (0, 6):
            for i in range (0, 4):
                im_name='src/handsnet_time/data/'+str(j+i)+'.png'
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




