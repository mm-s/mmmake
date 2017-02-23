# Find NDDS library and header file
# Sets
#   NDDS_FOUND               to 0 or 1 depending on the result
#   NDDS_INCLUDE_DIRECTORIES to directories required for using ndds
#   NDDS_LIBRARIES           to libndds and any dependent libraries
# If NDDS_REQUIRED is defined, then a fatal error message will be generated if libndds is not found


if ( NOT NDDS_INCLUDE_DIRECTORIES OR NOT NDDS_LIBRARIES OR NOT NDDS_FOUND )

  if ( $ENV{NDDSHOME} )
    file( TO_CMAKE_PATH "$ENV{NDDSHOME}" _NDDS_DIR )
    set( _NDDS_DIR $ENV{NDDSHOME} )
  endif ( $ENV{NDDSHOME} )


  find_library( NDDS_NDDSCORE
    NAMES nddscore
    PATHS
      ${_NDDS_DIR}/lib
      ${_NDDS_DIR}/lib/i86Linux2.6gcc4.1.1
      ${_NDDS_DIR}/lib/x64Linux2.6gcc4.1.1
      $ENV{NDDSHOME}/lib/i86Linux2.6gcc4.1.1
      $ENV{NDDSHOME}/lib/x64Linux2.6gcc4.1.1
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/lib
      /usr/lib
      ~/lib/rti/ndds43/lib
    NO_DEFAULT_PATH
  )

  find_library( NDDS_NDDSC
    NAMES nddsc
    PATHS
      ${_NDDS_DIR}/lib
      ${_NDDS_DIR}/lib/i86Linux2.6gcc4.1.1
      ${_NDDS_DIR}/lib/x64Linux2.6gcc4.1.1
      $ENV{NDDSHOME}/lib/i86Linux2.6gcc4.1.1
      $ENV{NDDSHOME}/lib/x64Linux2.6gcc4.1.1
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/lib
      /usr/lib
      ~/lib/rti/ndds43/lib
    NO_DEFAULT_PATH
  )

  find_library( NDDS_NDDSCPP
    NAMES nddscpp
    PATHS
      ${_NDDS_DIR}/lib
      ${_NDDS_DIR}/lib/i86Linux2.6gcc4.1.1
      ${_NDDS_DIR}/lib/x64Linux2.6gcc4.1.1
      $ENV{NDDSHOME}/lib/i86Linux2.6gcc4.1.1
      $ENV{NDDSHOME}/lib/x64Linux2.6gcc4.1.1
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/lib
      /usr/lib
      ~/lib/rti/ndds43/lib
    NO_DEFAULT_PATH
  )


set (NDDS_LIBRARIES
${NDDS_NDDSCORE}
${NDDS_NDDSC}
${NDDS_NDDSCPP}
)

  find_path( NDDS_INCLUDE_DIRECTORIES
    NAMES ndds/ndds_cpp.h 
    PATHS
      ${_NDDS_DIR}
      ${_NDDS_DIR}/include
      $ENV{NDDSHOME}/include
      ${CMAKE_INSTALL_PREFIX}/include
      /usr/local/include
      /usr/include
      ~/lib/rti/ndds43/
    NO_DEFAULT_PATH
  )


  if ( NOT NDDS_INCLUDE_DIRECTORIES OR NOT NDDS_LIBRARIES ) 
    if ( NDDS_REQUIRED )
      message( FATAL_ERROR "NDDS is required. Set NDDSHOME" )
    endif ( NDDS_REQUIRED )
  else ( NOT NDDS_INCLUDE_DIRECTORIES OR NOT NDDS_LIBRARIES ) 
    set( NDDS_FOUND 1 )
    mark_as_advanced( NDDS_FOUND )
  endif ( NOT NDDS_INCLUDE_DIRECTORIES OR NOT NDDS_LIBRARIES )

endif ( NOT NDDS_INCLUDE_DIRECTORIES OR NOT NDDS_LIBRARIES OR NOT NDDS_FOUND )

mark_as_advanced( FORCE NDDS_INCLUDE_DIRECTORIES )
mark_as_advanced( FORCE NDDS_LIBRARIES )


