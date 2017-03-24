#include "toolset.h"

typedef mmmake::toolset c;

using namespace std;

void c::write_cmake(const path& p) const {
	b::write_cmake(p);
}

void c::write_definitions(std::ostream& os) const {
	os << "execute_process(COMMAND " << cmd << ")" << endl;
}


void c::parse(mmmake::project& parent, const dom_element& e) {
	b::parse(parent,e);
        cmd=e.get_attribute_value("cmd");
}

