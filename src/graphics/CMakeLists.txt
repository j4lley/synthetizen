
#find_package(GLEW REQUIRED)

find_package(Qt5Gui)

set(SYNTHETHIZEN_GRAPHICS_SRC
	"openglwindow.h"
	"openglwindow.cpp"
)

add_library(synthetizen_graphics ${SYNTHETHIZEN_GRAPHICS_SRC})

# Use the Widgets and OpenGL modules from Qt 5.
qt5_use_modules(synthetizen_graphics Widgets OpenGL)
target_link_libraries(synthetizen_graphics ${QT_LIBRARIES})

#target_link_libraries(synthetizen_graphics PRIVATE GLEW::GLEW)