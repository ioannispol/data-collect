# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/build

# Include any dependencies generated for this target.
include CMakeFiles/rs_bag2image.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/rs_bag2image.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/rs_bag2image.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/rs_bag2image.dir/flags.make

CMakeFiles/rs_bag2image.dir/realsense.cpp.o: CMakeFiles/rs_bag2image.dir/flags.make
CMakeFiles/rs_bag2image.dir/realsense.cpp.o: ../realsense.cpp
CMakeFiles/rs_bag2image.dir/realsense.cpp.o: CMakeFiles/rs_bag2image.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/rs_bag2image.dir/realsense.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/rs_bag2image.dir/realsense.cpp.o -MF CMakeFiles/rs_bag2image.dir/realsense.cpp.o.d -o CMakeFiles/rs_bag2image.dir/realsense.cpp.o -c /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/realsense.cpp

CMakeFiles/rs_bag2image.dir/realsense.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rs_bag2image.dir/realsense.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/realsense.cpp > CMakeFiles/rs_bag2image.dir/realsense.cpp.i

CMakeFiles/rs_bag2image.dir/realsense.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rs_bag2image.dir/realsense.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/realsense.cpp -o CMakeFiles/rs_bag2image.dir/realsense.cpp.s

CMakeFiles/rs_bag2image.dir/main.cpp.o: CMakeFiles/rs_bag2image.dir/flags.make
CMakeFiles/rs_bag2image.dir/main.cpp.o: ../main.cpp
CMakeFiles/rs_bag2image.dir/main.cpp.o: CMakeFiles/rs_bag2image.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/rs_bag2image.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/rs_bag2image.dir/main.cpp.o -MF CMakeFiles/rs_bag2image.dir/main.cpp.o.d -o CMakeFiles/rs_bag2image.dir/main.cpp.o -c /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/main.cpp

CMakeFiles/rs_bag2image.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rs_bag2image.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/main.cpp > CMakeFiles/rs_bag2image.dir/main.cpp.i

CMakeFiles/rs_bag2image.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rs_bag2image.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/main.cpp -o CMakeFiles/rs_bag2image.dir/main.cpp.s

# Object files for target rs_bag2image
rs_bag2image_OBJECTS = \
"CMakeFiles/rs_bag2image.dir/realsense.cpp.o" \
"CMakeFiles/rs_bag2image.dir/main.cpp.o"

# External object files for target rs_bag2image
rs_bag2image_EXTERNAL_OBJECTS =

rs_bag2image: CMakeFiles/rs_bag2image.dir/realsense.cpp.o
rs_bag2image: CMakeFiles/rs_bag2image.dir/main.cpp.o
rs_bag2image: CMakeFiles/rs_bag2image.dir/build.make
rs_bag2image: /usr/local/lib/librealsense2.so.2.50.0
rs_bag2image: /usr/local/lib/libopencv_gapi.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_highgui.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_ml.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_objdetect.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_photo.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_stitching.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_video.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_videoio.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_imgcodecs.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_dnn.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_calib3d.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_features2d.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_flann.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_imgproc.so.4.6.0
rs_bag2image: /usr/local/lib/libopencv_core.so.4.6.0
rs_bag2image: CMakeFiles/rs_bag2image.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable rs_bag2image"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rs_bag2image.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/rs_bag2image.dir/build: rs_bag2image
.PHONY : CMakeFiles/rs_bag2image.dir/build

CMakeFiles/rs_bag2image.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/rs_bag2image.dir/cmake_clean.cmake
.PHONY : CMakeFiles/rs_bag2image.dir/clean

CMakeFiles/rs_bag2image.dir/depend:
	cd /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/build /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/build /home/ioannis/Dev/d435/data-collect/rs_bag2image/rs_bag2image/build/CMakeFiles/rs_bag2image.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/rs_bag2image.dir/depend
