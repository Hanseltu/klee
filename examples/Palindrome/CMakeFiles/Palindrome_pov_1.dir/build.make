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
CMAKE_SOURCE_DIR = /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64

# Include any dependencies generated for this target.
include challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/depend.make

# Include the progress variables for this target.
include challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/progress.make

# Include the compile flags for this target's objects.
include challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/flags.make

challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/pov_1/pov.c.o: challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/flags.make
challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/pov_1/pov.c.o: ../challenges/Palindrome/pov_1/pov.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/pov_1/pov.c.o"
	cd /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64/challenges/Palindrome && /usr/local/bin/wllvm $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Palindrome_pov_1.dir/pov_1/pov.c.o -c /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/challenges/Palindrome/pov_1/pov.c

challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/pov_1/pov.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Palindrome_pov_1.dir/pov_1/pov.c.i"
	cd /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64/challenges/Palindrome && /usr/local/bin/wllvm $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/challenges/Palindrome/pov_1/pov.c > CMakeFiles/Palindrome_pov_1.dir/pov_1/pov.c.i

challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/pov_1/pov.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Palindrome_pov_1.dir/pov_1/pov.c.s"
	cd /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64/challenges/Palindrome && /usr/local/bin/wllvm $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/challenges/Palindrome/pov_1/pov.c -o CMakeFiles/Palindrome_pov_1.dir/pov_1/pov.c.s

# Object files for target Palindrome_pov_1
Palindrome_pov_1_OBJECTS = \
"CMakeFiles/Palindrome_pov_1.dir/pov_1/pov.c.o"

# External object files for target Palindrome_pov_1
Palindrome_pov_1_EXTERNAL_OBJECTS =

challenges/Palindrome/pov_1.pov: challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/pov_1/pov.c.o
challenges/Palindrome/pov_1.pov: challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/build.make
challenges/Palindrome/pov_1.pov: include/libpov/libpov.so
challenges/Palindrome/pov_1.pov: include/libcgc.so
challenges/Palindrome/pov_1.pov: include/tiny-AES128-C/libtiny-AES128-C.so
challenges/Palindrome/pov_1.pov: challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable pov_1.pov"
	cd /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64/challenges/Palindrome && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Palindrome_pov_1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/build: challenges/Palindrome/pov_1.pov

.PHONY : challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/build

challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/clean:
	cd /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64/challenges/Palindrome && $(CMAKE_COMMAND) -P CMakeFiles/Palindrome_pov_1.dir/cmake_clean.cmake
.PHONY : challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/clean

challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/depend:
	cd /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/challenges/Palindrome /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64 /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64/challenges/Palindrome /home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64/challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : challenges/Palindrome/CMakeFiles/Palindrome_pov_1.dir/depend

