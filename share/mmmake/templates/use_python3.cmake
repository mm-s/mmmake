
FIND_PACKAGE(PYTHON3 REQUIRED)

#FOREACH(INCDIR ${PYTHON3_INCLUDE})
#include_directories(${INCDIR})
#ENDFOREACH(INCDIR)

IF( NOT PYTHON3_FOUND )
  MESSAGE( SEND_ERROR "python3 is mandatory" )
ENDIF(NOT PYTHON3_FOUND )

