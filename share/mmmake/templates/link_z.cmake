IF (Z_FOUND)

FOREACH(LINKLIB ${Z_LIBRARIES}) 
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)

ENDIF()