IF (NOT SUNDIALS_FOUND)

SET(LIBSEARCHPATHS 
	/usr/lib
	C:/usr/lib
      C:/development/sundials/sundials-2.3.0/build/src/nvec_ser/release
      C:/development/sundials/sundials-2.3.0/build/src/ida/release
      C:/development/sundials/sundials-2.3.0/build/src/cvode/release
) 

FIND_PATH(SUNDIALS_INCLUDE_DIR sundials/sundials_nvector.h 
      /usr/include
	/usr/local/include
      C:/development/sundials/sundials-2.3.0/include
	DOC "Directory containing Sundials includes"
)

FIND_LIBRARY(SUNDIALS_NVECSERIAL
	NAMES 
		sundials_nvecserial
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(SUNDIALS_IDA
	NAMES 
		sundials_ida
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(SUNDIALS_CVODE
	NAMES 
		sundials_cvode
	PATHS 	${LIBSEARCHPATHS} 
) 

SET(SUNDIALS_LIBRARIES 
${SUNDIALS_NVECSERIAL}
${SUNDIALS_IDA}
${SUNDIALS_CVODE}
)

SET(SUNDIALS_LIBRARIES_D ${SUNDIALS_LIBRARIES})

#message(${SUNDIALS_INCLUDE_DIR})
IF (SUNDIALS_INCLUDE_DIR AND SUNDIALS_LIBRARIES AND SUNDIALS_LIBRARIES_D)
	SET(SUNDIALS_FOUND TRUE) 
ENDIF (SUNDIALS_INCLUDE_DIR AND SUNDIALS_LIBRARIES AND SUNDIALS_LIBRARIES_D)
 
IF (SUNDIALS_FOUND)
	IF (NOT SUNDIALS_FIND_QUIETLY) 
		MESSAGE(STATUS "Found Sundials: ${SUNDIALS_INCLUDE_DIR}") 
	ENDIF (NOT SUNDIALS_FIND_QUIETLY) 
ELSE (SUNDIALS_FOUND)
	IF (NOT SUNDIALS_FIND_QUIETLY) 
		MESSAGE(FATAL_ERROR "Could not find Sundials") 
	ENDIF (NOT SUNDIALS_FIND_QUIETLY) 
ENDIF (SUNDIALS_FOUND)

ENDIF (NOT SUNDIALS_FOUND)
