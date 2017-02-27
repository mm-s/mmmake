IF (NOT ANL_FOUND)

FIND_PATH(ANL_ROOT_DIR include/netdb.h
	/usr
	/usr/local
	c:/include
	DOC "Directory containing ANL headers"
)

IF (ANL_ROOT_DIR)
	SET(ANL_FOUND TRUE) 
ENDIF (ANL_ROOT_DIR)

IF (ANL_FOUND)
	SET(grd ${ANL_ROOT_DIR})
	LINK_DIRECTORIES(${grd}/lib)
	SET(ANL_LIBS anl)
	SET(ANL_INCLUDE_DIR ${grd}/include )
	MESSAGE(STATUS "Found ANL: ${ANL_ROOT_DIR}") 

ELSE (ANL_FOUND)
	MESSAGE(FATAL_ERROR "Could not find ANL") 
ENDIF (ANL_FOUND)

ENDIF (NOT ANL_FOUND)

