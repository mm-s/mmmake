# Find TAO library and header file
# Sets
#   TAO_FOUND               to 0 or 1 depending on the result
#   TAO_INCLUDE_DIRECTORIES to directories required for using libpq
#   TAO_LIBRARIES           to libpq and any dependent libraries
# If TAO_REQUIRED is defined, then a fatal error message will be generated if libpq is not found

if ( NOT TAO_INCLUDE_DIRECTORIES OR NOT TAO_LIBRARIES OR NOT TAO_FOUND )

  if ( $ENV{TAO_ROOT} )
    file( TO_CMAKE_PATH "$ENV{TAO_ROOT}" _TAO_DIR )
  endif ( $ENV{TAO_ROOT} )

  find_library( TAO_PORTABLE_SERVER
    NAMES TAO_PortableServer
    PATHS
      ${_TAO_DIR}
      ${_TAO_DIR}/lib
      $ENV{ACE_ROOT}/lib
      ${CMAKE_INSTALL_PREFIX}/bin
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/lib
      /usr/lib
    NO_DEFAULT_PATH
  )
  find_library( TAO_ANYTYPECODE
    NAMES TAO_AnyTypeCode
    PATHS
      ${_TAO_DIR}
      ${_TAO_DIR}/lib
      $ENV{ACE_ROOT}/lib
      ${CMAKE_INSTALL_PREFIX}/bin
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/lib
      /usr/lib
    NO_DEFAULT_PATH
  )
  find_library( TAO_LIB
    NAMES TAO
    PATHS
      ${_TAO_DIR}
      ${_TAO_DIR}/lib
      $ENV{ACE_ROOT}/lib
      ${CMAKE_INSTALL_PREFIX}/bin
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/lib
      /usr/lib
    NO_DEFAULT_PATH
  )
  find_library( TAO_IORTABLE
    NAMES TAO_IORTable
    PATHS
      ${_TAO_DIR}
      ${_TAO_DIR}/lib
      $ENV{ACE_ROOT}/lib
      ${CMAKE_INSTALL_PREFIX}/bin
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/lib
      /usr/lib
    NO_DEFAULT_PATH
  )

set (TAO_LIBRARIES
${TAO_PORTABLE_SERVER}
${TAO_ANYTYPECODE}
${TAO_LIB}
${TAO_IORTABLE}
)

  find_path( TAO_INCLUDES
    NAMES tao/AnyTypeCode_Adapter.h
    PATHS
      ${_TAO_DIR}
      ${_TAO_DIR}/include
      $ENV{TAO_ROOT}
      ${CMAKE_INSTALL_PREFIX}/include
      /usr/local/include
      /usr/include
    NO_DEFAULT_PATH
  )

  find_path( ACE_INCLUDES
    NAMES ace/config-all.h
    PATHS
      ${_TAO_DIR}
      ${_TAO_DIR}/include
      $ENV{ACE_ROOT}
      ${CMAKE_INSTALL_PREFIX}/include
      /usr/local/include
      /usr/include
    NO_DEFAULT_PATH
  )

## no puedo encontrar como hacer funcionar esta parte. Ningun paquete de mi distro instala el fichero Naming_Service/Naming_Service.h
#  find_path( TAO_ORB_INCLUDES
#    NAMES Naming_Service/Naming_Service.h
#    PATHS
#      ${_TAO_DIR}
#      ${_TAO_DIR}/include
#      $ENV{TAO_ROOT}
#      $ENV{TAO_ROOT}/orbsvcs	
#      ${CMAKE_INSTALL_PREFIX}/include
#      /usr/local/include
#      /usr/include
#    NO_DEFAULT_PATH
#  )

set (TAO_INCLUDE_DIRECTORIES
${TAO_INCLUDES}
${ACE_INCLUDES}
#${TAO_ORB_INCLUDES}
)

  if ( NOT TAO_INCLUDE_DIRECTORIES OR NOT TAO_LIBRARIES ) 
    if ( TAO_REQUIRED )
      message( FATAL_ERROR "TAO is required. Set TAO_DIR" )
    endif ( TAO_REQUIRED )
  else ( NOT TAO_INCLUDE_DIRECTORIES OR NOT TAO_LIBRARIES ) 
    set( TAO_FOUND 1 )
    mark_as_advanced( TAO_FOUND )
  endif ( NOT TAO_INCLUDE_DIRECTORIES OR NOT TAO_LIBRARIES )

endif ( NOT TAO_INCLUDE_DIRECTORIES OR NOT TAO_LIBRARIES OR NOT TAO_FOUND )

mark_as_advanced( FORCE TAO_INCLUDE_DIRECTORIES )
mark_as_advanced( FORCE TAO_LIBRARIES )

