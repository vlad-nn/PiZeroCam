#
# Toolchain file for Raspberry Pi Zero (armv6)
#

set(CMAKE_SYSTEM_NAME Linux)		# for Linux OS
set(CMAKE_SYSTEM_PROCESSOR armv6)	# ARM v6 architecture

# C/C++ compiler (should be in path)
set(CMAKE_C_COMPILER arm-linux-gnueabi-gcc)
set(CMAKE_CXX_COMPILER arm-linux-gnueabi-g++)
set(CMAKE_ASM_COMPILER arm-linux-gnueabi-gcc)

# compile flags
set(ARMCC_FLAGS "-march=armv6 -mfpu=vfp -funsafe-math-optimizations -Wno-psabi")
set(CMAKE_C_FLAGS ${ARMCC_FLAGS})                
set(CMAKE_CXX_FLAGS ${ARMCC_FLAGS})

# root path for cross-compile headers/libs
set(CMAKE_FIND_ROOT_PATH /usr/arm-linux-gnueabihf)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)	# find_program(): never search in root path
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY) 	# find_library(): always search in root path
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)	# find_include(): always search in root path
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)	# find_package(): always search in root path
