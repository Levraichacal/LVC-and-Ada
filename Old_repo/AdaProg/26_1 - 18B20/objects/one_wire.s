	.file	"one_wire.adb"
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
 ;  -gnatez /home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire.adb
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
	.section	.text.one_wire__wait_480us,"ax",@progbits
.global	one_wire__wait_480us
	.type	one_wire__wait_480us, @function
one_wire__wait_480us:
.LFB2:
	.file 1 "/opt/avrada/avr/lib/gnat/avr_lib/avr-wait.adb"
	.loc 1 56 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 64 0
	ldi r24,lo8(1935)	 ; ,
	ldi r25,hi8(1935)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	ret
.LFE2:
	.size	one_wire__wait_480us, .-one_wire__wait_480us
	.section	.text.one_wire__wait_410us,"ax",@progbits
.global	one_wire__wait_410us
	.type	one_wire__wait_410us, @function
one_wire__wait_410us:
.LFB3:
	.loc 1 56 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 64 0
	ldi r24,lo8(1652)	 ; ,
	ldi r25,hi8(1652)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	rjmp .
	nop
	ret
.LFE3:
	.size	one_wire__wait_410us, .-one_wire__wait_410us
	.section	.text.one_wire__wait_70us,"ax",@progbits
.global	one_wire__wait_70us
	.type	one_wire__wait_70us, @function
one_wire__wait_70us:
.LFB4:
	.loc 1 56 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 64 0
	ldi r24,lo8(282)	 ; ,
	ldi r25,hi8(282)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	ret
.LFE4:
	.size	one_wire__wait_70us, .-one_wire__wait_70us
	.section	.text.one_wire__wait_50us,"ax",@progbits
.global	one_wire__wait_50us
	.type	one_wire__wait_50us, @function
one_wire__wait_50us:
.LFB5:
	.loc 1 56 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 64 0
	ldi r24,lo8(201)	 ; ,
	ldi r25,hi8(201)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
	nop
	ret
.LFE5:
	.size	one_wire__wait_50us, .-one_wire__wait_50us
	.section	.text.one_wire__wait_10us,"ax",@progbits
.global	one_wire__wait_10us
	.type	one_wire__wait_10us, @function
one_wire__wait_10us:
.LFB6:
	.loc 1 56 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 64 0
	ldi r24,lo8(53)	 ; ,
	1: dec r24	 ; 
	brne 1b
	rjmp .
	ret
.LFE6:
	.size	one_wire__wait_10us, .-one_wire__wait_10us
	.section	.text.one_wire__wait_6us,"ax",@progbits
.global	one_wire__wait_6us
	.type	one_wire__wait_6us, @function
one_wire__wait_6us:
.LFB7:
	.loc 1 56 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 64 0
	ldi r24,lo8(32)	 ; ,
	1: dec r24	 ; 
	brne 1b
	ret
.LFE7:
	.size	one_wire__wait_6us, .-one_wire__wait_6us
	.section	.text.one_wire__wait_4us,"ax",@progbits
.global	one_wire__wait_4us
	.type	one_wire__wait_4us, @function
one_wire__wait_4us:
.LFB8:
	.loc 1 56 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 64 0
	ldi r24,lo8(21)	 ; ,
	1: dec r24	 ; 
	brne 1b
	nop
	ret
.LFE8:
	.size	one_wire__wait_4us, .-one_wire__wait_4us
	.section	.text.one_wire__init_comm,"ax",@progbits
.global	one_wire__init_comm
	.type	one_wire__init_comm, @function
one_wire__init_comm:
.LFB9:
	.file 2 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-init_comm.adb"
	.loc 2 2 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 2 4 0
	cli
	ret
.LFE9:
	.size	one_wire__init_comm, .-one_wire__init_comm
	.section	.text.one_wire__exit_comm,"ax",@progbits
.global	one_wire__exit_comm
	.type	one_wire__exit_comm, @function
one_wire__exit_comm:
.LFB10:
	.file 3 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire.adb"
	.loc 3 80 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 82 0
	sei
	ret
.LFE10:
	.size	one_wire__exit_comm, .-one_wire__exit_comm
	.section	.text.one_wire__set_data_line_high,"ax",@progbits
.global	one_wire__set_data_line_high
	.type	one_wire__set_data_line_high, @function
one_wire__set_data_line_high:
.LFB11:
	.loc 3 86 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 90 0
	sbi 0x4,3	 ; ,
	.loc 3 91 0
	sbi 0x5,3	 ; ,
	ret
.LFE11:
	.size	one_wire__set_data_line_high, .-one_wire__set_data_line_high
	.section	.text.one_wire__reset,"ax",@progbits
.global	one_wire__reset
	.type	one_wire__reset, @function
one_wire__reset:
.LFB12:
	.loc 3 95 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL0:
	.loc 3 109 0
	sbi 0x4,3	 ; ,
	.loc 3 110 0
	cbi 0x5,3	 ; ,
.LBB16:
.LBB17:
	.loc 1 64 0
	ldi r24,lo8(1935)	 ; ,
	ldi r25,hi8(1935)	 ; ,
	1: sbiw r24,1	 ; 
	brne 1b
.LBE17:
.LBE16:
	.loc 3 115 0
	cbi 0x4,3	 ; ,
	.loc 3 116 0
	sbi 0x5,3	 ; ,
.LBB18:
.LBB19:
	.loc 1 64 0
	ldi r30,lo8(282)	 ; ,
	ldi r31,hi8(282)	 ; ,
	1: sbiw r30,1	 ; 
	brne 1b
.LBE19:
.LBE18:
	.loc 3 122 0
	in r24,0x3	 ;  D.1624, MEM[(volatile struct avr__bits_in_byte___XP1 & {ref-all})35].OBJECT
.LVL1:
.LBB20:
.LBB21:
	.loc 1 64 0
	ldi r30,lo8(1652)	 ; ,
	ldi r31,hi8(1652)	 ; ,
	1: sbiw r30,1	 ; 
	brne 1b
	rjmp .
	nop
.LBE21:
.LBE20:
	.loc 3 130 0
	sbis 0x3,3	 ; ,
	rjmp .L13	 ; 
	.loc 3 122 0
	bst r24,3	 ;  D.1624,
	clr r24	 ;  found
	bld r24,0	 ;  found
.LVL2:
	ldi r25,lo8(1)	 ;  tmp73,
	eor r24,r25	 ;  found, tmp73
	ret
.LVL3:
.L13:
	.loc 3 132 0
	ldi r24,0	 ;  found
.LVL4:
	.loc 3 169 0
	ret
.LFE12:
	.size	one_wire__reset, .-one_wire__reset
	.section	.text.one_wire__read_write_bit,"ax",@progbits
.global	one_wire__read_write_bit
	.type	one_wire__read_write_bit, @function
one_wire__read_write_bit:
.LFB13:
	.loc 3 172 0
.LVL5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 224 0
	cli
	.loc 3 227 0
	sbi 0x4,3	 ; ,
	.loc 3 228 0
	cbi 0x5,3	 ; ,
.LBB22:
.LBB23:
	.loc 1 64 0
	ldi r25,lo8(21)	 ; ,
	1: dec r25	 ; 
	brne 1b
	nop
.LBE23:
.LBE22:
	.loc 3 233 0
	tst r24	 ;  bit
	breq .L15	 ; ,
	.loc 3 234 0
	cbi 0x4,3	 ; ,
	.loc 3 235 0
	sbi 0x5,3	 ; ,
.L15:
.LBB24:
.LBB25:
	.loc 1 64 0
	ldi r30,lo8(32)	 ; ,
	1: dec r30	 ; 
	brne 1b
.LBE25:
.LBE24:
	.loc 3 242 0
	sbis 0x3,3	 ; ,
	.loc 3 243 0
	ldi r24,0	 ;  return_bit
.LVL6:
.L16:
.LBB26:
.LBB27:
	.loc 1 64 0
	ldi r30,lo8(201)	 ; ,
	ldi r31,hi8(201)	 ; ,
	1: sbiw r30,1	 ; 
	brne 1b
	nop
.LBE27:
.LBE26:
	.loc 3 249 0
	cbi 0x4,3	 ; ,
	.loc 3 250 0
	sbi 0x5,3	 ; ,
.LBB28:
.LBB29:
	.loc 1 64 0
	ldi r31,lo8(53)	 ; ,
	1: dec r31	 ; 
	brne 1b
	rjmp .
.LBE29:
.LBE28:
	.loc 3 255 0
	sei
	.loc 3 258 0
	ret
.LFE13:
	.size	one_wire__read_write_bit, .-one_wire__read_write_bit
	.section	.text.one_wire__touch,"ax",@progbits
.global	one_wire__touch
	.type	one_wire__touch, @function
one_wire__touch:
.LFB14:
	.loc 3 261 0
.LVL7:
	push r17	 ; 
.LCFI0:
	push r28	 ; 
.LCFI1:
	push r29	 ; 
.LCFI2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	mov r17,r24	 ;  v, set
	.loc 3 262 0
	ldi r28,lo8(8)	 ;  ivtmp.63,
	ldi r29,0	 ;  ivtmp.63
.LVL8:
.L23:
.LBB30:
	.loc 3 266 0 discriminator 1
	mov r24,r17	 ; , v
	andi r24,lo8(1)	 ; ,
	call one_wire__read_write_bit	 ; 
.LVL9:
	.loc 3 267 0 discriminator 1
	lsr r17	 ;  v
.LVL10:
	.loc 3 268 0 discriminator 1
	cpse r24,__zero_reg__	 ; 
	.loc 3 269 0
	ori r17,lo8(-128)	 ;  v,
.LVL11:
.L22:
	sbiw r28,1	 ;  ivtmp.63,
	.loc 3 265 0
	brne .L23	 ; ,
.LBE30:
	.loc 3 273 0
	mov r24,r17	 ; , v
.LVL12:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
.LVL13:
	ret
.LFE14:
	.size	one_wire__touch, .-one_wire__touch
	.section	.text.one_wire__send_command,"ax",@progbits
.global	one_wire__send_command
	.type	one_wire__send_command, @function
one_wire__send_command:
.LFB15:
	.loc 3 276 0
.LVL14:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 279 0
	jmp one_wire__touch	 ; 
.LVL15:
.LFE15:
	.size	one_wire__send_command, .-one_wire__send_command
	.section	.text.one_wire__get,"ax",@progbits
.global	one_wire__get
	.type	one_wire__get, @function
one_wire__get:
.LFB16:
	.loc 3 283 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 285 0
	ldi r24,lo8(-1)	 ; ,
	jmp one_wire__touch	 ; 
.LVL16:
.LFE16:
	.size	one_wire__get, .-one_wire__get
	.section	.text.one_wire___elabb,"ax",@progbits
.global	one_wire___elabb
	.type	one_wire___elabb, @function
one_wire___elabb:
.LFB0:
	.loc 3 30 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
.LFE0:
	.size	one_wire___elabb, .-one_wire___elabb
.global	one_wire__wait_4usGP2936__micro_secondsX
	.section	.rodata.one_wire__wait_4usGP2936__micro_secondsX,"a",@progbits
	.type	one_wire__wait_4usGP2936__micro_secondsX, @object
	.size	one_wire__wait_4usGP2936__micro_secondsX, 8
one_wire__wait_4usGP2936__micro_secondsX:
	.byte	4
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__wait_4usGP2936__crystal_hertzX
	.section	.rodata.one_wire__wait_4usGP2936__crystal_hertzX,"a",@progbits
	.type	one_wire__wait_4usGP2936__crystal_hertzX, @object
	.size	one_wire__wait_4usGP2936__crystal_hertzX, 8
one_wire__wait_4usGP2936__crystal_hertzX:
	.byte	0
	.byte	36
	.byte	-12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__wait_6usGP2759__micro_secondsX
	.section	.rodata.one_wire__wait_6usGP2759__micro_secondsX,"a",@progbits
	.type	one_wire__wait_6usGP2759__micro_secondsX, @object
	.size	one_wire__wait_6usGP2759__micro_secondsX, 8
one_wire__wait_6usGP2759__micro_secondsX:
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__wait_6usGP2759__crystal_hertzX
	.section	.rodata.one_wire__wait_6usGP2759__crystal_hertzX,"a",@progbits
	.type	one_wire__wait_6usGP2759__crystal_hertzX, @object
	.size	one_wire__wait_6usGP2759__crystal_hertzX, 8
one_wire__wait_6usGP2759__crystal_hertzX:
	.byte	0
	.byte	36
	.byte	-12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__wait_10usGP2579__micro_secondsX
	.section	.rodata.one_wire__wait_10usGP2579__micro_secondsX,"a",@progbits
	.type	one_wire__wait_10usGP2579__micro_secondsX, @object
	.size	one_wire__wait_10usGP2579__micro_secondsX, 8
one_wire__wait_10usGP2579__micro_secondsX:
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__wait_10usGP2579__crystal_hertzX
	.section	.rodata.one_wire__wait_10usGP2579__crystal_hertzX,"a",@progbits
	.type	one_wire__wait_10usGP2579__crystal_hertzX, @object
	.size	one_wire__wait_10usGP2579__crystal_hertzX, 8
one_wire__wait_10usGP2579__crystal_hertzX:
	.byte	0
	.byte	36
	.byte	-12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__wait_50usGP2399__micro_secondsX
	.section	.rodata.one_wire__wait_50usGP2399__micro_secondsX,"a",@progbits
	.type	one_wire__wait_50usGP2399__micro_secondsX, @object
	.size	one_wire__wait_50usGP2399__micro_secondsX, 8
one_wire__wait_50usGP2399__micro_secondsX:
	.byte	50
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__wait_50usGP2399__crystal_hertzX
	.section	.rodata.one_wire__wait_50usGP2399__crystal_hertzX,"a",@progbits
	.type	one_wire__wait_50usGP2399__crystal_hertzX, @object
	.size	one_wire__wait_50usGP2399__crystal_hertzX, 8
one_wire__wait_50usGP2399__crystal_hertzX:
	.byte	0
	.byte	36
	.byte	-12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__wait_70usGP2219__micro_secondsX
	.section	.rodata.one_wire__wait_70usGP2219__micro_secondsX,"a",@progbits
	.type	one_wire__wait_70usGP2219__micro_secondsX, @object
	.size	one_wire__wait_70usGP2219__micro_secondsX, 8
one_wire__wait_70usGP2219__micro_secondsX:
	.byte	70
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__wait_70usGP2219__crystal_hertzX
	.section	.rodata.one_wire__wait_70usGP2219__crystal_hertzX,"a",@progbits
	.type	one_wire__wait_70usGP2219__crystal_hertzX, @object
	.size	one_wire__wait_70usGP2219__crystal_hertzX, 8
one_wire__wait_70usGP2219__crystal_hertzX:
	.byte	0
	.byte	36
	.byte	-12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__wait_410usGP2036__micro_secondsX
	.section	.rodata.one_wire__wait_410usGP2036__micro_secondsX,"a",@progbits
	.type	one_wire__wait_410usGP2036__micro_secondsX, @object
	.size	one_wire__wait_410usGP2036__micro_secondsX, 8
one_wire__wait_410usGP2036__micro_secondsX:
	.byte	-102
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__wait_410usGP2036__crystal_hertzX
	.section	.rodata.one_wire__wait_410usGP2036__crystal_hertzX,"a",@progbits
	.type	one_wire__wait_410usGP2036__crystal_hertzX, @object
	.size	one_wire__wait_410usGP2036__crystal_hertzX, 8
one_wire__wait_410usGP2036__crystal_hertzX:
	.byte	0
	.byte	36
	.byte	-12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__wait_480usGP1853__micro_secondsX
	.section	.rodata.one_wire__wait_480usGP1853__micro_secondsX,"a",@progbits
	.type	one_wire__wait_480usGP1853__micro_secondsX, @object
	.size	one_wire__wait_480usGP1853__micro_secondsX, 8
one_wire__wait_480usGP1853__micro_secondsX:
	.byte	-32
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__wait_480usGP1853__crystal_hertzX
	.section	.rodata.one_wire__wait_480usGP1853__crystal_hertzX,"a",@progbits
	.type	one_wire__wait_480usGP1853__crystal_hertzX, @object
	.size	one_wire__wait_480usGP1853__crystal_hertzX, 8
one_wire__wait_480usGP1853__crystal_hertzX:
	.byte	0
	.byte	36
	.byte	-12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	one_wire__internal_pull_up
	.section	.rodata.one_wire__internal_pull_up,"a",@progbits
	.type	one_wire__internal_pull_up, @object
	.size	one_wire__internal_pull_up, 1
one_wire__internal_pull_up:
	.byte	1
.global	one_wire_E
	.section	.data.one_wire_E,"aw",@progbits
	.type	one_wire_E, @object
	.size	one_wire_E, 2
one_wire_E:
	.zero	2
	.section	.debug_frame,"",@progbits
.Lframe0:
	.long	.LECIE0-.LSCIE0
.LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -1
	.byte	0x24
	.byte	0xc
	.uleb128 0x20
	.uleb128 0x2
	.byte	0xa4
	.uleb128 0x1
	.p2align	2
.LECIE0:
.LSFDE0:
	.long	.LEFDE0-.LASFDE0
.LASFDE0:
	.long	.Lframe0
	.long	.LFB2
	.long	.LFE2-.LFB2
	.p2align	2
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB3
	.long	.LFE3-.LFB3
	.p2align	2
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB4
	.long	.LFE4-.LFB4
	.p2align	2
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB5
	.long	.LFE5-.LFB5
	.p2align	2
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB6
	.long	.LFE6-.LFB6
	.p2align	2
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB7
	.long	.LFE7-.LFB7
	.p2align	2
.LEFDE10:
.LSFDE12:
	.long	.LEFDE12-.LASFDE12
.LASFDE12:
	.long	.Lframe0
	.long	.LFB8
	.long	.LFE8-.LFB8
	.p2align	2
.LEFDE12:
.LSFDE14:
	.long	.LEFDE14-.LASFDE14
.LASFDE14:
	.long	.Lframe0
	.long	.LFB9
	.long	.LFE9-.LFB9
	.p2align	2
.LEFDE14:
.LSFDE16:
	.long	.LEFDE16-.LASFDE16
.LASFDE16:
	.long	.Lframe0
	.long	.LFB10
	.long	.LFE10-.LFB10
	.p2align	2
.LEFDE16:
.LSFDE18:
	.long	.LEFDE18-.LASFDE18
.LASFDE18:
	.long	.Lframe0
	.long	.LFB11
	.long	.LFE11-.LFB11
	.p2align	2
.LEFDE18:
.LSFDE20:
	.long	.LEFDE20-.LASFDE20
.LASFDE20:
	.long	.Lframe0
	.long	.LFB12
	.long	.LFE12-.LFB12
	.p2align	2
.LEFDE20:
.LSFDE22:
	.long	.LEFDE22-.LASFDE22
.LASFDE22:
	.long	.Lframe0
	.long	.LFB13
	.long	.LFE13-.LFB13
	.p2align	2
.LEFDE22:
.LSFDE24:
	.long	.LEFDE24-.LASFDE24
.LASFDE24:
	.long	.Lframe0
	.long	.LFB14
	.long	.LFE14-.LFB14
	.byte	0x4
	.long	.LCFI0-.LFB14
	.byte	0xe
	.uleb128 0x3
	.byte	0x91
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x4
	.byte	0x9c
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x5
	.byte	0x9d
	.uleb128 0x4
	.p2align	2
.LEFDE24:
.LSFDE26:
	.long	.LEFDE26-.LASFDE26
.LASFDE26:
	.long	.Lframe0
	.long	.LFB15
	.long	.LFE15-.LFB15
	.p2align	2
.LEFDE26:
.LSFDE28:
	.long	.LEFDE28-.LASFDE28
.LASFDE28:
	.long	.Lframe0
	.long	.LFB16
	.long	.LFE16-.LFB16
	.p2align	2
.LEFDE28:
.LSFDE30:
	.long	.LEFDE30-.LASFDE30
.LASFDE30:
	.long	.Lframe0
	.long	.LFB0
	.long	.LFE0-.LFB0
	.p2align	2
.LEFDE30:
	.text
.Letext0:
	.file 4 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire.ads"
	.file 5 "/opt/avrada/avr/lib/gnat/avr_lib/avr-wait.ads"
	.file 6 "/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/avr-atmega328p.ads"
	.file 7 "/opt/avrada/avr/lib/gnat/avr_lib/avr.ads"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x769
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF47
	.byte	0xd
	.long	.LASF48
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0
	.byte	0xff
	.long	.LASF49
	.long	0x37
	.uleb128 0x4
	.byte	0x1
	.byte	0x7
	.long	.LASF3
	.byte	0x1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF2
	.uleb128 0x5
	.long	.LASF50
	.byte	0x1
	.byte	0x7
	.byte	0x35
	.byte	0x1
	.long	0x78
	.uleb128 0x6
	.long	.LASF51
	.byte	0x7
	.byte	0x35
	.long	0x6b
	.byte	0x1
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.byte	0
	.byte	0xff
	.long	.LASF52
	.long	0x46
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.byte	0x1
	.byte	0x7
	.long	.LASF4
	.byte	0x1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x8
	.byte	0x1
	.long	.LASF11
	.byte	0x1
	.byte	0x3
	.long	0xbb
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0xa
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.word	0x1e3d
	.byte	0
	.uleb128 0xb
	.long	0xc1
	.byte	0x1
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.long	.LASF10
	.byte	0x1
	.uleb128 0xc
	.long	0x3f
	.uleb128 0x8
	.byte	0x1
	.long	.LASF12
	.byte	0x1
	.byte	0x3
	.long	0xf4
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0xa
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.word	0x469
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.long	.LASF13
	.byte	0x1
	.byte	0x3
	.long	0x11a
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0xa
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.word	0x19d4
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.long	.LASF14
	.byte	0x1
	.byte	0x3
	.long	0x13f
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0x9
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.byte	0x40
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.byte	0x3
	.long	0x164
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0x9
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.byte	0x60
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0x3
	.long	0x18a
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0xa
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.word	0x326
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.long	.LASF17
	.byte	0x1
	.byte	0x3
	.long	0x1af
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0x9
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.byte	0xa1
	.byte	0
	.uleb128 0xd
	.long	0x95
	.long	.LFB2
	.long	.LFE2
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x1df
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0xa
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.word	0x1e3d
	.byte	0
	.uleb128 0xd
	.long	0xf4
	.long	.LFB3
	.long	.LFE3
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x20f
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0xa
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.word	0x19d4
	.byte	0
	.uleb128 0xd
	.long	0xce
	.long	.LFB4
	.long	.LFE4
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x23f
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0xa
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.word	0x469
	.byte	0
	.uleb128 0xd
	.long	0x164
	.long	.LFB5
	.long	.LFE5
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x26f
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0xa
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.word	0x326
	.byte	0
	.uleb128 0xd
	.long	0x18a
	.long	.LFB6
	.long	.LFE6
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x29e
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0x9
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.byte	0xa1
	.byte	0
	.uleb128 0xd
	.long	0x13f
	.long	.LFB7
	.long	.LFE7
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x2cd
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0x9
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.byte	0x60
	.byte	0
	.uleb128 0xd
	.long	0x11a
	.long	.LFB8
	.long	.LFE8
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x2fc
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0x9
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.byte	0x40
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF18
	.byte	0x2
	.byte	0x2
	.long	.LFB9
	.long	.LFE9
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF19
	.byte	0x3
	.byte	0x50
	.long	.LFB10
	.long	.LFE10
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF20
	.byte	0x3
	.byte	0x56
	.long	.LFB11
	.long	.LFE11
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0xf
	.byte	0x1
	.long	.LASF21
	.byte	0x3
	.byte	0x5f
	.long	0x87
	.long	.LFB12
	.long	.LFE12
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x409
	.uleb128 0x10
	.long	.LASF23
	.byte	0x3
	.byte	0x60
	.long	0x87
	.long	.LLST0
	.uleb128 0x11
	.long	0x95
	.long	.LBB16
	.long	.LBE16
	.byte	0x3
	.byte	0x71
	.long	0x39e
	.uleb128 0x12
	.long	.LBB17
	.long	.LBE17
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0xa
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.word	0x1e3d
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	0xce
	.long	.LBB18
	.long	.LBE18
	.byte	0x3
	.byte	0x78
	.long	0x3d5
	.uleb128 0x12
	.long	.LBB19
	.long	.LBE19
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0xa
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.word	0x469
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0xf4
	.long	.LBB20
	.long	.LBE20
	.byte	0x3
	.byte	0x81
	.uleb128 0x12
	.long	.LBB21
	.long	.LBE21
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0xa
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.word	0x19d4
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF22
	.byte	0x3
	.byte	0xac
	.long	0x25
	.long	.LFB13
	.long	.LFE13
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x518
	.uleb128 0x14
	.string	"bit"
	.byte	0x4
	.byte	0x5c
	.long	0x518
	.long	.LLST1
	.uleb128 0x15
	.long	.LASF24
	.byte	0x3
	.byte	0xde
	.long	0x25
	.byte	0x1
	.byte	0x68
	.uleb128 0x11
	.long	0x11a
	.long	.LBB22
	.long	.LBE22
	.byte	0x3
	.byte	0xe6
	.long	0x478
	.uleb128 0x12
	.long	.LBB23
	.long	.LBE23
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0x9
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.byte	0x40
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	0x13f
	.long	.LBB24
	.long	.LBE24
	.byte	0x3
	.byte	0xee
	.long	0x4ae
	.uleb128 0x12
	.long	.LBB25
	.long	.LBE25
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0x9
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.byte	0x60
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	0x164
	.long	.LBB26
	.long	.LBE26
	.byte	0x3
	.byte	0xf6
	.long	0x4e5
	.uleb128 0x12
	.long	.LBB27
	.long	.LBE27
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0xa
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.word	0x326
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x18a
	.long	.LBB28
	.long	.LBE28
	.byte	0x3
	.byte	0xfd
	.uleb128 0x12
	.long	.LBB29
	.long	.LBE29
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x3a
	.long	0xbb
	.byte	0x3e
	.uleb128 0x9
	.long	.LASF9
	.byte	0x1
	.byte	0x3d
	.long	0xc9
	.byte	0xa1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x25
	.uleb128 0x16
	.byte	0x1
	.long	.LASF25
	.byte	0x3
	.word	0x105
	.long	0x25
	.long	.LFB14
	.long	.LFE14
	.long	.LLST2
	.byte	0x1
	.long	0x58d
	.uleb128 0x14
	.string	"set"
	.byte	0x4
	.byte	0x58
	.long	0x518
	.long	.LLST3
	.uleb128 0x17
	.string	"v"
	.byte	0x3
	.word	0x106
	.long	0x25
	.long	.LLST4
	.uleb128 0x17
	.string	"r"
	.byte	0x3
	.word	0x107
	.long	0x25
	.long	.LLST5
	.uleb128 0x12
	.long	.LBB30
	.long	.LBE30
	.uleb128 0x18
	.string	"i"
	.byte	0x3
	.word	0x109
	.long	0x78
	.uleb128 0x19
	.long	.LVL9
	.long	0x409
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x4
	.byte	0x81
	.sleb128 0
	.byte	0x31
	.byte	0x1a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF53
	.byte	0x3
	.word	0x114
	.long	.LFB15
	.long	.LFE15
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x5d5
	.uleb128 0x1c
	.long	.LASF26
	.byte	0x4
	.byte	0x4e
	.long	0x5d5
	.long	.LLST6
	.uleb128 0x1d
	.long	.LASF27
	.byte	0x3
	.word	0x115
	.long	0x25
	.uleb128 0x1e
	.long	.LVL15
	.byte	0x1
	.long	0x51d
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x2c
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF28
	.byte	0x3
	.word	0x11b
	.long	0x25
	.long	.LFB16
	.long	.LFE16
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x60a
	.uleb128 0x1e
	.long	.LVL16
	.byte	0x1
	.long	0x51d
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF54
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x21
	.long	.LASF29
	.byte	0x3
	.byte	0x26
	.long	0x630
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__internal_pull_up
	.uleb128 0xc
	.long	0x87
	.uleb128 0x21
	.long	.LASF30
	.byte	0x5
	.byte	0x29
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_480usGP1853__crystal_hertzX
	.uleb128 0x21
	.long	.LASF31
	.byte	0x5
	.byte	0x2a
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_480usGP1853__micro_secondsX
	.uleb128 0x21
	.long	.LASF32
	.byte	0x5
	.byte	0x29
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_410usGP2036__crystal_hertzX
	.uleb128 0x21
	.long	.LASF33
	.byte	0x5
	.byte	0x2a
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_410usGP2036__micro_secondsX
	.uleb128 0x21
	.long	.LASF34
	.byte	0x5
	.byte	0x29
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_70usGP2219__crystal_hertzX
	.uleb128 0x21
	.long	.LASF35
	.byte	0x5
	.byte	0x2a
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_70usGP2219__micro_secondsX
	.uleb128 0x21
	.long	.LASF36
	.byte	0x5
	.byte	0x29
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_50usGP2399__crystal_hertzX
	.uleb128 0x21
	.long	.LASF37
	.byte	0x5
	.byte	0x2a
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_50usGP2399__micro_secondsX
	.uleb128 0x21
	.long	.LASF38
	.byte	0x5
	.byte	0x29
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_10usGP2579__crystal_hertzX
	.uleb128 0x21
	.long	.LASF39
	.byte	0x5
	.byte	0x2a
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_10usGP2579__micro_secondsX
	.uleb128 0x21
	.long	.LASF40
	.byte	0x5
	.byte	0x29
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_6usGP2759__crystal_hertzX
	.uleb128 0x21
	.long	.LASF41
	.byte	0x5
	.byte	0x2a
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_6usGP2759__micro_secondsX
	.uleb128 0x21
	.long	.LASF42
	.byte	0x5
	.byte	0x29
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_4usGP2936__crystal_hertzX
	.uleb128 0x21
	.long	.LASF43
	.byte	0x5
	.byte	0x2a
	.long	0xbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	one_wire__wait_4usGP2936__micro_secondsX
	.uleb128 0x22
	.long	.LASF44
	.byte	0x6
	.word	0x9b2
	.long	0x73f
	.byte	0x1
	.byte	0x24
	.uleb128 0xc
	.long	0x744
	.uleb128 0x23
	.byte	0x2
	.long	0x74a
	.uleb128 0x24
	.long	0x4d
	.byte	0x1
	.uleb128 0x22
	.long	.LASF45
	.byte	0x6
	.word	0x991
	.long	0x73f
	.byte	0x1
	.byte	0x25
	.uleb128 0x22
	.long	.LASF46
	.byte	0x6
	.word	0x9d3
	.long	0x73f
	.byte	0x1
	.byte	0x23
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
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x27
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x27
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x27
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL0
	.long	.LVL1
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL1
	.long	.LVL2
	.word	0x9
	.byte	0x88
	.sleb128 0
	.byte	0x38
	.byte	0x1a
	.byte	0x48
	.byte	0x24
	.byte	0x30
	.byte	0x29
	.byte	0x9f
	.long	.LVL3
	.long	.LVL4
	.word	0x9
	.byte	0x88
	.sleb128 0
	.byte	0x38
	.byte	0x1a
	.byte	0x48
	.byte	0x24
	.byte	0x30
	.byte	0x29
	.byte	0x9f
	.long	.LVL4
	.long	.LFE12
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST1:
	.long	.LVL5
	.long	.LVL6
	.word	0x1
	.byte	0x68
	.long	.LVL6
	.long	.LFE13
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST2:
	.long	.LFB14
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI2
	.long	.LFE14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	0
	.long	0
.LLST3:
	.long	.LVL7
	.long	.LVL8
	.word	0x1
	.byte	0x68
	.long	.LVL8
	.long	.LFE14
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST4:
	.long	.LVL8
	.long	.LVL13
	.word	0x1
	.byte	0x61
	.long	.LVL13
	.long	.LFE14
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST5:
	.long	.LVL9
	.long	.LVL12
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST6:
	.long	.LVL14
	.long	.LVL15-1
	.word	0x1
	.byte	0x68
	.long	.LVL15-1
	.long	.LFE15
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x94
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB2
	.long	.LFE2-.LFB2
	.long	.LFB3
	.long	.LFE3-.LFB3
	.long	.LFB4
	.long	.LFE4-.LFB4
	.long	.LFB5
	.long	.LFE5-.LFB5
	.long	.LFB6
	.long	.LFE6-.LFB6
	.long	.LFB7
	.long	.LFE7-.LFB7
	.long	.LFB8
	.long	.LFE8-.LFB8
	.long	.LFB9
	.long	.LFE9-.LFB9
	.long	.LFB10
	.long	.LFE10-.LFB10
	.long	.LFB11
	.long	.LFE11-.LFB11
	.long	.LFB12
	.long	.LFE12-.LFB12
	.long	.LFB13
	.long	.LFE13-.LFB13
	.long	.LFB14
	.long	.LFE14-.LFB14
	.long	.LFB15
	.long	.LFE15-.LFB15
	.long	.LFB16
	.long	.LFE16-.LFB16
	.long	.LFB0
	.long	.LFE0-.LFB0
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB2
	.long	.LFE2
	.long	.LFB3
	.long	.LFE3
	.long	.LFB4
	.long	.LFE4
	.long	.LFB5
	.long	.LFE5
	.long	.LFB6
	.long	.LFE6
	.long	.LFB7
	.long	.LFE7
	.long	.LFB8
	.long	.LFE8
	.long	.LFB9
	.long	.LFE9
	.long	.LFB10
	.long	.LFE10
	.long	.LFB11
	.long	.LFE11
	.long	.LFB12
	.long	.LFE12
	.long	.LFB13
	.long	.LFE13
	.long	.LFB14
	.long	.LFE14
	.long	.LFB15
	.long	.LFE15
	.long	.LFB16
	.long	.LFE16
	.long	.LFB0
	.long	.LFE0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"cycle_length"
.LASF28:
	.string	"one_wire__get"
.LASF4:
	.string	"avr__Tbit_numberB"
.LASF53:
	.string	"one_wire__send_command"
.LASF52:
	.string	"avr__bits_in_byte___XP1"
.LASF41:
	.string	"one_wire__wait_6usGP2759__micro_secondsX"
.LASF31:
	.string	"one_wire__wait_480usGP1853__micro_secondsX"
.LASF26:
	.string	"command"
.LASF21:
	.string	"one_wire__reset"
.LASF12:
	.string	"one_wire__wait_70us"
.LASF36:
	.string	"one_wire__wait_50usGP2399__crystal_hertzX"
.LASF7:
	.string	"system__address"
.LASF25:
	.string	"one_wire__touch"
.LASF54:
	.string	"one_wire___elabb"
.LASF22:
	.string	"one_wire__read_write_bit"
.LASF44:
	.string	"avr__atmega328p__ddrb_bits"
.LASF13:
	.string	"one_wire__wait_410us"
.LASF18:
	.string	"one_wire__init_comm"
.LASF48:
	.string	"/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire.adb"
.LASF27:
	.string	"dummy"
.LASF1:
	.string	"interfaces__unsigned_32"
.LASF30:
	.string	"one_wire__wait_480usGP1853__crystal_hertzX"
.LASF15:
	.string	"one_wire__wait_6us"
.LASF2:
	.string	"system__unsigned_types__short_short_unsigned"
.LASF24:
	.string	"return_bit"
.LASF29:
	.string	"one_wire__internal_pull_up"
.LASF0:
	.string	"interfaces__unsigned_8"
.LASF37:
	.string	"one_wire__wait_50usGP2399__micro_secondsX"
.LASF43:
	.string	"one_wire__wait_4usGP2936__micro_secondsX"
.LASF40:
	.string	"one_wire__wait_6usGP2759__crystal_hertzX"
.LASF50:
	.string	"avr__bits_in_byte___XP1___JM"
.LASF35:
	.string	"one_wire__wait_70usGP2219__micro_secondsX"
.LASF46:
	.string	"avr__atmega328p__pinb_bits"
.LASF49:
	.string	"one_wire__command_code"
.LASF5:
	.string	"sizetype"
.LASF23:
	.string	"found"
.LASF3:
	.string	"one_wire__Tcommand_codeB"
.LASF14:
	.string	"one_wire__wait_4us"
.LASF10:
	.string	"long_long_integer"
.LASF16:
	.string	"one_wire__wait_50us"
.LASF34:
	.string	"one_wire__wait_70usGP2219__crystal_hertzX"
.LASF47:
	.string	"GNU Ada 4.7.0"
.LASF11:
	.string	"one_wire__wait_480us"
.LASF45:
	.string	"avr__atmega328p__portb_bits"
.LASF51:
	.string	"OBJECT"
.LASF38:
	.string	"one_wire__wait_10usGP2579__crystal_hertzX"
.LASF42:
	.string	"one_wire__wait_4usGP2936__crystal_hertzX"
.LASF20:
	.string	"one_wire__set_data_line_high"
.LASF32:
	.string	"one_wire__wait_410usGP2036__crystal_hertzX"
.LASF9:
	.string	"cycles_to_wait"
.LASF17:
	.string	"one_wire__wait_10us"
.LASF19:
	.string	"one_wire__exit_comm"
.LASF6:
	.string	"boolean"
.LASF33:
	.string	"one_wire__wait_410usGP2036__micro_secondsX"
.LASF39:
	.string	"one_wire__wait_10usGP2579__micro_secondsX"
	.ident	"GCC: (GNU) 4.7.0"
.global __do_copy_data
