MCU=attiny4313
CFLAGS=-Wall -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU)
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PART=t4313
AVRDUDE=sudo avrdude

GNATMAKE=avr-gnatmake
ADA_RTS=rts/$(MCU)
MFLAGS=-XMCU=$(MCU) -Pmain.gpr
HEX_FILE=main.hex

main.hex: main.adb attiny_twi.ads attiny_twi-master.ads attiny_twi-master.adb
	$(GNATMAKE) -p $(MFLAGS)
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf $(HEX_FILE)

upload: main.hex
	$(AVRDUDE) -c usbtiny -p $(PART) -U flash:w:$(HEX_FILE)

check:
	$(AVRDUDE) -c usbtiny -p $(PART)

size: main.hex
	avr-size $(HEX_FILE)

programfuses:
	@echo Programming fuses. Press Ctrl-C to cancel.
	@sh -c "read foo"
	sudo avrdude -p t2313 -c usbtiny -U lfuse:w:0xdc:m -U hfuse:w:0xdf:m -U efuse:w:0xff:m

clean:
	-avr-gnatclean -XMCU=$(MCU) -Pmain.gpr
	rm -f main.hex main.elf
