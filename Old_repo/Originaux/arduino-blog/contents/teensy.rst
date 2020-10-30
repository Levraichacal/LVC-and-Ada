AVR-Ada gets teensy 2.0, teensy++ 2.0, Arduino Leonardo and Arduino Micro support
=================================================================================

:tags: teensy, leonardo, atmega32u4, at90usb1286, i2c, attiny
:date: 2013-09-16 22:00

.. image:: http://farm4.staticflickr.com/3727/9772670044_78b06e6885.jpg
   :target: http://www.flickr.com/photos/terokoskinen/9772670044/
   :height: 375
   :width: 500

I just pushed initial support for atmega32u4 and improved support for at90usb1286 MCUs
to AVR-Ada repository. This means you can now use AVR-Ada with your teensy_ and Arduino Leonardo devices.

Teensy 2.0, Arduino Leonardo, and Arduino Micro devices have atmega32u4 processor
and teensy++ 2.0 has at90usb1286 processor. These processors have USB functionality
built in the processor itself, so in theory you can let them simulate USB keyboards,
mouses, and other devices relatively easily. However, AVR-Ada itself does not
contain any USB code yet, so you are expected to do everything from scratch by yourself.

In addition, I also pushed some USI code for attiny processors and now you can
use attiny2313 or attiny4313 as I2C master.


.. _teensy: http://www.pjrc.com/teensy/

