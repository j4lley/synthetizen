
# Find the QtWidgets library
find_package(Qt5Core)
find_package(Qt5Gui)
find_package(Qt5Widgets)
find_package(Qt5OpenGL)

# OpenGL & GLEW library
find_package(OpenGL)

# Find FreeImage
find_package(FreeImage)

# Find CUDA
#find_package(CUDA)

if (NOT TARGET ${PROJECT_NAME})

include_directories(${FREEIMAGE_INCLUDE})

# Use resources to add shaders and additional image data
QT5_ADD_RESOURCES(SYNTHETIZEN_GLTEST_RES 
	"${PROJECT_SOURCE_DIR}/resources/images.qrc"
	"${PROJECT_SOURCE_DIR}/resources/shaders.qrc"
)

file(GLOB SYNTHETIZEN_GLTEST_SRC
    "*.h"
	"*.cc"
    "*.cpp"
)

add_executable (synthetizen_gltest ${SYNTHETIZEN_GLTEST_SRC} ${SYNTHETIZEN_GLTEST_RES})

include_directories("${CMAKE_SOURCE_DIR}/src")

# Use the Widgets and OpenGL modules from Qt 5.
qt5_use_modules(synthetizen_gltest Widgets OpenGL)
target_link_libraries(synthetizen_gltest synthetizen_graphics ${QT_LIBRARIES} ${OPENGL_LIBRARIES})
    
endif (NOT TARGET ${PROJECT_NAME})
