# - Find fastcgi++ - download, build and install from sources at http://www.nongnu.org/fastcgipp/; there is not yet a debian package
# Find the native headers and libraries.
#
#  FCGIPP_INCLUDE_DIRS   - where to find
#  FCGIPP_LIBRARIES      - List of libraries when using it.
#  FCGIPP_FOUND          - True if found.

find_path(FCGIPP_INCLUDE_DIR fastcgi++/manager.hpp
  /usr/include
  /usr/local/include
  DOC "Directory containing FCGIPP headers"
)
mark_as_advanced(FCGIPP_INCLUDE_DIR)

#message( FATAL_ERROR ${FCGIPP_INCLUDE_DIR} )
#-lfastcgipp -lboost_thread -lboost_system -pthread -lboost_date_time
FIND_LIBRARY( FCGIPP_LIBRARY
  NAMES fastcgipp
  PATHS /usr/lib
        /usr/local/lib
	/usr/lib/i386-linux-gnu
)

mark_as_advanced(FCGIPP_LIBRARY)

# handle the QUIETLY and REQUIRED arguments and set Found to TRUE if
# all listed variables are TRUE

  if ( NOT FCGIPP_INCLUDE_DIR OR NOT FCGIPP_LIBRARY )
#    if ( FCGIPP_REQUIRED )
      message( FATAL_ERROR "FCGIPP is required. Set FCGIPP_DIR. download, build and install from sources at http://www.nongnu.org/fastcgipp/" )
#    endif ( FCGIPP_REQUIRED )
  else ( NOT FCGIPP_INCLUDE_DIR OR NOT FCGIPP_LIBRARY )
    set( FCGIPP_FOUND 1 )
    mark_as_advanced( FCGIPP_FOUND )
  endif ( NOT FCGIPP_INCLUDE_DIR OR NOT FCGIPP_LIBRARY )


if(FCGIPP_FOUND)
  set(FCGIPP_LIBRARIES ${FCGIPP_LIBRARY})
  set(FCGIPP_INCLUDE_DIRS ${FCGIPP_INCLUDE_DIR})
endif()
