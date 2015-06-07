Build from sources
------------------

from the package source directory do
CMAKE_MODULE_PATH share/mmmake/cmakemodules cmake .

then
make mmmake


build debian package
--------------------

from the package source directory do
dpkg-buildpackage


