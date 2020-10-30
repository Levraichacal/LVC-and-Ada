MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT?=/dev/ttyACM0
BAUD?=115200
AVRDUDE=sudo avrdude

ledpwm.hex: ledpwm.adb
	avr-gnatmake -p -XMCU=$(MCU) -Pledpwm.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom ledpwm.elf ledpwm.hex

upload-uno: ledpwm.hex
	$(AVRDUDE) -c arduino -p atmega328p -P $(PORT) -b $(BAUD) -U flash:w:ledpwm.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pledpwm.gpr
	rm -f ledpwm.hex ledpwm.elf
