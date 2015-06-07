
#FIND_PACKAGE(WXW REQUIRED)

#include_directories(${WXW_INCLUDE_DIR})
#include_directories(${WXW_CONF_INCLUDE_DIR}) 


#if(UNIX)
#	add_definitions(-D__WXGTK__)
#endif(UNIX)
#if(WIN32)
#	add_definitions(-D__WXMSW__)
#	add_definitions(-DWXUSINGDLL)
#endif(WIN32)



set(wxWidgets_USE_DEBUG OFF)
set(wxWidgets_USE_UNICODE ON)
set(wxWidgets_USE_UNIVERSAL OFF)
set(wxWidgets_USE_STATIC OFF)

IF(CMAKE_BUILD_TYPE STREQUAL "debug")
add_definitions(-D__WXDEBUG__)
set(wxWidgets_USE_DEBUG ON)
ENDIF(CMAKE_BUILD_TYPE STREQUAL "debug")


FIND_PACKAGE(wxWidgets REQUIRED core base adv)

INCLUDE(${wxWidgets_USE_FILE})

 