#bmake snippet from file share/bmake/templates/link_gtkmm.cmake
FOREACH(LINKLIB ${GTKMM_LIBS})
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)
