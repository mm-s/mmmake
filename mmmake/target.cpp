#include "target.h"
#include "third_party_dependency.h"
#include "project.h"


typedef mmmake::target c;

using namespace mmmake;

c::target(): _project(0), _unit_test(false) {
}

c::~target() {
}


c::dependencies c::get_all_dependencies() const {
	dependencies ds;
	put_all_dependencies(ds);
	return ds;
}

void c::put_all_dependencies(dependencies& d) const {
	for (dependencies::const_iterator I=_dependencies.begin(); I!=_dependencies.end(); ++I) {
		d.insert(*I);
		(*I)->put_all_dependencies(d);
	}
}

c::third_party_dependencies c::get_all_third_party_dependencies() const {
	third_party_dependencies ds;
	put_all_third_party_dependencies(ds);
	return ds;
}

bool c::needs_qt5() const {
	for (third_party_dependencies::const_iterator I=_third_party_dependencies.begin(); I!=_third_party_dependencies.end(); ++I) {
		if ((*I)->get_name()=="qt5") return true;
	}
    return false;
}

void c::put_all_third_party_dependencies(third_party_dependencies& d) const {
	for (third_party_dependencies::const_iterator I=_third_party_dependencies.begin(); I!=_third_party_dependencies.end(); ++I) {
		d.insert(*I);
	}

	for (dependencies::const_iterator I=_dependencies.begin(); I!=_dependencies.end(); ++I) {
		(*I)->put_all_third_party_dependencies(d);
	}

}


#include <boost/filesystem.hpp>

c::dirs c::get_header_dirs(const path& p) const {
	std::string spath=p.string();
	dirs s;

	boost::filesystem::recursive_directory_iterator end;
	for (boost::filesystem::recursive_directory_iterator I=boost::filesystem::recursive_directory_iterator(p); I!=end;) {
		std::string parent_name=I->path().parent_path().filename().string();
		if (parent_name==".svn") { I.pop(); continue; }
		if (parent_name==".git") { I.pop(); continue; }
		if (parent_name.find("_off",0)!=std::string::npos) { I.pop(); continue; }
		std::string ext=I->path().extension().string();
		if (ext==".h" || ext==".hpp") {
			if (spath==I->path().parent_path().string()) {
				s.insert("");
			}
			else {
				s.insert(I->path().parent_path().string().substr(spath.size()+1));
			}
		}
		++I;
	}
	return s;
}

c::dirs c::get_cpp_dirs(const path& p) const {
	std::string spath=p.string();
	dirs s;
	boost::filesystem::recursive_directory_iterator end;
	for (boost::filesystem::recursive_directory_iterator I=boost::filesystem::recursive_directory_iterator(p); I!=end;) {
		std::string parent_name=I->path().parent_path().filename().string();
		if (parent_name==".svn") { I.pop(); continue; }
		if (parent_name==".git") { I.pop(); continue; }
		if (parent_name.find("_off",0)!=std::string::npos) { I.pop(); continue; }
		std::string ext=I->path().extension().string();
		if (ext==".c" || ext==".cpp" || ext==".cxx") {
			if (spath==I->path().parent_path().string()) {
				s.insert("");
			}
			else {
				s.insert(I->path().parent_path().string().substr(spath.size()+1));
			}
		}
		++I;
	}
	return s;
}

#include "sources.h"
bool c::file_exists(const std::string& file) const {
	return boost::filesystem::exists(get_project().get_sources().get_path() / get_project().get_name() / get_name() / file);
}

std::string c::to_group(const std::string& s) const {
	std::string phrase=s;
	std::string sought="/";
	std::string replacement="\\\\";
	size_t pos=std::string::npos;
	while((pos=phrase.find(sought))!= std::string::npos)
		phrase.replace(pos, sought.size(), replacement);
	return phrase;
}

std::string c::to_identif(const std::string& s) const {
	typedef	std::map<std::string,std::string> smap;
	static smap _smap;
	static int i=0;
	smap::const_iterator I=_smap.find(s);
	if (I==_smap.end()) {
		++i;
		std::ostringstream oss;
		oss << "dir_" << i;
		_smap.insert(smap::value_type(s,oss.str()));
		return oss.str();
	}
	else
		return I->second;
}

#include <fstream>
using namespace std;

void c::write_definitions(std::ostream& os) const {
	for (definitions::const_iterator I=_definitions.begin(); I!=_definitions.end(); ++I)
		os << "add_definitions(" << *I << ")" << endl;
}

bool c::is_mingw() const {
	return true; //TODO NICOLAS
}

bool c::is_unittest() const {
	if (get_name()=="test") return true;
	return _unit_test;
}


void c::write_cmake(const path& prj_path) const {

	assert(!get_name().empty());
	path here=prj_path / get_name();
	std::ofstream os((here / "CMakeLists.txt").string().c_str());

	os << "#mmmake" << endl;

/*
	third_party_dependencies tpdeps=get_all_third_party_dependencies();
	for (project::third_party_dependencies::const_iterator I=tpdeps.begin(); I!=tpdeps.end(); ++I) {
		(*I)->write_use_snippet(os);
	}
	os << endl;
*/


	if (is_unittest()) {
		if (get_name()!="test") {
		os << "set(prjname " << get_name() << ")" << endl;
		}
		if (file_exists("config.cpp.template")) {
			os << "set(DO_NOT_MODIFY_WARNING \"File automatically generated by CMAKE. Do not modify by hand or you will lose your changes.\")" << endl;
			os << "configure_file(config.cpp.template ${CMAKE_CURRENT_SOURCE_DIR}/config.cpp)" << endl;
			os << endl;
		}
		if (file_exists("developers.h.template")) {
			os << "if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/developers.h)" << endl;
			os << "" << endl;
			os << "else (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/developers.h)" << endl;
			os << "	configure_file(developers.h.template ${CMAKE_CURRENT_SOURCE_DIR}/developers.h)" << endl;
			os << "endif (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/developers.h)" << endl;
		}
	}
	else {
		os << "set(prjname " << get_name() << ")" << endl;
	}

	dirs headers=get_header_dirs(here);
	for (dirs::const_iterator I=headers.begin(); I!=headers.end(); ++I) {
		std::string dir=*I;
		std::string identif=to_identif(dir);
		if (dir.empty()) {
			os <<  "file (GLOB " << identif << "_headers *.h *.hpp)" << endl;
		}
		else {
			os <<  "file (GLOB " << identif << "_headers " << dir << "/*.h " << dir << "/*.hpp)" << endl;  /**/
		}
		os << "SOURCE_GROUP(\"" << to_group(dir) << "\" FILES ${" << identif << "_headers})" << endl;
	}


	dirs sources=get_cpp_dirs(here);
	for (dirs::const_iterator I=sources.begin(); I!=sources.end(); ++I) {
		std::string dir=*I;
		std::string identif=to_identif(dir);
		if (dir.empty()) {
			os <<  "file (GLOB " << identif << "_sources *.cpp *.c)" << endl;
		}
		else {
			os <<  "file (GLOB " << identif << "_sources " << dir << "/*.cpp " << dir << "/*.c "  << dir << "/*.cxx)" << endl;  /**/
		}
		os << "SOURCE_GROUP(\"" << to_group(dir) << "\" FILES ${" << identif << "_sources})" << endl;
	}


	for (auto& i:codegens) {  //code generators
		i.gen(os);
	}


	os << "set(all_headers ";
	for (dirs::const_iterator I=headers.begin(); I!=headers.end(); ++I) {
		std::string dir=*I;
		std::string identif=to_identif(dir);
		os << "${" << identif << "_headers} ";
	}
	os << ")" << endl;

	os << "set(all_sources ";
	for (dirs::const_iterator I=sources.begin(); I!=sources.end(); ++I) {
		std::string dir=*I;
		std::string identif=to_identif(dir);
		os << "${" << identif << "_sources} ";
	}
	os << ")" << endl;
	os << endl;

	for (definitions::const_iterator I=_definitions.begin(); I!=_definitions.end(); ++I) {
		os << "add_definitions(" << (*I) << ")" << endl;
	}

    if (needs_qt5()) {
        os << "set(CMAKE_INCLUDE_CURRENT_DIR ON)" << endl;
        os << "set(CMAKE_AUTOMOC ON)" << endl;
        os << "set(CMAKE_AUTOUIC ON)" << endl;
    }

	write_definitions(os);

	os << "set_target_properties(${prjname} PROPERTIES DEBUG_OUTPUT_NAME ${prjname}${DEBUG_TARGET_SUFFIX})" << endl;
	os << "set_target_properties(${prjname} PROPERTIES RELEASE_OUTPUT_NAME ${prjname})" << endl;
//	os << "set_property(TARGET ${prjname} PROPERTY CXX_STANDARD 14)" << endl;

	{
		project::project_dependencies pds;
		dependencies td=get_all_dependencies();
		for (dependencies::const_iterator I=td.begin(); I!=td.end(); ++I) {
			pds.insert(&(*I)->get_project());
		}

		for (project::project_dependencies::const_iterator I=pds.begin(); I!=pds.end(); ++I) {
			os << "include_directories(${PROJECTS_SRC_ROOT}/" << (*I)->get_name() << ")" << endl;
		}
	}


	{
		dependencies deps;
		dependencies td=get_all_dependencies();
		for (dependencies::const_iterator I=td.begin(); I!=td.end(); ++I) {
			os << "target_link_libraries(${prjname} debug " << (*I)->get_name() << "${DEBUG_TARGET_SUFFIX} optimized " << (*I)->get_name() << ")" << endl;
			os << "if (WIN32)" << endl;
			os << " STRING(TOUPPER " << (*I)->get_name() << " LIB)" << endl;
			os << " add_definitions(-D${LIB}_IMPORT_SYMBOLS)" << endl;
			os << "endif(WIN32)" << endl;
			os << "" << endl;
		}

	}

	{
		third_party_dependencies deps;
		third_party_dependencies td=get_all_third_party_dependencies();
		for (third_party_dependencies::const_iterator I=td.begin(); I!=td.end(); ++I) {
			(*I)->write_link_snippet(os);
		}

	}
}

void c::codegen::gen(ostream& os) const {
	if (cmd.empty()) return;
	os << "# code generator id: " << id << endl;
	if (!append_path.empty()) {
		os << "set( path $ENV{PATH}:" << append_path << "  )" << endl;
		os << "set( ENV{PATH} ${path} )" << endl;
	}
	os << "get_filename_component(PARENT_DIR ${CMAKE_CURRENT_LIST_DIR} DIRECTORY)" << endl;
	os << "execute_process(COMMAND ${PARENT_DIR}/" << cmd << "  )" << endl;
}


#include "shared_library.h"
#include "static_library.h"
#include "executable.h"
#include "toolset.h"
#include "sources.h"



c* c::create(mmmake::project& parent,const dom_element& e) {
	string toolst=e.get_attribute_value("toolset");
//	string name=e.get_attribute_value("name");
	c* instance=0;
	if (!toolst.empty()) {
		instance=new mmmake::toolset();
	}
	else {
		string format=e.get_attribute_value("format");
		if (format=="executable") {
			instance=new executable();
			string ut=e.get_attribute_value("unit_test");
			if (ut=="yes" || ut=="true") {
				instance->set_unit_test();
			}
		}
		else {
			if (parent.get_sources().force_static_library(parent)) {
					instance=new static_library();
			}
			else {
				if (format=="shared library") {
					instance=new shared_library();
				}
				else if (format=="static library") {
					instance=new static_library();
				}
			}
		}
	}
	if (instance==0) return 0;
	return instance;
}

void c::resolvedeps() {
	for (depstrs::iterator I=_depstrs.begin(); I!=_depstrs.end(); ++I) {
		target& t=get_project().get_sources().get_project(I->prj).get_target(I->tgt);
		_dependencies.insert(&t);
	}
}

void c::parse(mmmake::project& parent, const dom_element& e) {
	set_project(parent);

	_name=e.get_attribute_value("name");
	{
		xmlpp::Node::NodeList ch=e.get_children("title");
		for (xmlpp::Node::NodeList::const_iterator J=ch.begin(); J!=ch.end(); ++J) {
			xmlpp::Element* el=dynamic_cast<xmlpp::Element*>(*J);
			if (el!=0) {
				if (el->has_child_text()) {
					_title=el->get_child_text()->get_content();
				}
			}
		}
	}

	{
		xmlpp::Node::NodeList ch=e.get_children("definitions");
		for (xmlpp::Node::NodeList::const_iterator J=ch.begin(); J!=ch.end(); ++J) {
			xmlpp::Element* el=dynamic_cast<xmlpp::Element*>(*J);
			if (el!=0) {
				if (el->has_child_text()) {
					_definitions.push_back(el->get_child_text()->get_content());
				}
			}
		}
	}

	{
		xmlpp::Node::NodeList ch=e.get_children("codegen");
		for (xmlpp::Node::NodeList::const_iterator J=ch.begin(); J!=ch.end(); ++J) {
			xmlpp::Element* el=dynamic_cast<xmlpp::Element*>(*J);
			if (el!=0) {
//		<codegen id="jni_headers" append_path="JDKORACLE_ROOT/bin">bin/generate_jni_headers</codegen>
				codegen cdg;
				cdg.id=el->get_attribute_value("id");
				cdg.append_path=el->get_attribute_value("append_path");
                                if (el->has_child_text()) {
                                        cdg.cmd=el->get_child_text()->get_content();
                                }
				codegens.push_back(cdg);
			}
		}
	}

	{
		xmlpp::Node::NodeList ch=e.get_children("dependencies");
		for (xmlpp::Node::NodeList::const_iterator J=ch.begin(); J!=ch.end(); ++J) {
			xmlpp::Element* el=dynamic_cast<xmlpp::Element*>(*J);
			if (el!=0) {
				{
					xmlpp::Node::NodeList ch=el->get_children("prj");
					for (xmlpp::Node::NodeList::const_iterator J=ch.begin(); J!=ch.end(); ++J) {
						xmlpp::Element* el2=dynamic_cast<xmlpp::Element*>(*J);
						if (el2!=0) {
							std::string name=el2->get_attribute_value("name");
							std::string tgt=el2->get_attribute_value("target");
							if (get_project().get_sources().exists_project(name)) {
								depstr d;
								d.prj=name;
								d.tgt=tgt;
								_depstrs.push_back(d);
								get_project().get_sources().get_project(name);  //force load project
							}
							else {
								std::cout << "[X] " << parent.get_name() << "." << _name << std::endl;
								std::string phrase=tgt;
								std::string sought="_";
								std::string replacement="-";
								size_t pos=std::string::npos;
								while((pos=phrase.find(sought))!= std::string::npos)
									phrase.replace(pos, sought.size(), replacement);
								tgt=phrase;
								//if (tgt.size() < 3) tgt = tgt + "-alt";
								third_party_dependency& t=parent.get_sources().get_third_party_dependency(tgt);
								_third_party_dependencies.insert(&t);
							}
						}
					}
				}
				{
					xmlpp::Node::NodeList ch=el->get_children("library");
					for (xmlpp::Node::NodeList::const_iterator J=ch.begin(); J!=ch.end(); ++J) {
						xmlpp::Element* el2=dynamic_cast<xmlpp::Element*>(*J);
						if (el2!=0) {
							string name=el2->get_attribute_value("name");
							third_party_dependency& t=parent.get_sources().get_third_party_dependency(name);
							string components=el2->get_attribute_value("components");
							t.add_components(components);
							_third_party_dependencies.insert(&t);
						}
					}
				}
			}
		}
	}
}


void c::write_project_cmake(ostream& os) const {
     os << "add_subdirectory(" << get_name() << ")" << endl;
}

