#ifndef _MMMAKE_TOOLSET_
#define _MMMAKE_TOOLSET_

#include "mmmake.h"
#include "target.h"

#include <string>

namespace mmmake {


class MMMAKE_EXPORT_IMPORT_POLICY toolset: public target {
	typedef target b;
public:
	virtual void write_cmake(const path&) const override;

	virtual void write_definitions(std::ostream& os) const override;

        virtual void parse(project&,const dom_element&) override;

	std::string cmd;
};



}

#endif
