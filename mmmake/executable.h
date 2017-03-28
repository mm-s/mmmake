#ifndef _MMMAKE_EXECUTABLE_
#define _MMMAKE_EXECUTABLE_

#include "mmmake.h"
#include "target.h"

#include <string>

namespace mmmake {


class MMMAKE_EXPORT_IMPORT_POLICY executable: public target {
	typedef target b;
public:
	virtual void write_cmake(const path&) const;

	virtual void write_definitions(std::ostream& os) const;

};



}

#endif
