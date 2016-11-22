
FOREACH(LINKLIB ${Qt5Gui_LIBRARIES}) 
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)

