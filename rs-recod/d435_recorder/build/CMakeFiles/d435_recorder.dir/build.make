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
CMAKE_SOURCE_DIR = /home/ioannis/Dev/cpp/D435/d435_recorder

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ioannis/Dev/cpp/D435/d435_recorder/build

# Include any dependencies generated for this target.
include CMakeFiles/d435_recorder.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/d435_recorder.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/d435_recorder.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/d435_recorder.dir/flags.make

CMakeFiles/d435_recorder.dir/d435_recorder.cpp.o: CMakeFiles/d435_recorder.dir/flags.make
CMakeFiles/d435_recorder.dir/d435_recorder.cpp.o: ../d435_recorder.cpp
CMakeFiles/d435_recorder.dir/d435_recorder.cpp.o: CMakeFiles/d435_recorder.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ioannis/Dev/cpp/D435/d435_recorder/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/d435_recorder.dir/d435_recorder.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/d435_recorder.dir/d435_recorder.cpp.o -MF CMakeFiles/d435_recorder.dir/d435_recorder.cpp.o.d -o CMakeFiles/d435_recorder.dir/d435_recorder.cpp.o -c /home/ioannis/Dev/cpp/D435/d435_recorder/d435_recorder.cpp

CMakeFiles/d435_recorder.dir/d435_recorder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/d435_recorder.dir/d435_recorder.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ioannis/Dev/cpp/D435/d435_recorder/d435_recorder.cpp > CMakeFiles/d435_recorder.dir/d435_recorder.cpp.i

CMakeFiles/d435_recorder.dir/d435_recorder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/d435_recorder.dir/d435_recorder.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ioannis/Dev/cpp/D435/d435_recorder/d435_recorder.cpp -o CMakeFiles/d435_recorder.dir/d435_recorder.cpp.s

# Object files for target d435_recorder
d435_recorder_OBJECTS = \
"CMakeFiles/d435_recorder.dir/d435_recorder.cpp.o"

# External object files for target d435_recorder
d435_recorder_EXTERNAL_OBJECTS =

d435_recorder: CMakeFiles/d435_recorder.dir/d435_recorder.cpp.o
d435_recorder: CMakeFiles/d435_recorder.dir/build.make
d435_recorder: /usr/local/lib/librealsense2.so.2.50.0
d435_recorder: CMakeFiles/d435_recorder.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ioannis/Dev/cpp/D435/d435_recorder/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable d435_recorder"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/d435_recorder.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/d435_recorder.dir/build: d435_recorder
.PHONY : CMakeFiles/d435_recorder.dir/build

CMakeFiles/d435_recorder.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/d435_recorder.dir/cmake_clean.cmake
.PHONY : CMakeFiles/d435_recorder.dir/clean

CMakeFiles/d435_recorder.dir/depend:
	cd /home/ioannis/Dev/cpp/D435/d435_recorder/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ioannis/Dev/cpp/D435/d435_recorder /home/ioannis/Dev/cpp/D435/d435_recorder /home/ioannis/Dev/cpp/D435/d435_recorder/build /home/ioannis/Dev/cpp/D435/d435_recorder/build /home/ioannis/Dev/cpp/D435/d435_recorder/build/CMakeFiles/d435_recorder.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/d435_recorder.dir/depend

