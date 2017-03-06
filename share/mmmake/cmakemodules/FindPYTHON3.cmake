IF (NOT PYTHON3_FOUND)

FIND_PATH(PYTHON3_INCLUDE Python.h
	PATHS
	/usr
	/usr/local
	c:/
	PATH_SUFFIXES include/python3.4m include/python3.5m
	DOC "Directory containing PYTHON3 headers"
)

FIND_LIBRARY(PYTHON3_LIBS NAMES python3.4m python3.5m
   PATHS
   /usr
   /usr/local
   c:/
   PATH_SUFFIXES lib/python3.5/config-3.5m-x86_64-linux-gnu
   	         lib/python3.4/config-3.4m-x86_64-linux-gnu
   )

#/usr/include/python3.5m/pyhash.h
#/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/libpython3.5m.so


#  exec_program(x86_64-linux-gnu-python3-config ARGS "--ldflags" OUTPUT_VARIABLE PYTHON3_LDFLAGS)
#  exec_program(x86_64-linux-gnu-python3-config ARGS "--cflags" OUTPUT_VARIABLE PYTHON3_CFLAGS)
#  exec_program(x86_64-linux-gnu-python3-config ARGS "--libs" OUTPUT_VARIABLE PYTHON3_LIBS)
#  exec_program(x86_64-linux-gnu-python3-config ARGS "--include" OUTPUT_VARIABLE PYTHON3_INCLUDE)


  IF (PYTHON3_INCLUDE AND PYTHON3_LIBS)
    SET(PYTHON3_FOUND TRUE) 
  ENDIF (PYTHON3_INCLUDE AND PYTHON3_LIBS)

  IF (PYTHON3_FOUND)
    IF (NOT Python3_FIND_QUIETLY) 
      MESSAGE(STATUS "Found Python3: ${PYTHON3_LIBS} ${PYTHON3_INCLUDE}") 
    ENDIF (NOT Python3_FIND_QUIETLY) 
  ELSE (PYTHON3_FOUND)
    IF (Python3_FIND_REQUIRED) 
      MESSAGE(FATAL_ERROR "Could not find Python3") 
    ENDIF (Python3_FIND_REQUIRED) 
  ENDIF (PYTHON3_FOUND)
ENDIF (NOT PYTHON3_FOUND)



