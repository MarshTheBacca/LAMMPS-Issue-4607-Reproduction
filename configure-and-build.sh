#!/bin/bash

# Configure the project using CMake with Clang++ as the compiler
cmake -G Ninja -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -S /app -B /app/build

# Build the project
cmake --build /app/build