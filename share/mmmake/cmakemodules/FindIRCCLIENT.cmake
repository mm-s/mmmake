# - Find ircclient - debian package libircclient-dev
# Find the native headers and libraries.
#
#  IRCCLIENT_INCLUDE_DIRS   - where to find
#  IRCCLIENT_LIBRARIES      - List of libraries when using it.
#  IRCCLIENT_FOUND          - True if found.

find_path(IRCCLIENT_INCLUDE_DIR libircclient.h
  /usr/include
  /usr/include/libircclient
  /usr/local/include
  DOC "Directory containing IRCCLIENT headers"
)
mark_as_advanced(IRCCLIENT_INCLUDE_DIR)

#message( FATAL_ERROR ${IRCCLIENT_INCLUDE_DIR} )

FIND_LIBRARY( IRCCLIENT_LIBRARY
  NAMES ircclient
  PATHS /usr/lib
        /usr/local/lib
	/usr/lib/i386-linux-gnu
)

mark_as_advanced(IRCCLIENT_LIBRARY)

# handle the QUIETLY and REQUIRED arguments and set CURL_FOUND to TRUE if
# all listed variables are TRUE

  if ( NOT IRCCLIENT_INCLUDE_DIR OR NOT IRCCLIENT_LIBRARY )
#    if ( IRCCLIENT_REQUIRED )
      message( FATAL_ERROR "IRCCLIENT is required. Set IRCCLIENT_DIR" )
#    endif ( IRCCLIENT_REQUIRED )
  else ( NOT IRCCLIENT_INCLUDE_DIR OR NOT IRCCLIENT_LIBRARY )
    set( IRCCLIENT_FOUND 1 )
    mark_as_advanced( IRCCLIENT_FOUND )
  endif ( NOT IRCCLIENT_INCLUDE_DIR OR NOT IRCCLIENT_LIBRARY )


if(IRCCLIENT_FOUND)
  set(IRCCLIENT_LIBRARIES ${IRCCLIENT_LIBRARY})
  set(IRCCLIENT_INCLUDE_DIRS ${IRCCLIENT_INCLUDE_DIR})
endif()
