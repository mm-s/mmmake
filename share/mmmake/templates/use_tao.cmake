
IF (NOT TAO_FOUND)
FIND_PACKAGE(TAO REQUIRED)
include_directories( ${TAO_INCLUDE_DIRECTORIES} )
ENDIF( NOT TAO_FOUND)

IF( NOT TAO_FOUND )
  MESSAGE( SEND_ERROR "TAO is mandatory" )
ENDIF(NOT TAO_FOUND )

