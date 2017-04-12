#include_directories(${SSL_INCLUDE})
include_directories(${OPENSSL_INCLUDE_DIR})


#FOREACH(LINKLIB ${SSL_LIBS})
FOREACH(LINKLIB ${OPENSSL_LIBRARIES})

target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)
