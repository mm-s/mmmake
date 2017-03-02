#ifndef MMMAKE_DISEM
#define MMMAKE_DISEM

#include "mmmake.h"
#include <string>
namespace mmmake {

struct MMMAKE_EXPORT_IMPORT_POLICY disem {
	static const std::string major;
	static const std::string minor;
	static const std::string rev;

	static std::string get_version() { return major + "." + minor + "." + rev; }
};

}




#endif




