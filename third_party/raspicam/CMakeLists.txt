#
# Custom cmake to build raspicam library. Substitutes original cmake
#

SET(srcs raspicam.cpp raspicam_still.cpp private/private_impl.cpp private/threadcondition.cpp private_still/private_still_impl.cpp)

add_library(raspicam STATIC ${srcs})
target_include_directories(raspicam PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(raspicam PUBLIC userland)
