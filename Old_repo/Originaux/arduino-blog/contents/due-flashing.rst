Arduino Due
===========

:date: 2013-01-23 22:00
:tags: arduino-due

`Arduino Due`_ is another Arduino board, but with Atmel ARM
processor instead of AVR. I have had Due for a while, but
flashing it on Linux had not been working. However, now I
managed to flash simple blink app (written in C++) on Linux
using bossac:

::

   sudo ~/programs64/arduino-1.5.1/hardware/tools/bossac --port=ttyACM1 \
     -U false -e -w -v -b /tmp/build5203148458475074262.tmp/Blink.cpp.bin -R

This means that I can start porting GNAT and a variant of AVR-Ada
to Arduino DUE. All of the AVR packages need to be rewritten and
other packages will need quite big changes also, so don't hold
your breath. If I am lucky, I have something ready before end
of the year. :)

Ps. Before running bossac, you need to hold erase button down for a few seconds.

.. _Arduino Due: http://arduino.cc/en/Main/ArduinoBoardDue
