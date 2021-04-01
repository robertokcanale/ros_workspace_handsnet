# Install script for directory: /home/maclab/Documents/RCanale/ros_workspace/src/handsnet_time

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/maclab/Documents/RCanale/ros_workspace/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/handsnet_time/msg" TYPE FILE FILES "/home/maclab/Documents/RCanale/ros_workspace/src/handsnet_time/msg/Image_array.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/handsnet_time/cmake" TYPE FILE FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/handsnet_time-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/maclab/Documents/RCanale/ros_workspace/devel/include/handsnet_time")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/maclab/Documents/RCanale/ros_workspace/devel/share/roseus/ros/handsnet_time")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/maclab/Documents/RCanale/ros_workspace/devel/share/common-lisp/ros/handsnet_time")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/maclab/Documents/RCanale/ros_workspace/devel/share/gennodejs/ros/handsnet_time")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/maclab/Documents/RCanale/ros_workspace/devel/lib/python3/dist-packages/handsnet_time")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/maclab/Documents/RCanale/ros_workspace/devel/lib/python3/dist-packages/handsnet_time")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/handsnet_time.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/handsnet_time/cmake" TYPE FILE FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/handsnet_time-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/handsnet_time/cmake" TYPE FILE FILES
    "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/handsnet_timeConfig.cmake"
    "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/handsnet_timeConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/handsnet_time" TYPE FILE FILES "/home/maclab/Documents/RCanale/ros_workspace/src/handsnet_time/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/handsnet_time" TYPE PROGRAM FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/hand_recognition.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/handsnet_time" TYPE PROGRAM FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/hand_recognition_trt.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/handsnet_time" TYPE PROGRAM FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/hand_recognition_1.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/handsnet_time" TYPE PROGRAM FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/tactile_image_publisher_1.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/handsnet_time" TYPE PROGRAM FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/hand_recognition_2.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/handsnet_time" TYPE PROGRAM FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/tactile_image_publisher_2.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/handsnet_time" TYPE PROGRAM FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/hand_recognition_3.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/handsnet_time" TYPE PROGRAM FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/tactile_image_publisher_3.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/handsnet_time" TYPE PROGRAM FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/hand_recognition_4.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/handsnet_time" TYPE PROGRAM FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/tactile_image_publisher_4.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/handsnet_time" TYPE PROGRAM FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/hand_recognition_5.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/handsnet_time" TYPE PROGRAM FILES "/home/maclab/Documents/RCanale/ros_workspace/build/handsnet_time/catkin_generated/installspace/tactile_image_publisher_5.py")
endif()

