# Find ACE library and header file
# Sets
#   ACE_FOUND               to 0 or 1 depending on the result
#   ACE_INCLUDE_DIRECTORIES to directories required for using libpq
#   ACE_LIBRARIES           to libpq and any dependent libraries
# If ACE_REQUIRED is defined, then a fatal error message will be generated if libpq is not found

if ( NOT ACE_INCLUDE_DIRECTORIES OR NOT ACE_LIBRARIES OR NOT ACE_FOUND )

  if ( $ENV{ACE_ROOT} )
    file( TO_CMAKE_PATH "$ENV{ACE_ROOT}" _ACE_DIR )
  endif ( $ENV{ACE_ROOT} )

  find_library( ACE_LIBRARIES
    NAMES ACE
    PATHS
      /usr/local/lib
      /usr/lib
      $ENV{ACE_ROOT}/lib
      ${_ACE_DIR}
      ${_ACE_DIR}/lib
      /usr/local/lib
      /usr/lib
    NO_DEFAULT_PATH
  )

  find_path( ACE_INCLUDE_DIRECTORIES
    NAMES ace/Active_Map_Manager_T.h
    PATHS
      ${_ACE_DIR}
      $ENV{ACE_ROOT}
      ${_ACE_DIR}/include
      ${CMAKE_INSTALL_PREFIX}/include
      /usr/local/include
      /usr/include
    NO_DEFAULT_PATH
  )

  if ( NOT ACE_INCLUDE_DIRECTORIES OR NOT ACE_LIBRARIES ) 
    if ( ACE_REQUIRED )
      message( FATAL_ERROR "ACE is required. Set ACE_ROOT" )
    endif ( ACE_REQUIRED )
  else ( NOT ACE_INCLUDE_DIRECTORIES OR NOT ACE_LIBRARIES ) 
    set( ACE_FOUND 1 )
    mark_as_advanced( ACE_FOUND )
  endif ( NOT ACE_INCLUDE_DIRECTORIES OR NOT ACE_LIBRARIES )

endif ( NOT ACE_INCLUDE_DIRECTORIES OR NOT ACE_LIBRARIES OR NOT ACE_FOUND )

mark_as_advanced( FORCE ACE_INCLUDE_DIRECTORIES )
mark_as_advanced( FORCE ACE_LIBRARIES )

