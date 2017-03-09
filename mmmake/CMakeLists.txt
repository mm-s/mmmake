#mmmake
set(prjname mmmake)
file (GLOB dir_1_headers *.h *.hpp)
SOURCE_GROUP("" FILES ${dir_1_headers})
file (GLOB dir_1_sources *.cpp *.c)
SOURCE_GROUP("" FILES ${dir_1_sources})
set(all_headers ${dir_1_headers} )
set(all_sources ${dir_1_sources} )

add_executable(${prjname} ${all_headers} ${all_sources})

set_target_properties(${prjname} PROPERTIES DEBUG_OUTPUT_NAME ${prjname}${DEBUG_TARGET_SUFFIX})
set_target_properties(${prjname} PROPERTIES RELEASE_OUTPUT_NAME ${prjname})

#link snippet for xmlpp
#------------------------------------------------------------------------------
FOREACH(INCDIR ${LIBXMLPP_INCLUDE_DIRS} ) 
include_directories(${INCDIR})
ENDFOREACH(INCDIR)
FOREACH(LINKLIB ${LIBXMLPP_LIBRARIES}) 
target_link_libraries(${prjname} ${LINKLIB})
ENDFOREACH(LINKLIB)
#------------------------------------------------------------------------------


#link snippet for boost
#------------------------------------------------------------------------------

IF(MMMAKE_STATIC_LINK)
else()
        add_definitions(-DBOOST_ALL_DYN_LINK)
        add_definitions(-DBOOST_FILESYSTEM_VERSION=3)
endif()

if(Boost_FOUND)
include_directories( ${Boost_INCLUDE_DIRS} )
link_directories( ${Boost_LIBRARY_DIRS} )
endif()


target_link_libraries(${prjname} ${Boost_LIBRARIES})


#------------------------------------------------------------------------------

