# - Find curlpp - debian package libcurlpp-dev
# Find the native CURLPP headers and libraries.
#
#  CURLPP_INCLUDE_DIRS   - where to find
#  CURLPP_LIBRARIES      - List of libraries when using it.
#  CURLPP_FOUND          - True if found.

find_path(CURLPP_INCLUDE_DIR curlpp/cURLpp.hpp
  /usr/include
  /usr/local/include
  DOC "Directory containing CURLPP headers"
)
mark_as_advanced(CURLPP_INCLUDE_DIR)

FIND_LIBRARY( CURLPP_LIBRARY
  NAMES curlpp
  PATHS /usr/lib
        /usr/local/lib
	/usr/lib/i386-linux-gnu/
	/usr/lib/x86_64-linux-gnu/

)

mark_as_advanced(CURLPP_LIBRARY)

# handle the QUIETLY and REQUIRED arguments and set CURL_FOUND to TRUE if
# all listed variables are TRUE

  if ( NOT CURLPP_INCLUDE_DIR OR NOT CURLPP_LIBRARY )
#    if ( CURLPP_REQUIRED )
      message( FATAL_ERROR "CURLPP is required. Set CURLPP_DIR" )
#    endif ( CURLPP_REQUIRED )
  else ( NOT CURLPP_INCLUDE_DIR OR NOT CURLPP_LIBRARY )
    set( CURLPP_FOUND 1 )
    mark_as_advanced( CURLPP_FOUND )
  endif ( NOT CURLPP_INCLUDE_DIR OR NOT CURLPP_LIBRARY )


if(CURLPP_FOUND)
  set(CURLPP_LIBRARIES ${CURLPP_LIBRARY})
  set(CURLPP_INCLUDE_DIRS ${CURLPP_INCLUDE_DIR})
endif()
