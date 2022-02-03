#
# Custom cmake to build raspicam library. Substitutes original cmake
#

SET(srcs raspicam.cpp raspicam_still.cpp private/private_impl.cpp private/threadcondition.cpp private_still/private_still_impl.cpp)

add_library(raspicam STATIC ${srcs})
get_target_property(mmal_includes mmal SOURCE_DIR)

target_include_directories(raspicam PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(raspicam PRIVATE ${mmal_includes}/.. ${mmal_includes}/../..)
target_link_libraries(raspicam PUBLIC mmal_core mmal_util mmal)
