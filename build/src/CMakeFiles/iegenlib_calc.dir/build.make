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
include src/CMakeFiles/iegenlib_calc.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/iegenlib_calc.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/iegenlib_calc.dir/flags.make

src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o: src/CMakeFiles/iegenlib_calc.dir/flags.make
src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o: ../src/iegenlib_calc.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/shivi/Desktop/IEGenLib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o"
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o -c /mnt/c/Users/shivi/Desktop/IEGenLib/src/iegenlib_calc.cc

src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.i"
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/shivi/Desktop/IEGenLib/src/iegenlib_calc.cc > CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.i

src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.s"
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/shivi/Desktop/IEGenLib/src/iegenlib_calc.cc -o CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.s

src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o.requires:

.PHONY : src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o.requires

src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o.provides: src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o.requires
	$(MAKE) -f src/CMakeFiles/iegenlib_calc.dir/build.make src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o.provides.build
.PHONY : src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o.provides

src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o.provides.build: src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o


# Object files for target iegenlib_calc
iegenlib_calc_OBJECTS = \
"CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o"

# External object files for target iegenlib_calc
iegenlib_calc_EXTERNAL_OBJECTS =

bin/iegenlib_calc: src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o
bin/iegenlib_calc: src/CMakeFiles/iegenlib_calc.dir/build.make
bin/iegenlib_calc: src/libiegenlib.a
bin/iegenlib_calc: src/CMakeFiles/iegenlib_calc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/shivi/Desktop/IEGenLib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/iegenlib_calc"
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/iegenlib_calc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/iegenlib_calc.dir/build: bin/iegenlib_calc

.PHONY : src/CMakeFiles/iegenlib_calc.dir/build

src/CMakeFiles/iegenlib_calc.dir/requires: src/CMakeFiles/iegenlib_calc.dir/iegenlib_calc.cc.o.requires

.PHONY : src/CMakeFiles/iegenlib_calc.dir/requires

src/CMakeFiles/iegenlib_calc.dir/clean:
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build/src && $(CMAKE_COMMAND) -P CMakeFiles/iegenlib_calc.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/iegenlib_calc.dir/clean

src/CMakeFiles/iegenlib_calc.dir/depend:
	cd /mnt/c/Users/shivi/Desktop/IEGenLib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/shivi/Desktop/IEGenLib /mnt/c/Users/shivi/Desktop/IEGenLib/src /mnt/c/Users/shivi/Desktop/IEGenLib/build /mnt/c/Users/shivi/Desktop/IEGenLib/build/src /mnt/c/Users/shivi/Desktop/IEGenLib/build/src/CMakeFiles/iegenlib_calc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/iegenlib_calc.dir/depend

