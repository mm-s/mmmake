# - Find z - debian package zlib1g-dev
# Find the native headers and libraries.
#
#  Z_INCLUDE_DIRS   - where to find
#  Z_LIBRARIES      - List of libraries when using it.
#  Z_FOUND          - True if found.

find_path(Z_INCLUDE_DIR zlib.h
  /usr/include
  /usr/local/include
  DOC "Directory containing z headers"
)
mark_as_advanced(Z_INCLUDE_DIR)

#message( FATAL_ERROR ${Z_INCLUDE_DIR} )

FIND_LIBRARY( Z_LIBRARY
  NAMES z
  PATHS /usr/lib
        /usr/local/lib
	/usr/lib/i386-linux-gnu
)

mark_as_advanced(Z_LIBRARY)

# handle the QUIETLY and REQUIRED arguments and set Found to TRUE if
# all listed variables are TRUE

  if ( NOT Z_INCLUDE_DIR OR NOT Z_LIBRARY )
#    if ( Z_REQUIRED )
      message( FATAL_ERROR "Z is required. Set Z_DIR" )
#    endif ( Z_REQUIRED )
  else ( NOT Z_INCLUDE_DIR OR NOT Z_LIBRARY )
    set( Z_FOUND 1 )
    mark_as_advanced( Z_FOUND )
  endif ( NOT Z_INCLUDE_DIR OR NOT Z_LIBRARY )


if(Z_FOUND)
  set(Z_LIBRARIES ${Z_LIBRARY})
  set(Z_INCLUDE_DIRS ${Z_INCLUDE_DIR})
endif()
