Build System for C++/Linux
------------------

Initially designed to get over the complexities that CMake originated in the group of Researchers who wanted to write C++ programs.
It works by automatically generating and maintaining the CMake scripts that otherwise must have to be maintained by hand.
mmmake project file is easy to read and maintain and is standard XML.



Build from sources
------------------

from the package source directory do
CMAKE_MODULE_PATH share/mmmake/cmakemodules cmake .

then
make mmmake


build debian package
--------------------

See required packages at doc/aptitude_install_dependencies

from the package source directory do
dpkg-buildpackage


