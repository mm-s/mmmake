#ifndef _BMAKE_PROJECT_
#define _BMAKE_PROJECT_

#include "mmmake.h"

#include "target.h"
#include <string>
#include <iostream>
#include <list>
#include <boost/filesystem/operations.hpp>
#include <boost/filesystem/path.hpp>
#include <iostream>
#include <libxml++/libxml++.h>

namespace bmake {

class shared_library;
class executable;
class sources;

class BMAKE_EXPORT_IMPORT_POLICY project {
public:
	typedef boost::filesystem::path path;
	typedef xmlpp::Element dom_element;
public:
	project();
	virtual ~project();

	typedef std::map<std::string,target*> targets;
	typedef std::list<const executable*> executables;
	typedef std::list<const shared_library*> shared_libraries;

	typedef target::dependencies dependencies;
	typedef target::third_party_dependencies third_party_dependencies;

	typedef std::set<const project*> project_dependencies;
	project_dependencies get_project_dependencies() const;


	executables get_executables() const;
	shared_libraries get_shared_libraries() const;
	const targets& get_targets() const { return _targets; }


	void load(const path&);

	dependencies get_all_dependencies() const;

	third_party_dependencies get_all_third_party_dependencies() const;

	const std::string& get_name() const { return _name; }
	target& get_target(const std::string&);

	void write_cmake(std::ostream&) const;

	void resolvedeps();
private:
	void put_all_dependencies(dependencies&) const;
	void put_all_third_party_dependencies(third_party_dependencies&) const;

private:
	void parse(const dom_element& root);

public:
	inline const sources& get_sources() const { return *_sources; }
	inline sources& get_sources() { return *_sources; }
	inline void set_sources(sources&s) { _sources=&s; }

private:
	sources* _sources;

	std::string _name;
	std::string _title;
	std::string _major;
	std::string _minor;
	targets _targets;

};



}

#endif
