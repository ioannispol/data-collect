cmake_minimum_required(VERSION 2.8.11)
project(Calib_io_CAM)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS_DEBUG_INIT "-Wall")

find_package(OpenCV REQUIRED)
include_directories( $(OpenCV_INCLUDE_DIRS) )

add_executable(Calib_io_CAM camera_params.cpp)

target_link_libraries(Calib_io_CAM ${OpenCV_LIBS})
#target_link_directories(./libs/json/)