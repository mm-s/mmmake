IF (NOT EVENT_FOUND)

FIND_PATH(EVENT_ROOT_DIR event2/event.h
	PATHS
	/usr
	/usr/local
	c:/include
	PATH_SUFFIXES include
	DOC "Directory containing EVENT headers"
)

IF (EVENT_ROOT_DIR)
	SET(EVENT_FOUND TRUE) 
ENDIF (EVENT_ROOT_DIR)

IF (EVENT_FOUND)

FIND_LIBRARY( EVENT_LIBRARY
  NAMES event
  PATHS /usr/lib
        /usr/local/lib
	/usr/lib/${MMMAKE_TRIPLET}
)

FIND_LIBRARY( EVENT_PTHREADS_LIBRARY
  NAMES event_pthreads
  PATHS /usr/lib
        /usr/local/lib
	/usr/lib/${MMMAKE_TRIPLET}
)


	SET(EVENT_LIBRARIES ${EVENT_LIBRARY} ${EVENT_PTHREADS_LIBRARY})
	SET(EVENT_INCLUDE_DIR ${EVENT_ROOT_DIR} )
	MESSAGE(STATUS "Found EVENT: ${EVENT_ROOT_DIR} ${EVENT_LIBRARIES}") 

ELSE (EVENT_FOUND)
	MESSAGE(FATAL_ERROR "Could not find EVENT. apt install libevent-dev") 
ENDIF (EVENT_FOUND)

ENDIF (NOT EVENT_FOUND)

