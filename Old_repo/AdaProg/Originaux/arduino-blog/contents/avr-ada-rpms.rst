AVR-Ada RPMs for Fedora 17 and 18
=================================

:date: 2013-03-08 22:00
:tags: avrada, fedora, rpms

I finally managed to find time to create AVR-Ada RPMs for Fedora.
The packages are available for Fedora 17 and 18 on i386 and x86_64
architectures.

To install them you need to create file /etc/yum.repos.d/fedora-adalanguage.repo with contents:

::

   [fedora-adalanguage]
   name=Tero's Fedora RPM repository for Ada packages
   baseurl=http://fedora.ada-language.com/repo/$releasever/$basearch
   enabled=1

After that, run as root command::

   yum install --nogpgcheck avr-ada-lib

Two notes however:

My AVR-Ada packages will conflict with Fedora's avr-gcc
package and you need to remove it first (yum remove avr-gcc).

If you have *arduino* packages also installed, removing avr-gcc will
remove those also. But after you have avr-ada-lib installed, you can
install arduino packages again and they will use my version of avr-gcc
instead of one from official Fedora repositories.

Another thing is that my packages are not signed. You need to use
*--nogpgcheck* parameter when installing the packages.

When you have installed the packages, you can verify the installation
by cloning my `arduino-hello-uart <https://bitbucket.org/tkoskine/arduino-hello-uart>`_ repository and compiling it:

::

   hg clone https://bitbucket.org/tkoskine/arduino-hello-uart
   cd arduino-hello-uart
   make

If the compilation is successful, everything was installed correctly.
