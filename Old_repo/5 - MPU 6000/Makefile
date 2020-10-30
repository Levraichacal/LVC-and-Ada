MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT?=/dev/ttyACM0
BAUD?=115200
AVRDUDE=sudo avrdude

mpu6000.hex: mpu6000.adb
	avr-gnatmake -p -XMCU=$(MCU) -Pmpu6000.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom mpu6000.elf mpu6000.hex

upload: mpu6000.hex
	$(AVRDUDE) -D -c stk500v2 -p m2560 -P $(PORT) -b $(BAUD) -U flash:w:mpu6000.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pmpu6000.gpr
	rm -f mpu6000.hex mpu6000.elf main.map
