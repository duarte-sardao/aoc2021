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
CMAKE_SOURCE_DIR = C:\Users\Duarte\Desktop\aoc2021\four

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Duarte\Desktop\aoc2021\four\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/four.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/four.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/four.dir/flags.make

CMakeFiles/four.dir/code.cpp.obj: CMakeFiles/four.dir/flags.make
CMakeFiles/four.dir/code.cpp.obj: ../code.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Duarte\Desktop\aoc2021\four\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/four.dir/code.cpp.obj"
	C:\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\four.dir\code.cpp.obj -c C:\Users\Duarte\Desktop\aoc2021\four\code.cpp

CMakeFiles/four.dir/code.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/four.dir/code.cpp.i"
	C:\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\Duarte\Desktop\aoc2021\four\code.cpp > CMakeFiles\four.dir\code.cpp.i

CMakeFiles/four.dir/code.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/four.dir/code.cpp.s"
	C:\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\Duarte\Desktop\aoc2021\four\code.cpp -o CMakeFiles\four.dir\code.cpp.s

# Object files for target four
four_OBJECTS = \
"CMakeFiles/four.dir/code.cpp.obj"

# External object files for target four
four_EXTERNAL_OBJECTS =

four.exe: CMakeFiles/four.dir/code.cpp.obj
four.exe: CMakeFiles/four.dir/build.make
four.exe: CMakeFiles/four.dir/linklibs.rsp
four.exe: CMakeFiles/four.dir/objects1.rsp
four.exe: CMakeFiles/four.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Duarte\Desktop\aoc2021\four\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable four.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\four.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/four.dir/build: four.exe

.PHONY : CMakeFiles/four.dir/build

CMakeFiles/four.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\four.dir\cmake_clean.cmake
.PHONY : CMakeFiles/four.dir/clean

CMakeFiles/four.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Duarte\Desktop\aoc2021\four C:\Users\Duarte\Desktop\aoc2021\four C:\Users\Duarte\Desktop\aoc2021\four\cmake-build-debug C:\Users\Duarte\Desktop\aoc2021\four\cmake-build-debug C:\Users\Duarte\Desktop\aoc2021\four\cmake-build-debug\CMakeFiles\four.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/four.dir/depend

