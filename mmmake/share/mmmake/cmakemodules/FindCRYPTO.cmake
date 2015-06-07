IF (NOT CRYPTO_FOUND)

FIND_PATH(CRYPTO_INCLUDE_PATH openssl/md5.h
  /usr/include
  /usr/local/include
  DOC "Directory containing CRYPTO headers"
) 


FIND_LIBRARY( CRYPTO_LIBRARY
  NAMES crypto
  PATHS /usr/lib
        /usr/local/lib
)




SET(CRYPTO_LIBRARIES ${CRYPTO_LIBRARY})


IF (CRYPTO_INCLUDE_PATH AND CRYPTO_LIBRARY)
	SET(CRYPTO_FOUND TRUE) 
ENDIF ()

IF (CRYPTO_FOUND)
	IF (NOT CRYPTO_FIND_QUIETLY) 
		MESSAGE(STATUS "Found CRYPTO: ${CRYPTO_LIBRARY}") 
	ENDIF (NOT CRYPTO_FIND_QUIETLY) 
ELSE (CRYPTO_FOUND)
	IF (CRYPTO_FIND_REQUIRED) 
		MESSAGE(FATAL_ERROR "Could not find CRYPTO") 
	ENDIF (CRYPTO_FIND_REQUIRED) 
ENDIF (CRYPTO_FOUND)

ENDIF ()
