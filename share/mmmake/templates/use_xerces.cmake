IF (NOT XERCES_FOUND)
FIND_PACKAGE(XERCES REQUIRED)
include_directories( ${XERCES_INCLUDE_DIR} )
ENDIF( NOT XERCES_FOUND )

IF( NOT XERCES_FOUND )
  MESSAGE( SEND_ERROR "xerces is mandatory" )
ENDIF( NOT XERCES_FOUND )

