#
# CMake initial settings file to compile userland libraries
# Should contain only set() statements
#

set(VIDEOCORE_BUILD_DIR "${CMAKE_BINARY_DIR}/third_party/userland/build" CACHE STRING "")
set(VMCS_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/third_party/userland/install" CACHE STRING "")


if(inBuildExternalDependency)

  # add phony target to access include and library path
  add_library(userland INTERFACE IMPORTED)
  target_link_libraries(userland INTERFACE ${my_install_dir}/lib/libmmal_core.so ${my_install_dir}/lib/libmmal_util.so ${my_install_dir}/lib/libmmal.so)
  target_include_directories(userland INTERFACE ${my_source_dir} ${my_source_dir}/interface)

endif()
