
FOREACH(LINKLIB ${Qt5Widgets_LIBRARIES}) 
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)

