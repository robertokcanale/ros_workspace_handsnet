#!/usr/bin/env python3
import rospy
#import tensorflow as tf
from PIL import Image
from sensor_msgs.msg import Image as TactileImage
import ros_numpy
import numpy as np

if __name__ == '__main__':

    pub = rospy.Publisher('tactile_image', TactileImage, queue_size=10)

    rospy.init_node('tactile_image_publisher')

    #PIL image
    im = Image.open('src/handsnet/data/hand.png')
    im = im.convert('RGB')
    im = im.resize((100,68), Image.ANTIALIAS) #MAYBE I NEED THIS WHEN SENDING THIS MESSAGE

    #tested it, and it wants a PIL image, don't forget to place the GPU stuff
    #model = tf.keras.models.load_model('src/handsnet/data/HandsNet_2_97.h5')
    #input_arr= tf.keras.preprocessing.image.img_to_array(im)
    #input_arr = np.array([input_arr])  
    #predictions = model.predict(input_arr)
    #print(predictions)



    tactile_image = TactileImage()
    tactile_image.header.stamp = rospy.Time.now()
    tactile_image.height = im.height
    tactile_image.width = im.width
    tactile_image.encoding = "rgb8"
    tactile_image.is_bigendian = False
    tactile_image.step = 3 * im.width # Full row length in bytes
    tactile_image.data = np.array(im).tobytes()

    my_array= ros_numpy.numpify(tactile_image)#works
    print(my_array)
    
    #publishing_my_image
    while not rospy.is_shutdown():
        pub.publish(tactile_image)

#also, I need something of the kind    PIL.Image.Image



