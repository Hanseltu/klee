# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/tuhaoxin/github/klee

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tuhaoxin/github/klee/build

# Include any dependencies generated for this target.
include tools/gen-bout/CMakeFiles/gen-bout.dir/depend.make

# Include the progress variables for this target.
include tools/gen-bout/CMakeFiles/gen-bout.dir/progress.make

# Include the compile flags for this target's objects.
include tools/gen-bout/CMakeFiles/gen-bout.dir/flags.make

tools/gen-bout/CMakeFiles/gen-bout.dir/gen-bout.cpp.o: tools/gen-bout/CMakeFiles/gen-bout.dir/flags.make
tools/gen-bout/CMakeFiles/gen-bout.dir/gen-bout.cpp.o: ../tools/gen-bout/gen-bout.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tuhaoxin/github/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/gen-bout/CMakeFiles/gen-bout.dir/gen-bout.cpp.o"
	cd /home/tuhaoxin/github/klee/build/tools/gen-bout && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gen-bout.dir/gen-bout.cpp.o -c /home/tuhaoxin/github/klee/tools/gen-bout/gen-bout.cpp

tools/gen-bout/CMakeFiles/gen-bout.dir/gen-bout.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gen-bout.dir/gen-bout.cpp.i"
	cd /home/tuhaoxin/github/klee/build/tools/gen-bout && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tuhaoxin/github/klee/tools/gen-bout/gen-bout.cpp > CMakeFiles/gen-bout.dir/gen-bout.cpp.i

tools/gen-bout/CMakeFiles/gen-bout.dir/gen-bout.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gen-bout.dir/gen-bout.cpp.s"
	cd /home/tuhaoxin/github/klee/build/tools/gen-bout && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tuhaoxin/github/klee/tools/gen-bout/gen-bout.cpp -o CMakeFiles/gen-bout.dir/gen-bout.cpp.s

# Object files for target gen-bout
gen__bout_OBJECTS = \
"CMakeFiles/gen-bout.dir/gen-bout.cpp.o"

# External object files for target gen-bout
gen__bout_EXTERNAL_OBJECTS =

bin/gen-bout: tools/gen-bout/CMakeFiles/gen-bout.dir/gen-bout.cpp.o
bin/gen-bout: tools/gen-bout/CMakeFiles/gen-bout.dir/build.make
bin/gen-bout: lib/libkleeBasic.a
bin/gen-bout: /usr/lib/x86_64-linux-gnu/libz.so
bin/gen-bout: /usr/lib/x86_64-linux-gnu/libtcmalloc.so
bin/gen-bout: /home/tuhaoxin/compilers/llvm/llvm-9.0/llvm-src/build/lib/libLLVMSupport.a
bin/gen-bout: /home/tuhaoxin/compilers/llvm/llvm-9.0/llvm-src/build/lib/libLLVMDemangle.a
bin/gen-bout: tools/gen-bout/CMakeFiles/gen-bout.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/tuhaoxin/github/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/gen-bout"
	cd /home/tuhaoxin/github/klee/build/tools/gen-bout && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gen-bout.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/gen-bout/CMakeFiles/gen-bout.dir/build: bin/gen-bout

.PHONY : tools/gen-bout/CMakeFiles/gen-bout.dir/build

tools/gen-bout/CMakeFiles/gen-bout.dir/clean:
	cd /home/tuhaoxin/github/klee/build/tools/gen-bout && $(CMAKE_COMMAND) -P CMakeFiles/gen-bout.dir/cmake_clean.cmake
.PHONY : tools/gen-bout/CMakeFiles/gen-bout.dir/clean

tools/gen-bout/CMakeFiles/gen-bout.dir/depend:
	cd /home/tuhaoxin/github/klee/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tuhaoxin/github/klee /home/tuhaoxin/github/klee/tools/gen-bout /home/tuhaoxin/github/klee/build /home/tuhaoxin/github/klee/build/tools/gen-bout /home/tuhaoxin/github/klee/build/tools/gen-bout/CMakeFiles/gen-bout.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/gen-bout/CMakeFiles/gen-bout.dir/depend

