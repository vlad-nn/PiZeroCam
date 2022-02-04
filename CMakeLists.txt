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
set(CMAKE_TOOLCHAIN_FILE tools/pizero-toolchain.cmake)

project(PiZeroCam C CXX)

# third-party
add_subdirectory(third_party)
                           
# Demo
add_subdirectory(demo)
