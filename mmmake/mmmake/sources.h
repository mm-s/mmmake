#ifndef _BMAKE_SOURCES_
#define _BMAKE_SOURCES_

#include "mmmake.h"

#include <string>
#include <map>
#include <list>
#include <set>
#include <boost/filesystem/operations.hpp>
#include <boost/filesystem/path.hpp>
#include <iostream>

namespace bmake {

class project;
class third_party_dependency;

class BMAKE_EXPORT_IMPORT_POLICY sources {
public:
	typedef boost::filesystem::path path;
	typedef std::map<std::string, project*> projects;
	typedef std::map<std::string, third_party_dependency*> third_party_dependencies;

	sources(const path&, const std::string& top_project, const std::string& build_type);
	virtual ~sources();


	void load();
	void write() const;
private:
	void write_main_cmake() const;
	void commit_write() const;
	void commit_file(const path&, const path&) const;
	bool identical(const path& file1, const path& file2) const;
	void read_file(const path& file, std::list<std::string>& lines) const;
	

private:
	project* load(const std::string& name);

	void resolvedeps();
public:
	bool exists_project(const std::string& name) const;
	project& get_project(const std::string& name);
	third_party_dependency& get_third_party_dependency(const std::string& name);

	const path& get_prefix() const { return _data_prefix; }
	const path& get_path() const { return _path; }

	bool force_static_library(const project&);

	bool is_excluded(const std::string& target) const;
	bool is_included(const std::string& target) const;

	void set_two_phase_write() { _two_phase_write=true; }
private:
	std::string _build_type;

	path _path;

	projects _projects;

	path _data_prefix;

public:
	static void from_env(std::string& var, const char* env);

	void set_unique_target();
	void set_force_static_libs();
private:
	bool _unique_target;
	bool _force_static_libs;

	std::string _top_project;

	std::string _cxxflags;
	std::string _cxxflagsdebug;
	std::string _cxxflagsrelease;
	std::string _cflags;
	std::string _cflagsdebug;
	std::string _cflagsrelease;
	std::string _debugsuffix;
	std::string _include_tests;

	typedef std::set<std::string> excluded_targets;
	excluded_targets _excluded_targets;

public:
	typedef std::set<std::string> included_targets;
	included_targets _included_targets;

private:
	third_party_dependencies _third_party_dependencies;

private:
	bool _two_phase_write;
};



}

#endif
