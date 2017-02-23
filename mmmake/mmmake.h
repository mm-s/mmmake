#ifndef BMAKE_H_INCLUDED
#define BMAKE_H_INCLUDED

#if defined(_MSC_VER)
//4251: some class or template needs to have dll-interface to be used by clients of this class 
//no problem when reffers to templates, clients can link succesfully because the class instantiation (the code) is in client side (so no link at all)
//disabling 4251 can hide a problem when this class (which is dll exported) either 1.-expose in non-private sections or 2.-use in inline functions implementations, types witch are not dll exported
# pragma warning ( disable :4251 )
#endif

// windows shared library design require to mine the source code with this ugly litter
// because it precises to expicitely say which symbols one want to be exported
// (when using this header to build the library) or imported (when some other project wants
// to use the classes provided by this library

#ifdef _WIN32
#  ifdef BMAKE_EXPORT_SYMBOLS
#    define BMAKE_EXPORT_IMPORT_POLICY __declspec(dllexport)
#    define BMAKE_EXPORT_IMPORT_POLICY_MSG "	BMAKE: Exporting symbols"
#  else
#	ifdef BMAKE_IMPORT_SYMBOLS
#		define BMAKE_EXPORT_IMPORT_POLICY __declspec(dllimport)
#		 define BMAKE_EXPORT_IMPORT_POLICY_MSG "	BMAKE: Importing symbols"
#	else
#		define BMAKE_EXPORT_IMPORT_POLICY
#		 define BMAKE_EXPORT_IMPORT_POLICY_MSG "	BMAKE: neither importing nor exporting symbols"
#	endif
#  endif
#else
# define BMAKE_EXPORT_IMPORT_POLICY __attribute__ ((visibility("default")))
#endif

#ifndef SHOW_IMPORT_EXPORT_MSG
//#define SHOW_IMPORT_EXPORT_MSG
#endif



#ifdef _WIN32
#ifdef SHOW_IMPORT_EXPORT_MSG
#pragma message (BMAKE_EXPORT_IMPORT_POLICY_MSG)
#endif
#endif


#endif
