IF (NOT BITCOINAPICPP_FOUND)
FIND_PACKAGE(BITCOINAPICPP REQUIRED)
include_directories( ${BITCOINAPICPP_INCLUDE_DIR} )
ENDIF( NOT BITCOINAPICPP_FOUND )

IF( NOT BITCOINAPICPP_FOUND )
  MESSAGE( SEND_ERROR "BITCOINAPICPP is mandatory" )
ENDIF( NOT BITCOINAPICPP_FOUND )

