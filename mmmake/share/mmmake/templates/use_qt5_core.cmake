cmake_minimum_required(VERSION 2.8.11)

FIND_PACKAGE(Qt5Core REQUIRED)
include_directories( ${Qt5Core_INCLUDE_DIRS} )
add_definitions(${Qt5Core_DEFINITIONS})
set(CMAKE_CXX_FLAGS "${Qt5Core_EXECUTABLE_COMPILE_FLAGS}")


