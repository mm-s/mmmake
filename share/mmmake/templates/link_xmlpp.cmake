
FOREACH(INCDIR ${LIBXMLPP_INCLUDE_DIRS} ) 
include_directories(${INCDIR})
ENDFOREACH(INCDIR)
FOREACH(LINKLIB ${LIBXMLPP_LIBRARIES}) 
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)
