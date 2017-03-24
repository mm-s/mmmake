#ifndef MMMAKE_H_INCLUDED
#define MMMAKE_H_INCLUDED

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

#ifndef MMMAKE_EXPORT_SYMBOLS
#ifdef mmmake_EXPORTS
 #define MMMAKE_EXPORT_SYMBOLS
#endif
#endif

#ifdef _WIN32
#  ifdef MMMAKE_EXPORT_SYMBOLS
#    define MMMAKE_EXPORT_IMPORT_POLICY __declspec(dllexport)
#    define MMMAKE_EXPORT_IMPORT_POLICY_MSG "	MMMAKE: Exporting symbols"
#  else
#	ifdef MMMAKE_IMPORT_SYMBOLS
#		define MMMAKE_EXPORT_IMPORT_POLICY __declspec(dllimport)
#		 define MMMAKE_EXPORT_IMPORT_POLICY_MSG "	MMMAKE: Importing symbols"
#	else
#		define MMMAKE_EXPORT_IMPORT_POLICY
#		 define MMMAKE_EXPORT_IMPORT_POLICY_MSG "	MMMAKE: neither importing nor exporting symbols"
#	endif
#  endif
#else
# define MMMAKE_EXPORT_IMPORT_POLICY __attribute__ ((visibility("default")))
#endif

#ifndef SHOW_IMPORT_EXPORT_MSG
//#define SHOW_IMPORT_EXPORT_MSG
#endif



#ifdef _WIN32
#ifdef SHOW_IMPORT_EXPORT_MSG
#pragma message (MMMAKE_EXPORT_IMPORT_POLICY_MSG)
#endif
#endif


#endif
