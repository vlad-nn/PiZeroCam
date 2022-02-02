#
# Root CMake file to cross compile TFLite, ARM libraries for Raspberry Pi,
# RaspiCam and demo application
#
# Runs on Ubuntu x64 host
# Compiles for ARMv6 (Raspberry Pi Zero)
#
# Requires packages installed by ./tools/mysetup.sh script
#
# Build standard way:
#   mkdir build
#   cd build
#   cmake ..
#   make
#

cmake_minimum_required(VERSION 3.16)
set(CMAKE_TOOLCHAIN_FILE tools/pizero-toolchain.cmake)

project(PiZeroCam C CXX)
               
# TFLite
set(TFLITE_ENABLE_XNNPACK OFF)
set(ABSL_PROPAGATE_CXX_STD ON)
add_subdirectory(third_party/tensorflow/tensorflow/lite)

# ARM libraries for Raspberry Pi (mmal, vcos, raspicam. etc)
set (VIDEOCORE_BUILD_DIR "${CMAKE_BINARY_DIR}/userland_build" CACHE STRING "")
add_subdirectory(third_party/userland/)
                           
# Demo
# add_subdirectory(demo)
