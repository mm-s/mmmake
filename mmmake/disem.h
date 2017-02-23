#ifndef BMAKE_DISEM
#define BMAKE_DISEM

#include "mmmake.h"
#include <string>
namespace bmake {

struct BMAKE_EXPORT_IMPORT_POLICY disem {
	static const std::string major;
	static const std::string minor;
	static const std::string rev;

	static std::string get_version() { return major + "." + minor + "." + rev; }
};

}




#endif




