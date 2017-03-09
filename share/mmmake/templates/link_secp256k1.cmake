include_directories(${SECP256K1_INCLUDE})

FOREACH(LINKLIB ${SECP256K1_LIBS})
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)
