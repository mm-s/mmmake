# - Find talib - download, build and install from sources at http://ta-lib.org/hdr_dw.html; there is not yet a debian package
# Find the native headers and libraries.
#
#  TALIB_INCLUDE_DIRS   - where to find
#  TALIB_LIBRARIES      - List of libraries when using it.
#  TALIB_FOUND          - True if found.

find_path(TALIB_INCLUDE_DIR ta-lib/ta_common.h
  /usr/include
  /usr/local/include
  DOC "Directory containing talib headers"
)
mark_as_advanced(TALIB_INCLUDE_DIR)

#message( FATAL_ERROR ${TALIB_INCLUDE_DIR} )

FIND_LIBRARY( TALIB_LIBRARY
  NAMES ta_lib
  PATHS /usr/lib
        /usr/local/lib
	/usr/lib/i386-linux-gnu
)

mark_as_advanced(TALIB_LIBRARY)

# handle the QUIETLY and REQUIRED arguments and set Found to TRUE if
# all listed variables are TRUE

  if ( NOT TALIB_INCLUDE_DIR OR NOT TALIB_LIBRARY )
#    if ( TALIB_REQUIRED )
      message( FATAL_ERROR "TALIB is required. Set TALIB_DIR. download, build and install from sources at http://ta-lib.org/hdr_dw.html" )
#    endif ( TALIB_REQUIRED )
  else ( NOT TALIB_INCLUDE_DIR OR NOT TALIB_LIBRARY )
    set( TALIB_FOUND 1 )
    mark_as_advanced( TALIB_FOUND )
  endif ( NOT TALIB_INCLUDE_DIR OR NOT TALIB_LIBRARY )


if(TALIB_FOUND)
  set(TALIB_LIBRARIES ${TALIB_LIBRARY})
  set(TALIB_INCLUDE_DIRS ${TALIB_INCLUDE_DIR})
endif()
