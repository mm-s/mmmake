
IF (NOT XMLRPCC_FOUND)
FIND_PACKAGE(XMLRPCC REQUIRED)
include_directories( ${XMLRPCC_INCLUDE_DIRS} )
ENDIF( NOT XMLRPCC_FOUND )

IF( NOT XMLRPCC_FOUND )
  MESSAGE( SEND_ERROR "xmlrpc is mandatory" )
ENDIF(NOT XMLRPCC_FOUND )


