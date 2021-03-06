IF (NOT WXW_FOUND)

SET(ver 2.8)

SET(LIBSEARCHPATHS 
	/usr/lib
	C:/usr/lib
	R:/usr/lib
) 


if(UNIX)

FIND_PATH(WXW_INCLUDE_DIR wx/statline.h
	/usr/include/wx-2.8
	DOC "Directory containing WxWidgets includes"
)
FIND_PATH(WXW_CONF_INCLUDE_DIR wx/setup.h
	/usr/lib/wx/include/gtk2-ansi-release-2.8
	/usr/lib/wx/include/gtk2-unicode-release-2.8
	DOC "Directory containing WxWidgets release library config"
)

FIND_PATH(WXW_CONF_D_INCLUDE_DIR wx/setup.h
	/usr/lib/wx/include/gtk2-ansi-debug-2.8
	/usr/lib/wx/include/gtk2-unicode-debug-2.8
	DOC "Directory containing WxWidgets debug library config"
)

FIND_LIBRARY(WXW_BASE_LIBRARY
	NAMES 
		wx_base-${ver}
		wx_baseu-${ver}
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_BASE_NET_LIBRARY
	NAMES 
		wx_base_net-${ver}
		wx_baseu_net-${ver}
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_BASE_XML_LIBRARY
	NAMES 
		wx_base_xml-${ver}
		wx_baseu_xml-${ver}
	PATHS 	${LIBSEARCHPATHS} 
) 
FIND_LIBRARY(WXW_GTK2_ADV_LIBRARY
	NAMES 
		wx_gtk2_adv-${ver}
		wx_gtk2u_adv-${ver}
	PATHS 	${LIBSEARCHPATHS} 
) 
FIND_LIBRARY(WXW_GTK2_AUI_LIBRARY
	NAMES 
		wx_gtk2_aui-${ver}
		wx_gtk2u_aui-${ver}
	PATHS 	${LIBSEARCHPATHS} 
) 
FIND_LIBRARY(WXW_GTK2_CORE_LIBRARY
	NAMES 
		wx_gtk2_core-${ver}
		wx_gtk2u_core-${ver}
	PATHS 	${LIBSEARCHPATHS} 
) 
FIND_LIBRARY(WXW_GTK2_HTML_LIBRARY
	NAMES 
		wx_gtk2_html-${ver}
		wx_gtk2u_html-${ver}
	PATHS 	${LIBSEARCHPATHS} 
) 
FIND_LIBRARY(WXW_GTK2_QA_LIBRARY
	NAMES 
		wx_gtk2_qa-${ver}
		wx_gtk2u_qa-${ver}
	PATHS 	${LIBSEARCHPATHS} 
) 
FIND_LIBRARY(WXW_GTK2_RICHTEXT_LIBRARY
	NAMES 
		wx_gtk2_richtext-${ver}
		wx_gtk2u_richtext-${ver}
	PATHS 	${LIBSEARCHPATHS} 
) 
FIND_LIBRARY(WXW_GTK2_XRC_LIBRARY
	NAMES 
		wx_gtk2_xrc-${ver}
		wx_gtk2u_xrc-${ver}
	PATHS 	${LIBSEARCHPATHS} 
) 
FIND_LIBRARY(WXW_GTK2_PROPGRID_LIBRARY
	NAMES 
		wxcode_gtk2_propgrid-${ver}
		wxcode_gtk2u_propgrid-${ver}
	PATHS 	${LIBSEARCHPATHS} 
) 

SET(WXW_LIBRARIES 
${WXW_BASE_LIBRARY}
${WXW_BASE_NET_LIBRARY}
${WXW_BASE_XML_LIBRARY}
${WXW_GTK2_ADV_LIBRARY}
${WXW_GTK2_AUI_LIBRARY}
${WXW_GTK2_CORE_LIBRARY}
${WXW_GTK2_HTML_LIBRARY}
${WXW_GTK2_QA_LIBRARY}
${WXW_GTK2_RICHTEXT_LIBRARY}
${WXW_GTK2_XRC_LIBRARY}
${WXW_GTK2_PROPGRID_LIBRARY}
)

SET(WXW_LIBRARIES_D ${WXW_LIBRARIES})

endif(UNIX)

if(WIN32)

FIND_PATH(WXW_INCLUDE_DIR wx/propgrid/propgrid.h
	/usr/local/include/wx-2.8
	c:/usr/include/wx-2.8
	r:/usr/include/wx-2.8
	DOC "Directory containing WxWidgets includes"
)

FIND_PATH(WXW_CONF_INCLUDE_DIR wx/setup.h
	c:/usr/lib/wx/include/msw-ansi-2.8
	r:/usr/lib/wx/include/msw-ansi-2.8
	DOC "Directory containing WxWidgets debug/release library config"
)

FIND_LIBRARY(WXW_BASE_LIBRARY
	NAMES
		wxbase28
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_BASE_NET_LIBRARY
	NAMES
		wxbase28_net
	PATHS 	${LIBSEARCHPATHS} 
) 


FIND_LIBRARY(WXW_BASE_XML_LIBRARY
	NAMES
		wxbase28_xml
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_PROPGRID_LIBRARY
	NAMES
		wxcode_msw28_propgrid
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_EXPAT_LIBRARY
	NAMES
		wxexpat		
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_JPEG_LIBRARY
	NAMES
		wxjpeg		
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_ADV_LIBRARY
	NAMES
		wxmsw28_adv	
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_AUI_LIBRARY
	NAMES
		wxmsw28_aui	
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_CORE_LIBRARY
	NAMES
		wxmsw28_core	
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_HTML_LIBRARY
	NAMES
		wxmsw28_html
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_MEDIA_LIBRARY
	NAMES
		wxmsw28_media
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_QA_LIBRARY
	NAMES
		wxmsw28_qa	
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_RICHTEXT_LIBRARY
	NAMES
		wxmsw28_richtext
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_XRC_LIBRARY
	NAMES
		wxmsw28_xrc
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_PNG_LIBRARY
	NAMES
		wxpng
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_REGEX_LIBRARY
	NAMES
		wxregex	
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_TIFF_LIBRARY
	NAMES
		wxtiff		
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_ZLIB_LIBRARY
	NAMES
		wxzlib		
	PATHS 	${LIBSEARCHPATHS} 
) 

SET(WXW_LIBRARIES	
${WXW_BASE_LIBRARY}
${WXW_BASE_NET_LIBRARY}
${WXW_BASE_XML_LIBRARY}
${WXW_PROPGRID_LIBRARY}
${WXW_EXPAT_LIBRARY}
${WXW_JPEG_LIBRARY}
${WXW_MSW_ADV_LIBRARY}
${WXW_MSW_AUI_LIBRARY}
${WXW_MSW_CORE_LIBRARY}
${WXW_MSW_HTML_LIBRARY}
${WXW_MSW_MEDIA_LIBRARY}
${WXW_MSW_QA_LIBRARY}
${WXW_MSW_RICHTEXT_LIBRARY}
${WXW_MSW_XRC_LIBRARY}
${WXW_PNG_LIBRARY}
${WXW_REGEX_LIBRARY}
${WXW_TIFF_LIBRARY}
${WXW_ZLIB_LIBRARY}
)

FIND_LIBRARY(WXW_BASE_LIBRARY_D
	NAMES
		wxbase28d
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_BASE_NET_LIBRARY_D
	NAMES
		wxbase28d_net
	PATHS 	${LIBSEARCHPATHS} 
) 


FIND_LIBRARY(WXW_BASE_XML_LIBRARY_D
	NAMES
		wxbase28d_xml
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_PROPGRID_LIBRARY_D
	NAMES
		wxcode_msw28d_propgrid
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_EXPAT_LIBRARY_D
	NAMES
		wxexpatd		
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_JPEG_LIBRARY_D
	NAMES
		wxjpegd		
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_ADV_LIBRARY_D
	NAMES
		wxmsw28d_adv	
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_AUI_LIBRARY_D
	NAMES
		wxmsw28d_aui	
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_CORE_LIBRARY_D
	NAMES
		wxmsw28d_core	
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_HTML_LIBRARY_D
	NAMES
		wxmsw28d_html
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_MEDIA_LIBRARY_D
	NAMES
		wxmsw28d_media
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_QA_LIBRARY_D
	NAMES
		wxmsw28d_qa	
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_RICHTEXT_LIBRARY_D
	NAMES
		wxmsw28d_richtext
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_MSW_XRC_LIBRARY_D
	NAMES
		wxmsw28d_xrc
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_PNG_LIBRARY_D
	NAMES
		wxpngd
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_REGEX_LIBRARY_D
	NAMES
		wxregexd	
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_TIFF_LIBRARY_D
	NAMES
		wxtiffd		
	PATHS 	${LIBSEARCHPATHS} 
) 

FIND_LIBRARY(WXW_ZLIB_LIBRARY_D
	NAMES
		wxzlibd		
	PATHS 	${LIBSEARCHPATHS} 
) 

SET(WXW_LIBRARIES_D	
${WXW_BASE_LIBRARY_D}
${WXW_BASE_NET_LIBRARY_D}
${WXW_BASE_XML_LIBRARY_D}
${WXW_PROPGRID_LIBRARY_D}
${WXW_EXPAT_LIBRARY_D}
${WXW_JPEG_LIBRARY_D}
${WXW_MSW_ADV_LIBRARY_D}
${WXW_MSW_AUI_LIBRARY_D}
${WXW_MSW_CORE_LIBRARY_D}
${WXW_MSW_HTML_LIBRARY_D}
${WXW_MSW_MEDIA_LIBRARY_D}
${WXW_MSW_QA_LIBRARY_D}
${WXW_MSW_RICHTEXT_LIBRARY_D}
${WXW_MSW_XRC_LIBRARY_D}
${WXW_PNG_LIBRARY_D}
${WXW_REGEX_LIBRARY_D}
${WXW_TIFF_LIBRARY_D}
${WXW_ZLIB_LIBRARY_D}
)


endif(WIN32)
message(${WXW_INCLUDE_DIR})
IF (WXW_CONF_INCLUDE_DIR AND WXW_INCLUDE_DIR AND WXW_LIBRARIES AND WXW_LIBRARIES_D)
	SET(WXW_FOUND TRUE) 
ENDIF (WXW_CONF_INCLUDE_DIR AND WXW_INCLUDE_DIR AND WXW_LIBRARIES AND WXW_LIBRARIES_D)
 
IF (WXW_FOUND)
	IF (NOT Wxw_FIND_QUIETLY) 
		MESSAGE(STATUS "Found WxWidgets: ${WXW_INCLUDE_DIR} ${WXW_CONF_INCLUDE_DIR}") 
	ENDIF (NOT Wxw_FIND_QUIETLY) 
ELSE (WXW_FOUND)
	IF (NOT Wxw_FIND_QUIETLY) 
		MESSAGE(FATAL_ERROR "Could not find WxWidgets") 
	ENDIF (NOT Wxw_FIND_QUIETLY) 
ENDIF (WXW_FOUND)

ENDIF (NOT WXW_FOUND)
