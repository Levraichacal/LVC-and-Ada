Storing large data amount to flash memory
=========================================

:date: 2013-05-28 22:30
:tags: progmem, lcd, nokia3310

If you paid attention in my `Olimex MOD-LCD3310 article`_,
you noticed that I stored a large array for font/characters
to RAM memory. This is highly inefficient since the array
takes space both on the flash and on the memory at the same
time.

To make the space usage more efficient, you can specify
the array to be only on the flash. This way, you can
use the precious RAM to other things. The downside is that
you cannot access the array on the flash as easily as
from RAM.

However, AVR-Ada provides you relatively simple means
to place data on flash and to retrieve it from there.
You need to do only two things, add a linker pragma like::

   pragma Linker_Section (Fonts, ".progmem");

and use AVR.Programspace package to fetch the data::

   Place := Fonts (0, I)'Address;
   Offset := AVR.Programspace.Get_Byte (Place);

Notice how the (flash) address of *Fonts* array is specified
by *Address* attribute. You don't need to know any details
how the address is calculated, the compiler handles everything
for you.

The updated code is available at `my arduino-mod-lcd3310 repository <https://bitbucket.org/tkoskine/arduino-mod-lcd3310>`_ as usual.
The revision number for this change is *ab6d9f7edc6f*.

And here the .bss usage before and after Linker_Section pragma::

   $ avr-size main-ram.elf
      text    data     bss     dec     hex filename
      2570     582     512    3664     e50 main-ram.elf
   $ avr-size main-progmem.elf
      text    data     bss     dec     hex filename
      3038     112     511    3661     e4d main-progmem.elf


The data (RAM) usage is higher without .progmem Linker_Section pragma,
and with the pragma the text (flash section) is higher.

.. _Olimex MOD-LCD3310 article: http://arduino.ada-language.com/displaying-characters-on-mod-lcd3310-by-using-olimexino-328-with-ada.html
