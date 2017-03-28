#ifndef _MMMAKE_SHARED_LIBRARY_
#define _MMMAKE_SHARED_LIBRARY_

#include "mmmake.h"
#include "target.h"
#include <iostream>

#include <string>

namespace mmmake {
using namespace std;

class MMMAKE_EXPORT_IMPORT_POLICY shared_library: public target {
	typedef target b;
public:

	virtual void write_cmake(const path&) const;

	virtual void write_definitions(ostream& os) const;

};



}

#endif
