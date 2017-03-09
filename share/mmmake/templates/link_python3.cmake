FOREACH(INCDIR ${PYTHON3_INCLUDE})
include_directories(${INCDIR})
ENDFOREACH(INCDIR)


target_link_libraries(${prjname} ${PYTHON3_LIBS})



