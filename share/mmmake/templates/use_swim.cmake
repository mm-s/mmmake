
IF (NOT SWIM_FOUND)
  FIND_PACKAGE(SWIM REQUIRED)
  include_directories( ${SWIM_INCLUDE_DIRECTORIES} )
ENDIF( NOT SWIM_FOUND)

IF(NOT SWIM_FOUND )
  MESSAGE( SEND_ERROR "SWIM is mandatory" )
ENDIF(NOT SWIM_FOUND )

