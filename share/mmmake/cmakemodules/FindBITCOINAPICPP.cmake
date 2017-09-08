# - Find bitcoinapipp - debian package libjsoncpp-dev
# Find the native BITCOINAPICPP headers and libraries.
#
#  BITCOINAPICPP_INCLUDE_DIRS   - where to find
#  BITCOINAPICPP_LIBRARIES      - List of libraries when using it.
#  BITCOINAPICPP_FOUND          - True if found.

find_path(BITCOINAPICPP_INCLUDE_DIR bitcoinapi/bitcoinapi.h
  /usr/include
  /usr/local/include
  DOC "Directory containing BITCOINAPICPP headers"
)
mark_as_advanced(BITCOINAPICPP_INCLUDE_DIR)

FIND_LIBRARY( BITCOINAPICPP_LIBRARY
  NAMES bitcoinapi
  PATHS /usr/lib
        /usr/local/lib
)

mark_as_advanced(BITCOINAPICPP_LIBRARY)

# handle the QUIETLY and REQUIRED arguments and set CURL_FOUND to TRUE if
# all listed variables are TRUE

  if ( NOT BITCOINAPICPP_INCLUDE_DIR OR NOT BITCOINAPICPP_LIBRARY )
#    if ( BITCOINAPICPP_REQUIRED )
      message( FATAL_ERROR "BITCOINAPICPP is required. Set BITCOINAPICPP_DIR" )
#    endif ( BITCOINAPICPP_REQUIRED )
  else ( NOT BITCOINAPICPP_INCLUDE_DIR OR NOT BITCOINAPICPP_LIBRARY )
    set( BITCOINAPICPP_FOUND 1 )
    mark_as_advanced( BITCOINAPICPP_FOUND )
  endif ( NOT BITCOINAPICPP_INCLUDE_DIR OR NOT BITCOINAPICPP_LIBRARY )


if(BITCOINAPICPP_FOUND)
  set(BITCOINAPICPP_LIBRARIES ${BITCOINAPICPP_LIBRARY})
  set(BITCOINAPICPP_INCLUDE_DIRS ${BITCOINAPICPP_INCLUDE_DIR})
endif()
