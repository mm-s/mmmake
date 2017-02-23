IF (NOT PYTHON_FOUND)
  FIND_PATH(PYTHON_INCLUDE_DIR pyerrors.h
    /usr/include/python2.6
    DOC "Directory containing python headers"
    )

  SET(LIBSEARCHPATHS 
    /usr/lib
    /usr/local/lib
    ${DISTR_PREFIX}/lib
    ) 

  FIND_LIBRARY(PYTHON_LIBRARIES
    NAMES
    python2.6
    PATHS 	${LIBSEARCHPATHS} 
    ) 

  IF (PYTHON_INCLUDE_DIR AND PYTHON_LIBRARIES)
    SET(PYTHON_FOUND TRUE) 
  ENDIF (PYTHON_INCLUDE_DIR AND PYTHON_LIBRARIES)

  IF (PYTHON_FOUND)
    IF (NOT Python_FIND_QUIETLY) 
      MESSAGE(STATUS "Found Python: ${PYTHON_LIBRARIES}") 
    ENDIF (NOT Python_FIND_QUIETLY) 
  ELSE (PYTHON_FOUND)
    IF (Python_FIND_REQUIRED) 
      MESSAGE(FATAL_ERROR "Could not find Python") 
    ENDIF (Python_FIND_REQUIRED) 
  ENDIF (PYTHON_FOUND)
ENDIF (NOT PYTHON_FOUND)
