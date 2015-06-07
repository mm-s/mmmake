# Find SWIM library and header file
# Sets
#   SWIM_FOUND               to 0 or 1 depending on the result
#   SWIM_INCLUDE_DIRECTORIES to directories required for using SWIM
#   SWIM_LIBRARIES           to libSWIM and any dependent libraries
# If SWIM_REQUIRED is defined, then a fatal error message will be generated if libSWIM is not found


if ( NOT SWIM_INCLUDE_DIRECTORIES OR NOT SWIM_LIBRARIES OR NOT SWIM_FOUND )

  if ( $ENV{ATL_HOME} )
    file( TO_CMAKE_PATH "$ENV{ATL_HOME}" _SWIM_DIR )
    set( _SWIM_DIR $ENV{ATL_HOME} )
  endif ( $ENV{ATL_HOME} )

SET(LIBSEARCHPATHS 
      ${_SWIM_DIR}/lib
      ${_SWIM_DIR}/SWIM_API/lib
      $ENV{ATL_HOME}/SWIM_API/lib	
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/lib
      /usr/lib
      /opt/swim/SWIM_API/lib
) 

  find_library( SWIM_CORE_CPP
    NAMES SWIM_CPP
    PATHS ${LIBSEARCHPATHS} 
    NO_DEFAULT_PATH
  )

  find_library( LIBSWIM_NS
    NAMES SWIM_NS
    PATHS ${LIBSEARCHPATHS} 
    NO_DEFAULT_PATH
  )
  find_library( LIBSWIM_NSD
    NAMES SWIM_NSd
    PATHS ${LIBSEARCHPATHS} 
    NO_DEFAULT_PATH
  )


  find_library( SWIM_CORE_CPPD
    NAMES SWIM_CPPd
    PATHS ${LIBSEARCHPATHS} 
    NO_DEFAULT_PATH
  )


set (SWIM_LIBRARIES
${SWIM_CORE_CPP}
${LIBSWIM_NS}
)

set (SWIM_LIBRARIES_D
${SWIM_CORE_CPPD}
${LIBSWIM_NSD}
)

  find_path( SWIM_INCLUDE_DIRECTORIES
    NAMES SwimConfig_PS.h 
    PATHS
      ${_SWIM_DIR}
      ${_SWIM_DIR}/include
      ${_SWIM_DIR}/SWIM_API/include/CPP
      $ENV{ATL_HOME}/SWIM_API/include/CPP
      ${CMAKE_INSTALL_PREFIX}/include
      /usr/local/include
      /usr/include
      /opt/swim/SWIM_API/include/CPP
    NO_DEFAULT_PATH
  )


  if ( NOT SWIM_INCLUDE_DIRECTORIES OR NOT SWIM_LIBRARIES ) 
    if ( SWIM_REQUIRED )
      message( FATAL_ERROR "SWIM is required. Set ATL_HOME" )
    endif ( SWIM_REQUIRED )
  else ( NOT SWIM_INCLUDE_DIRECTORIES OR NOT SWIM_LIBRARIES ) 
    set( SWIM_FOUND 1 )
    mark_as_advanced( SWIM_FOUND )
  endif ( NOT SWIM_INCLUDE_DIRECTORIES OR NOT SWIM_LIBRARIES )

endif ( NOT SWIM_INCLUDE_DIRECTORIES OR NOT SWIM_LIBRARIES OR NOT SWIM_FOUND )

mark_as_advanced( FORCE SWIM_INCLUDE_DIRECTORIES )
mark_as_advanced( FORCE SWIM_LIBRARIES )


