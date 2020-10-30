AVR-Ada 1.2.2 RPMs for Fedora 19
================================

:date: 2013-07-26 21:00
:tags: avrada, fedora, rpms

AVR-Ada 1.2.2 RPMs for Fedora 19 (i386 and x86_64) are now available
in my `fedora.ada-language.com <http://fedora.ada-language.com/>`_ repository.

As before, create file /etc/yum.repos.d/fedora-adalanguage.repo with contents:

::

   [fedora-adalanguage]
   name=Tero's Fedora RPM repository for Ada packages
   baseurl=http://fedora.ada-language.com/repo/$releasever/$basearch
   enabled=1

And run:

::

   sudo yum install avr-gnat avr-ada-lib --nogpgcheck

Notes:

* The used GCC version is 4.7.2. I know that there is 4.7.3 also
  available, but I haven't tested that yet, so 4.7.2 is used for now.
* The packaging is not done by the book since building AVR-Ada requires
  native gcc/gnat 4.7.x and Fedora 19 has native gcc/gnat 4.8.x as default.
  I have used custom gcc/gnat 4.7.x binaries, compiled on Fedora 18,
  for package building.
* The release contains two of my patches, which are not in the official
  AVR-Ada 1.2.2 repository.

  * The first patch reverts AVR.UART behaviour back to AVR-Ada 1.2 (=interrupt mode also works)
  * The second patch fixes linking errors with libavrada.a, so that all boards get correct CPU frequencies and other code.

* The RPMs are unofficial in every possible way and they are not endorsed by Fedora or AVR-Ada projects.
  If there are bugs, complain to me (tero.koskinen@iki.fi).

