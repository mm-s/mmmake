# - Try to find LibXml2pp
# Once done this will define
#
#  LIBXMLPP_FOUND - system has LibXml2
#  LIBXMLPP_INCLUDE_DIR - the LibXml2 include directory
#  LIBXMLPP_LIBRARIES - the libraries needed to use LibXml2
#  LIBXMLPP_DEFINITIONS - Compiler switches required for using LibXml2
#

#IF (NOT LIBXML2_FOUND)
#FIND_PACKAGE(LibXml2 REQUIRED)
#ENDIF( NOT LIBXML2_FOUND )

IF (LIBXMLPP_INCLUDE_DIR AND LIBXMLPP_LIBRARIES)
   # in cache already
   SET(LibXmlPP_FIND_QUIETLY TRUE)
ENDIF (LIBXMLPP_INCLUDE_DIR AND LIBXMLPP_LIBRARIES)

#IF (NOT WIN32)
#   # use pkg-config to get the directories and then use these values
#   # in the FIND_PATH() and FIND_LIBRARY() calls
#   INCLUDE(UsePkgConfig)
#   PKGCONFIG(libxml++-2.6 _LibXmlPPIncDir _LibXmlPPLinkDir _LibXmlPPLinkFlags _LibXmlPPCflags)
#   SET(LIBXMLPP_DEFINITIONS ${_LibXmlPPCflags})
#ENDIF (NOT WIN32)

#FOREACH(LINKLIB ${_LibXmlPPIncDir} ) 
#message (${LINKLIB})
#ENDFOREACH(LINKLIB)

EXEC_PROGRAM(gcc ARGS -dumpmachine OUTPUT_VARIABLE TRIPLET)

FIND_PATH(LIBXMLPP_MAIN_INCLUDE_DIR libxml++/libxml++.h
   PATHS
   /usr/include
   c:/GTK/include
   PATH_SUFFIXES libxml++-2.6
   )
FIND_PATH(LIBXMLPP_LIB_INCLUDE_DIR libxml++config.h
   PATHS
   /usr/lib
   /usr/lib/${TRIPLET}
#   /usr/lib/x86_64-linux-gnu
   c:/GTK/lib
   PATH_SUFFIXES libxml++-2.6/include
   )
FIND_PATH(LIBXMLPP_GLIBMM_MAIN_INCLUDE_DIR glibmm/value_basictypes.h
   PATHS
   /usr/include
   c:/GTK/include
   PATH_SUFFIXES glibmm-2.4
   )
FIND_PATH(LIBXMLPP_GLIB_LIB_INCLUDE_DIR glibconfig.h
   PATHS
   /usr/lib
#   /usr/lib/x86_64-linux-gnu
   /usr/lib/${TRIPLET}
   c:/GTK/lib
   PATH_SUFFIXES glib-2.0/include
   )


FIND_PATH(LIBXMLPP_GLIBMM_LIB_INCLUDE_DIR glibmmconfig.h
   PATHS
   /usr/lib
#   /usr/lib/i386-linux-gnu
#   /usr/lib/x86_64-linux-gnu
   /usr/lib/${TRIPLET}

   c:/GTK/lib
   PATH_SUFFIXES glibmm-2.4/include
   )
FIND_PATH(LIBXMLPP_GLIB_MAIN_INCLUDE_DIR glib.h
   PATHS
   /usr/include
   c:/GTK/include
   PATH_SUFFIXES glib-2.0
   )
FIND_PATH(LIBXMLPP_GLIB_LIB_INCLUDE_DIR glibconfig.h
   PATHS
   /usr/lib
   c:/GTK/lib
   /usr/lib/${TRIPLET}
#   /usr/lib/i386-linux-gnu
#   /usr/lib/x86_64-linux-gnu
   PATH_SUFFIXES glib-2.0/include
   )
FIND_PATH(LIBXMLPP_SIGCpp_MAIN_INCLUDE_DIR sigc++/sigc++.h
   PATHS
   /usr/include
   c:/GTK/include
   PATH_SUFFIXES sigc++-2.0
   )
FIND_PATH(LIBXMLPP_SIGCpp_LIB_INCLUDE_DIR sigc++config.h
   PATHS
   /usr/lib
   c:/GTK/lib
   /usr/lib/${TRIPLET}
#   /usr/lib/i386-linux-gnu
#   /usr/lib/x86_64-linux-gnu
   PATH_SUFFIXES sigc++-2.0/include
   )
FIND_PATH(LIBXML2_INCLUDE_DIR libxml/parser.h
   PATHS
   /usr/include
   c:/GTK/include
   $ENV{ATTDEPENDENCIESROOT}/GTK/include
   /sw/include
   PATH_SUFFIXES libxml2
   )

SET(LIBXMLPP_INCLUDE_DIRS
${LIBXMLPP_MAIN_INCLUDE_DIR}
${LIBXMLPP_LIB_INCLUDE_DIR}
${LIBXML2_INCLUDE_DIR}
${LIBXMLPP_GLIBMM_MAIN_INCLUDE_DIR}
${LIBXMLPP_GLIBMM_LIB_INCLUDE_DIR}
${LIBXMLPP_GLIB_MAIN_INCLUDE_DIR}
${LIBXMLPP_GLIB_LIB_INCLUDE_DIR}
${LIBXMLPP_SIGCpp_MAIN_INCLUDE_DIR}
${LIBXMLPP_SIGCpp_LIB_INCLUDE_DIR}
)

#FOREACH(LINKLIB ${LIBXMLPP_INCLUDE_DIRS} ) 
#message (${LINKLIB})
#ENDFOREACH(LINKLIB)

if (MSVC90)
   SET (MSVC_COMPILER "90")
endif (MSVC90)
if (MSVC80)
   SET (MSVC_COMPILER "80")
endif (MSVC80)



FIND_LIBRARY(LIBXMLPP_LIBS NAMES xml++-2.6 libxml++-2.6 xml++-vc${MSVC_COMPILER}-2_6
   PATHS
   /usr/lib
   /usr/lib/${TRIPLET}
   c:/GTK/lib
   )
FIND_LIBRARY(LIBXML2_LIBS NAMES xml2 libxml2
   PATHS
   /usr/lib
   /usr/lib/${TRIPLET}
   c:/GTK/lib
   )
FIND_LIBRARY(LIBGLIBMM_LIBS NAMES glibmm-2.4 libglibmm-2.4 glibmm-vc${MSVC_COMPILER}-2_4
   PATHS
   /usr/lib
   /usr/lib/${TRIPLET}
   c:/GTK/lib
   )
FIND_LIBRARY(LIBGLIB_LIBS NAMES glib-2.0 libglib-2.0 glib-vc${MSVC_COMPILER}-2_0
   PATHS
   /usr/lib
   /usr/lib/${TRIPLET}
   c:/GTK/lib
   )
FIND_LIBRARY(LIBGOBJECT_LIBS NAMES gobject-2.0 libgobject-2.0
   PATHS
   /usr/lib
   /usr/lib/${TRIPLET}
   c:/GTK/lib
   )
FIND_LIBRARY(LIBSIGC_LIBS NAMES sigc-2.0 libsigc-2.0 sigc-vc${MSVC_COMPILER}-2_0
   PATHS
   /usr/lib
   /usr/lib/${TRIPLET}
   c:/GTK/lib
   )
FIND_LIBRARY(LIBXML2_LIBS NAMES xml2
   PATHS
   /usr/lib
   /usr/lib/${TRIPLET}
   c:/GTK/lib
   )

SET(LIBXMLPP_LIBRARIES
${LIBXMLPP_LIBS}
${LIBXML2_LIBS}
${LIBGLIB_LIBS}
${LIBGLIBMM_LIBS}
${LIBGOBJECT_LIBS}
${LIBSIGC_LIBS}
)

IF (LIBXMLPP_INCLUDE_DIRS AND LIBXMLPP_LIBRARIES)
   SET(LIBXMLPP_FOUND TRUE)
ELSE (LIBXMLPP_INCLUDE_DIRS AND LIBXMLPP_LIBRARIES)
   SET(LIBXMLPP_FOUND FALSE)
ENDIF (LIBXMLPP_INCLUDE_DIRS AND LIBXMLPP_LIBRARIES)

IF (LIBXMLPP_FOUND)
   IF (NOT LibXmlPP_FIND_QUIETLY)
      MESSAGE(STATUS "Found LibXml++: ${LIBXMLPP_LIBRARIES}")
   ENDIF (NOT LibXmlPP_FIND_QUIETLY)
ELSE (LIBXMLPP_FOUND)
   IF (LibXmlPP_FIND_REQUIRED)
      MESSAGE(SEND_ERROR "Could NOT find LibXml++")
   ENDIF (LibXmlPP_FIND_REQUIRED)
ENDIF (LIBXMLPP_FOUND)

MARK_AS_ADVANCED(LIBXMLPP_INCLUDE_DIRS LIBXMLPP_LIBRARIES)

