#
# CMake file to cross compile third-party librearies: TFLite, ARM libraries for Raspberry Pi,
# RaspiCam, OpenCV
#
# Runs on Ubuntu x64 host
# Compiles for ARMv6 (Raspberry Pi Zero)
#

#
# TFLite
#
set(TFLITE_ENABLE_XNNPACK OFF)
set(ABSL_PROPAGATE_CXX_STD ON)
add_subdirectory(tensorflow/tensorflow/lite)


#
# ARM libraries for Raspberry Pi (mmal, vcos, etc)
#
set (VIDEOCORE_BUILD_DIR "${CMAKE_BINARY_DIR}/userland_build" CACHE STRING "")
add_subdirectory(userland)


#
# raspicam: C++ wrapper for Pi camera
#
add_subdirectory(raspicam)
 

#                          
# OpenCV with minimum feature set
#
set(OPENCV_FORCE_3RDPARTY_BUILD ON CACHE BOOL "")
set(WITH_VTK OFF CACHE BOOL "")
set(WITH_DSHOW OFF CACHE BOOL "")
set(BUILD_opencv_stitching OFF CACHE BOOL "")
set(BUILD_opencv_dnn OFF CACHE BOOL "")
set(BUILD_JAVA OFF CACHE BOOL "")
set(BUILD_OPENJPEG OFF CACHE BOOL "")
set(WITH_WEBP OFF CACHE BOOL "")
set(BUILD_opencv_photo OFF CACHE BOOL "")
set(BUILD_opencv_flann OFF CACHE BOOL "")
set(BUILD_opencv_ts OFF CACHE BOOL "")
set(BUILD_opencv_objc_bindings_generator OFF CACHE BOOL "")
set(BUILD_opencv_video OFF CACHE BOOL "")
set(OPENCL_FOUND OFF CACHE BOOL "")
set(WITH_ADE OFF CACHE BOOL "")
set(BUILD_opencv_highgui ON CACHE BOOL "")
set(WITH_ARITH_ENC OFF CACHE BOOL "")
set(WITH_FFMPEG OFF CACHE BOOL "")
set(WITH_MSMF OFF CACHE BOOL "")
set(WITH_V4L OFF CACHE BOOL "")
set(WITH_QUIRC OFF CACHE BOOL "")
set(WITH_EIGEN OFF CACHE BOOL "")
set(BUILD_PROTOBUF OFF CACHE BOOL "")
set(thunder OFF CACHE BOOL "")
set(BUILD_opencv_calib3d OFF CACHE BOOL "")
set(WITH_OPENCL OFF CACHE BOOL "")
set(BUILD_SHARED_LIBS OFF CACHE BOOL "")
set(BUILD_PNG OFF CACHE BOOL "")
set(WITH_DIRECTX OFF CACHE BOOL "")
set(BUILD_opencv_python_bindings_generator OFF CACHE BOOL "")
set(WITH_IMGCODEC_PFM OFF CACHE BOOL "")
set(BUILD_opencv_objdetect OFF CACHE BOOL "")
set(BUILD_IPP_IW OFF CACHE BOOL "")
set(BUILD_opencv_java_bindings_generator OFF CACHE BOOL "")
set(ENABLE_PIC OFF CACHE BOOL "")
set(BUILD_opencv_apps OFF CACHE BOOL "")
set(BUILD_opencv_ml OFF CACHE BOOL "")
set(WITH_1394 OFF CACHE BOOL "")
set(BUILD_WEBP OFF CACHE BOOL "")
set(BUILD_OPENEXR OFF CACHE BOOL "")
set(mdi OFF CACHE BOOL "")
set(lzw OFF CACHE BOOL "")
set(BUILD_PERF_TESTS OFF CACHE BOOL "")
set(BUILD_JASPER OFF CACHE BOOL "")
set(WITH_PNG OFF CACHE BOOL "")
set(WITH_IMGCODEC_HDR OFF CACHE BOOL "")
set(next OFF CACHE BOOL "")
set(WITH_PROTOBUF OFF CACHE BOOL "")
set(BUILD_PACKAGE OFF CACHE BOOL "")
set(BUILD_ITT OFF CACHE BOOL "")
set(WITH_JASPER OFF CACHE BOOL "")
set(BUILD_opencv_world OFF CACHE BOOL "")
set(WITH_OPENEXR OFF CACHE BOOL "")
set(BUILD_opencv_js_bindings_generator OFF CACHE BOOL "")
set(WITH_MSMF_DXVA OFF CACHE BOOL "")
set(BUILD_opencv_gapi OFF CACHE BOOL "")
set(INSTALL_PDB OFF CACHE BOOL "")
set(WITH_IMGCODEC_SUNRASTER OFF CACHE BOOL "")
set(packbits OFF CACHE BOOL "")
set(WITH_OPENCLAMDFFT OFF CACHE BOOL "")
set(WITH_ITT OFF CACHE BOOL "")
set(WITH_ARITH_DEC OFF CACHE BOOL "")
set(WITH_IMGCODEC_PXM OFF CACHE BOOL "")
set(BUILD_ZLIB OFF CACHE BOOL "")
set(WITH_IPP OFF CACHE BOOL "")
set(WITH_OPENCLAMDBLAS OFF CACHE BOOL "")
set(BUILD_TESTS OFF CACHE BOOL "")
set(BUILD_opencv_python2 OFF CACHE BOOL "")
set(BUILD_opencv_python3 OFF CACHE BOOL "")
set(BUILD_opencv_python_tests OFF CACHE BOOL "")
set(WITH_WIN32UI OFF CACHE BOOL "")
set(WITH_GTK OFF CACHE BOOL "")
set(BUILD_opencv_features2d OFF CACHE BOOL "")
set(WITH_LAPACK OFF CACHE BOOL "")
set(WITH_GSTREAMER OFF CACHE BOOL "")
set(WITH_JPEG ON CACHE BOOL "")
set(WITH_TIFF OFF CACHE BOOL "")
set(logluv OFF CACHE BOOL "")
set(OPENCV_DNN_OPENCL OFF CACHE BOOL "")
set(WITH_OPENCL_D3D11_NV OFF CACHE BOOL "")
set(BUILD_JPEG OFF CACHE BOOL "")
set(BUILD_JPEG_TURBO_DISABLE OFF CACHE BOOL "")
set(WITH_OPENJPEG OFF CACHE BOOL "")
set(BUILD_WITH_STATIC_CRT OFF CACHE BOOL "")
set(BUILD_TIFF OFF CACHE BOOL "")
set(ccitt OFF CACHE BOOL "")

add_subdirectory(opencv)
