Counting seconds with attiny4313
================================

:date: 2013-01-21 21:30
:tags: attiny4313, time, 7segment, display

`AVR-Ada`_ includes AVR.Real_Time package and
separate AVR.Real_Time.Clock function, whose job is to
return the current time.
On `Arduino`_, the current time means seconds from the device bootup,
in other words it tells you how long the device has been on.

Relevant code is following

::

   with AVR.Real_Time;
   with AVR.Real_Time.Clock;
   use AVR.Real_Time;

   Start_Time : AVR.Real_Time.Time;
   ...
   Start_Time := AVR.Real_Time.Clock;
   if AVR.Real_Time.Clock - Start_Time > 1.0 then
      ...
   end if;


When you combine this information with the `7-segment display`_,
you can create a simple counter:

.. image:: http://farm9.staticflickr.com/8053/8369883642_9c8a539252.jpg
   :target: http://www.flickr.com/photos/66708330@N00/8369883642/

Adding buttons to reset/stop time is left as an exercise for the reader :).

Code is at `bitbucket`_. Notice that the repository is
*arduino-mega2560-4d-7segment* and the branch is this time *attiny4313*.
This is mostly because I was lazy and didn't want to create a separate
repository for this simple demo.

To get the code with `Mercurial`_ you need to do:

::

   hg clone https://bitbucket.org/tkoskine/arduino-mega2560-4d-7segment
   cd arduino-mega2560-4d-7segment
   hg update attiny4313



.. _AVR-Ada: http://sourceforge.net/projects/avr-ada/
.. _Arduino: http://www.arduino.cc/
.. _7-segment display: http://arduino.ada-language.com/controlling-4-digit-7-segment-display.html
.. _bitbucket: https://bitbucket.org/tkoskine/arduino-mega2560-4d-7segment
.. _Mercurial: http://mercurial.selenic.com/
