IF (NOT FCGIPP_FOUND)
FIND_PACKAGE(FCGIPP REQUIRED)
include_directories( ${FCGIPP_INCLUDE_DIR} )
ENDIF( NOT FCGIPP_FOUND )

IF( NOT FCGIPP_FOUND )
  MESSAGE( SEND_ERROR "FCGIPP is mandatory" )
ENDIF( NOT FCGIPP_FOUND )

