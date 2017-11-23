
# Find the QtWidgets library
find_package(Qt5Core)
find_package(Qt5Widgets)
find_package(Qt5OpenGL)

# OpenGL & GLEW library
find_package(OpenGL)

# Find FreeImage
find_package(FreeImage)

# Find CUDA
#find_package(CUDA)

include_directories(${FREEIMAGE_INCLUDE})

file(GLOB SYNTHETIZEN_GLTEST_SRC
    "*.h"
	"*.cc"
    "*.cpp"
)

add_executable (synthetizen_gltest ${SYNTHETIZEN_GLTEST_SRC})

# Use the Widgets and OpenGL modules from Qt 5.
qt5_use_modules(synthetizen_gltest Widgets OpenGL)
target_link_libraries(synthetizen_gltest ${QT_LIBRARIES} ${OPENGL_LIBRARIES})
