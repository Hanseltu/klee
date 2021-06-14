# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/haoxin/haoxin-data/smu-research/klee

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/haoxin/haoxin-data/smu-research/klee/smu-build

# Include any dependencies generated for this target.
include tools/kleaver/CMakeFiles/kleaver.dir/depend.make

# Include the progress variables for this target.
include tools/kleaver/CMakeFiles/kleaver.dir/progress.make

# Include the compile flags for this target's objects.
include tools/kleaver/CMakeFiles/kleaver.dir/flags.make

tools/kleaver/CMakeFiles/kleaver.dir/main.cpp.o: tools/kleaver/CMakeFiles/kleaver.dir/flags.make
tools/kleaver/CMakeFiles/kleaver.dir/main.cpp.o: ../tools/kleaver/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/haoxin/haoxin-data/smu-research/klee/smu-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/kleaver/CMakeFiles/kleaver.dir/main.cpp.o"
	cd /home/haoxin/haoxin-data/smu-research/klee/smu-build/tools/kleaver && /usr/bin/clang++-9 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleaver.dir/main.cpp.o -c /home/haoxin/haoxin-data/smu-research/klee/tools/kleaver/main.cpp

tools/kleaver/CMakeFiles/kleaver.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleaver.dir/main.cpp.i"
	cd /home/haoxin/haoxin-data/smu-research/klee/smu-build/tools/kleaver && /usr/bin/clang++-9 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/haoxin/haoxin-data/smu-research/klee/tools/kleaver/main.cpp > CMakeFiles/kleaver.dir/main.cpp.i

tools/kleaver/CMakeFiles/kleaver.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleaver.dir/main.cpp.s"
	cd /home/haoxin/haoxin-data/smu-research/klee/smu-build/tools/kleaver && /usr/bin/clang++-9 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/haoxin/haoxin-data/smu-research/klee/tools/kleaver/main.cpp -o CMakeFiles/kleaver.dir/main.cpp.s

# Object files for target kleaver
kleaver_OBJECTS = \
"CMakeFiles/kleaver.dir/main.cpp.o"

# External object files for target kleaver
kleaver_EXTERNAL_OBJECTS =

bin/kleaver: tools/kleaver/CMakeFiles/kleaver.dir/main.cpp.o
bin/kleaver: tools/kleaver/CMakeFiles/kleaver.dir/build.make
bin/kleaver: lib/libkleaverSolver.a
bin/kleaver: lib/libkleeBasic.a
bin/kleaver: lib/libkleaverExpr.a
bin/kleaver: lib/libkleeSupport.a
bin/kleaver: /usr/lib/x86_64-linux-gnu/libz.so
bin/kleaver: /usr/lib/x86_64-linux-gnu/libtcmalloc.so
bin/kleaver: /home/haoxin/haoxin-data/dut-research/compilers/llvm-9.0/llvm-src/build/lib/libLLVMSupport.a
bin/kleaver: /home/haoxin/haoxin-data/dut-research/compilers/llvm-9.0/llvm-src/build/lib/libLLVMDemangle.a
bin/kleaver: /usr/local/lib/libstp.so.2.3
bin/kleaver: /usr/local/lib/libminisat.so
bin/kleaver: /usr/local/lib/libz3.so
bin/kleaver: tools/kleaver/CMakeFiles/kleaver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/haoxin/haoxin-data/smu-research/klee/smu-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/kleaver"
	cd /home/haoxin/haoxin-data/smu-research/klee/smu-build/tools/kleaver && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kleaver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/kleaver/CMakeFiles/kleaver.dir/build: bin/kleaver

.PHONY : tools/kleaver/CMakeFiles/kleaver.dir/build

tools/kleaver/CMakeFiles/kleaver.dir/clean:
	cd /home/haoxin/haoxin-data/smu-research/klee/smu-build/tools/kleaver && $(CMAKE_COMMAND) -P CMakeFiles/kleaver.dir/cmake_clean.cmake
.PHONY : tools/kleaver/CMakeFiles/kleaver.dir/clean

tools/kleaver/CMakeFiles/kleaver.dir/depend:
	cd /home/haoxin/haoxin-data/smu-research/klee/smu-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/haoxin/haoxin-data/smu-research/klee /home/haoxin/haoxin-data/smu-research/klee/tools/kleaver /home/haoxin/haoxin-data/smu-research/klee/smu-build /home/haoxin/haoxin-data/smu-research/klee/smu-build/tools/kleaver /home/haoxin/haoxin-data/smu-research/klee/smu-build/tools/kleaver/CMakeFiles/kleaver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/kleaver/CMakeFiles/kleaver.dir/depend
