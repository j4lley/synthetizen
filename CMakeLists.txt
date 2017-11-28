cmake_minimum_required(VERSION 2.8.11)

project(synthetizen)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)

# Module Path
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake_modules")	

add_subdirectory (src)
add_subdirectory (apps)
