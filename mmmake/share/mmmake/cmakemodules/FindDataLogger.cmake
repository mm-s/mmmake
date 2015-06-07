IF (NOT DATALOGGER_FOUND)

FIND_PATH( DataLogger_INCLUDE_PATH datalogger/DL.h
  /usr/include
  /usr/local/include
)

FIND_LIBRARY( DataLogger_LIBRARY
  NAMES datalogger
  PATHS /usr/lib
        /usr/local/lib
        /usr/local/lib/datalogger
)

FIND_LIBRARY( sparser_LIBRARY
  NAMES  sparser
  PATHS  /usr/lib
         /usr/local/lib
         /usr/local/lib/sparser
)

FIND_LIBRARY( common_fm_LIBRARY
  NAMES  common_fm
  PATHS  /usr/lib
         /usr/local/lib
         /usr/local/lib/common_fm
)

SET(DataLogger_LIBRARIES ${sparser_LIBRARY}
                         ${DataLogger_LIBRARY}
			 ${common_fm_LIBRARY})


IF (DataLogger_INCLUDE_PATH AND DataLogger_LIBRARY AND common_fm_LIBRARY)
	SET(DATALOGGER_FOUND TRUE) 
ENDIF ()

IF (DATALOGGER_FOUND)
	IF (NOT Datalogger_FIND_QUIETLY) 
		MESSAGE(STATUS "Found Datalogger: ${DataLogger_LIBRARY}") 
	ENDIF (NOT Datalogger_FIND_QUIETLY) 
ELSE (DATALOGGER_FOUND)
	IF (Datalogger_FIND_REQUIRED) 
		MESSAGE(FATAL_ERROR "Could not find Datalogger") 
	ENDIF (Datalogger_FIND_REQUIRED) 
ENDIF (DATALOGGER_FOUND)



ENDIF ()
