IF (NOT XERCES_FOUND)

FIND_PATH(XERCES_INCLUDE_DIR xercesc/sax2/Attributes.hpp
  /usr/include
  /usr/include/xercesc-2.7.0
  /usr/local/include/xercesc-2.7.0
  r:/usr/include/xercesc-2.7.0 
  c:/usr/include/xercesc-2.7.0  
  ${DISTR_PREFIX}/include/xercesc-2.7.0
  DOC "Directory containing xerces headers"
)

SET(LIBSEARCHPATHS 
	/usr/lib
	/usr/local/lib
	R:/usr/lib
	${DISTR_PREFIX}/lib
) 

FIND_LIBRARY(XERCES_LIBRARY
	NAMES
		xerces-c_2
		xerces-c
		xerces-c
		xerces-c-3.0
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(XERCES_LIBRARY_D
	NAMES 	
		xerces-c_2D
		xerces-c
		libxerces-c
		xerces-c-3.0
	PATHS 	${LIBSEARCHPATHS}
) 


IF (XERCES_INCLUDE_DIR AND XERCES_LIBRARY_D AND XERCES_LIBRARY)
	SET(XERCES_FOUND TRUE) 
ENDIF (XERCES_INCLUDE_DIR AND XERCES_LIBRARY_D AND XERCES_LIBRARY)

IF (XERCES_FOUND)
	IF (NOT Xerces_FIND_QUIETLY) 
		MESSAGE(STATUS "Found Xerces: ${XERCES_LIBRARY}") 
	ENDIF (NOT Xerces_FIND_QUIETLY) 
ELSE (XERCES_FOUND)
	 IF (Xerces_FIND_REQUIRED) 
		MESSAGE(FATAL_ERROR "Could not find Xerces") 
	ENDIF (Xerces_FIND_REQUIRED) 
ENDIF (XERCES_FOUND)

ENDIF (NOT XERCES_FOUND)
