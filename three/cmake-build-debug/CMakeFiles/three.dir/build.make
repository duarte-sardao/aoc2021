# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.17

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

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2020.2.3\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2020.2.3\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\Duarte\Desktop\aoc2021\three

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Duarte\Desktop\aoc2021\three\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/three.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/three.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/three.dir/flags.make

CMakeFiles/three.dir/code.c.obj: CMakeFiles/three.dir/flags.make
CMakeFiles/three.dir/code.c.obj: ../code.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Duarte\Desktop\aoc2021\three\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/three.dir/code.c.obj"
	C:\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\three.dir\code.c.obj   -c C:\Users\Duarte\Desktop\aoc2021\three\code.c

CMakeFiles/three.dir/code.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/three.dir/code.c.i"
	C:\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\Duarte\Desktop\aoc2021\three\code.c > CMakeFiles\three.dir\code.c.i

CMakeFiles/three.dir/code.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/three.dir/code.c.s"
	C:\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Users\Duarte\Desktop\aoc2021\three\code.c -o CMakeFiles\three.dir\code.c.s

# Object files for target three
three_OBJECTS = \
"CMakeFiles/three.dir/code.c.obj"

# External object files for target three
three_EXTERNAL_OBJECTS =

three.exe: CMakeFiles/three.dir/code.c.obj
three.exe: CMakeFiles/three.dir/build.make
three.exe: CMakeFiles/three.dir/linklibs.rsp
three.exe: CMakeFiles/three.dir/objects1.rsp
three.exe: CMakeFiles/three.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Duarte\Desktop\aoc2021\three\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable three.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\three.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/three.dir/build: three.exe

.PHONY : CMakeFiles/three.dir/build

CMakeFiles/three.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\three.dir\cmake_clean.cmake
.PHONY : CMakeFiles/three.dir/clean

CMakeFiles/three.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Duarte\Desktop\aoc2021\three C:\Users\Duarte\Desktop\aoc2021\three C:\Users\Duarte\Desktop\aoc2021\three\cmake-build-debug C:\Users\Duarte\Desktop\aoc2021\three\cmake-build-debug C:\Users\Duarte\Desktop\aoc2021\three\cmake-build-debug\CMakeFiles\three.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/three.dir/depend

