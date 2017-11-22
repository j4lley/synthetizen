# README #

This README explains the needed steps to get synthetizen up and running in Windows 8.1 / Windows 10.

### What is this repository for? ###

* synthetizen is a playground space for coding image processing and tiny applications.
* Version of synthetizen: __alpha__

### How do I get set up? ###

+ Dependencies. 3xposure render has been tested under Windows 8.1 and Windows 10 in 32bit.
  Basically, you will need CMake, vcpkg and Qt5

+ Summary of set up:
    * Install [vcpkg](https://github.com/Microsoft/vcpkg/) and Visual Studio 2013 Community Edition [here](https://www.visualstudio.com/en/vs/older-downloads/). We do not reccomend using 2017 yet.
	* Install NVidia CUDA Toolkit (> 7.5 recommended)
    * Install [CMake](https://cmake.org/download/) (latest version should work)
    * Download and install [Qt-5.9](http://download.qt.io/official_releases/online_installers/qt-unified-windows-x86-online.exe):
	* Set Qt ``bin`` directory in your PATH enviroment variable, this will make CMake to find all Qt-related stuff automatically.
    * Configure with CMake-GUI. Click configure, then generate solution.
    * Remember to set up your CUDA build customizations in Visual Studio to control compute capability and CUDA code generation
  
+ Configuration
+ How to run tests
+ Deployment instructions


