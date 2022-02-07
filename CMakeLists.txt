#
# Root CMake file to cross compile applications for Pi camera capture and AI processing
# with all third party library dependencies
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

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/tools/pizero-toolchain.cmake)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR} ${CMAKE_SOURCE_DIR}/tools)
include(buildExternalDependency)


project(PiZeroCam C CXX)

# OpenCV
buildExternalDependency(third_party/opencv third_party/opencv.cmake "${CMAKE_BUILD_TYPE}")

# TFLite
buildExternalDependency(third_party/tensorflow/tensorflow/lite third_party/tflite.cmake "${CMAKE_BUILD_TYPE}")

# Userland
buildExternalDependency(third_party/userland third_party/userland.cmake "${CMAKE_BUILD_TYPE}")

# Raspicam
add_subdirectory(third_party/raspicam)
                         
# Demo
add_subdirectory(demo)
