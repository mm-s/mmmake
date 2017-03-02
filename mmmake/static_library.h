#ifndef _MMMAKE_STATIC_LIBRARY_
#define _MMMAKE_STATIC_LIBRARY_

#include "mmmake.h"
#include "target.h"
#include <iostream>

#include <string>

namespace mmmake {


class MMMAKE_EXPORT_IMPORT_POLICY static_library: public target {
	typedef target B;
public:

	virtual void write_cmake(const path&) const;

	virtual void write_definitions(std::ostream& os) const;

};



}

#endif
