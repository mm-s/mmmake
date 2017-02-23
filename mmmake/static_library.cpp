#include "static_library.h"


typedef bmake::static_library c;


void c::write_cmake(const path& p) const {
	B::write_cmake(p);
}


using namespace std;
void c::write_definitions(std::ostream& os) const {
	os << endl;
	os << "STRING(TOUPPER ${prjname} PRJNAME)" << endl;
	os << "add_definitions(-D${PRJNAME}_EXPORT_SYMBOLS) " << endl;
	os << "" << endl;
	os << "add_library(${prjname} STATIC ${all_headers} ${all_sources})" << endl;
	os << "" << endl;

//	os << "IF (MINGW)" << endl;
//	os << "SET_TARGET_PROPERTIES(${prjname} PROPERTIES LINK_FLAGS \"-Wl,--output-def,${LIBRARY_OUTPUT_PATH}/lib/${prjname}.def\")" << endl;
//	os << "ENDIF (MINGW)" << endl;


}
