#ifndef _BMAKE_SHARED_LIBRARY_
#define _BMAKE_SHARED_LIBRARY_

#include "mmmake.h"
#include "target.h"
#include <iostream>

#include <string>

namespace bmake {


class BMAKE_EXPORT_IMPORT_POLICY shared_library: public target {
	typedef target B;
public:

	virtual void write_cmake(const path&) const;

	virtual void write_definitions(std::ostream& os) const;

};



}

#endif
