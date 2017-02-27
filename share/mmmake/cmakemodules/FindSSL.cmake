IF (NOT SSL_FOUND)

FIND_PATH(SSL_ROOT_DIR include/openssl/ssl.h
	/usr
	/usr/local
	c:/include
	DOC "Directory containing SSL headers"
)

IF (SSL_ROOT_DIR)
	SET(SSL_FOUND TRUE) 
ENDIF (SSL_ROOT_DIR)

IF (SSL_FOUND)
	SET( ENV{PKG_CONFIG_PATH} ${SSL_ROOT_DIR}/lib/pkgconfig )

IF(UNIX)
	exec_program(pkg-config ARGS "--libs libssl" OUTPUT_VARIABLE SSL_LIBS)
	exec_program(pkg-config ARGS "--cflags libssl" OUTPUT_VARIABLE SSL_INCLUDE)
else(UNIX)
	SET(grd ${SSL_ROOT_DIR})

	LINK_DIRECTORIES(${grd}/lib)

	SET(SSL_LIBS SSL)

	SET(SSL_INCLUDE ${grd}/include )
endif(UNIX)

	link_directories( ${SSL_ROOT_DIR}/lib )

	MESSAGE(STATUS "Found SSL: ${SSL_ROOT_DIR}") 

ELSE (SSL_FOUND)
	MESSAGE(FATAL_ERROR "Could not find SSL") 
ENDIF (SSL_FOUND)

ENDIF (NOT SSL_FOUND)

