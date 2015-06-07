IF (NOT MODULE_PL_CAMERA_FOUND)
FIND_PACKAGE(MODPLCAMERA REQUIRED)
include_directories( ${MODULE_PL_CAMERA_INCLUDE_PATH} )
ENDIF( NOT MODULE_PL_CAMERA_FOUND )

IF( NOT MODULE_PL_CAMERA_FOUND )
  MESSAGE( SEND_ERROR "MODPLCAMERA is mandatory" )
ENDIF( NOT MODULE_PL_CAMERA_FOUND )

