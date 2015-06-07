
#FOREACH(LINKLIB ${WXW_LIBRARIES_D})
#target_link_libraries(${prjname} debug ${LINKLIB})
#ENDFOREACH(LINKLIB)
#FOREACH(LINKLIB ${WXW_LIBRARIES})
#target_link_libraries(${prjname} optimized ${LINKLIB})
#ENDFOREACH(LINKLIB) 


TARGET_LINK_LIBRARIES(${prjname} ${wxWidgets_LIBRARIES})
