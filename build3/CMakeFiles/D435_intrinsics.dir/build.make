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
CMAKE_SOURCE_DIR = "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/build3"

# Include any dependencies generated for this target.
include CMakeFiles/D435_intrinsics.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/D435_intrinsics.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/D435_intrinsics.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/D435_intrinsics.dir/flags.make

CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.o: CMakeFiles/D435_intrinsics.dir/flags.make
CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.o: ../d435-intrisics.cpp
CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.o: CMakeFiles/D435_intrinsics.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/build3/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.o -MF CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.o.d -o CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.o -c "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/d435-intrisics.cpp"

CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/d435-intrisics.cpp" > CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.i

CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/d435-intrisics.cpp" -o CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.s

CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.o: CMakeFiles/D435_intrinsics.dir/flags.make
CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.o: ../intrinsics.cpp
CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.o: CMakeFiles/D435_intrinsics.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/build3/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.o -MF CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.o.d -o CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.o -c "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/intrinsics.cpp"

CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/intrinsics.cpp" > CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.i

CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/intrinsics.cpp" -o CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.s

# Object files for target D435_intrinsics
D435_intrinsics_OBJECTS = \
"CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.o" \
"CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.o"

# External object files for target D435_intrinsics
D435_intrinsics_EXTERNAL_OBJECTS =

D435_intrinsics: CMakeFiles/D435_intrinsics.dir/d435-intrisics.cpp.o
D435_intrinsics: CMakeFiles/D435_intrinsics.dir/intrinsics.cpp.o
D435_intrinsics: CMakeFiles/D435_intrinsics.dir/build.make
D435_intrinsics: /usr/local/lib/librealsense2.so.2.50.0
D435_intrinsics: CMakeFiles/D435_intrinsics.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/build3/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable D435_intrinsics"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/D435_intrinsics.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/D435_intrinsics.dir/build: D435_intrinsics
.PHONY : CMakeFiles/D435_intrinsics.dir/build

CMakeFiles/D435_intrinsics.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/D435_intrinsics.dir/cmake_clean.cmake
.PHONY : CMakeFiles/D435_intrinsics.dir/clean

CMakeFiles/D435_intrinsics.dir/depend:
	cd "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/build3" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect" "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect" "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/build3" "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/build3" "/home/ioannis/Documents/01-Projects/PhD/Year 3/D435/datacollect/data-collect/build3/CMakeFiles/D435_intrinsics.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/D435_intrinsics.dir/depend
