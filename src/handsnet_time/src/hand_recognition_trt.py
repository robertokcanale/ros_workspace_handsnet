#!/usr/bin/env python
from tensorflow.python.keras.backend import zeros
import rospy
import numpy as np
import tensorflow as tf
from tensorflow import keras
from std_msgs.msg import Int16
from sensor_msgs.msg import Image as TactileImage
from std_msgs.msg import Int16MultiArray
from PIL import Image
import ros_numpy
import time
from tensorflow.python.compiler.tensorrt import trt_convert as trt
from handsnet_time.msg import Image_array

#INITIALIZATION
model = 0
HandsNet_predict = 0
contact_type = Int16MultiArray()
contact_type.data = [0,0,0,0]
time_i = 0
elapsed1 = 0
time_tot = 0
elapsed_tot = 0

#IMPORTING THE MODEL
def import_model():
    global model, HandsNet_predict
    #MODEL IMPORT
    saved_model_dir_trt = 'src/handsnet_time/data/HandsNet_3_96_trt'

    model = tf.saved_model.load(saved_model_dir_trt)
    signature_keys = list(model.signatures.keys())
    HandsNet_predict = model.signatures['serving_default']


#CALLBACK IMAGE CONVERSION1
def callback(data):
    #global vars
    global tactile_image, time_i, elapsed1, time_tot, elapsed_tot, contact_type, model

    #Loop where all the Images are received as array, converted, inference is made, and then the output vector is stored
    time_tot = time.time()
    for i in range(4):
        time_i = time.time()
        #PREPROCESSING
        img = ros_numpy.numpify(data.tactile_image[i])
        img_array = tf.keras.preprocessing.image.img_to_array(img) #Converts to numpy.ndarray
        img_array = np.expand_dims(img_array, axis=0) #not sure i need this
        image_input = tf.constant(img_array.astype('float32'))#tf.constant Creates a constant tensor from a tensor-like object

        #MODELPREDICTION
        prediction =  HandsNet_predict(input_1=image_input)

        #Time for a single prediction
        elapsed1 = time.time() - time_i
        print("Prediction time:", elapsed1)

        #Assigning values to the output Array, based on the prediction
        if prediction['dense_2'].numpy()[0][0]>0.9:
            print("Hand")
            contact_type.data[i] = 1 #recognizes hand in contact
        elif prediction['dense_2'].numpy()[0][1]>0.9:
            print("Non_Hand")
            contact_type.data[i] = 0 #recognizes non_hand in contact
        else: 
            print("Not Recognized")
            contact_type.data[i] = 99 #the software is not sure about it 
    

    #total prediction time
    elapsed_tot = time.time() - time_tot
    print("TOTAL prediction time:", elapsed_tot)

 
#MAIN FUNCTION
if __name__ == '__main__':
    #GPU CHECKS
    gpus = tf.config.experimental.list_physical_devices('GPU')
    if gpus:
        try:
            tf.config.experimental.set_virtual_device_configuration(
            gpus[0],
            [tf.config.experimental.VirtualDeviceConfiguration(memory_limit=1024 * 4.5)])
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
    pub = rospy.Publisher('contact', Int16MultiArray, queue_size=10)
    #one subscriber per handle
    rospy.Subscriber('tactile_image_array', Image_array, callback) #this is a rosmsmg.msg Image
    rate = rospy.Rate(100) # 10hz

    #LOOP
    while not rospy.is_shutdown():
        pub.publish(contact_type)
        rate.sleep()

      


    

