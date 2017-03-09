
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


