# Find XMLRPCC library and header file
# Sets
#   XMLRPCC_FOUND               to 0 or 1 depending on the result
#   XMLRPCC_INCLUDE_DIRECTORIES to directories required for using libpq
#   XMLRPCC_LIBRARIES           to libpq and any dependent libraries
# If XMLRPCC_REQUIRED is defined, then a fatal error message will be generated if not found

if ( NOT XMLRPCC_INCLUDE_DIRECTORIES OR NOT XMLRPCC_LIBRARIES OR NOT XMLRPCC_FOUND )

  if ( $ENV{XMLRPCC_DIR} )
    file( TO_CMAKE_PATH "$ENV{XMLRPCC_DIR}" _XMLRPCC_DIR )
  endif ( $ENV{XMLRPCC_DIR} )

  find_library( XMLRPCC_XMLPARSE_LIBRARY NAMES xmlrpc_xmlparse
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/xmlrpc/lib
      /usr/local/lib
      /usr/lib
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )
  find_library( XMLRPCC_XMLRPC_LIBRARY NAMES xmlrpc
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/XMLRPCC/lib
      /usr/local/lib
      /usr/lib
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )
  find_library( XMLRPCC_XMLRPCXX_LIBRARY NAMES xmlrpc++
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/xmlrpc/lib
      /usr/local/lib
      /usr/lib
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )
  find_library( XMLRPCC_XMLRPC_CPP_LIBRARY NAMES xmlrpc_cpp
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/xmlrpc/lib
      /usr/local/lib
      /usr/lib
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )
  find_library( XMLRPCC_XMLTOK_LIBRARY NAMES xmlrpc_xmltok
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/xmlrpc/lib
      /usr/local/lib
      /usr/lib
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )
  find_library( XMLRPCC_CLIENT_LIBRARY NAMES xmlrpc_client
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/XMLRPCC/lib
      /usr/local/lib
      /usr/lib
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )
  find_library( XMLRPCC_CLIENTXX_LIBRARY NAMES xmlrpc_client++
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/XMLRPCC/lib
      /usr/local/lib
      /usr/lib
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )
  find_library( XMLRPCC_UTIL_LIBRARY NAMES xmlrpc_util
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/XMLRPCC/lib
      /usr/local/lib
      /usr/lib
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )
  find_library( XMLRPCC_CURL_LIBRARY NAMES curl
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/XMLRPCC/lib
      /usr/local/lib
      /usr/lib
      /usr/lib/x86_64-linux-gnu
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )
  find_library( XMLRPCC_SERVER_LIBRARY NAMES xmlrpc_server
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/XMLRPCC/lib
      /usr/local/lib
      /usr/lib
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )
  find_library( XMLRPCC_SERVERXX_LIBRARY NAMES xmlrpc_server++
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/XMLRPCC/lib
      /usr/local/lib
      /usr/lib
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )
  find_library( XMLRPCC_SERVER_ABYSS_LIBRARY NAMES xmlrpc_server_abyss
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/XMLRPCC/lib
      /usr/local/lib
      /usr/lib
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )
  find_library( XMLRPCC_ABYSS_LIBRARY NAMES xmlrpc_abyss
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/XMLRPCC/lib
      /usr/local/lib
      /usr/lib
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )
  find_library( XMLRPCC_PTHREAD_LIBRARY NAMES pthread
      PATHS
      ${_XMLRPCC_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/lib
      /usr/lib
      /usr/lib/x86_64-linux-gnu
      ${_XMLRPCC_DIR}
      $ENV{ATTDEPENDENCIESROOT}/lib
    NO_DEFAULT_PATH
  )

SET(XMLRPCC_LIBRARIES
${XMLRPCC_XMLPARSE_LIBRARY}
${XMLRPCC_XMLRPC_LIBRARY}
${XMLRPCC_XMLRPCXX_LIBRARY}
${XMLRPCC_XMLRPC_CPP_LIBRARY}
${XMLRPCC_XMLTOK_LIBRARY}
${XMLRPCC_CLIENT_LIBRARY}
${XMLRPCC_CLIENTXX_LIBRARY}
${XMLRPCC_UTIL_LIBRARY}
${XMLRPCC_CURL_LIBRARY}
${XMLRPCC_SERVER_LIBRARY}
${XMLRPCC_SERVERXX_LIBRARY}
${XMLRPCC_ABYSS_LIBRARY}
${XMLRPCC_SERVER_ABYSS_LIBRARY}
${XMLRPCC_PTHREAD_LIBRARY}
)


  find_path( XMLRPCC_INCLUDE_DIRECTORIES
    NAMES xmlrpc-c/config.h
    PATHS
      ${_XMLRPCC_DIR}
      ${_XMLRPCC_DIR}/include
      ${CMAKE_INSTALL_PREFIX}/include
      /usr/local/xmlrpc/include
      /usr/local/include
      /usr/include
      /usr/include/xmlrpc
      $ENV{ATTDEPENDENCIESROOT}/include
    NO_DEFAULT_PATH
  )

  if ( NOT XMLRPCC_INCLUDE_DIRECTORIES OR NOT XMLRPCC_LIBRARIES ) 

  message(${XMLRPCC_XMLPARSE_LIBRARY})
  message(${XMLRPCC_XMLRPC_LIBRARY})
  message(${XMLRPCC_XMLRPCXX_LIBRARY})
  message(${XMLRPCC_XMLRPC_CPP_LIBRARY})
  message(${XMLRPCC_XMLTOK_LIBRARY})
  message(${XMLRPCC_CLIENT_LIBRARY})
  message(${XMLRPCC_CLIENTXX_LIBRARY})
  message(${XMLRPCC_UTIL_LIBRARY})
  message(${XMLRPCC_CURL_LIBRARY})
  message(${XMLRPCC_SERVER_LIBRARY})
  message(${XMLRPCC_SERVERXX_LIBRARY})
  message(${XMLRPCC_ABYSS_LIBRARY})
  message(${XMLRPCC_SERVER_ABYSS_LIBRARY})
  message(${XMLRPCC_PTHREAD_LIBRARY})


    if ( XMLRPCC_REQUIRED )
      message( FATAL_ERROR "XMLRPCC is required. Set XMLRPCC_DIR" )
    endif ( XMLRPCC_REQUIRED )
  else ( NOT XMLRPCC_INCLUDE_DIRECTORIES OR NOT XMLRPCC_LIBRARIES ) 
    set( XMLRPCC_FOUND 1 )
    mark_as_advanced( XMLRPCC_FOUND )
  endif ( NOT XMLRPCC_INCLUDE_DIRECTORIES OR NOT XMLRPCC_LIBRARIES )

endif ( NOT XMLRPCC_INCLUDE_DIRECTORIES OR NOT XMLRPCC_LIBRARIES OR NOT XMLRPCC_FOUND )

mark_as_advanced( FORCE XMLRPCC_INCLUDE_DIRECTORIES )
mark_as_advanced( FORCE XMLRPCC_LIBRARIES )

