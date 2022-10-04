cmake_minimum_required(VERSION 3.1.0)
set(CMAKE_CXX_STANDARD 11)

project(D435Recoder)

find_package(realsense2 REQUIRED)
add_executable(d435_recorder d435_recorder.cpp)

target_link_libraries(d435_recorder ${realsense2_LIBRARY} realsense2::realsense2)
include_directories(../tclap/include ${realsense2_INCLUDE_DIR})