IF (NOT XPLAIN_FOUND)
FIND_PACKAGE(XPLAIN REQUIRED)
include_directories( ${XPLAIN_INCLUDE_DIRS} )
ENDIF ()

IF( NOT XPLAIN_FOUND)
  MESSAGE( SEND_ERROR "XPLAIN (X-PLANE 9 SDK) is mandatory" )
else()
  IF (UNIX)
   add_definitions(-DLIN=1)
  ENDIF()

ENDIF()

