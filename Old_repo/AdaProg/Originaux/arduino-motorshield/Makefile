MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT?=/dev/ttyACM0
BAUD?=115200
AVRDUDE=sudo avrdude

motor.hex: motor.adb
	avr-gnatmake -p -XMCU=$(MCU) -Pmotor.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom motor.elf motor.hex

upload-uno: motor.hex
	$(AVRDUDE) -c arduino -p atmega328p -P $(PORT) -b $(BAUD) -U flash:w:motor.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pmotor.gpr
	rm -f motor.hex motor.elf
