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
CMAKE_SOURCE_DIR = "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/rs-recod/recorder"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/rs-recod/recorder/build"

# Include any dependencies generated for this target.
include CMakeFiles/rs-record.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/rs-record.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/rs-record.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/rs-record.dir/flags.make

CMakeFiles/rs-record.dir/rs-record.cpp.o: CMakeFiles/rs-record.dir/flags.make
CMakeFiles/rs-record.dir/rs-record.cpp.o: ../rs-record.cpp
CMakeFiles/rs-record.dir/rs-record.cpp.o: CMakeFiles/rs-record.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/rs-recod/recorder/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/rs-record.dir/rs-record.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/rs-record.dir/rs-record.cpp.o -MF CMakeFiles/rs-record.dir/rs-record.cpp.o.d -o CMakeFiles/rs-record.dir/rs-record.cpp.o -c "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/rs-recod/recorder/rs-record.cpp"

CMakeFiles/rs-record.dir/rs-record.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rs-record.dir/rs-record.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/rs-recod/recorder/rs-record.cpp" > CMakeFiles/rs-record.dir/rs-record.cpp.i

CMakeFiles/rs-record.dir/rs-record.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rs-record.dir/rs-record.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/rs-recod/recorder/rs-record.cpp" -o CMakeFiles/rs-record.dir/rs-record.cpp.s

# Object files for target rs-record
rs__record_OBJECTS = \
"CMakeFiles/rs-record.dir/rs-record.cpp.o"

# External object files for target rs-record
rs__record_EXTERNAL_OBJECTS =

rs-record: CMakeFiles/rs-record.dir/rs-record.cpp.o
rs-record: CMakeFiles/rs-record.dir/build.make
rs-record: /usr/local/lib/librealsense2.so.2.50.0
rs-record: CMakeFiles/rs-record.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/rs-recod/recorder/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable rs-record"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rs-record.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/rs-record.dir/build: rs-record
.PHONY : CMakeFiles/rs-record.dir/build

CMakeFiles/rs-record.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/rs-record.dir/cmake_clean.cmake
.PHONY : CMakeFiles/rs-record.dir/clean

CMakeFiles/rs-record.dir/depend:
	cd "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/rs-recod/recorder/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/rs-recod/recorder" "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/rs-recod/recorder" "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/rs-recod/recorder/build" "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/rs-recod/recorder/build" "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/rs-recod/recorder/build/CMakeFiles/rs-record.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/rs-record.dir/depend

