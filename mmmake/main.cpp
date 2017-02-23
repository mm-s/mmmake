/*
   *****************************************************************
    BlockChain SDK
    (C) 2017 nChain - London.

    TODO: Licence info.

    Rev date: 2017-02-23T14:50:45.000000Z                         
    Rev : 7                         
   *****************************************************************
*/


#include "disem.h"

#include <iostream>
#include <cstring>
using namespace std;

void usage() {
	cout << "mmmake " << mmmake::disem::version << endl;
	cout << "usage" << endl;
	cout << "  mmmake <projects source directory> <project name> <debug|release>" << endl;
	cout << "  mmmake <project name>" << endl;
	cout << "     assumes '../src' as <sources dir> and config is taken from parent dirname (debug or release)" << endl;
	cout << "" << endl;
	cout << "un mensaje:" << endl;
	cout << " si quieres evitarte problemas que no te apetece intentar resolver es mejor que invoques \"mmmake <proyecto>\" desde dentro de un directorio llamado \"debug\" que se encuentra dentro de un directorio llamado \"trunk\", bajo el cual se encuentra el \"checkout\" de la rama trunk del repositorio en el directorio \"src\"  " << endl;
	cout << "  , es decir:" << endl;
	cout << "  mkdir trunk; cd trunk" << endl;
	cout << "  svn co http://servidor/svn/trunk src" << endl;
	cout << "  mkdir debug; cd debug" << endl;
	cout << "  mmmake <tu proyecto>" << endl;
	cout << "" << endl;
	cout << "environment variables:" << endl;
	cout << "   CMAKE_GENERATOR  (i.e.=\"CodeBlocks - Unix Makefiles\") see cmake --help for generators. defaults to KDevelop3" << endl;
	cout << "" << endl;
	cout << "example:" << endl;
	cout << "  $> ls" << endl;
	cout << "  src/ release/" << endl;
	cout << "  $> mkdir debug" << endl;
	cout << "  $> cd debug" << endl;
	cout << "  $> mmmake ../src hifisim debug" << endl;
	cout << "" << endl;
	cout << "environment:" << endl;
	cout << "  MMMAKE_CROSS=<toolset>" << endl;
	cout << "     toolset can be any of:" << endl;
	cout << "       MINGW32" << endl;
	cout << "  MMMAKE_SINGLE_TARGET=yes   force production of static libs except to the top level project" << endl;
	cout << "  MMMAKE_FORCE_STATIC_LIBS=yes   force production of static libs including the top level project" << endl;
	cout << "  MMMAKE_TWO_PHASE_WRITE=yes   write files only if the new content is different" << endl;

	cout << "" << endl;
	cout << "send greeting to:" << endl;
	cout << "  Marcos Mayorga - mm@mm-studios.com" << endl; //marcos.f.mayorgaaguirre@boeing.com; marcos@fairluck.org" << endl;
	cout << "  Boeing BR&TE 2009 2010 (as bmake)" << "; mm-studios 2014-2017" << endl;
}

#include <boost/filesystem/path.hpp>
#include "sources.h"

void invoke_cmake(const bmake::sources&);

int main(int argc, char *argv[]) {
	boost::filesystem::path curPath=boost::filesystem::current_path();

	if (argc!=4 && argc!=2) {
		usage();
		return 1;
	}

	std::string srcdir;
	std::string confname;
	std::string topprj;

	if (argc==4) {
		srcdir=argv[1];
		topprj=argv[2];
		confname=argv[3];
	}
	else { /// argc is 2

		srcdir="../src";
		srcdir=(boost::filesystem::path("..") / "src").string();
		topprj=argv[1];
		confname=curPath.filename().string();
	}
	std::cout << "using '" << confname << "' as configuration" << std::endl;
	std::cout << "using '" << srcdir << "' as projects container directory" << std::endl;

	std::string single_target("false");
	bmake::sources::from_env(single_target,"BMAKE_SINGLE_TARGET");

	std::string force_static_libs("false");
	bmake::sources::from_env(force_static_libs,"BMAKE_FORCE_STATIC_LIBS");

	std::string two_phase_write("false");
	bmake::sources::from_env(two_phase_write,"BMAKE_TWO_PHASE_WRITE");

	boost::filesystem::path p(srcdir);
	bmake::sources s(p,topprj,confname);


	if (force_static_libs!="false") {
		if (force_static_libs=="yes" || force_static_libs=="YES" || force_static_libs=="y" || force_static_libs=="Y" || force_static_libs=="true" || force_static_libs=="TRUE") {
			s.set_force_static_libs();
		}
		else
			std::cerr << "*** error: unrecognized value for BMAKE_FORCE_STATIC_LIBS" << std::endl;
	}
	

	if (single_target!="false") {
		if (single_target=="yes" || single_target=="YES" || single_target=="y" || single_target=="Y" || single_target=="true" || single_target=="TRUE") {
			s.set_unique_target();
		}
		else
			std::cerr << "*** error: unrecognized value for BMAKE_SINGLE_TARGET" << std::endl;
	}

	if (two_phase_write!="false") {
		if (two_phase_write=="yes" || two_phase_write=="YES" || two_phase_write=="y" || two_phase_write=="Y" || two_phase_write=="true" || two_phase_write=="TRUE") {
			s.set_two_phase_write();
		}
		else
			std::cerr << "*** error: unrecognized value for BMAKE_TWO_PHASE_WRITE" << std::endl;
	}

	s.load();
	s.write();
	invoke_cmake(s);
	return 0;
}
#include <stdlib.h>
#include <sstream>

void invoke_cmake(const bmake::sources& src) {
	std::string generator("KDevelop3");
	bmake::sources::from_env(generator,"CMAKE_GENERATOR");

	std::string cross;
	bmake::sources::from_env(cross,"BMAKE_CROSS");

	if (cross == "MINGW32") {
		std::cout << "setting environment variables to cross compile with mingw" << std::endl;
		putenv((char*)"CC=i586-mingw32msvc-gcc");
		putenv((char*)"CXX=i586-mingw32msvc-g++");
		putenv((char*)"LD=i586-mingw32msvc-ld");
		putenv((char*)"AR=i586-mingw32msvc-ar");
		putenv((char*)"AS=i586-mingw32msvc-as");
		putenv((char*)"NM=i586-mingw32msvc-nm");
		putenv((char*)"STRIP=i586-mingw32msvc-strip");
		putenv((char*)"RANLIB=i586-mingw32msvc-ranlib");
		putenv((char*)"DLLTOOL=i586-mingw32msvc-dlltool");
		putenv((char*)"OBJDUMP=i586-mingw32msvc-objdump");
		putenv((char*)"RESCOMP=i586-mingw32msvc-windres ");
	}
	else {
		std::cout << "setting environment variables to use default compiler" << std::endl;
		putenv((char*)"CC=");
		putenv((char*)"CXX=");
		putenv((char*)"LD=");
		putenv((char*)"AR=");
		putenv((char*)"AS=");
		putenv((char*)"NM=");
		putenv((char*)"STRIP=");
		putenv((char*)"RANLIB=");
		putenv((char*)"DLLTOOL=");
		putenv((char*)"OBJDUMP=");
		putenv((char*)"RESCOMP=");
	}

	{
        std::ostringstream oss;
        oss << "CMAKE_MODULE_PATH=" << (src.get_prefix() / "cmakemodules").string();
        ///
        char* value = new char [oss.str().size() + 1];
        strcpy (value, oss.str().c_str());
        putenv(value);
        std::cout << oss.str() << std::endl;
        ///
	}
	std::ostringstream oss;
	oss << "cmake -G \"" << generator << "\" " << src.get_path().string();
	system(oss.str().c_str());

}


