IF (NOT UNIVALUE_FOUND)

FIND_PATH(UNIVALUE_ROOT_DIR include/univalue.h
	/usr
	/usr/local
	c:/include
	DOC "Directory containing UNIVALUE headers"
)

IF (UNIVALUE_ROOT_DIR)
	SET(UNIVALUE_FOUND TRUE) 
ENDIF (UNIVALUE_ROOT_DIR)

IF (UNIVALUE_FOUND)
	SET( ENV{PKG_CONFIG_PATH} ${UNIVALUE_ROOT_DIR}/lib/pkgconfig )

IF(UNIX)
	exec_program(pkg-config ARGS "--libs libunivalue" OUTPUT_VARIABLE UNIVALUE_LIBS)
	exec_program(pkg-config ARGS "--cflags libunivalue" OUTPUT_VARIABLE UNIVALUE_INCLUDE)
else(UNIX)
	SET(grd ${UNIVALUE_ROOT_DIR})

	LINK_DIRECTORIES(${grd}/lib)

	SET(UNIVALUE_LIBS UNIVALUE)

	SET(UNIVALUE_INCLUDE ${grd}/include )
endif(UNIX)

	link_directories( ${UNIVALUE_ROOT_DIR}/lib )

	MESSAGE(STATUS "Found UNIVALUE: ${UNIVALUE_ROOT_DIR}") 

ELSE (UNIVALUE_FOUND)
	MESSAGE(FATAL_ERROR "Could not find UNIVALUE") 
ENDIF (UNIVALUE_FOUND)

ENDIF (NOT UNIVALUE_FOUND)

