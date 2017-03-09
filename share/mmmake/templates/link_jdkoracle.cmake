include_directories(${JDKORACLE_INCLUDE})
include_directories(${JDKORACLE_ARCH_INCLUDE})

FOREACH(LINKLIB ${JDKORACLE_LIBS})
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)
