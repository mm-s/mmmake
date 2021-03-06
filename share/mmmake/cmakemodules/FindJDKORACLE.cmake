IF (NOT JDKORACLE_FOUND)

	FIND_PATH(JDKORACLE_ROOT_DIR include/jni.h
	PATHS
	/usr
	/usr/local
	/opt/
	c:/
        PATH_SUFFIXES jdk1.8.0_121

	DOC "Directory containing jdk1.8.0_121 headers"
	)


	IF (JDKORACLE_ROOT_DIR)
		SET(JDKORACLE_FOUND TRUE) 
	ENDIF (JDKORACLE_ROOT_DIR)

	IF (JDKORACLE_FOUND)
		SET(grd ${JDKORACLE_ROOT_DIR})
		LINK_DIRECTORIES(${grd}/lib)
		SET(JDKORACLE_LIBS )
		SET(JDKORACLE_INCLUDE ${grd}/include )
		SET(JDKORACLE_ARCH_INCLUDE ${grd}/include/linux )
		MESSAGE(STATUS "Found JDKORACLE: ${JDKORACLE_ROOT_DIR}") 
	ELSE (JDKORACLE_FOUND)
		MESSAGE(FATAL_ERROR "Could not find Oracle JDK, please download and install it from http://www.oracle.com/technetwork/java/javase/downloads") 
	ENDIF (JDKORACLE_FOUND)

ENDIF (NOT JDKORACLE_FOUND)

