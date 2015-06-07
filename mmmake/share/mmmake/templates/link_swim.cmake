#target_link_libraries(${prjname} debug ${SWIM_LIBRARIES_D} optimized ${SWIM_LIBRARIES})

# ${SWIM_LIBRARIES_D}  deactivated since 64bit distribution of integrasys libs doesn't include debug binaries
target_link_libraries(${prjname} debug ${SWIM_LIBRARIES} optimized ${SWIM_LIBRARIES})


