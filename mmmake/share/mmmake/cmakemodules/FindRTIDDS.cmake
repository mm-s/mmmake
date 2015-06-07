# Find RTIDDS library and header file
# Sets
#   RTIDDS_FOUND               to 0 or 1 depending on the result
#   RTIDDS_INCLUDE_DIRECTORIES to directories required for using libpq
#   RTIDDS_LIBRARIES           to libpq and any dependent libraries
# If RTIDDS_REQUIRED is defined, then a fatal error message will be generated if libpq is not found

if ( NOT RTIDDS_INCLUDE_DIRECTORIES OR NOT RTIDDS_LIBRARIES OR NOT RTIDDS_FOUND )

  if ( $ENV{RTIDDS_DIR} )
    file( TO_CMAKE_PATH "$ENV{RTIDDS_DIR}" _RTIDDS_DIR )
  endif ( $ENV{RTIDDS_DIR} )

  find_library( RTIDDS_NDDSCORE
    NAMES nddscore
    PATHS
      ${_RTIDDS_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/lib
      /usr/lib
    NO_DEFAULT_PATH
  )

  find_library( RTIDDS_NDDSC
    NAMES nddsc
    PATHS
      ${_RTIDDS_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/lib
      /usr/lib
    NO_DEFAULT_PATH
  )

  find_library( RTIDDS_NDDSCPP
    NAMES nddscpp
    PATHS
      ${_RTIDDS_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/lib
      /usr/lib
    NO_DEFAULT_PATH
  )

  find_path( RTIDDS_INCLUDE_DIRECTORIES
    NAMES ndds/ndds_discovery_c.h
    PATHS
      ${_RTIDDS_DIR}/include
      ${_POSTGRES_DIR}
      ${_POSTGRES_DIR}/include
      ${CMAKE_INSTALL_PREFIX}/include
      /usr/local/pgsql/include
      /usr/local/include
      /usr/include
    NO_DEFAULT_PATH
  )

set (RTIDDS_LIBRARIES
${RTIDDS_NDDSCORE}
${RTIDDS_NDDSC}
${RTIDDS_NDDSCPP}
)

  if ( NOT RTIDDS_INCLUDE_DIRECTORIES OR NOT RTIDDS_LIBRARIES ) 
    if ( RTIDDS_REQUIRED )
      message( FATAL_ERROR "RTIDDS is required. Set RTIDDS_DIR is appropiate" )
    endif ( RTIDDS_REQUIRED )
  else ( NOT RTIDDS_INCLUDE_DIRECTORIES OR NOT RTIDDS_LIBRARIES ) 
    set( RTIDDS_FOUND 1 )
    mark_as_advanced( RTIDDS_FOUND )
  endif ( NOT RTIDDS_INCLUDE_DIRECTORIES OR NOT RTIDDS_LIBRARIES )

endif ( NOT RTIDDS_INCLUDE_DIRECTORIES OR NOT RTIDDS_LIBRARIES OR NOT RTIDDS_FOUND )

mark_as_advanced( FORCE RTIDDS_INCLUDE_DIRECTORIES )
mark_as_advanced( FORCE RTIDDS_LIBRARIES )

