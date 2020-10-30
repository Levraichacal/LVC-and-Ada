Building avr-gnat for AVR-Ada
=============================

:date: 2012-06-12 12:07
:tags: avr, gcc, avrada


None of the Linux distributions ship Ada-enabled avr-gcc (avr-gnat) by default.
And building GNAT for AVR a bit tricky. So, to help the situation I have
tried to gather a little help for that.

To build AVR-Ada applications, you need following software packages

* avr-binutils
* avr-gcc + avr-gnat
* avr-libc
* avr-ada itself

Since GNAT is written in Ada, you need native Ada compiler on your system.
In most cases, this means GNAT (installed using the package manager of
your Linux distribution). But, one should notice that to compile GNAT
you need to have same version or older version of GNAT installed.
Using newer version of GNAT to compiler order version is not supported.
For example, you cannot compile GNAT 4.2 using GNAT 4.6.

Ok, that was the introduction. Now, let's try to install avr-gcc 4.7.0
with Ada support (GNAT) on Fedora 16. 

Installing GNAT 4.7
-------------------
Since we are building GNAT 4.7 using GNAT 4.6, everything should go
smoothly.

Commands are following::

    yum install mpfr-devel gmp-devel bison make autoconf automake libtool flex gcc-gnat
    wget ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-4.7.0/gcc-4.7.0.tar.gz
    tar zxf gcc-4.7.0.tar.gz
    mkdir gcc-obj-470
    cd gcc-obj-470
    ../gcc-4.7.0/configure --enable-languages=c,ada \
      --prefix=$HOME/programs/gnat470 --disable-multilib
    make bootstrap
    make install

When 'make install' finishes, you should have (native/normal) gnat 4.7 in $HOME/programs/gnat470 directory.

Installing avr-binutils
-----------------------

Binutils package provides tools like 'as', 'ld', and 'objcopy', which are necessary when gcc compiles something. Binutils for AVR can be installed in following way::

    wget http://ftp.uni-kl.de/pub/gnu/binutils/binutils-2.20.1a.tar.bz2
    tar jxf binutils-2.20.1a.tar.bz2
    git clone git://avr-ada.git.sourceforge.net/gitroot/avr-ada/avr-ada
    cd binutils-2.20.1
    for a in ../avr-ada/patches/binutils/2.20.1/*.patch;
    do
        patch -p0 < $a || fail "avr-binutils: patch $a"
    done
    cd ..
    mkdir binutils-obj
    cd binutils-obj
    ../binutils-2.20.1/configure --target=avr --program-prefix=avr- \
      --disable-shared --disable-nls --enable-commonbfdlib=no \
      --disable-werror --prefix=$HOME/programs/avrada
    make
    make install

The patching part is there, because AVR-Ada repository includes
some patches with improve AVR support of binutils and it is a good
idea to use the patches.

Installing avr-gcc with Ada support
-----------------------------------

Now we are ready to compile avr-gcc. Notice how we set the PATH environment
variable that the gcc build process picks up our custom gnat 4.7.0.
Also, our new avr-binutils tools need to be in PATH.

::

    export PATH=$HOME/programs/gnat470/bin:$HOME/programs/avrada/bin:$PATH
    mv gcc-4.7.0 gcc-4.7.0-native
    git clone git://avr-ada.git.sourceforge.net/gitroot/avr-ada/avr-ada
    tar zxf gcc-4.7.0.tar.gz
    cd gcc-4.7.0
    for a in ../avr-ada/patches/gcc/4.7.0/*.patch;do patch -p0 < $a;done
    cd ..
    mkdir avr-gcc-obj
    cd avr-gcc-obj
    ../gcc-4.7.0/configure --target=avr --program-prefix=avr- \
                --disable-shared --disable-nls --disable-libssp \
                --with-system-zlib \
                --disable-libada \
                --enable-languages=ada,c,c++ --enable-cpp --with-dwarf2 \
                --enable-version-specific-runtime-libs \
                --prefix=$HOME/programs/avrada
    sed -i -e 's/$(STAMP)/echo timestamp >/' ../gcc-4.7.0/gcc/config/avr/t-avr
    make
    make install

Steps explained

::

    export PATH=$HOME/programs/gnat470/bin:$HOME/programs/avrada/bin:$PATH

Put gcc/gnat 4.7.0 to PATH. Also, put avr-binutils to PATH.

::

    mv gcc-4.7.0 gcc-4.7.0-native

Move previous gcc-4.7.0 source directory out of the way.

::

    git clone git://avr-ada.git.sourceforge.net/gitroot/avr-ada/avr-ada

Clone the official avr-gcc repository, which contains some avr-gcc specific
patches. You need to do this only if you haven't cloned the repository
in earlier steps.

::

    tar zxf gcc-4.7.0.tar.gz

Extract gcc-4.7.0 sources (since you move the previous source directory),
to have fresh untouched gcc-4.7.0 sources.

::

    cd gcc-4.7.0
    for a in ../avr-ada/patches/gcc/4.7.0/*.patch;do patch -p0 < $a;done
    cd ..

Enter the gcc-4.7.0 source directory and apply AVR and AVR-Ada specific patches
to gcc sources from the avr-ada repository.

::

    mkdir avr-gcc-obj

Create a separate build directory for gcc object files.

::

    cd avr-gcc-obj
    ../gcc-4.7.0/configure --target=avr --program-prefix=avr- \
                --disable-shared --disable-nls --disable-libssp \
                --with-system-zlib \
                --disable-libada \
                --enable-languages=ada,c,c++ --enable-cpp --with-dwarf2 \
                --enable-version-specific-runtime-libs \
                --prefix=$HOME/programs/avrada


Configure gcc to be cross-compiler with avr target.  We disable
a lot of unnecessary things, and enable three languages: Ada, C, and C++.

In addition, we disable libada (Ada runtime) compilation.
This means that gnattools (avr-gnatmake, avr-gnatclean, etc.)
will use Ada runtime from the host system. If the Ada runtime on
the host system is from different version of gcc, then gnattools will not work.

::
    
    sed -i -e 's/$(STAMP)/echo timestamp >/' ../gcc-4.7.0/gcc/config/avr/t-avr

This line fixes a little bug in gcc sources. STAMP variable is not defined
in t-avr file and easiest work-around is to replace it with 'echo' command.

::

    make

Compile the code.

::

    make install

Install everything.



Installing avr-libc
-------------------

AVR-Ada depends on avr-libc, so you need to build it also.

::

    export PATH=$HOME/programs/avrada/bin:$PATH
    wget http://download.savannah.gnu.org/releases/avr-libc/avr-libc-1.8.0.tar.bz2
    tar jxf avr-libc-1.8.0.tar.bz2
    cd avr-libc-1.8.0
    ./configure --host=avr --prefix=$HOME/programs/avrada
    make
    make install

Installing AVR-Ada
------------------

Finally, we are ready to install AVR-Ada. We will fetch the latest
version from AVR-Ada git repository, since it contains many improvements
over AVR-Ada 1.1.

::

    export PATH=$HOME/programs/avrada/bin:$PATH
    git clone git://avr-ada.git.sourceforge.net/gitroot/avr-ada/avr-ada
    cd avr-ada
    ./configure
    make
    make install_rts
    cd avr/avr_lib
    sed -i -e 's/stamp-libs: $(thread_libs)/stamp-libs:/' Makefile
    make
    cd ../..
    make install_libs

The 'sed ...' line is there to disable avr-threads support, since it
assumes Windows build system by default and we are building on Linux.
If one feels brave enough, he/she can skip the sed command and try to
build the avr-threads part also.

When 'make install_libs' completes, you should have complete AVR-Ada setup at
$HOME/programs/avrada.

Testing the setup
-----------------

To verify that you can actually compile AVR-Ada programs, you can download
some example code from my bitbucket repositories and build them.

::

    export PATH=$HOME/programs/avrada/bin:$PATH
    hg clone https://bitbucket.org/tkoskine/arduino-hello-uart
    cd arduino-hello-uart
    make

After successful build, there is file 'hello.hex' in the arduino-hello-uart
directory. If you have Arduino UNO, you can upload the file on it
using avrdude tool.

::

    sudo avrdude -c arduino -p atmega328p -P /dev/ttyACM0 -b 115200 -U flash:w:hello.hex
    # or simply "make upload-uno"


Final notes
-----------

Some final notes:

* Be careful with the version numbers. I use somewhat old releases on purpose, since they are proven to work with AVR-Ada better than later releases.
* If you get some strange compiler errors, check that you compile the code with correct GNAT. ("gnatls -v" shows the version number of GNAT)
* It is possible that AVR-Ada installation scripts do not set all permission bits properly, so AVR-GNAT (avr-gnatmake) might recompile some parts of AVR-Ada when you compile your AVR-Ada applications.
* Root (sudo) rights are necessary only with avrdude, other parts of this guide can be done with normal user rights.

