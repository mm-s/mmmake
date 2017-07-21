IF (FCGIPP_FOUND)

FOREACH(LINKLIB ${FCGIPP_LIBRARIES}) 
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)
#-lboost_thread -lboost_system -pthread -lboost_date_time
SET( CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -lboost_thread -lboost_system -pthread -lboost_date_time" )
ENDIF()
