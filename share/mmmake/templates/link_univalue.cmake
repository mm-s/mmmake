include_directories(${UNIVALUE_INCLUDE})

FOREACH(LINKLIB ${UNIVALUE_LIBS})
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)
