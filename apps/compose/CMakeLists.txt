
# Find the QtWidgets library
find_package(Qt5Core)
find_package(Qt5Widgets)
find_package(Qt5OpenGL)

# OpenGL & GLEW library
find_package(OpenGL)

# Find FreeImage
find_package(FreeImage)

# Find OpenEXR
#find_package(OpenEXR REQUIRED)


# Find CUDA
#find_package(CUDA)

if (NOT TARGET ${PROJECT_NAME})

include_directories(${FREEIMAGE_INCLUDE})

# Use resources to add shaders and additional image data
QT5_ADD_RESOURCES(SYNTHETIZEN_COMPOSE_RES 
	"${PROJECT_SOURCE_DIR}/resources/images.qrc"
	"${PROJECT_SOURCE_DIR}/resources/shaders.qrc"
)

file(GLOB SYNTHETIZEN_COMPOSE_SRC
    "*.h"
	"*.cc"
    "*.cpp"
)

add_executable (synthetizen_compose ${SYNTHETIZEN_COMPOSE_SRC} ${SYNTHETIZEN_COMPOSE_RES})

include_directories("${CMAKE_SOURCE_DIR}/src")

# Use the Widgets and OpenGL modules from Qt 5.
qt5_use_modules(synthetizen_compose Widgets OpenGL)
target_link_libraries(synthetizen_compose synthetizen_graphics ${QT_LIBRARIES} ${OPENGL_LIBRARIES})
    
endif (NOT TARGET ${PROJECT_NAME})
