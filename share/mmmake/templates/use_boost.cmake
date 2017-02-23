SET(BMAKE_STATIC_LINK $ENV{BMAKE_SINGLE_TARGET})
SET(BMAKE_STATIC_LINK_DEUCE $ENV{BMAKE_FORCE_STATIC_LIBS})

IF(BMAKE_STATIC_LINK)
	message("Using boost static libraries")
	set(Boost_USE_STATIC_LIBS ON)
else()
	message("Using boost dynamic libraries")
	set(Boost_USE_STATIC_LIBS OFF)
endif()

set(Boost_USE_MULTITHREADED ON)

IF(WIN32)
	IF(NOT CMAKE_CXX_COMPILER MATCHES "cl")
		SET(Boost_COMPILER -mgw34)
	ENDIF()
ENDIF()

#find_package( Boost 1.36.0 COMPONENTS date_time filesystem thread system program_options regex graph python REQUIRED)
find_package( Boost 1.36.0 COMPONENTS date_time filesystem thread system program_options regex graph REQUIRED)

IF(BMAKE_STATIC_LINK)
else()
	add_definitions(-DBOOST_ALL_DYN_LINK)
	add_definitions(-DBOOST_FILESYSTEM_VERSION=3)
endif()

if(Boost_FOUND)
include_directories( ${Boost_INCLUDE_DIRS} )
link_directories( ${Boost_LIBRARY_DIRS} )
endif()




