SET(MMMAKE_STATIC_LINK $ENV{MMMAKE_SINGLE_TARGET})
SET(MMMAKE_STATIC_LINK_DEUCE $ENV{MMMAKE_FORCE_STATIC_LIBS})

IF(MMMAKE_STATIC_LINK)
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

find_package( Boost 1.36.0 COMPONENTS ${MMAKE_COMPONENTS} REQUIRED)

IF(MMMAKE_STATIC_LINK)
else()
	add_definitions(-DBOOST_ALL_DYN_LINK)
	add_definitions(-DBOOST_FILESYSTEM_VERSION=3)
endif()

if(Boost_FOUND)
include_directories( ${Boost_INCLUDE_DIRS} )
link_directories( ${Boost_LIBRARY_DIRS} )
endif()
