FIND_PACKAGE(UNIVALUE REQUIRED)
#include_directories(${UNIVALUE_INCLUDE})
IF( NOT UNIVALUE_FOUND )
  MESSAGE( SEND_ERROR "Univalue is mandatory" )
ENDIF(NOT UNIVALUE_FOUND )


