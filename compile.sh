#!/bin/bash
mkdir -p build
cd build

cmake -G "Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE=./avr-cmake-toolchains/avr-gcc-toolchain.cmake ..
cmake --build .
