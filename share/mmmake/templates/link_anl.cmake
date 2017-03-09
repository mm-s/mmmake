include_directories(${ANL_INCLUDE_DIR})

FOREACH(LINKLIB ${ANL_LIBS})
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)
