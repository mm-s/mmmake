# - Find tar - debian package libtar-dev
# Find the native headers and libraries.
#
#  TAR_INCLUDE_DIRS   - where to find
#  TAR_LIBRARIES      - List of libraries when using it.
#  TAR_FOUND          - True if found.

find_path(TAR_INCLUDE_DIR libtar.h
  /usr/include
  /usr/local/include
  DOC "Directory containing tar headers"
)
mark_as_advanced(TAR_INCLUDE_DIR)

#message( FATAL_ERROR ${TAR_INCLUDE_DIR} )

FIND_LIBRARY( TAR_LIBRARY
  NAMES tar
  PATHS /usr/lib
        /usr/local/lib
	/usr/lib/i386-linux-gnu
)

mark_as_advanced(TAR_LIBRARY)

# handle the QUIETLY and REQUIRED arguments and set Found to TRUE if
# all listed variables are TRUE

  if ( NOT TAR_INCLUDE_DIR OR NOT TAR_LIBRARY )
#    if ( TAR_REQUIRED )
      message( FATAL_ERROR "TAR is required. Set TAR_DIR" )
#    endif ( TAR_REQUIRED )
  else ( NOT TAR_INCLUDE_DIR OR NOT TAR_LIBRARY )
    set( TAR_FOUND 1 )
    mark_as_advanced( TAR_FOUND )
  endif ( NOT TAR_INCLUDE_DIR OR NOT TAR_LIBRARY )


if(TAR_FOUND)
  set(TAR_LIBRARIES ${TAR_LIBRARY})
  set(TAR_INCLUDE_DIRS ${TAR_INCLUDE_DIR})
endif()
