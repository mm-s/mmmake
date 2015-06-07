#ifndef _BMAKE_THIRD_PARTY_DEPENDENCY_
#define _BMAKE_THIRD_PARTY_DEPENDENCY_

#include "mmmake.h"

#include <string>
#include <iostream>

namespace bmake {

class sources;

class BMAKE_EXPORT_IMPORT_POLICY third_party_dependency {
public:
	third_party_dependency(const std::string& name);
	virtual ~third_party_dependency();

	inline const std::string& get_name() const { return _name; }

	void write_use_snippet(std::ostream&) const;
	void write_link_snippet(std::ostream&) const;
public:
	inline const sources& get_sources() const { return *_sources; }
	inline sources& get_sources() { return *_sources; }
	inline void set_sources(sources&s) { _sources=&s; }

private:
	sources* _sources;

	std::string _name;

};



}

#endif
