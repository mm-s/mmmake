FIND_PACKAGE(CRYPTOPP REQUIRED)

IF( NOT CRYPTOPP_FOUND )
  MESSAGE( SEND_ERROR "CRYPTO++ is mandatory" )
ENDIF( NOT CRYPTOPP_FOUND )

