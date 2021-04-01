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
model = 0
tactile_image1 =  np.zeros((1, 100, 68, 3))
tactile_image2 =  np.zeros((1, 100, 68, 3))
tactile_image3 =  np.zeros((1, 100, 68, 3))
tactile_image4 =  np.zeros((1, 100, 68, 3))
time_i1 = 0
elapsed1 = 0
time_i2 = 0
elapsed2 = 0
time_i3 = 0
elapsed3 = 0
time_i4 = 0
elapsed4 = 0

#IMPORTING THE MODEL
def import_model():
    global model
    model = tf.keras.models.load_model('src/handsnet_time/data/HandsNet_2_97.h5')
    model.trainable = False #Freezing the Model
    #model.summary()

#CALLBACK IMAGE CONVERSION1
def callback1(data):
    global tactile_image1, time_i1, elapsed1, model
    time_i1 = time.time()
    cv_image= ros_numpy.numpify(data)
    input_arr= keras.preprocessing.image.img_to_array(cv_image) #Converts to numpy.ndarray
    tactile_image1= np.array([input_arr])  #Adds the first dimension
 
    #modelpredic
    predictions = model.predict(tactile_image1)
    elapsed1 = time.time() - time_i1
    print("Prediction1 time:", elapsed1)

    if predictions[0,0]>0.9:
        print("Hand1")
        contact_type = 1 #recognizes hand in contact
        pub1.publish(contact_type)
    elif predictions[0,1]>0.9:
        print("Non_Hand1")
        contact_type = 0 #recognizes non_hand in contact
        pub1.publish(contact_type)
    else: 
        print("Not Recognized1")
        contact_type = 99 #the software is not sure about it 
        pub1.publish(contact_type)

#CALLBACK IMAGE CONVERSION2
def callback2(data):
    global tactile_image2, time_i2, elapsed2, model
    time_i2 = time.time()
    cv_image= ros_numpy.numpify(data)
    input_arr= keras.preprocessing.image.img_to_array(cv_image) #Converts to numpy.ndarray
    tactile_image2= np.array([input_arr])  #Adds the first dimension
 
    #modelpredic
    predictions = model.predict(tactile_image2)
    elapsed2 = time.time() - time_i2
    print("Prediction2 time:", elapsed2)

    if predictions[0,0]>0.9:
        print("Hand2")
        contact_type = 1 #recognizes hand in contact
        pub2.publish(contact_type)
    elif predictions[0,1]>0.9:
        print("Non_Hand2")
        contact_type = 0 #recognizes non_hand in contact
        pub2.publish(contact_type)
    else: 
        print("Not Recognized2")
        contact_type = 99 #the software is not sure about it 
        pub2.publish(contact_type) 
#CALLBACK IMAGE CONVERSION
def callback3(data):
    global tactile_image3, time_i3, elapsed3, model
    time_i3 = time.time()
    cv_image= ros_numpy.numpify(data)
    input_arr= keras.preprocessing.image.img_to_array(cv_image) #Converts to numpy.ndarray
    tactile_image3= np.array([input_arr])  #Adds the first dimension
 
    #modelpredic
    predictions = model.predict(tactile_image3)
    elapsed3 = time.time() - time_i3
    print("Prediction3 time:", elapsed3)

    if predictions[0,0]>0.9:
        print("Hand3")
        contact_type = 1 #recognizes hand in contact
        pub3.publish(contact_type)
    elif predictions[0,1]>0.9:
        print("Non_Hand3")
        contact_type = 0 #recognizes non_hand in contact
        pub3.publish(contact_type)
    else: 
        print("Not Recognized3")
        contact_type = 99 #the software is not sure about it 
        pub3.publish(contact_type) 
#CALLBACK IMAGE CONVERSION
def callback4(data):
    global tactile_image, time_i4, elapsed4, model
    time_i4 = time.time()
    cv_image= ros_numpy.numpify(data)
    input_arr= keras.preprocessing.image.img_to_array(cv_image) #Converts to numpy.ndarray
    tactile_image4= np.array([input_arr])  #Adds the first dimension
 
    #modelpredic
    predictions = model.predict(tactile_image4)
    elapsed4 = time.time() - time_i4
    print("Prediction4 time:", elapsed4)

    if predictions[0,0]>0.9:
        print("Hand4")
        contact_type = 1 #recognizes hand in contact
        pub4.publish(contact_type)
    elif predictions[0,1]>0.9:
        print("Non_Hand4")
        contact_type = 0 #recognizes non_hand in contact
        pub4.publish(contact_type)
    else: 
        print("Not Recognized4")
        contact_type = 99 #the software is not sure about it 
        pub4.publish(contact_type)   


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
    #MODEL
    import_model()
    #one publisher per handle
    pub1 = rospy.Publisher('contact1', Int16, queue_size=10)
    pub2 = rospy.Publisher('contact2', Int16, queue_size=10)
    pub3 = rospy.Publisher('contact3', Int16, queue_size=10)
    pub4 = rospy.Publisher('contact4', Int16, queue_size=10)
    #one subscriber per handle
    rospy.Subscriber('tactile_image1', TactileImage, callback1) #this is a rosmsmg.msg Image
    rospy.Subscriber('tactile_image2', TactileImage, callback2) #this is a rosmsmg.msg Image
    rospy.Subscriber('tactile_image3', TactileImage, callback3) #this is a rosmsmg.msg Image
    rospy.Subscriber('tactile_image4', TactileImage, callback4) #this is a rosmsmg.msg Image

    rate = rospy.Rate(100) # 10hz


    
    #LOOP
    while not rospy.is_shutdown():
        #checking that I receive the image/something is in contact
        rate.sleep()


    

