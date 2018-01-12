# - Find GMP - debian package libgmp-dev libgmpxx4ldbl
# Find the native GMP headers and libraries.
#
#  GMP_INCLUDE_DIRS   - where to find
#  GMP_LIBRARIES      - List of libraries when using it.
#  GMP_FOUND          - True if found.

find_path(GMP_INCLUDE_DIR gmpxx.h
  /usr/include
  /usr/local/include
  DOC "Directory containing GMP headers"
)
mark_as_advanced(GMP_INCLUDE_DIR)

FIND_LIBRARY( GMP_LIBRARY
  NAMES gmp
  PATHS /usr/lib
        /usr/local/lib
	/usr/lib/x86_64-linux-gnu
)
FIND_LIBRARY( GMP_LIBRARYXX
  NAMES gmpxx
  PATHS /usr/lib
        /usr/local/lib
	/usr/lib/x86_64-linux-gnu
)

mark_as_advanced(GMP_LIBRARY)
mark_as_advanced(GMP_LIBRARYXX)

# handle the QUIETLY and REQUIRED arguments and set CURL_FOUND to TRUE if
# all listed variables are TRUE

  if ( NOT GMP_INCLUDE_DIR OR NOT GMP_LIBRARY )
#    if ( GMP_REQUIRED )
      message( FATAL_ERROR "GMP is required. Set GMP_DIR" )
#    endif ( GMP_REQUIRED )
  else ( NOT GMP_INCLUDE_DIR OR NOT GMP_LIBRARY )
    set( GMP_FOUND 1 )
    mark_as_advanced( GMP_FOUND )
  endif ( NOT GMP_INCLUDE_DIR OR NOT GMP_LIBRARY )


if(GMP_FOUND)
  set(GMP_LIBRARIES ${GMP_LIBRARY} ${GMP_LIBRARYXX})
  set(GMP_INCLUDE_DIRS ${GMP_INCLUDE_DIR})
endif()
