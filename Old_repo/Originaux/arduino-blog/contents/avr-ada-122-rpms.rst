AVR-Ada 1.2.2 RPMs for Fedora 18
================================

:date: 2013-06-18 12:45
:tags: avrada, fedora, rpms

I updated my `AVR-Ada rpms <http://arduino.ada-language.com/avr-ada-rpms-for-fedora-17-and-18.html>`_ for Fedora 18 to version 1.2.2.
I didn't update Fedora 17 rpms, since Fedora 17 support
will end soon anyway, and I felt that the update is waste
of time. However, if you need Fedora 17 rpms, you can
build them by yourself.

Here is the update procedure for Fedora 18 AVR-Ada 1.2.2 rpms:

::

   sudo yum clean expire-cache
   sudo yum update --nogpgcheck avr-ada-rts avr-ada-lib

If the update does not work, you can always remove the packages
and install them from scratch.


