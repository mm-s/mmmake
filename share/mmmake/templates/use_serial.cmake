IF (NOT SERIAL_FOUND)
FIND_PACKAGE(SERIAL REQUIRED)
include_directories( ${SERIAL_INCLUDE_DIR} )
ENDIF( NOT SERIAL_FOUND )

IF( NOT SERIAL_FOUND )
  MESSAGE( SEND_ERROR "Serial is mandatory" )
ENDIF( NOT SERIAL_FOUND )

