# Find includes in corresponding build directories
#set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Instruct CMake to run moc automatically when needed.
#set(CMAKE_AUTOMOC ON)
#set(CMAKE_AUTOUIC ON)


include_directories( ${Qt5Widgets_INCLUDE_DIRS} )
add_definitions(${Qt5Widgets_DEFINITIONS})
set(CMAKE_CXX_FLAGS "${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS}")

FOREACH(LINKLIB ${Qt5Widgets_LIBRARIES}) 
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)

