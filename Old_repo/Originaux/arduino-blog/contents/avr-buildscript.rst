Automating avr-gnat and AVR-Ada installation
============================================

:date: 2012-06-13 18:00
:tags: gnat, shell, avrada12

For those, who don't want to follow my `manual build instructions <http://arduino.ada-language.com//building-avr-gnat-for-avr-ada.html>`_, I made
`a script <https://bitbucket.org/tkoskine/avr-ada-build-script/raw/tip/build-avr-ada-environment.sh>`_ which automates the steps.

You can use the script like this:

::

    wget https://bitbucket.org/tkoskine/avr-ada-build-script/get/tip.zip
    unzip tip.zip
    cd tkoskine-avr-ada-build-script-1677e4b66123
    sh -x build-avr-ada-environment.sh

The script will build GNAT 4.7.0 into $HOME/programs64/gnat-native-470 directory
and AVR-Ada and AVR-GNAT into $HOME/programs64/avr-ada-470 directory. If you
want to change the locations, you need to edit GNATPREFIX and AVRADAPREFIX
variables at the beginning of the script.

The script is tested on Fedora 16 and Fedora 17, although I make no
promises that it actually works anywhere.
