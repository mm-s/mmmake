FOREACH(LINKLIB ${SSL_LIBS})
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)
