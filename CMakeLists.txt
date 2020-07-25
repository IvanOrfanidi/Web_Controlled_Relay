# Version CMake
cmake_minimum_required(VERSION 3.13)

# Project name
project(web_controlled_relay VERSION 1.0.1)

# Configure files
configure_file(
    project_version.h.in ${CMAKE_CURRENT_BINARY_DIR}/project_version.h
)

# Settings device
set(AVR_MCU atmega88)
set(AVR_H_FUSE 0xdf)
set(AVR_L_FUSE 0xf7)

# Settings programmer
set(AVR_UPLOADTOOL avrdude)
set(AVR_UPLOADTOOL_PORT usb)
set(AVR_PROGRAMMER dragon_isp)

# Set MCU speed
set(DF_CPU "18432000UL")

# Source files
file(GLOB_RECURSE SOURCES 
    src/*.c
    src/*.h
    src/config/*.c
    src/config/*.h
    src/net/*.c
    src/net/*.h
    src/web/*.c
    src/web/*.h
    src/usart/*.c
    src/usart/*.h
    src/at_commands/*.c
    src/at_commands/*.h
)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/config)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/net)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/web)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/usart)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/at_commands)

include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
)

# Set build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif(NOT CMAKE_BUILD_TYPE)

# Some cmake cross-compile necessities
if(DEFINED ENV{AVR_FIND_ROOT_PATH})
    set(CMAKE_FIND_ROOT_PATH $ENV{AVR_FIND_ROOT_PATH})
else(DEFINED ENV{AVR_FIND_ROOT_PATH})
    if(EXISTS "/opt/local/avr")
      set(CMAKE_FIND_ROOT_PATH "/opt/local/avr")
    elseif(EXISTS "/usr/avr")
      set(CMAKE_FIND_ROOT_PATH "/usr/avr")
    elseif(EXISTS "/usr/lib/avr")
      set(CMAKE_FIND_ROOT_PATH "/usr/lib/avr")
    elseif(EXISTS "/usr/local/CrossPack-AVR")
      set(CMAKE_FIND_ROOT_PATH "/usr/local/CrossPack-AVR")
    else(EXISTS "/opt/local/avr")
      message(FATAL_ERROR "Please set AVR_FIND_ROOT_PATH in your environment.")
    endif(EXISTS "/opt/local/avr")
endif(DEFINED ENV{AVR_FIND_ROOT_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
# not added automatically, since CMAKE_SYSTEM_NAME is "generic"
set(CMAKE_SYSTEM_INCLUDE_PATH "${CMAKE_FIND_ROOT_PATH}/include")
set(CMAKE_SYSTEM_LIBRARY_PATH "${CMAKE_FIND_ROOT_PATH}/lib")

# Status messages for generating
message(STATUS "Set CMAKE_FIND_ROOT_PATH to ${CMAKE_FIND_ROOT_PATH}")
message(STATUS "Set CMAKE_SYSTEM_INCLUDE_PATH to ${CMAKE_SYSTEM_INCLUDE_PATH}")
message(STATUS "Set CMAKE_SYSTEM_LIBRARY_PATH to ${CMAKE_SYSTEM_LIBRARY_PATH}")

# Set compiler options for build types
if(CMAKE_BUILD_TYPE MATCHES Release)
    set(CMAKE_C_FLAGS_RELEASE "-Os")
    set(CMAKE_CXX_FLAGS_RELEASE "-Os")
endif(CMAKE_BUILD_TYPE MATCHES Release)

if(CMAKE_BUILD_TYPE MATCHES RelWithDebInfo)
    set(CMAKE_C_FLAGS_RELWITHDEBINFO "-Os -save-temps -g -gdwarf-3 -gstrict-dwarf")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-Os -save-temps -g -gdwarf-3 -gstrict-dwarf")
endif(CMAKE_BUILD_TYPE MATCHES RelWithDebInfo)

if(CMAKE_BUILD_TYPE MATCHES Debug)
    set(CMAKE_C_FLAGS_DEBUG "-O0 -save-temps -g -gdwarf-3 -gstrict-dwarf")
    set(CMAKE_CXX_FLAGS_DEBUG "-O0 -save-temps -g -gdwarf-3 -gstrict-dwarf")
endif(CMAKE_BUILD_TYPE MATCHES Debug)

# Compiler options for all build types
set(CPU_FLAGS "-DF_CPU=${DF_CPU}")
set(COMPILER_FLAGS "-std=gnu99 -c -fpack-struct -fshort-enums -Wall -Werror -pedantic -pedantic-errors -funsigned-char -funsigned-bitfields -ffunction-sections")
add_definitions(${CPU_FLAGS} ${COMPILER_FLAGS})

add_avr_executable(${PROJECT_NAME}_${CMAKE_PROJECT_VERSION} ${SOURCES})
