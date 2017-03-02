#include "sources.h"
#include "project.h"
#include "third_party_dependency.h"
#include <cstdlib>


typedef mmmake::sources c;
using namespace mmmake;


c::sources(const path& p, const std::string& top_project, const std::string& bt): _path(p), _top_project(top_project), _build_type(bt), _unique_target(false), _force_static_libs(false), _two_phase_write(false),
_cxxflags(""),
_cxxflagsdebug("-O0 -g3 "),
_cxxflagsrelease("-O3 -g0"),
_cflags(""),
_cflagsdebug("-O0 -g3"),
_cflagsrelease("-O3 -g0"),
_debugsuffix("d"),
_include_tests("false")
 {

    #if __GNUC__ >= 4 || !(defined _WIN32)
    _cxxflags= "-fPIC -fvisibility=default";
    _cxxflagsdebug = "-O0 -g3 ";
    _cxxflagsrelease = "-O3 -g0";
    #else
    _cxxflags= "-fPIC /MD /EHsc";
    _cxxflagsdebug = "/ZI";
    _cxxflagsrelease = "";
    #endif


    #if __GNUC__ >= 4 || !(defined _WIN32)
    #else
    #endif

	std::string data_prefix("/usr/share/mmmake");
	from_env(data_prefix,"MMMAKE_PREFIX");
	_data_prefix=path(data_prefix);

	from_env(_cxxflags,"CMAKE_CXX_FLAGS");
	from_env(_cxxflagsdebug,"CMAKE_CXX_FLAGS_DEBUG");
	from_env(_cxxflagsrelease,"CMAKE_CXX_FLAGS_RELEASE");
	from_env(_cflags,"CMAKE_C_FLAGS");
	from_env(_cflagsdebug,"CMAKE_C_FLAGS_DEBUG");
	from_env(_cflagsrelease,"CMAKE_C_FLAGS_RELEASE");
	from_env(_debugsuffix,"DEBUG_TARGET_SUFFIX");
	from_env(_include_tests,"cbuild_include_test_projects");
	std::string exclude_targets;
	from_env(exclude_targets,"MMMAKE_EXCLUDE_TARGETS");
	std::string include_targets;
	from_env(include_targets,"MMMAKE_INCLUDE_TARGETS");
	{
	std::istringstream iss(include_targets);
	while (!iss.eof()) {
		std::string include_target;
		iss >> include_target;
		_included_targets.insert(include_target);
		std::cout << "included target: " << include_target << std::endl;
	}
	}
	{
	std::istringstream iss(exclude_targets);
	while (!iss.eof()) {
		std::string exclude_target;
		iss >> exclude_target;
		_excluded_targets.insert(exclude_target);
		std::cout << "excluded target: " << exclude_target << std::endl;
	}
	}
}

c::~sources() {
	for(projects::iterator I=_projects.begin(); I!=_projects.end(); ++I) delete I->second;
	for(third_party_dependencies::iterator I=_third_party_dependencies.begin(); I!=_third_party_dependencies.end(); ++I) delete I->second;

}

void c::load() {
	std::cout << "loading..." << std::endl;
	project& topp=const_cast<c&>(*this).get_project(_top_project);
	resolvedeps();
}

void c::set_unique_target() {
	_unique_target=true;
}
void c::set_force_static_libs() {
	_force_static_libs=true;
}

bool c::force_static_library(const project& p) {
	if (_force_static_libs) return true;
	if (!_unique_target) return false;
	return (p.get_name()!=_top_project);
}

bool c::exists_project(const std::string& name) const {
	return boost::filesystem::exists(_path / name / "project.xml");
}


project& c::get_project(const std::string& name) {
	//std::cout << "getting project: " << name << std::endl;
	static int indent=0;
	projects::iterator I=_projects.find(name);
	if (I==_projects.end()) {

		for (int i=0; i<indent; ++i) std::cout << "."; std::cout << name << std::endl;
		indent++;
		project* p=new project();
		_projects.insert(projects::value_type(name,p));
		p->set_sources(*this);

//		for (int i=0; i<indent; ++i) std::cout << " ";
//		std::cout << "targets: ";
		p->load(_path / name / "project.xml" );
//		std::cout << std::endl;

		indent--;
		return *p;
	}
	else
		return *I->second;
}

third_party_dependency& c::get_third_party_dependency(const std::string& name) {
	//std::cout << "getting project: " << name << std::endl;
	third_party_dependencies::iterator I=_third_party_dependencies.find(name);
	if (I==_third_party_dependencies.end()) {
		third_party_dependency* p=new third_party_dependency(name,"");
		_third_party_dependencies.insert(third_party_dependencies::value_type(name,p));
		p->set_sources(*this);
//		p->load(_path / name / "project.xml" );
		return *p;
	}
	else
		return *I->second;
}

void c::resolvedeps() {
	for(projects::iterator I=_projects.begin(); I!=_projects.end(); ++I) {
		I->second->resolvedeps();
	}
}

bool c::is_excluded(const std::string& target) const {
	return _excluded_targets.find(target)!=_excluded_targets.end();
}
bool c::is_included(const std::string& target) const {
	return _included_targets.find(target)!=_included_targets.end();
}

#include <fstream>

#include "third_party_dependency.h"
using namespace std;

void c::write() const {
	write_main_cmake();
	if (_two_phase_write) {
		commit_write();
	}
}

void c::write_main_cmake() const {
	path p;
	if (_two_phase_write) {
		std::cout << std::endl << "writing CMakeLists.txt.new's..." << std::endl;
		p=_path / "CMakeLists.txt.new";
	}
	else {
		std::cout << std::endl << "writing CMakeLists.txt's..." << std::endl;
		p=_path / "CMakeLists.txt";
	}
	std::ofstream os(p.string().c_str());

	os << "cmake_minimum_required(VERSION 2.6)" << endl;
	os << "project(hell)" << endl;

	os << "set(CMAKE_BUILD_TYPE " << _build_type << " CACHE STRING \"Value given by mmmake. Set through comand line.\" FORCE)" << endl;
	os << "set(INCLUDE_TEST_PROJECTS \"" << _include_tests << "\" CACHE STRING \"Value given by mmmake. Possible override though env variable.\" FORCE)" << endl;
	os << "set(CMAKE_CXX_FLAGS \"" << _cxxflags << "\" CACHE STRING \"Value given by mmmake. Possible override though env variable.\" FORCE)" << endl;
	os << "set(CMAKE_CXX_FLAGS_DEBUG \"" << _cxxflagsdebug << "\" CACHE STRING \"Value given by mmmake. Possible override though env variable.\" FORCE)" << endl;
	os << "set(CMAKE_CXX_FLAGS_RELEASE \"" << _cxxflagsrelease << "\" CACHE STRING \"Value given by mmmake. Possible override though env variable.\" FORCE)" << endl;
	os << "set(CMAKE_C_FLAGS \"" << _cflags << "\" CACHE STRING \"Value given by mmmake. Possible override though env variable.\" FORCE)" << endl;
	os << "set(CMAKE_C_FLAGS_DEBUG \"" << _cflagsdebug << "\" CACHE STRING \"Value given by mmmake. Possible override though env variable.\" FORCE)" << endl;
	os << "set(CMAKE_C_FLAGS_RELEASE \"" << _cflagsrelease << "\" CACHE STRING \"Value given by mmmake. Possible override though env variable.\" FORCE)" << endl;
	os << "set(DEBUG_TARGET_SUFFIX \"" << _debugsuffix << "\" CACHE STRING \"Value given by mmmake. Possible override here.\")" << endl;

	os << "set(PROJECTS_SRC_ROOT ${CMAKE_SOURCE_DIR})" << endl;
	os << "set(PROJECTS_BIN_ROOT ${CMAKE_BINARY_DIR})" << endl;
	os << "set(BUILD_SANDBOX ${PROJECTS_BIN_ROOT}/sandbox)" << endl;
	os << "FILE(MAKE_DIRECTORY ${BUILD_SANDBOX})" << endl;
	os << "FILE(WRITE ${BUILD_SANDBOX}/hook \"this file is for cmake to find this directory\")" << endl;
	os << "FIND_PATH(EXECUTABLE_OUTPUT_PATH hook ${BUILD_SANDBOX} )" << endl;
	os << "FIND_PATH(LIBRARY_OUTPUT_PATH hook ${BUILD_SANDBOX} )" << endl;
	os << "LINK_DIRECTORIES(${LIBRARY_OUTPUT_PATH})" << endl;
	os << "SET(CMAKE_MODULE_PATH $ENV{CMAKE_MODULE_PATH})" << endl;

	os << "if(\"${CMAKE_VERSION}\" VERSION_GREATER 3.6.1)" << endl;
	os << "               set(CMAKE_CXX_STANDARD 14)" << endl;
	os << "               set(CMAKE_CXX_STANDARD_REQUIRED ON)" << endl;
	os << "else()" << endl;
	os << "               add_definitions(-std=c++14)" << endl;
	os << "endif()" << endl;



	project& topp=const_cast<c&>(*this).get_project(_top_project);

	project::third_party_dependencies tpdeps=topp.get_all_third_party_dependencies();
	for (project::third_party_dependencies::const_iterator I=tpdeps.begin(); I!=tpdeps.end(); ++I) {
		(*I)->write_use_snippet(os);
	}

	os << endl;



	project::project_dependencies deps=topp.get_project_dependencies();
	deps.insert(&topp);
	for (project::project_dependencies::const_iterator I=deps.begin(); I!=deps.end(); ++I) {
		path p;
		{
		if (_two_phase_write) {
			p=_path / (*I)->get_name() / "CMakeLists.txt.new";
		}
		else {
			p=_path / (*I)->get_name() / "CMakeLists.txt";
		}
		std::ofstream prj_os(p.string().c_str());
		(*I)->write_cmake(prj_os);
		}
		os << "add_subdirectory(" << (*I)->get_name() << ")" << endl;
	}

}

void c::read_file(const path& file, std::list<std::string>& lines) const {
	std::string line;
	std::ifstream infile(file.string().c_str(), std::ios_base::in);
	while (getline(infile, line)) {
	    lines.push_back(line);
	}
}


bool c::identical(const path& file1, const path& file2) const {
	std::list<std::string> lines1;
	read_file(file1,lines1);

	std::list<std::string> lines2;
	read_file(file2,lines2);

	if (lines1.size()!=lines2.size()) return false;

	std::list<std::string>::const_iterator I1=lines1.begin();
	std::list<std::string>::const_iterator I2=lines2.begin();
	while (I1!=lines1.end()) {
		if ((*I1)!=(*I2)) return false;		
		++I1; ++I2;
	}
	return true;
}

void c::commit_file(const path& source, const path& target) const {
	bool write=true;

	if (boost::filesystem::exists(target)) {
		if (identical(source,target)) {
			write=false;
		}
		else {
			write=true;
			boost::filesystem::remove(target);
		}
	}
	if (write) {
		std::cout << " *written: " << target.string() << endl;
		boost::filesystem::rename(source,target);
	}
	else {
		boost::filesystem::remove(source);
	}
}


void c::commit_write() const {
	std::cout << "commiting CMakeLists.txt files:" << endl;
	///only touches the target file if it is different, to avoid confuse the cmake and make program and make them think they have to recompile the code when it actually hasn't changed
	path source=_path / "CMakeLists.txt.new";
	path target=_path / "CMakeLists.txt";
	commit_file(source,target);


	project& topp=const_cast<c&>(*this).get_project(_top_project);

	project::project_dependencies deps=topp.get_project_dependencies();
	deps.insert(&topp);
	for (project::project_dependencies::const_iterator I=deps.begin(); I!=deps.end(); ++I) {
		path source=_path / (*I)->get_name() / "CMakeLists.txt.new";
		path target=_path / (*I)->get_name() / "CMakeLists.txt";
		commit_file(source,target);
	}
}


void c::from_env(std::string& var, const char* env) {
	char * val=std::getenv(env);
	if (val!=0) {
	    var=val;
	    cout << "environment variable ${" << env << "} is set to " << var << endl;
	}
	else
	    cout << "environment variable ${" << env << "} not set, defaults to " << var << endl;

}

