# README #

This README explains the needed steps to get synthetizen up and running in Windows 8.1 / Windows 10.

### What is this repository for? ###

* synthetizen is a playground space for coding image processing and tiny applications.
* Version of synthetizen: __alpha__

### How do I get set up? ###

+ Dependencies. 3xposure render has been tested under Windows 8.1 and Windows 10 in 32bit.
  Basically, you will need CMake, vcpkg and Qt5

+ Summary of set up:
    * Install vcpkg in Visual Studio 2013 Community Edition [here](https://www.visualstudio.com/en/vs/older-downloads/). We do not reccoment using 2015 or 2017 yet.
	* Install NVidia CUDA Toolkit (7.5 and 8.0 have been tested)
    * Install [CMake](https://cmake.org/download/) (latest version should work)
    * Download and compile [Qt-4.8.6](https://download.qt.io/archive/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.zip) using the following code:
        `..\configure.exe -platform win32-msvc2013`
        - Qt-4.8.6 in 64bit gave some problems when compiling
	    - Qt-4.8.7 may have problems (if you want to try we reccomend shared dll's x86 version)
	* Set Qt ``bin`` directory in your PATH enviroment variable, this will make CMake to find all Qt-related stuff automatically.
    * Configure with CMake-GUI using ``3xposure-render/Sources`` into ``Build`` directory. Click configure, then generate solution.
    * Remember to set up your CUDA build customizations in Visual Studio to control compute capability and CUDA code generation
  
+ Configuration
+ How to run tests
+ Deployment instructions


