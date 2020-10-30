MCU=atmega328p
#MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
#PART=m2560
AVRDUDE=avrdude
PROG=-c arduino
#PROG=-D -c stk500v2
BAUD = 115200

ir_receiver.hex: irreceiver.adb main.adb Makefile
#	avr-gnatmake -gnat2012 -p -XMCU=$(MCU) -Pir_receiver.gpr
	avr-gnatmake -p -XMCU=$(MCU) -Pir_receiver.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf ir_receiver.hex

upload: ir_receiver.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:ir_receiver.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pir_receiver.gpr
	rm -f ir_receiver.hex main.elf main.map *~ -r objects
