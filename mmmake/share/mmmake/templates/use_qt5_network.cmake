cmake_minimum_required(VERSION 2.8.11)

FIND_PACKAGE(Qt5Network REQUIRED)
include_directories( ${Qt5Network_INCLUDE_DIRS} )
add_definitions(${Qt5Network_DEFINITIONS})
set(CMAKE_CXX_FLAGS "${Qt5Network_EXECUTABLE_COMPILE_FLAGS}")


