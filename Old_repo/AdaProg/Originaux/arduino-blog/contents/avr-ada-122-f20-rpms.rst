AVR-Ada 1.2.2 RPMs for Fedora 20
================================

:date: 2013-12-23 23:45
:tags: avrada, fedora, rpms

As a small Christmas gift, AVR-Ada 1.2.2 RPMs for Fedora 20 (i386 and x86_64) are now available
in my `fedora.ada-language.com <http://fedora.ada-language.com/>`_ repository.

Like always, create file /etc/yum.repos.d/fedora-adalanguage.repo with contents:

::

   [fedora-adalanguage]
   name=Tero's Fedora RPM repository for Ada packages
   baseurl=http://fedora.ada-language.com/repo/$releasever/$basearch
   enabled=1

And run:

::

   sudo yum install avr-gnat avr-ada-lib --nogpgcheck

Notes:

* The used GCC version is still 4.7.2. Fedora 20 ships with avr-gcc 4.8.x,
  but AVR-Ada is tested mainly with 4.7.x.
* As before, the packaging is done by using gnat 4.7 binaries from Fedora 18.
* The release contains two of my patches, which are not in the official
  AVR-Ada 1.2.2 release.

  * The first patch reverts AVR.UART behaviour back to AVR-Ada 1.2 (=interrupt mode also works)
  * The second patch fixes linking errors with libavrada.a, so that all boards get correct CPU frequencies and other code.

* The RPMs are unofficial in every possible way and they are not endorsed by Fedora or AVR-Ada projects.
* This time I was bit in a hurry, so they are not tested as well as before.
  If there are bugs, complain to me (tero.koskinen@iki.fi).

