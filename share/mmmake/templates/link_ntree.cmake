IF (NTREE_FOUND)

FOREACH(LINKLIB ${NTREE_LIBRARIES}) 
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)

ENDIF()
