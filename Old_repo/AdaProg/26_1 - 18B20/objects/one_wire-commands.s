	.file	"one_wire-commands.ads"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
 ;  GNU Ada (GCC) version 4.7.0 (avr)
 ; 	compiled by GNU C version 4.7.0, GMP version 5.0.2, MPFR version 3.1.0-p3, MPC version 0.9
 ;  GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ;  options passed:  -I - -Os -fRTS=rts/avr5 -fverbose-asm
 ;  -frename-registers -fdata-sections -ffunction-sections -gnatez -gnatea
 ;  -gnatec=/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/objects/GNAT-TEMP-000001.TMP
 ;  -gnatec=/opt/avrada/avr/lib/gnat/gnat.adc -gdwarf-2 -gnatwp -gnatwu
 ;  -gnatn -gnatp -gnatVn -gnatef -gnatdY -mmcu=atmega328p
 ;  -gnateDMCU=atmega328p -gnateDUART=usart0 -gnaty3abefhiklM130prn -gnatA
 ;  -gnatem=/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/objects/GNAT-TEMP-000002.TMP
 ;  -gnatez
 ;  /home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-commands.ads
 ;  options enabled:  -fauto-inc-dec -fbranch-count-reg -fcaller-saves
 ;  -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
 ;  -fcrossjumping -fcse-follow-jumps -fdata-sections -fdebug-types-section
 ;  -fdefer-pop -fdevirtualize -fearly-inlining
 ;  -feliminate-unused-debug-types -fexpensive-optimizations
 ;  -fforward-propagate -ffunction-cse -ffunction-sections -fgcse -fgcse-lm
 ;  -fgnu-runtime -fguess-branch-probability -fident -fif-conversion
 ;  -fif-conversion2 -findirect-inlining -finline -finline-atomics
 ;  -finline-functions -finline-functions-called-once
 ;  -finline-small-functions -fipa-cp -fipa-profile -fipa-pure-const
 ;  -fipa-reference -fipa-sra -fira-share-save-slots
 ;  -fira-share-spill-slots -fivopts -fkeep-static-consts
 ;  -fleading-underscore -fmath-errno -fmerge-constants
 ;  -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
 ;  -foptimize-register-move -foptimize-sibling-calls -fpartial-inlining
 ;  -fpeephole -fpeephole2 -fprefetch-loop-arrays -freg-struct-return
 ;  -fregmove -frename-registers -freorder-blocks -freorder-functions
 ;  -frerun-cse-after-loop -fsched-critical-path-heuristic
 ;  -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
 ;  -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
 ;  -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fshow-column
 ;  -fshrink-wrap -fsigned-zeros -fsplit-ivs-in-unroller -fsplit-wide-types
 ;  -fstrict-aliasing -fstrict-overflow -fstrict-volatile-bitfields
 ;  -fthread-jumps -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
 ;  -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-copy-prop
 ;  -ftree-copyrename -ftree-dce -ftree-dominator-opts -ftree-dse
 ;  -ftree-forwprop -ftree-fre -ftree-loop-if-convert -ftree-loop-im
 ;  -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
 ;  -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc -ftree-scev-cprop
 ;  -ftree-sink -ftree-slp-vectorize -ftree-sra -ftree-switch-conversion
 ;  -ftree-tail-merge -ftree-ter -ftree-vect-loop-version -ftree-vrp
 ;  -funit-at-a-time -fvar-tracking -fvar-tracking-assignments
 ;  -fverbose-asm

	.text
.Ltext0:
.global	one_wire__commands__write_scratchpad
	.section	.rodata.one_wire__commands__write_scratchpad,"a",@progbits
	.type	one_wire__commands__write_scratchpad, @object
	.size	one_wire__commands__write_scratchpad, 1
one_wire__commands__write_scratchpad:
	.byte	78
.global	one_wire__commands__copy_scratchpad
	.section	.rodata.one_wire__commands__copy_scratchpad,"a",@progbits
	.type	one_wire__commands__copy_scratchpad, @object
	.size	one_wire__commands__copy_scratchpad, 1
one_wire__commands__copy_scratchpad:
	.byte	72
.global	one_wire__commands__read_scratchpad
	.section	.rodata.one_wire__commands__read_scratchpad,"a",@progbits
	.type	one_wire__commands__read_scratchpad, @object
	.size	one_wire__commands__read_scratchpad, 1
one_wire__commands__read_scratchpad:
	.byte	-66
.global	one_wire__commands__read_power_supply
	.section	.rodata.one_wire__commands__read_power_supply,"a",@progbits
	.type	one_wire__commands__read_power_supply, @object
	.size	one_wire__commands__read_power_supply, 1
one_wire__commands__read_power_supply:
	.byte	-76
.global	one_wire__commands__recall_eeprom
	.section	.rodata.one_wire__commands__recall_eeprom,"a",@progbits
	.type	one_wire__commands__recall_eeprom, @object
	.size	one_wire__commands__recall_eeprom, 1
one_wire__commands__recall_eeprom:
	.byte	-72
.global	one_wire__commands__convert_t
	.section	.rodata.one_wire__commands__convert_t,"a",@progbits
	.type	one_wire__commands__convert_t, @object
	.size	one_wire__commands__convert_t, 1
one_wire__commands__convert_t:
	.byte	68
.global	one_wire__commands__alarm_search
	.section	.rodata.one_wire__commands__alarm_search,"a",@progbits
	.type	one_wire__commands__alarm_search, @object
	.size	one_wire__commands__alarm_search, 1
one_wire__commands__alarm_search:
	.byte	-20
.global	one_wire__commands__overdrive_match_rom
	.section	.rodata.one_wire__commands__overdrive_match_rom,"a",@progbits
	.type	one_wire__commands__overdrive_match_rom, @object
	.size	one_wire__commands__overdrive_match_rom, 1
one_wire__commands__overdrive_match_rom:
	.byte	105
.global	one_wire__commands__overdrive_skip_rom
	.section	.rodata.one_wire__commands__overdrive_skip_rom,"a",@progbits
	.type	one_wire__commands__overdrive_skip_rom, @object
	.size	one_wire__commands__overdrive_skip_rom, 1
one_wire__commands__overdrive_skip_rom:
	.byte	60
.global	one_wire__commands__search_rom
	.section	.rodata.one_wire__commands__search_rom,"a",@progbits
	.type	one_wire__commands__search_rom, @object
	.size	one_wire__commands__search_rom, 1
one_wire__commands__search_rom:
	.byte	-16
.global	one_wire__commands__skip_rom
	.section	.rodata.one_wire__commands__skip_rom,"a",@progbits
	.type	one_wire__commands__skip_rom, @object
	.size	one_wire__commands__skip_rom, 1
one_wire__commands__skip_rom:
	.byte	-52
.global	one_wire__commands__match_rom
	.section	.rodata.one_wire__commands__match_rom,"a",@progbits
	.type	one_wire__commands__match_rom, @object
	.size	one_wire__commands__match_rom, 1
one_wire__commands__match_rom:
	.byte	85
.global	one_wire__commands__read_rom
	.section	.rodata.one_wire__commands__read_rom,"a",@progbits
	.type	one_wire__commands__read_rom, @object
	.size	one_wire__commands__read_rom, 1
one_wire__commands__read_rom:
	.byte	51
.global	one_wire__commands_E
	.section	.data.one_wire__commands_E,"aw",@progbits
	.type	one_wire__commands_E, @object
	.size	one_wire__commands_E, 2
one_wire__commands_E:
	.zero	2
	.text
.Letext0:
	.file 1 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-commands.ads"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x11f
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF13
	.byte	0xd
	.long	.LASF14
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF15
	.uleb128 0x3
	.byte	0
	.byte	0xff
	.long	.LASF16
	.long	0x2b
	.uleb128 0x4
	.byte	0x1
	.byte	0x7
	.long	.LASF17
	.byte	0x1
	.uleb128 0x5
	.long	.LASF0
	.byte	0x1
	.byte	0x1c
	.long	0x45
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__commands__read_rom
	.uleb128 0x6
	.long	0x20
	.uleb128 0x5
	.long	.LASF1
	.byte	0x1
	.byte	0x24
	.long	0x45
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__commands__match_rom
	.uleb128 0x5
	.long	.LASF2
	.byte	0x1
	.byte	0x28
	.long	0x45
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__commands__skip_rom
	.uleb128 0x5
	.long	.LASF3
	.byte	0x1
	.byte	0x2b
	.long	0x45
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__commands__search_rom
	.uleb128 0x5
	.long	.LASF4
	.byte	0x1
	.byte	0x2e
	.long	0x45
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__commands__overdrive_skip_rom
	.uleb128 0x5
	.long	.LASF5
	.byte	0x1
	.byte	0x2f
	.long	0x45
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__commands__overdrive_match_rom
	.uleb128 0x5
	.long	.LASF6
	.byte	0x1
	.byte	0x33
	.long	0x45
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__commands__alarm_search
	.uleb128 0x5
	.long	.LASF7
	.byte	0x1
	.byte	0x3b
	.long	0x45
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__commands__convert_t
	.uleb128 0x5
	.long	.LASF8
	.byte	0x1
	.byte	0x3e
	.long	0x45
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__commands__recall_eeprom
	.uleb128 0x5
	.long	.LASF9
	.byte	0x1
	.byte	0x41
	.long	0x45
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__commands__read_power_supply
	.uleb128 0x5
	.long	.LASF10
	.byte	0x1
	.byte	0x44
	.long	0x45
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__commands__read_scratchpad
	.uleb128 0x5
	.long	.LASF11
	.byte	0x1
	.byte	0x47
	.long	0x45
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__commands__copy_scratchpad
	.uleb128 0x5
	.long	.LASF12
	.byte	0x1
	.byte	0x4a
	.long	0x45
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__commands__write_scratchpad
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.uleb128 0xb
	.uleb128 0x2f
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x14
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF11:
	.string	"one_wire__commands__copy_scratchpad"
.LASF13:
	.string	"GNU Ada 4.7.0"
.LASF10:
	.string	"one_wire__commands__read_scratchpad"
.LASF16:
	.string	"one_wire__command_code"
.LASF7:
	.string	"one_wire__commands__convert_t"
.LASF9:
	.string	"one_wire__commands__read_power_supply"
.LASF1:
	.string	"one_wire__commands__match_rom"
.LASF17:
	.string	"one_wire__Tcommand_codeB"
.LASF14:
	.string	"/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-commands.ads"
.LASF8:
	.string	"one_wire__commands__recall_eeprom"
.LASF4:
	.string	"one_wire__commands__overdrive_skip_rom"
.LASF0:
	.string	"one_wire__commands__read_rom"
.LASF2:
	.string	"one_wire__commands__skip_rom"
.LASF15:
	.string	"interfaces__unsigned_8"
.LASF6:
	.string	"one_wire__commands__alarm_search"
.LASF12:
	.string	"one_wire__commands__write_scratchpad"
.LASF3:
	.string	"one_wire__commands__search_rom"
.LASF5:
	.string	"one_wire__commands__overdrive_match_rom"
	.ident	"GCC: (GNU) 4.7.0"
.global __do_copy_data
