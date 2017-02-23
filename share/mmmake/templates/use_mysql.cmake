
#include_directories(/usr/include/postgresql)

FIND_PACKAGE(MySQL REQUIRED)
include_directories( ${MYSQL_INCLUDE_DIR} )

