# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Users/shivi/Desktop/IEGenLib

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/shivi/Desktop/IEGenLib/build

# Include any dependencies generated for this target.
include src/CMakeFiles/../bin/Computation_driver.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/../bin/Computation_driver.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/../bin/Computation_driver.dir/flags.make

src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o: src/CMakeFiles/../bin/Computation_driver.dir/flags.make
src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o: ../src/drivers/Computation_driver.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/shivi/Desktop/IEGenLib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o"
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o -c /mnt/c/Users/shivi/Desktop/IEGenLib/src/drivers/Computation_driver.cc

src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.i"
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/shivi/Desktop/IEGenLib/src/drivers/Computation_driver.cc > CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.i

src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.s"
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/shivi/Desktop/IEGenLib/src/drivers/Computation_driver.cc -o CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.s

src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o.requires:

.PHONY : src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o.requires

src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o.provides: src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o.requires
	$(MAKE) -f src/CMakeFiles/../bin/Computation_driver.dir/build.make src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o.provides.build
.PHONY : src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o.provides

src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o.provides.build: src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o


# Object files for target ../bin/Computation_driver
__/bin/Computation_driver_OBJECTS = \
"CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o"

# External object files for target ../bin/Computation_driver
__/bin/Computation_driver_EXTERNAL_OBJECTS =

bin/../bin/Computation_driver: src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o
bin/../bin/Computation_driver: src/CMakeFiles/../bin/Computation_driver.dir/build.make
bin/../bin/Computation_driver: src/libiegenlib.a
bin/../bin/Computation_driver: src/CMakeFiles/../bin/Computation_driver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/shivi/Desktop/IEGenLib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/../bin/Computation_driver"
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/../bin/Computation_driver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/../bin/Computation_driver.dir/build: bin/../bin/Computation_driver

.PHONY : src/CMakeFiles/../bin/Computation_driver.dir/build

src/CMakeFiles/../bin/Computation_driver.dir/requires: src/CMakeFiles/../bin/Computation_driver.dir/drivers/Computation_driver.cc.o.requires

.PHONY : src/CMakeFiles/../bin/Computation_driver.dir/requires

src/CMakeFiles/../bin/Computation_driver.dir/clean:
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && $(CMAKE_COMMAND) -P CMakeFiles/../bin/Computation_driver.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/../bin/Computation_driver.dir/clean

src/CMakeFiles/../bin/Computation_driver.dir/depend:
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/shivi/Desktop/IEGenLib /mnt/c/Users/shivi/Desktop/IEGenLib/src /mnt/c/Users/shivi/Desktop/IEGenLib/build /mnt/c/Users/shivi/Desktop/IEGenLib/build/src /mnt/c/Users/shivi/Desktop/IEGenLib/build/src/bin/Computation_driver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/../bin/Computation_driver.dir/depend

