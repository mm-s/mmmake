cmake_minimum_required(VERSION 2.8.11)

FIND_PACKAGE(Qt5Widgets REQUIRED)
include_directories( ${Qt5Widgets_INCLUDE_DIRS} )
add_definitions(${Qt5Widgets_DEFINITIONS})
set(CMAKE_CXX_FLAGS "${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS}")


