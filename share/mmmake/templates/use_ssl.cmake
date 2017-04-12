FIND_PACKAGE(OpenSSL REQUIRED)
#include_directories(${SSL_INCLUDE})
IF( NOT OPENSSL_FOUND ) #SSL_FOUND )
  MESSAGE( SEND_ERROR "OpenSSL is mandatory" )
ENDIF(NOT OPENSSL_FOUND )
#ENDIF(NOT SSL_FOUND )

#IF( OPENSSL_FOUND ) #SSL_FOUND )
#  MESSAGE( "Found OpenSSL ${OPENSSL_VERSION}: ${OPENSSL_INCLUDE_DIR}" )
#  FOREACH(LINKLIB ${OPENSSL_LIBRARIES})
#    MESSAGE("    lib: ${LINKLIB}")
#  ENDFOREACH(LINKLIB)

# ``OPENSSL_INCLUDE_DIR``
#   The OpenSSL include directory.
# ``OPENSSL_CRYPTO_LIBRARY``
#   The OpenSSL crypto library.
# ``OPENSSL_SSL_LIBRARY``
#   The OpenSSL SSL library.
# ``OPENSSL_LIBRARIES``
#   All OpenSSL libraries.
# ``OPENSSL_VERSION``

#ENDIF( OPENSSL_FOUND )


