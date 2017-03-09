IF (NOT CRYPTOPP_FOUND)
include_directories( ${CRYPTOPP_INCLUDE_PATH} )
ENDIF( NOT CRYPTOPP_FOUND )


target_link_libraries(${prjname} ${CRYPTOPP_LIBRARIES})
