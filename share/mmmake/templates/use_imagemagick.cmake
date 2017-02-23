

IF (NOT ImageMagick_FOUND)
FIND_PACKAGE(ImageMagick COMPONENTS Magick++ REQUIRED)
include_directories( ${ImageMagick_INCLUDE_DIRS} )
ENDIF ()

IF( NOT ImageMagick_FOUND)
  MESSAGE( SEND_ERROR "ImageMagick++ is mandatory" )
ENDIF()

