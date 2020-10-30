AVR-Ada package for Ubuntu 14.04
================================

:date: 2014-06-02 22:15
:tags: ubuntu, packaging

I created quick and dirty AVR-Ada package for Ubuntu 14.04 (amd64 only for now)
using the latest AVR-Ada sources (basically 1.2.2 + some fixes).
It is categorized as "quick and dirty" because I generated
the binaries on Ubuntu 14.04 using my
`avr-ada build script <https://bitbucket.org/tkoskine/avr-ada-build-script>`_
and then created the package using `fpm <https://github.com/jordansissel/fpm>`_.

Anyway, if you are brave enough, you can get the package from `ubuntu.ada-language.com <http://ubuntu.ada-language.com/>`_
by adding line::

   deb http://ubuntu.ada-language.com/14.04 ./
   
to your /etc/apt/sources.list file and running::

   sudo apt-get update
   sudo apt-get install avr-ada
   
The package is not signed, so you need to say Yes ('y') when
apt-get asks about the installation of the package.

Once the package is installed, you can find the binaries from /opt/avr-ada/avr-ada-122 directory.
Then you need to adjust PATH variable and add /opt/avr-ada/avr-ada-122/bin to PATH so your
shell finds avr-gnatmake and other relevant tools.

Note: The package is about 162 megabytes and includes also avr-binutils and all other tools
required for AVR-Ada programs.

If you want to generate the package by yourself, you can clone avr-ada-build-script repository and run the script and the fpm tool::

   hg clone https://bitbucket.org/tkoskine/avr-ada-build-script
   cd avr-ada-build-script
   # install gnat-4.6, probably need many other dependencies also
   apt-get install gnat-4.6
   mkdir build-1
   vi build-avr-ada-environment.sh # tweak the paths
   cd build-1
   sh -x ../build-avr-ada-environment.sh
   fpm -s dir -t deb -n avr-ada -v 1.2.2 /opt/avr-ada/avr-ada-122

