#!/usr/bin/env python
import rospy
#import tensorflow as tf
from PIL import Image
from sensor_msgs.msg import Image as TactileImage
import ros_numpy
import numpy as np

if __name__ == '__main__':

    pub = rospy.Publisher('tactile_image3', TactileImage, queue_size=10)
    rospy.init_node('tactile_image_publisher3')
    rate = rospy.Rate(1000) # 1hz

    #publishing_my_image, in this case a loop of images
    while not rospy.is_shutdown():
        for i in range(1, 25):
            im_name='src/handsnet_time/data/'+str(i)+'.png'
            #PIL image
            im = Image.open(im_name)
            im = im.convert('RGB')
            im = im.resize((68,100), Image.ANTIALIAS) #I have to write it like this so that when the message is sent i get 100,68,3
            #sensor_msgs.msg.Image
            tactile_image = TactileImage()
            tactile_image.header.stamp = rospy.Time.now()
            tactile_image.height = im.height
            tactile_image.width = im.width
            tactile_image.encoding = "rgb8"
            tactile_image.is_bigendian = False
            tactile_image.step = 3 * im.width # Full row length in bytes
            tactile_image.data = np.array(im).tobytes()
            pub.publish(tactile_image)
            rate.sleep()
    #also, I need something of the kind    PIL.Image.Image
    #tested it, and it wants a PIL image, don't forget to place the GPU stuff
    #model = tf.keras.models.load_model('src/handsnet/data/HandsNet_2_97.h5')
    #input_arr= tf.keras.preprocessing.image.img_to_array(im)
    #input_arr = np.array([input_arr])  
    #predictions = model.predict(input_arr)
    #print(predictions)



