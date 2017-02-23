cmake_minimum_required(VERSION 2.8.11)

FIND_PACKAGE(Qt5Gui REQUIRED)
include_directories( ${Qt5Gui_INCLUDE_DIRS} )
add_definitions(${Qt5Gui_DEFINITIONS})
set(CMAKE_CXX_FLAGS "${Qt5Gui_EXECUTABLE_COMPILE_FLAGS}")


