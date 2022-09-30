cmake_minimum_required(VERSION 3.1)

project(D435_intrinsics)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS_DEBUG_INIT "-Wall")

find_package(realsense2 REQUIRED)

include_directories(${realsense2_INCLUDE_DIR})

add_executable(D435_intrinsics d435-intrisics.cpp intrinsics.cpp)

target_link_libraries(D435_intrinsics ${realsense2_LIBRARY} realsense2::realsense2) 