#
# CMake initial settings file to compile TFLite library
# Should contain only set() statements
#

set(TFLITE_ENABLE_XNNPACK OFF CACHE BOOL "")
set(ABSL_PROPAGATE_CXX_STD ON CACHE BOOL "")

if(inBuildExternalDependency)

  # add phony target to access include and library path
  add_library(tflite INTERFACE IMPORTED)
  target_link_libraries(tflite INTERFACE ${my_build_dir}/libtensorflow-lite.a)
  target_include_directories(tflite INTERFACE ${my_source_dir}/../..)

endif()
