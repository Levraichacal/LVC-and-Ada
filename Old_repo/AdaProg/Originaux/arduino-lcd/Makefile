MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
AVRDUDE=avrdude

lcd_test.hex: lcd_test.adb lcd-wiring.ads lcd.ads lcd.adb
	avr-gnatmake -save-temps -p -XMCU=$(MCU) -Plcd.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom lcd_test.elf lcd_test.hex

upload-uno: lcd_test.hex
	$(AVRDUDE) -p -c arduino -p atmega328p -P $(PORT) -U flash:w:lcd_test.hex

upload-usbtiny: lcd_test.hex
	$(AVRDUDE) -c usbtiny -p atmega328p -P usb -b 115200 -U flash:w:lcd_test.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Plcd.gpr
	rm -f lcd_test.hex lcd_test.elf
