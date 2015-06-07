IF (NOT GTKMM_FOUND)

FIND_PATH(GTKMM_ROOT_DIR include/gtkmm-2.4/gtkmm.h
	/usr
	/usr/local
	/sw
	c:/gtk
	c:/att_development/att_dependencies/GTK
	DOC "Directory containing GTK+ and gtkmm libraries"
)

IF (GTKMM_ROOT_DIR)
	SET(GTKMM_FOUND TRUE) 
ENDIF (GTKMM_ROOT_DIR)

IF (GTKMM_FOUND)

	SET( ENV{PKG_CONFIG_PATH} ${GTKMM_ROOT_DIR}/lib/pkgconfig )

IF(UNIX)
	exec_program(pkg-config ARGS "--libs libglademm-2.4" OUTPUT_VARIABLE GTKMM_LIBS)
	exec_program(pkg-config ARGS "--cflags libglademm-2.4" OUTPUT_VARIABLE GTKMM_INCLUDE)
else(UNIX)
	SET(grd ${GTKMM_ROOT_DIR})

	LINK_DIRECTORIES(${grd}/lib)

	SET(GTKMM_LIBS glademm-vc80-2.4 gtkmm-vc80-2.4 glade-2.0 gdkmm-vc80-2.4 atkmm-vc80-1.6 pangomm-vc80-1.4 cairomm-vc80-1.0 glibmm-vc80-2.4
		sigc-vc80-2.0 gtk-win32-2.0 xml2 gdk-win32-2.0 atk-1.0 gdk_pixbuf-2.0 pangowin32-1.0 pangocairo-1.0
		cairo pangoft2-1.0 fontconfig freetype z pango-1.0 gobject-2.0 gmodule-2.0 glib-2.0 intl iconv)

	#exec_program(pkg-config ARGS "--libs --msvc-syntax libglademm-2.4" OUTPUT_VARIABLE GTKMM_LIBS)



	
	SET(GTKMM_INCLUDE ${grd}/include/libglademm-2.4 ${grd}/lib/libglademm-2.4/include ${grd}/include/gtkmm-2.4 
				${grd}/lib/gtkmm-2.4/include ${grd}/include/libglade-2.0 ${grd}/include/glibmm-2.4 
				${grd}/lib/glibmm-2.4/include ${grd}/include/gdkmm-2.4 ${grd}/lib/gdkmm-2.4/include
				${grd}/include/pangomm-1.4 ${grd}/include/atkmm-1.6 ${grd}/include/gtk-2.0 
				${grd}/include/sigc++-2.0 ${grd}/lib/sigc++-2.0/include ${grd}/include/glib-2.0
				${grd}/lib/glib-2.0/include ${grd}/lib/gtk-2.0/include ${grd}/include/cairomm-1.0
				${grd}/include/pango-1.0 ${grd}/include/cairo ${grd}/include/freetype2 ${grd}/include 
				${grd}/include/atk-1.0 ${grd}/include/libxml2 )
endif(UNIX)

	link_directories( ${GTKMM_ROOT_DIR}/lib )

	MESSAGE(STATUS "Found gtkmm: ${GTKMM_ROOT_DIR}") 
ELSE (GTKMM_FOUND)
	MESSAGE(FATAL_ERROR "Could not find gtkmm") 

ENDIF (GTKMM_FOUND)

ENDIF (NOT GTKMM_FOUND)

