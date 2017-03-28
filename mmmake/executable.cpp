#include "executable.h"

typedef mmmake::executable c;

using namespace std;
void c::write_cmake(const path& p) const {
	b::write_cmake(p);


}

using namespace std;

void c::write_definitions(std::ostream& os) const {
	b::write_definitions(os);
	if (get_name()=="test") {
		os << "SET(prjname ${prjname}_test)" << endl;
	}
	os << "add_executable(${prjname} ${all_headers} ${all_sources})" << endl;
	os << endl;
}

