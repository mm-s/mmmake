IF (NOT IOBD_FOUND)

FIND_PATH(IOBD_INCLUDE_DIR iobd/Sampler/PressureLogger.h
  /usr/include
  /usr/local/include
  DOC "Directory containing iobd headers"
)

SET(LIBSEARCHPATHS 
	/usr/lib
	/usr/local/lib
	${DISTR_PREFIX}/lib
) 

FIND_LIBRARY(SENSORS_LIBRARY
	NAMES
		Sensors
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(SAMPLER_LIBRARY
	NAMES
		Sampler
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(INTERFACES_LIBRARY
	NAMES
		IOBInterface
	PATHS 	${LIBSEARCHPATHS} 
) 

set (IOBD_LIBRARIES
${SENSORS_LIBRARY}
${SAMPLER_LIBRARY}
${INTERFACES_LIBRARY}
)


IF (IOBD_INCLUDE_DIR AND IOBD_LIBRARIES)
	SET(IOBD_FOUND TRUE) 
ENDIF (IOBD_INCLUDE_DIR AND IOBD_LIBRARIES)

IF (IOBD_FOUND)
	IF (NOT iobd_FIND_QUIETLY) 
		MESSAGE(STATUS "Found IOBD: ${IOBD_LIBRARIES}") 
	ENDIF (NOT iobd_FIND_QUIETLY) 
ELSE (IOBD_FOUND)
	 IF (iobd_FIND_REQUIRED) 
		MESSAGE(FATAL_ERROR "Could not find IOBD") 
	ENDIF (iobd_FIND_REQUIRED) 
ENDIF (IOBD_FOUND)

ENDIF (NOT IOBD_FOUND)