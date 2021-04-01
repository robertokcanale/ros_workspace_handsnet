#!/usr/bin/env python3
import rospy
import numpy as np
import tensorflow as tf
from tensorflow import keras
from std_msgs.msg import Int16
from sensor_msgs.msg import Image as TactileImage
from PIL import Image
import ros_numpy
import time
tactile_image = tactile_image = np.zeros((1, 100, 68, 3))

#IMPORTING THE MODEL
def import_model():
    model = tf.keras.models.load_model('src/handsnet/data/HandsNet_2_97.h5')
    model.trainable = False #Freezing the Model
    #model.summary()
    return model

#CALLBACK IMAGE CONVERSION
def callback(data):
    global tactile_image 
    time_i = time.time()
    cv_image= ros_numpy.numpify(data)
    input_arr= keras.preprocessing.image.img_to_array(cv_image) #Converts to numpy.ndarray
    tactile_image= np.array([input_arr])  #Adds the first dimension
    elapsed = time.time() - time_i
    print("Preprocessing time:", elapsed)

#RECOGNIZE HAND OR NON_HAND
def hand_recognition(model, image): 
    time_i = time.time()
    predictions = model.predict(image)
    elapsed = time.time() - time_i
    print("Prediction time:", elapsed)

    if predictions[0,0]>0.9:
        print("Hand")
        return 1 #recognizes hand in contact
    elif predictions[0,1]>0.9:
        print("Non_Hand")
        return 0 #recognizes non_hand in contact
    else: 
        print("Not Recognized")
        return 99 #the software is not sure about it   


#MAIN FUNCTION
if __name__ == '__main__':
    #GPU CHECKS
    gpus = tf.config.experimental.list_physical_devices('GPU')
    if gpus:
        try:
            tf.config.experimental.set_virtual_device_configuration(
            gpus[0],
            [tf.config.experimental.VirtualDeviceConfiguration(memory_limit=1024 * 4)])
            logical_gpus = tf.config.experimental.list_logical_devices('GPU')
            print(len(gpus), "Physical GPUs,", len(logical_gpus), "Logical GPUs")
        except RuntimeError as e:
        # Virtual devices must be set before GPUs have been initialized
            print(e)

    #NODE INITIALIZATION
    rospy.init_node('hand_recognition', anonymous=True)
    pub = rospy.Publisher('contact', Int16, queue_size=10)
    rospy.Subscriber('tactile_image1', TactileImage, callback) #this is a rosmsmg.msg Image
    rate = rospy.Rate(100) # 10hz

    #MODEL
    HandsNet = import_model()
    
    #LOOP
    while not rospy.is_shutdown():
        #checking that I receive the image/something is in contact
        if np.all((tactile_image == 0)):
            print("No Contact")
            contact_type = 9999
            pub.publish(contact_type)
        else:
            contact_type = hand_recognition(HandsNet, tactile_image)
            pub.publish(contact_type)
            tactile_image = np.zeros((1, 100, 68, 3)) #setting the vector to 0
        rate.sleep()


    

