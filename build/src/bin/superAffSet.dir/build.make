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
include src/CMakeFiles/../bin/superAffSet.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/../bin/superAffSet.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/../bin/superAffSet.dir/flags.make

src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o: src/CMakeFiles/../bin/superAffSet.dir/flags.make
src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o: ../src/drivers/superAffSet.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/shivi/Desktop/IEGenLib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o"
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o -c /mnt/c/Users/shivi/Desktop/IEGenLib/src/drivers/superAffSet.cc

src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.i"
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/shivi/Desktop/IEGenLib/src/drivers/superAffSet.cc > CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.i

src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.s"
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/shivi/Desktop/IEGenLib/src/drivers/superAffSet.cc -o CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.s

src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o.requires:

.PHONY : src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o.requires

src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o.provides: src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o.requires
	$(MAKE) -f src/CMakeFiles/../bin/superAffSet.dir/build.make src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o.provides.build
.PHONY : src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o.provides

src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o.provides.build: src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o


# Object files for target ../bin/superAffSet
__/bin/superAffSet_OBJECTS = \
"CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o"

# External object files for target ../bin/superAffSet
__/bin/superAffSet_EXTERNAL_OBJECTS =

bin/../bin/superAffSet: src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o
bin/../bin/superAffSet: src/CMakeFiles/../bin/superAffSet.dir/build.make
bin/../bin/superAffSet: src/libiegenlib.a
bin/../bin/superAffSet: src/CMakeFiles/../bin/superAffSet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/shivi/Desktop/IEGenLib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/../bin/superAffSet"
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/../bin/superAffSet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/../bin/superAffSet.dir/build: bin/../bin/superAffSet

.PHONY : src/CMakeFiles/../bin/superAffSet.dir/build

src/CMakeFiles/../bin/superAffSet.dir/requires: src/CMakeFiles/../bin/superAffSet.dir/drivers/superAffSet.cc.o.requires

.PHONY : src/CMakeFiles/../bin/superAffSet.dir/requires

src/CMakeFiles/../bin/superAffSet.dir/clean:
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && $(CMAKE_COMMAND) -P CMakeFiles/../bin/superAffSet.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/../bin/superAffSet.dir/clean

src/CMakeFiles/../bin/superAffSet.dir/depend:
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/shivi/Desktop/IEGenLib /mnt/c/Users/shivi/Desktop/IEGenLib/src /mnt/c/Users/shivi/Desktop/IEGenLib/build /mnt/c/Users/shivi/Desktop/IEGenLib/build/src /mnt/c/Users/shivi/Desktop/IEGenLib/build/src/bin/superAffSet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/../bin/superAffSet.dir/depend

