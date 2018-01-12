IF (NOT JSONRPCCPP_FOUND)
FIND_PACKAGE(JSONRPCCPP REQUIRED)
include_directories( ${JSONRPCCPP_INCLUDE_DIRS} )
ENDIF( NOT JSONRPCCPP_FOUND )

IF( NOT JSONRPCCPP_FOUND )
  MESSAGE( SEND_ERROR "JSONRPCCPP is mandatory" )
ENDIF( NOT JSONRPCCPP_FOUND )
