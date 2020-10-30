MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
BAUD?=115200
AVRDUDE=sudo avrdude

display.hex: display.adb
	avr-gnatmake -p -XMCU=$(MCU) -Pdisplay.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom display.elf display.hex

upload-mega2560: display.hex
	$(AVRDUDE) -c stk500v2 -p m2560 -P $(PORT) -b $(BAUD) -U flash:w:display.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pdisplay.gpr
	rm -f display.hex display.elf main.map
