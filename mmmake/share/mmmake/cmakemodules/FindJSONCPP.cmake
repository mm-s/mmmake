# - Find jsoncpp - debian package libjsoncpp-dev
# Find the native JSONCPP headers and libraries.
#
#  JSONCPP_INCLUDE_DIRS   - where to find
#  JSONCPP_LIBRARIES      - List of libraries when using it.
#  JSONCPP_FOUND          - True if found.

find_path(JSONCPP_INCLUDE_DIR jsoncpp/json/json.h
  /usr/include
  /usr/local/include
  DOC "Directory containing JSONCPP headers"
)
mark_as_advanced(JSONCPP_INCLUDE_DIR)

FIND_LIBRARY( JSONCPP_LIBRARY
  NAMES jsoncpp
  PATHS /usr/lib
        /usr/local/lib
)

mark_as_advanced(JSONCPP_LIBRARY)

# handle the QUIETLY and REQUIRED arguments and set CURL_FOUND to TRUE if
# all listed variables are TRUE

  if ( NOT JSONCPP_INCLUDE_DIR OR NOT JSONCPP_LIBRARY )
#    if ( JSONCPP_REQUIRED )
      message( FATAL_ERROR "JSONCPP is required. Set JSONCPP_DIR" )
#    endif ( JSONCPP_REQUIRED )
  else ( NOT JSONCPP_INCLUDE_DIR OR NOT JSONCPP_LIBRARY )
    set( JSONCPP_FOUND 1 )
    mark_as_advanced( JSONCPP_FOUND )
  endif ( NOT JSONCPP_INCLUDE_DIR OR NOT JSONCPP_LIBRARY )


if(JSONCPP_FOUND)
  set(JSONCPP_LIBRARIES ${JSONCPP_LIBRARY})
  set(JSONCPP_INCLUDE_DIRS ${JSONCPP_INCLUDE_DIR})
endif()
