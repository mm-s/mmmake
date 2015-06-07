#include "third_party_dependency.h"
#include "sources.h"

typedef bmake::third_party_dependency c;


c::third_party_dependency(const std::string& name): _name(name), _sources(0) {
}

c::~third_party_dependency() {
}

#include <sstream>
#include <fstream>


void c::write_use_snippet(std::ostream& os) const {
	os << std::endl;
	os << "#use snippet for " << _name << std::endl;
	os << "#------------------------------------------------------------------------------" << std::endl;
	std::ostringstream oss;
	oss << "use_" << _name << ".cmake";
	std::ifstream ifs( (_sources->get_prefix() / "templates" / oss.str()).string().c_str() );
	if (!ifs) {
		std::ostringstream oss2;
		oss2 << "unable to find template " << oss.str();
		std::cerr << "unable to find template " << oss.str() << ". You need to have " << _name << " development libraries installed in your system." << std::endl;
		throw oss2.str().c_str();
	}
	char line[1000];
	while (!ifs.eof()) {
		ifs.getline(line,999);
		os << line << std::endl;
	}
	os << std::endl;
	os << "#------------------------------------------------------------------------------" << std::endl;
	os << std::endl;
}

void c::write_link_snippet(std::ostream& os) const {
	os << std::endl;
	os << "#link snippet for " << _name;
	os << "#------------------------------------------------------------------------------" << std::endl;
	std::ostringstream oss;
	oss << "link_" << _name << ".cmake";
	std::ifstream ifs( (_sources->get_prefix() / "templates" / oss.str()).string().c_str() );
	if (!ifs) {
		std::ostringstream oss2;
		oss2 << "unable to find template " << oss.str();
		std::cerr << "unable to find template " << oss.str() << std::endl;
		throw oss2.str().c_str();
	}
	char line[1000];
	while (!ifs.eof()) {
		ifs.getline(line,999);
		os << line << std::endl;
	}
	os << std::endl;
	os << "#------------------------------------------------------------------------------" << std::endl;
	os << std::endl;
}
