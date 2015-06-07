
include_directories( ${NDDS_INCLUDE_DIRECTORIES} )
include_directories( ${NDDS_INCLUDE_DIRECTORIES}/ndds )

target_link_libraries(${prjname} ${NDDS_LIBRARIES})
#target_link_libraries(${prjname} $ENV{NDDSHOME}/lib/i86Linux2.6gcc4.1.1/libnddscore.so $ENV{NDDSHOME}/lib/i86Linux2.6gcc4.1.1/libnddscpp.so $ENV{NDDSHOME}/lib/i86Linux2.6gcc4.1.1/libnddsc.so)

