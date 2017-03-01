Build System for C++/Linux
------------------

Designed to simplify CMake.
It works by automatically generating and maintaining the CMake scripts that otherwise must have to be maintained by hand.
mmmake project.xml file is easy to read and maintain and is standard XML.

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



--
see the wiki https://github.com/mm-s/mmmake/wiki
