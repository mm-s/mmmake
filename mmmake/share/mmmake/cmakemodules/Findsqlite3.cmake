# - Try to find sqlite3
# Once done, this will define
#
#  sqlite3_FOUND - system has sqlite3
#  sqlite3_INCLUDE_DIRS - the sqlite3 include directories
#  sqlite3_LIBRARIES - link these to use sqlite3

include(LibFindMacros)

# Dependencies
#libfind_package(sqlite3 dependencia)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(sqlite3_PKGCONF sqlite3)

# Include dir
find_path(sqlite3_INCLUDE_DIR
  NAMES sqlite3.h
  PATHS ${sqlite3_PKGCONF_INCLUDE_DIRS}
)

# Finally the library itself
find_library(sqlite3_LIBRARY
  NAMES sqlite3
  PATHS ${sqlite3_PKGCONF_LIBRARY_DIRS}
)

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this lib depends on.
set(sqlite3_PROCESS_INCLUDES sqlite3_INCLUDE_DIR)
set(sqlite3_PROCESS_LIBS sqlite3_LIBRARY)
libfind_process(sqlite3)
 
