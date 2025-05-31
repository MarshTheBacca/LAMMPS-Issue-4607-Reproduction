# Set the minimum version of CMake that can be used
cmake_minimum_required(VERSION 3.20)

# Set the project name and the language
project(lammps-issue-4607-reproduction LANGUAGES CXX)

# Set the C++ standard to C++23
set(CMAKE_CXX_STANDARD 23)

# Require the C++ standard
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Fetch LAMMPS from GitHub
include(FetchContent)
FetchContent_Declare(
  lammps GIT_REPOSITORY https://github.com/lammps/lammps.git GIT_TAG patch_2Apr2025
)
FetchContent_MakeAvailable(lammps)

# Set LAMMPS build options as first used in the issue
set(CMAKE_PROJECT_lammps_INCLUDE "${lammps_SOURCE_DIR}/cmake/presets/basic.cmake")
set(BUILD_SHARED_LIBS ON CACHE BOOL "" FORCE)
set(PKG_MOLECULE ON CACHE BOOL "" FORCE)
set(PKG_EXTRA-MOLECULE ON CACHE BOOL "" FORCE)
set(WITH_JPEG ON CACHE BOOL "" FORCE)
set(WITH_PNG ON CACHE BOOL "" FORCE)
set(WITH_FFMPEG ON CACHE BOOL "" FORCE)
set(WITH_GZIP ON CACHE BOOL "" FORCE)
set(BUILD_MPI ON CACHE BOOL "" FORCE)
set(BUILD_OMP ON CACHE BOOL "" FORCE)
set(BUILD_LIB_FMT OFF CACHE BOOL "" FORCE) 

add_subdirectory(${lammps_SOURCE_DIR}/cmake ${lammps_BINARY_DIR})
