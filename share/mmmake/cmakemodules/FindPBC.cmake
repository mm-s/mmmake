# - Find PBC - sources https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz
# Find the native PBC headers and libraries.
#
#  PBC_INCLUDE_DIRS   - where to find
#  PBC_LIBRARIES      - List of libraries when using it.
#  PBC_FOUND          - True if found.

find_path(PBC_INCLUDE_DIR pbc/pbc.h
  /usr/include
  /usr/local/include
  DOC "Directory containing PBC headers"
)
mark_as_advanced(PBC_INCLUDE_DIR)

FIND_LIBRARY( PBC_LIBRARY
  NAMES pbc
  PATHS /usr/lib
        /usr/local/lib
	/usr/lib/x86_64-linux-gnu
)

mark_as_advanced(PBC_LIBRARY)

# handle the QUIETLY and REQUIRED arguments and set CURL_FOUND to TRUE if
# all listed variables are TRUE

  if ( NOT PBC_INCLUDE_DIR OR NOT PBC_LIBRARY )
#    if ( PBC_REQUIRED )
      message( FATAL_ERROR "PBC is required. Set PBC_DIR" )
#    endif ( PBC_REQUIRED )
  else ( NOT PBC_INCLUDE_DIR OR NOT PBC_LIBRARY )
    set( PBC_FOUND 1 )
    mark_as_advanced( PBC_FOUND )
  endif ( NOT PBC_INCLUDE_DIR OR NOT PBC_LIBRARY )


if(PBC_FOUND)
  set(PBC_LIBRARIES ${PBC_LIBRARY})
  set(PBC_INCLUDE_DIRS ${PBC_INCLUDE_DIR})
endif()
