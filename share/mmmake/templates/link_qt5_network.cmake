
FOREACH(LINKLIB ${Qt5Network_LIBRARIES}) 
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)

