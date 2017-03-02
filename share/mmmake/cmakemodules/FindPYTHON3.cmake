IF (NOT PYTHON3_FOUND)

  exec_program(x86_64-linux-gnu-python3-config ARGS "--ldflags" OUTPUT_VARIABLE PYTHON3_LDFLAGS)
  exec_program(x86_64-linux-gnu-python3-config ARGS "--cflags" OUTPUT_VARIABLE PYTHON3_CFLAGS)
  exec_program(x86_64-linux-gnu-python3-config ARGS "--libs" OUTPUT_VARIABLE PYTHON3_LIBS)
  exec_program(x86_64-linux-gnu-python3-config ARGS "--include" OUTPUT_VARIABLE PYTHON3_INCLUDE)


  IF (PYTHON3_INCLUDE AND PYTHON3_LIBS)
    SET(PYTHON3_FOUND TRUE) 
  ENDIF (PYTHON3_INCLUDE AND PYTHON3_LIBS)

  IF (PYTHON3_FOUND)
    IF (NOT Python3_FIND_QUIETLY) 
      MESSAGE(STATUS "Found Python3: ${PYTHON_LIBS}") 
    ENDIF (NOT Python3_FIND_QUIETLY) 
  ELSE (PYTHON3_FOUND)
    IF (Python3_FIND_REQUIRED) 
      MESSAGE(FATAL_ERROR "Could not find Python3") 
    ENDIF (Python3_FIND_REQUIRED) 
  ENDIF (PYTHON3_FOUND)
ENDIF (NOT PYTHON3_FOUND)
