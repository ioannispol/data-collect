# License: Apache 2.0. See LICENSE file in root directory.
# Copyright(c) 2019 Intel Corporation. All Rights Reserved.
#  minimum required cmake version: 3.1.0
cmake_minimum_required(VERSION 3.1.0)
set(CMAKE_CXX_STANDARD 11)

project(RealsenseToolsRecorder)

find_package(realsense2 REQUIRED)
add_executable(rs-record rs-record.cpp)
#set_property(TARGET rs-record PROPERTY CXX_STANDARD 11)
target_link_libraries(rs-record ${realsense2_LIBRARY} realsense2::realsense2)
include_directories(../tclap/include ${realsense2_INCLUDE_DIR})
# set_target_properties (rs-record PROPERTIES
#     FOLDER "Tools"
# )

# install(
#     TARGETS

#     rs-record

#     RUNTIME DESTINATION
#     ${CMAKE_INSTALL_BINDIR}
# )

