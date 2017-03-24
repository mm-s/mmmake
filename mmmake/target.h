#ifndef _MMMAKE_TARGET_
#define _MMMAKE_TARGET_

#include "mmmake.h"

#include <string>
#include <set>
#include <list>
#include <vector>
#include <iostream>
#include <libxml++/libxml++.h>
#include <boost/filesystem/operations.hpp>
#include <boost/filesystem/path.hpp>

namespace mmmake {

using namespace std;

class project;
class third_party_dependency;

class MMMAKE_EXPORT_IMPORT_POLICY target {
public:
	typedef boost::filesystem::path path;
	typedef xmlpp::Element dom_element;

	struct codegen {
//              <codegen id="jni_headers" append_path="JDKORACLE_ROOT/bin">bin/generate_jni_headers</codegen>
		string id;
		string append_path;
		string cmd;

		void gen(ostream& os) const;
	};
	vector<codegen> codegens;


	target();
	virtual ~target();

	typedef std::string definition;
	typedef std::list<definition> definitions;

	inline const std::string& get_name() const { return _name; }
	inline const project& get_project() const { return *_project; }
	inline project& get_project() { return *_project; }

	inline void set_project(project& p) { _project=&p; }


	typedef std::set<const target*> dependencies;
	typedef std::set<const third_party_dependency*> third_party_dependencies;

	bool needs_qt5() const;


	const dependencies& get_dependencies() const { return _dependencies; }
	dependencies get_all_dependencies() const;

	const third_party_dependencies& get_third_party_dependencies() const { return _third_party_dependencies; }
	third_party_dependencies get_all_third_party_dependencies() const;

	bool file_exists(const std::string& file) const;

	typedef std::set<std::string> dirs;
	dirs get_header_dirs(const path&) const;
	dirs get_cpp_dirs(const path&) const;
	std::string to_identif(const std::string&) const;
	std::string to_group(const std::string&) const;


	virtual void write_definitions(std::ostream& os) const;
	bool is_mingw() const;
	bool is_unittest() const;

	void set_unit_test() { _unit_test=true; }
public:
	void put_all_dependencies(dependencies&) const;
	void put_all_third_party_dependencies(third_party_dependencies&) const;

public:
	virtual void write_cmake(const path&) const;

	static target* create(project& parent, const dom_element& e);
	virtual void parse(project&,const dom_element&);

	void resolvedeps();

private:
	std::string _name;
	std::string _title;
	bool _unit_test;

	project* _project;  /// weak

	dependencies _dependencies;

	third_party_dependencies _third_party_dependencies;

	definitions _definitions;

private:
	struct depstr {
		std::string prj;
		std::string tgt;
	};
	typedef std::list<depstr> depstrs;
	depstrs _depstrs;

	string toolset;
};



}

#endif
