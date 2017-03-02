#ifndef _MMMAKE_THIRD_PARTY_DEPENDENCY_
#define _MMMAKE_THIRD_PARTY_DEPENDENCY_

#include "mmmake.h"

#include <string>
#include <iostream>
#include <set>

namespace mmmake {
using namespace std;

class sources;

class MMMAKE_EXPORT_IMPORT_POLICY third_party_dependency {
public:
	third_party_dependency(const string& name);
	virtual ~third_party_dependency();

	void add_components(const string& line);
	string get_components() const;


	inline const std::string& get_name() const { return _name; }

	void write_use_snippet(ostream&) const;
	void write_link_snippet(ostream&) const;
public:
	inline const sources& get_sources() const { return *_sources; }
	inline sources& get_sources() { return *_sources; }
	inline void set_sources(sources&s) { _sources=&s; }

private:
	sources* _sources;

	string _name;
	set<string> _components;

};



}

#endif
