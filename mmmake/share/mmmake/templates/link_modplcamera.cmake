IF (MODULE_PL_CAMERA_FOUND)

FOREACH(LINKLIB ${MODULE_PL_CAMERA_LIBRARIES}) 
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)

ENDIF()
