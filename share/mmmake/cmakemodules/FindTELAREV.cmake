IF (NOT TELAREV_FOUND)

FIND_PATH(TELAREV_INCLUDE_PATH telar/environment/module.h
  /usr/include
  /usr/local/include
  DOC "Directory containing Telar Environment headers"
) 




FIND_LIBRARY( TELAREV_LIBRARY
  NAMES  telarev
  PATHS  /usr/lib
         /usr/local/lib
)

FIND_LIBRARY( MODULE_BASIC_PRTL_LIBRARY
  NAMES  modulebasic_prtl
  PATHS  /usr/lib
         /usr/local/lib
)



SET(TELAREV_LIBRARIES ${TELAREV_LIBRARY} ${MODULE_BASIC_PRTL_LIBRARY})


IF (TELAREV_INCLUDE_PATH AND TELAREV_LIBRARY  AND MODULE_BASIC_PRTL_LIBRARY)
	SET(TELAREV_FOUND TRUE) 
ENDIF ()

IF (TELAREV_FOUND)
	IF (NOT TELAREV_FIND_QUIETLY) 
		MESSAGE(STATUS "Found TELAREV: ${TELAREV_LIBRARY}") 
	ENDIF (NOT TELAREV_FIND_QUIETLY) 
ELSE (TELAREV_FOUND)
	IF (TELAREV_FIND_REQUIRED) 
		MESSAGE(FATAL_ERROR "Could not find TELAREV") 
	ENDIF (TELAREV_FIND_REQUIRED) 
ENDIF (TELAREV_FOUND)



ENDIF ()