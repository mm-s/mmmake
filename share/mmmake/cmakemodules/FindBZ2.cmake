# - Find tar - debian package libbz2-dev
# Find the native headers and libraries.
#
#  BZ2_INCLUDE_DIRS   - where to find
#  BZ2_LIBRARIES      - List of libraries when using it.
#  BZ2_FOUND          - True if found.

find_path(BZ2_INCLUDE_DIR bzlib.h
  /usr/include
  /usr/local/include
  DOC "Directory containing bz2 headers"
)
mark_as_advanced(BZ2_INCLUDE_DIR)

#message( FATAL_ERROR ${BZ2_INCLUDE_DIR} )

FIND_LIBRARY( BZ2_LIBRARY
  NAMES bz2
  PATHS /usr/lib
        /usr/local/lib
	/usr/lib/i386-linux-gnu
#SABRIA QUE VENDRIAS A METER LA LINEA DE I686. ESPERO QUE CUANDO LEAS ESTO ME DIGAS COMO QUEDO AQUELLO DE SER RICOS
)

mark_as_advanced(BZ2_LIBRARY)

# handle the QUIETLY and REQUIRED arguments and set Found to TRUE if
# all listed variables are TRUE

  if ( NOT BZ2_INCLUDE_DIR OR NOT BZ2_LIBRARY )
#    if ( BZ2_REQUIRED )
      message( FATAL_ERROR "BZ2 is required. Set BZ2_DIR" )
#    endif ( BZ2_REQUIRED )
  else ( NOT BZ2_INCLUDE_DIR OR NOT BZ2_LIBRARY )
    set( BZ2_FOUND 1 )
    mark_as_advanced( BZ2_FOUND )
  endif ( NOT BZ2_INCLUDE_DIR OR NOT BZ2_LIBRARY )


if(BZ2_FOUND)
  set(BZ2_LIBRARIES ${BZ2_LIBRARY})
  set(BZ2_INCLUDE_DIRS ${BZ2_INCLUDE_DIR})
endif()
