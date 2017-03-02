#include "project.h"
#include "target.h"
#include "shared_library.h"
#include "executable.h"


typedef mmmake::project c;

c::project(): _sources(0), _major("0"), _minor("1") {
}

c::~project() {
for(targets::const_iterator I=_targets.begin(); I!=_targets.end(); ++I) delete I->second;

}


c::executables c::get_executables() const {
	executables o;
	for (targets::const_iterator I=_targets.begin(); I!=_targets.end(); ++I) {
		const executable* i=dynamic_cast<const executable*>(I->second);
		if (i!=0) o.push_back(i);
	}
	return o;	
}

c::shared_libraries c::get_shared_libraries() const {
	shared_libraries o;
	for (targets::const_iterator I=_targets.begin(); I!=_targets.end(); ++I) {
		const shared_library* i=dynamic_cast<const shared_library*>(I->second);
		if (i!=0) o.push_back(i);
	}
	return o;	
}


c::dependencies c::get_all_dependencies() const {
	dependencies ds;
	put_all_dependencies(ds);
	return ds;
}

void c::put_all_dependencies(dependencies& d) const {
	for (targets::const_iterator I=_targets.begin(); I!=_targets.end(); ++I) {
		(I->second)->put_all_dependencies(d);
	}
}

c::third_party_dependencies c::get_all_third_party_dependencies() const {
	third_party_dependencies ds;
	put_all_third_party_dependencies(ds);
	return ds;
}

void c::put_all_third_party_dependencies(third_party_dependencies& d) const {
	for (targets::const_iterator I=_targets.begin(); I!=_targets.end(); ++I) {
		(I->second)->put_all_third_party_dependencies(d);
	}
}

c::project_dependencies c::get_project_dependencies() const {
	project_dependencies pds;
	dependencies td=get_all_dependencies();
	for (dependencies::const_iterator I=td.begin(); I!=td.end(); ++I) {	
		pds.insert(&(*I)->get_project());
	}
	return pds;
}




#include <fstream>
#include "sources.h"

using namespace std;
void c::write_cmake(std::ostream& os) const {
	assert(!_name.empty());
	os << "" << endl;
	os << "set(prjname " << _name << ")" << endl;
	os << "set(version 1)" << endl;
	os << "" << endl;
	os << "project(${prjname} CXX)" << endl;
	
	for (targets::const_iterator I=get_targets().begin(); I!=get_targets().end(); ++I) {
		I->second->write_cmake(get_sources().get_path() / get_name());
		os << "add_subdirectory(" << (I->second)->get_name() << ")" << endl;
	}
	
}

mmmake::target& c::get_target(const std::string& name) {
	targets::iterator I=_targets.find(name);
	if (I==_targets.end()) {
		std::cerr << "***error: target " << name << " in project " << get_name() << " not found" << std::endl;
		throw "";
	}
	return *I->second;
	
}

void c::resolvedeps() {
	for (targets::const_iterator I=_targets.begin(); I!=_targets.end(); ++I) {
		(*I->second).resolvedeps();
	}
}

void c::load(const path& filename) {
	xmlpp::DomParser parser;
	parser.set_substitute_entities(); //We just want the text to be resolved/unescaped automatically
	parser.parse_file(filename.string());
	if (parser) {
		const dom_element& root=dynamic_cast<const dom_element&>(*parser.get_document()->get_root_node());
		parse(root);
	}
	else {
		std::ostringstream oss;
		oss << "Unable to parse: " << filename.string();
		throw oss.str().c_str();
	}
}

void c::parse(const dom_element& e) {
	_name=e.get_attribute_value("name");
	_major=e.get_attribute_value("major");
	_minor=e.get_attribute_value("minor");
	if (_major.empty()) _major="0";
	if (_minor.empty()) _minor="1";
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
		xmlpp::Node::NodeList ch=e.get_children("target");
		for (xmlpp::Node::NodeList::const_iterator J=ch.begin(); J!=ch.end(); ++J) {
			xmlpp::Element* el=dynamic_cast<xmlpp::Element*>(*J);
			if (el!=0) {
				std::string name=el->get_attribute_value("name");
				bool goahead=false;
				if (!get_sources()._included_targets.empty()) {
					if (get_sources().is_included(name)) goahead=true;
				}
				if (!get_sources().is_excluded(name)) {
					goahead=true;
				}
				if (goahead) {
					target* t=target::create(*this,*el);	
					assert(t!=0);
					_targets.insert(targets::value_type(name,t));
					t->parse(*this,*el);
				}
			}
		}

	}	
}









