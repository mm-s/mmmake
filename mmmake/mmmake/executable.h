#ifndef _BMAKE_EXECUTABLE_
#define _BMAKE_EXECUTABLE_

#include "mmmake.h"
#include "target.h"

#include <string>

namespace bmake {


class BMAKE_EXPORT_IMPORT_POLICY executable: public target {
	typedef target B;
public:
	virtual void write_cmake(const path&) const;

	virtual void write_definitions(std::ostream& os) const;

};



}

#endif
