	.file	"main.adb"
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
 ;  -gnatez /home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/main.adb
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
	.section	.text.main__wait_long.1441,"ax",@progbits
	.type	main__wait_long.1441, @function
main__wait_long.1441:
.LFB5:
	.file 1 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/main.adb"
	.loc 1 51 0
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL0:
	.loc 1 51 0
	ldi r24,lo8(32)	 ;  ivtmp.36,
	ldi r25,lo8(3)	 ;  ivtmp.36,
.LVL1:
.L2:
.LBB16:
.LBB17:
.LBB18:
	.file 2 "/opt/avrada/avr/lib/gnat/avr_lib/avr-wait.adb"
	.loc 2 64 0 discriminator 1
	ldi r30,lo8(4032)	 ; ,
	ldi r31,hi8(4032)	 ; ,
	1: sbiw r30,1	 ; 
	brne 1b
	sbiw r24,1	 ;  ivtmp.36,
.LBE18:
.LBE17:
	.loc 1 53 0 discriminator 1
	brne .L2	 ; ,
/* epilogue start */
.LBE16:
	.loc 1 56 0
	ret
.LFE5:
	.size	main__wait_long.1441, .-main__wait_long.1441
	.section	.rodata
.LC17:
	.ascii	"."
.LC18:
	.ascii	"Entering menu"
.LC19:
	.ascii	"---- Menu ----"
.LC20:
	.ascii	"1. Set Device ID"
.LC21:
	.ascii	"2. Set reporting cycle"
.LC22:
	.ascii	"Q  Quit menu"
.LC23:
	.ascii	"Enter one character long ID ([1-9A-Z]):"
.LC24:
	.ascii	"Device ID Written."
.LC25:
	.ascii	"Select reporting cycle:"
.LC26:
	.ascii	"1.  1 minute"
.LC27:
	.ascii	"2. 10 minutes"
.LC28:
	.ascii	"3. 30 minutes"
.LC29:
	.ascii	"4. 60 minutes"
.LC30:
	.ascii	"5. 3600 minutes"
.LC31:
	.ascii	"Cycle time written."
.LC32:
	.ascii	"Invalid option."
.LC33:
	.ascii	"Wait_Time: "
.LC34:
	.ascii	"CRC: "
.LC35:
	.ascii	": "
.LC36:
	.ascii	"Temp: "
.LC37:
	.ascii	"C"
.LC38:
	.ascii	"No onewire sensors found"
.LC5:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	0
.LC12:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	12
.LC7:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	13
.LC8:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	15
.LC9:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	21
.LC10:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	11
.LC15:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	38
.LC16:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	17
.LC11:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	22
.LC13:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	14
.LC14:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	18
.LC0:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	10
.LC1:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	4
.LC2:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	1
.LC3:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	5
.LC4:
 ;  LB0:
	.byte	1
 ;  UB0:
	.byte	5
.LC6:
 ;  LB0:
	.byte	0
 ;  UB0:
	.byte	23
	.section	.text.startup._ada_main,"ax",@progbits
.global	_ada_main
	.type	_ada_main, @function
_ada_main:
.LFB1:
	.loc 1 24 0
	push r28	 ; 
.LCFI0:
	push r29	 ; 
.LCFI1:
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
.LCFI2:
	subi r28,109	 ; ,
	sbc r29,__zero_reg__	 ; 
.LCFI3:
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
/* prologue: function */
/* frame size = 109 */
/* stack size = 111 */
.L__stack_usage = 111
	.loc 1 25 0
	std Y+21,__zero_reg__	 ;  input_buffer___UNC.BOUNDS.LB0,
	ldi r24,lo8(3)	 ;  tmp127,
	std Y+22,r24	 ;  input_buffer___UNC.BOUNDS.UB0, tmp127
	std Y+23,__zero_reg__	 ;  input_buffer___UNC.ARRAY,
	std Y+24,__zero_reg__	 ;  input_buffer___UNC.ARRAY,
	std Y+25,__zero_reg__	 ;  input_buffer___UNC.ARRAY,
	std Y+26,__zero_reg__	 ;  input_buffer___UNC.ARRAY,
.LVL2:
	.loc 1 27 0
	movw r18,r28	 ; ,
	subi r18,-23	 ; ,
	sbci r19,-1	 ; ,
	movw r20,r28	 ; ,
	subi r20,-21	 ; ,
	sbci r21,-1	 ; ,
	.loc 1 150 0
	ldi r22,0	 ; 
	ldi r24,lo8(103)	 ; ,
	ldi r25,0	 ; 
	call avr__uart__init_interrupt_read	 ; 
.LVL3:
	.loc 1 152 0
	sbi 0xa,5	 ; ,
	.loc 1 153 0
	sbi 0xb,5	 ; ,
.LBB43:
.LBB44:
.LBB45:
	.loc 1 63 0
	call _ada_avr__real_time__clock	 ; 
.LVL4:
	std Y+32,r18	 ; , tmp155
	std Y+33,r19	 ; , tmp156
	std Y+34,r20	 ; , tmp157
	std Y+35,r21	 ; , tmp158
	std Y+36,r22	 ; , tmp159
	std Y+37,r23	 ; , tmp160
	ldi r16,lo8(6)	 ;  tmp138,
	movw r30,r28	 ; ,
	adiw r30,32	 ; ,
	movw r26,r28	 ; ,
	adiw r26,15	 ; ,
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r16	 ;  tmp138
	brne 0b
.LVL5:
.LBB46:
	.loc 1 66 0
	ldi r22,lo8(6)	 ; ,
	mov r13,r22	 ;  tmp183,
.L6:
	call _ada_avr__real_time__clock	 ; 
.LVL6:
	std Y+32,r18	 ; , tmp163
	std Y+33,r19	 ; , tmp164
	std Y+34,r20	 ; , tmp165
	std Y+35,r21	 ; , tmp166
	std Y+36,r22	 ; , tmp167
	std Y+37,r23	 ; , tmp168
	movw r30,r28	 ; ,
	adiw r30,32	 ; ,
	movw r26,r28	 ; ,
	adiw r26,9	 ; ,
	mov r4,r13	 ;  tmp140, tmp183
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r4	 ;  tmp140
	brne 0b
	ldd r14,Y+15	 ; , start_time
	ldd r15,Y+16	 ; , start_time
	ldd r16,Y+17	 ; , start_time
	ldd r17,Y+18	 ; , start_time
	ldd r18,Y+19	 ; , start_time
	ldd r19,Y+20	 ; , start_time
	ldd r20,Y+9	 ; , D.1993
	ldd r21,Y+10	 ; , D.1993
	ldd r22,Y+11	 ; , D.1993
	ldd r23,Y+12	 ; , D.1993
	ldd r24,Y+13	 ; , D.1993
	ldd r25,Y+14	 ; , D.1993
	call avr__real_time__Osubtract__2	 ; 
.LVL7:
	cpi r22,17	 ;  D.1992,
	sbci r23,39	 ;  D.1992,
	cpc r24,__zero_reg__	 ;  D.1992
	cpc r25,__zero_reg__	 ;  D.1992
	brlt .+2	 ; 
	rjmp .L8	 ; 
	.loc 1 67 0
	ldi r22,lo8(-12)	 ; ,
	ldi r23,lo8(1)	 ; ,
	ldi r24,0	 ; 
	ldi r25,0	 ; 
	call ada__calendar__delays__delay_for	 ; 
.LVL8:
	.loc 1 68 0
	ldi r20,lo8(.LC17)	 ; ,
	mov r4,r20	 ;  D.1991,
	ldi r20,hi8(.LC17)	 ; ,
	mov r5,r20	 ;  D.1991,
	ldi r21,lo8(.LC5)	 ; ,
	mov r6,r21	 ;  D.1991,
	ldi r21,hi8(.LC5)	 ; ,
	mov r7,r21	 ;  D.1991,
	movw r24,r6	 ; , D.1991
	movw r22,r4	 ; , D.1991
	call avr__uart__put__2	 ; 
.LVL9:
	.loc 1 69 0
	call avr__uart__have_input	 ; 
.LVL10:
	tst r24	 ; 
	breq .L6	 ; ,
	.loc 1 70 0
	ldi r22,lo8(.LC18)	 ;  D.1989,
	ldi r23,hi8(.LC18)	 ;  D.1989,
	ldi r24,lo8(.LC12)	 ;  D.1989,
	ldi r25,hi8(.LC12)	 ;  D.1989,
	call avr__uart__put__2	 ; 
.LVL11:
	call avr__uart__crlf	 ; 
.LVL12:
	.loc 1 75 0
	ldi r17,lo8(1)	 ;  tmp182,
.L7:
	call avr__uart__have_input	 ; 
.LVL13:
	cpse r24,r17	 ; , tmp182
	rjmp .L28	 ; 
	.loc 1 76 0
	call avr__uart__get	 ; 
.LVL14:
	rjmp .L7	 ; 
.L28:
.LBE46:
.LBE45:
.LBE44:
.LBE43:
.LBB47:
.LBB48:
.LBB49:
	.loc 1 121 0
	ldi r18,lo8(.LC19)	 ; ,
	ldi r19,hi8(.LC19)	 ; ,
	adiw r28,78-62	 ;  %sfp
	std Y+63,r19	 ; 
	std Y+62,r18	 ; 
	sbiw r28,78-62	 ;  %sfp
	ldi r30,lo8(.LC7)	 ; ,
	ldi r31,hi8(.LC7)	 ; ,
	adiw r28,80-62	 ;  %sfp
	std Y+63,r31	 ; 
	std Y+62,r30	 ; 
	sbiw r28,80-62	 ;  %sfp
	adiw r28,78-60	 ;  %sfp
	ldd r22,Y+60	 ; 
	ldd r23,Y+61	 ; 
	ldd r24,Y+62	 ; 
	ldd r25,Y+63	 ; 
	sbiw r28,78-60	 ;  %sfp
	call avr__uart__put__2	 ; 
.LVL15:
	call avr__uart__crlf	 ; 
.LVL16:
	.loc 1 122 0
	ldi r20,lo8(.LC20)	 ; ,
	ldi r21,hi8(.LC20)	 ; ,
	adiw r28,82-62	 ;  %sfp
	std Y+63,r21	 ; 
	std Y+62,r20	 ; 
	sbiw r28,82-62	 ;  %sfp
	ldi r22,lo8(.LC8)	 ; ,
	ldi r23,hi8(.LC8)	 ; ,
	adiw r28,84-62	 ;  %sfp
	std Y+63,r23	 ; 
	std Y+62,r22	 ; 
	sbiw r28,84-62	 ;  %sfp
	adiw r28,82-60	 ;  %sfp
	ldd r22,Y+60	 ; 
	ldd r23,Y+61	 ; 
	ldd r24,Y+62	 ; 
	ldd r25,Y+63	 ; 
	sbiw r28,82-60	 ;  %sfp
	call avr__uart__put__2	 ; 
.LVL17:
	call avr__uart__crlf	 ; 
.LVL18:
	.loc 1 123 0
	ldi r26,lo8(.LC21)	 ; ,
	ldi r27,hi8(.LC21)	 ; ,
	adiw r28,86-62	 ;  %sfp
	std Y+63,r27	 ; 
	std Y+62,r26	 ; 
	sbiw r28,86-62	 ;  %sfp
	ldi r24,lo8(.LC9)	 ; ,
	ldi r25,hi8(.LC9)	 ; ,
	adiw r28,88-62	 ;  %sfp
	std Y+63,r25	 ; 
	std Y+62,r24	 ; 
	sbiw r28,88-62	 ;  %sfp
	adiw r28,86-60	 ;  %sfp
	ldd r22,Y+60	 ; 
	ldd r23,Y+61	 ; 
	ldd r24,Y+62	 ; 
	ldd r25,Y+63	 ; 
	sbiw r28,86-60	 ;  %sfp
	call avr__uart__put__2	 ; 
.LVL19:
	call avr__uart__crlf	 ; 
.LVL20:
	.loc 1 124 0
	ldi r18,lo8(.LC22)	 ; ,
	mov r8,r18	 ;  D.2003,
	ldi r18,hi8(.LC22)	 ; ,
	mov r9,r18	 ;  D.2003,
	ldi r19,lo8(.LC10)	 ; ,
	mov r10,r19	 ;  D.2003,
	ldi r19,hi8(.LC10)	 ; ,
	mov r11,r19	 ;  D.2003,
	movw r24,r10	 ; , D.2003
	movw r22,r8	 ; , D.2003
	call avr__uart__put__2	 ; 
.LVL21:
	call avr__uart__crlf	 ; 
.LVL22:
	.loc 1 126 0
	call avr__uart__get	 ; 
.LVL23:
	.loc 1 127 0
	cpi r24,lo8(81)	 ;  ch,
	brne .+2	 ; 
	rjmp .L8	 ; 
	.loc 1 129 0
	cpi r24,lo8(49)	 ;  ch,
	brne .L9	 ; ,
	.loc 1 130 0
	call avr__uart__crlf	 ; 
.LVL24:
.LBB50:
.LBB51:
	.loc 1 89 0
	ldi r30,lo8(.LC23)	 ; ,
	ldi r31,hi8(.LC23)	 ; ,
	adiw r28,70-62	 ;  %sfp
	std Y+63,r31	 ; 
	std Y+62,r30	 ; 
	sbiw r28,70-62	 ;  %sfp
	ldi r20,lo8(.LC15)	 ; ,
	ldi r21,hi8(.LC15)	 ; ,
	adiw r28,72-62	 ;  %sfp
	std Y+63,r21	 ; 
	std Y+62,r20	 ; 
	sbiw r28,72-62	 ;  %sfp
	adiw r28,70-60	 ;  %sfp
	ldd r22,Y+60	 ; 
	ldd r23,Y+61	 ; 
	ldd r24,Y+62	 ; 
	ldd r25,Y+63	 ; 
	sbiw r28,70-60	 ;  %sfp
	call avr__uart__put__2	 ; 
.LVL25:
	call avr__uart__crlf	 ; 
.LVL26:
	.loc 1 90 0
	call avr__uart__get	 ; 
.LVL27:
	.loc 1 91 0
	mov r22,r24	 ; , ch
	ldi r24,0	 ; 
	ldi r25,0	 ; 
.LVL28:
	call avr__eeprom__put	 ; 
.LVL29:
	.loc 1 93 0
	ldi r22,lo8(.LC24)	 ; ,
	ldi r23,hi8(.LC24)	 ; ,
	adiw r28,74-62	 ;  %sfp
	std Y+63,r23	 ; 
	std Y+62,r22	 ; 
	sbiw r28,74-62	 ;  %sfp
	ldi r26,lo8(.LC16)	 ; ,
	ldi r27,hi8(.LC16)	 ; ,
	adiw r28,76-62	 ;  %sfp
	std Y+63,r27	 ; 
	std Y+62,r26	 ; 
	sbiw r28,76-62	 ;  %sfp
	adiw r28,74-60	 ;  %sfp
	ldd r22,Y+60	 ; 
	ldd r23,Y+61	 ; 
	ldd r24,Y+62	 ; 
	ldd r25,Y+63	 ; 
	sbiw r28,74-60	 ;  %sfp
	rjmp .L31	 ; 
.LVL30:
.L9:
.LBE51:
.LBE50:
	.loc 1 132 0
	cpi r24,lo8(50)	 ;  ch,
	breq .+2	 ; 
	rjmp .L10	 ; 
	.loc 1 133 0
	call avr__uart__crlf	 ; 
.LVL31:
.LBB52:
.LBB53:
	.loc 1 100 0
	ldi r16,lo8(.LC25)	 ; ,
	ldi r17,hi8(.LC25)	 ; ,
	std Y+39,r17	 ;  %sfp,
	std Y+38,r16	 ;  %sfp,
	ldi r18,lo8(.LC11)	 ; ,
	ldi r19,hi8(.LC11)	 ; ,
	std Y+41,r19	 ;  %sfp,
	std Y+40,r18	 ;  %sfp,
	ldd r22,Y+38	 ; , %sfp
	ldd r23,Y+39	 ; , %sfp
	ldd r24,Y+40	 ; , %sfp
	ldd r25,Y+41	 ; , %sfp
	call avr__uart__put__2	 ; 
.LVL32:
	call avr__uart__crlf	 ; 
.LVL33:
	.loc 1 101 0
	ldi r30,lo8(.LC26)	 ; ,
	ldi r31,hi8(.LC26)	 ; ,
	std Y+43,r31	 ;  %sfp,
	std Y+42,r30	 ;  %sfp,
	ldi r20,lo8(.LC10)	 ; ,
	ldi r21,hi8(.LC10)	 ; ,
	std Y+45,r21	 ;  %sfp,
	std Y+44,r20	 ;  %sfp,
	ldd r22,Y+42	 ; , %sfp
	ldd r23,Y+43	 ; , %sfp
	ldd r24,Y+44	 ; , %sfp
	ldd r25,Y+45	 ; , %sfp
	call avr__uart__put__2	 ; 
.LVL34:
	call avr__uart__crlf	 ; 
.LVL35:
	.loc 1 102 0
	ldi r22,lo8(.LC27)	 ; ,
	ldi r23,hi8(.LC27)	 ; ,
	std Y+47,r23	 ;  %sfp,
	std Y+46,r22	 ;  %sfp,
	ldi r26,lo8(.LC12)	 ; ,
	ldi r27,hi8(.LC12)	 ; ,
	std Y+49,r27	 ;  %sfp,
	std Y+48,r26	 ;  %sfp,
	ldd r22,Y+46	 ; , %sfp
	ldd r23,Y+47	 ; , %sfp
	ldd r24,Y+48	 ; , %sfp
	ldd r25,Y+49	 ; , %sfp
	call avr__uart__put__2	 ; 
.LVL36:
	call avr__uart__crlf	 ; 
.LVL37:
	.loc 1 103 0
	ldi r24,lo8(.LC28)	 ; ,
	ldi r25,hi8(.LC28)	 ; ,
	std Y+51,r25	 ;  %sfp,
	std Y+50,r24	 ;  %sfp,
	ldi r16,lo8(.LC12)	 ; ,
	ldi r17,hi8(.LC12)	 ; ,
	std Y+53,r17	 ;  %sfp,
	std Y+52,r16	 ;  %sfp,
	ldd r22,Y+50	 ; , %sfp
	ldd r23,Y+51	 ; , %sfp
	ldd r24,Y+52	 ; , %sfp
	ldd r25,Y+53	 ; , %sfp
	call avr__uart__put__2	 ; 
.LVL38:
	call avr__uart__crlf	 ; 
.LVL39:
	.loc 1 104 0
	ldi r18,lo8(.LC29)	 ; ,
	ldi r19,hi8(.LC29)	 ; ,
	std Y+55,r19	 ;  %sfp,
	std Y+54,r18	 ;  %sfp,
	ldi r30,lo8(.LC12)	 ; ,
	ldi r31,hi8(.LC12)	 ; ,
	std Y+57,r31	 ;  %sfp,
	std Y+56,r30	 ;  %sfp,
	ldd r22,Y+54	 ; , %sfp
	ldd r23,Y+55	 ; , %sfp
	ldd r24,Y+56	 ; , %sfp
	ldd r25,Y+57	 ; , %sfp
	call avr__uart__put__2	 ; 
.LVL40:
	call avr__uart__crlf	 ; 
.LVL41:
	.loc 1 105 0
	ldi r20,lo8(.LC30)	 ; ,
	ldi r21,hi8(.LC30)	 ; ,
	std Y+59,r21	 ;  %sfp,
	std Y+58,r20	 ;  %sfp,
	ldi r22,lo8(.LC13)	 ; ,
	ldi r23,hi8(.LC13)	 ; ,
	std Y+61,r23	 ;  %sfp,
	std Y+60,r22	 ;  %sfp,
	ldd r22,Y+58	 ; , %sfp
	ldd r23,Y+59	 ; , %sfp
	ldd r24,Y+60	 ; , %sfp
	ldd r25,Y+61	 ; , %sfp
	call avr__uart__put__2	 ; 
.LVL42:
	call avr__uart__crlf	 ; 
.LVL43:
	.loc 1 106 0
	call avr__uart__get	 ; 
.LVL44:
	.loc 1 107 0
	mov r25,r24	 ;  tmp143, ch
	subi r25,lo8(-(-49))	 ;  tmp143,
	cpi r25,lo8(5)	 ;  tmp143,
	brsh .L11	 ; ,
	.loc 1 108 0
	mov r22,r24	 ; , ch
	ldi r24,lo8(1)	 ; ,
	ldi r25,0	 ; 
.LVL45:
	call avr__eeprom__put	 ; 
.LVL46:
	.loc 1 110 0
	ldi r16,lo8(.LC31)	 ; ,
	ldi r17,hi8(.LC31)	 ; ,
	std Y+63,r17	 ;  %sfp,
	std Y+62,r16	 ;  %sfp,
	ldi r18,lo8(.LC14)	 ; ,
	ldi r19,hi8(.LC14)	 ; ,
	adiw r28,64-62	 ;  %sfp
	std Y+63,r19	 ; 
	std Y+62,r18	 ; 
	sbiw r28,64-62	 ;  %sfp
	adiw r28,62-60	 ;  %sfp
	ldd r22,Y+60	 ; 
	ldd r23,Y+61	 ; 
	ldd r24,Y+62	 ; 
	ldd r25,Y+63	 ; 
	sbiw r28,62-60	 ;  %sfp
	rjmp .L31	 ; 
.LVL47:
.L11:
	.loc 1 112 0
	ldi r26,lo8(.LC32)	 ; ,
	ldi r27,hi8(.LC32)	 ; ,
	adiw r28,66-62	 ;  %sfp
	std Y+63,r27	 ; 
	std Y+62,r26	 ; 
	sbiw r28,66-62	 ;  %sfp
	ldi r24,lo8(.LC13)	 ; ,
	ldi r25,hi8(.LC13)	 ; ,
.LVL48:
	adiw r28,68-62	 ;  %sfp
	std Y+63,r25	 ; 
	std Y+62,r24	 ; 
	sbiw r28,68-62	 ;  %sfp
	adiw r28,66-60	 ;  %sfp
	ldd r22,Y+60	 ; 
	ldd r23,Y+61	 ; 
	ldd r24,Y+62	 ; 
	ldd r25,Y+63	 ; 
	sbiw r28,66-60	 ;  %sfp
.LVL49:
.L31:
	call avr__uart__put__2	 ; 
.LVL50:
	call avr__uart__crlf	 ; 
.LVL51:
.L10:
.LBE53:
.LBE52:
	.loc 1 136 0
	call avr__uart__crlf	 ; 
.LVL52:
	rjmp .L28	 ; 
.LVL53:
.L8:
.LBE49:
.LBE48:
.LBE47:
	.loc 1 161 0
	ldi r24,0	 ; 
	ldi r25,0	 ; 
	call avr__eeprom__get	 ; 
.LVL54:
	mov r14,r24	 ;  byte,
.LVL55:
	.loc 1 163 0
	ldi r24,lo8(1)	 ; ,
	ldi r25,0	 ; 
	call avr__eeprom__get	 ; 
.LVL56:
	mov r17,r24	 ;  byte,
.LVL57:
	.loc 1 164 0
	ldi r22,lo8(.LC33)	 ;  D.1819,
	ldi r23,hi8(.LC33)	 ;  D.1819,
	ldi r24,lo8(.LC0)	 ;  D.1819,
	ldi r25,hi8(.LC0)	 ;  D.1819,
	call avr__uart__put__2	 ; 
.LVL58:
.LBB54:
.LBB55:
	.file 3 "/opt/avrada/avr/lib/gnat/avr_lib/avr-uart.adb"
	.loc 3 148 0
	mov r24,r17	 ; , byte
	call avr__uart__put_raw	 ; 
.LVL59:
.LBE55:
.LBE54:
	.loc 1 166 0
	call avr__uart__crlf	 ; 
.LVL60:
	subi r17,lo8(-(-49))	 ;  csui.17,
.LVL61:
	cpi r17,lo8(5)	 ;  csui.17,
	brsh .L20	 ; ,
	ldi r19,lo8(4)	 ; ,
	mul r17,r19	 ;  csui.17,
	movw r30,r0	 ;  tmp147
	clr __zero_reg__
	subi r30,lo8(-(CSWTCH.18))	 ;  tmp147,
	sbci r31,hi8(-(CSWTCH.18))	 ;  tmp147,
	ld r8,Z	 ;  wait_time, CSWTCH.18
	ldd r9,Z+1	 ;  wait_time, CSWTCH.18
	ldd r10,Z+2	 ;  wait_time, CSWTCH.18
	ldd r11,Z+3	 ;  wait_time, CSWTCH.18
	rjmp .L13	 ; 
.L20:
	ldi r25,lo8(-24)	 ; ,
	mov r8,r25	 ;  wait_time,
	ldi r25,lo8(3)	 ; ,
	mov r9,r25	 ;  wait_time,
	mov r10,__zero_reg__	 ;  wait_time
	mov r11,__zero_reg__	 ;  wait_time
.L13:
	.loc 1 169 0
	call one_wire__init_comm	 ; 
.LVL62:
	.loc 1 171 0
	call one_wire__search__first	 ; 
.LVL63:
	.loc 1 172 0
	tst r24	 ; 
	brne .+2	 ; 
	rjmp .L14	 ; 
	.loc 1 173 0
	ldi r21,lo8(8)	 ;  tmp148,
	ldi r30,lo8(one_wire__rom__identifier)	 ; ,
	ldi r31,hi8(one_wire__rom__identifier)	 ; ,
	movw r26,r28	 ; ,
	adiw r26,1	 ; ,
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r21	 ;  tmp148
	brne 0b
.LVL64:
	clr r4	 ;  ivtmp.55
	inc r4	 ;  ivtmp.55
	mov r5,__zero_reg__	 ;  ivtmp.55
.LVL65:
	add r4,r28	 ;  ivtmp.55,
	adc r5,r29	 ;  ivtmp.55,
	.loc 1 24 0
	movw r6,r28	 ;  D.2066,
	ldi r24,9	 ; ,
	add r6,r24	 ;  D.2066,
	adc r7,__zero_reg__	 ;  D.2066
.LBB56:
.LBB57:
	.loc 1 174 0
	mov r13,__zero_reg__	 ;  crc
.LVL66:
.L15:
.LBE57:
.LBE56:
.LBB58:
	.loc 1 176 0 discriminator 1
	movw r30,r4	 ; , ivtmp.55
	ld r15,Z+	 ;  D.1825, MEM[base: D.2064_206, offset: 0B]
	movw r4,r30	 ;  ivtmp.55,
	mov r22,r13	 ; , crc
	mov r24,r15	 ; , D.1825
	call _ada_crc8	 ; 
.LVL67:
	mov r13,r24	 ;  crc,
.LVL68:
	.loc 1 177 0 discriminator 1
	ldi r22,lo8(16)	 ; ,
	mov r24,r15	 ; , D.1825
	call avr__uart__put__5	 ; 
.LVL69:
.LBB59:
.LBB60:
	.loc 3 148 0 discriminator 1
	ldi r24,lo8(32)	 ; ,
	call avr__uart__put_raw	 ; 
.LVL70:
.LBE60:
.LBE59:
	.loc 1 175 0 discriminator 1
	cp r4,r6	 ;  ivtmp.55, D.2066
	cpc r5,r7	 ;  ivtmp.55, D.2066
	brne .L15	 ; ,
.LBE58:
	.loc 1 180 0
	ldi r22,lo8(.LC34)	 ;  D.1827,
	ldi r23,hi8(.LC34)	 ;  D.1827,
	ldi r24,lo8(.LC1)	 ;  D.1827,
	ldi r25,hi8(.LC1)	 ;  D.1827,
	call avr__uart__put__2	 ; 
.LVL71:
	.loc 1 181 0
	ldi r22,lo8(16)	 ; ,
	mov r24,r13	 ; , crc
	call avr__uart__put__5	 ; 
.LVL72:
	.loc 1 182 0
	call avr__uart__crlf	 ; 
.LVL73:
	.loc 1 183 0
	call main__wait_long.1441	 ; 
.LVL74:
.LBB61:
	.loc 1 189 0
	ldi r17,lo8(8)	 ;  tmp179,
.LVL75:
	.loc 1 194 0
	movw r6,r28	 ;  tmp181,
	ldi r31,27	 ; ,
	add r6,r31	 ;  tmp181,
	adc r7,__zero_reg__	 ; 
.L16:
	.loc 1 186 0 discriminator 1
	sts one_wire__rom__identifier,__zero_reg__	 ;  one_wire__rom__identifier,
	.loc 1 187 0 discriminator 1
	call one_wire__temperature_sensors__init_t_conversion	 ; 
.LVL76:
	.loc 1 188 0 discriminator 1
	call main__wait_long.1441	 ; 
.LVL77:
	.loc 1 189 0 discriminator 1
	movw r30,r28	 ; ,
	adiw r30,1	 ; ,
	ldi r26,lo8(one_wire__rom__identifier)	 ; ,
	ldi r27,hi8(one_wire__rom__identifier)	 ; ,
	mov r5,r17	 ;  tmp150, tmp179
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r5	 ;  tmp150
	brne 0b
	.loc 1 191 0 discriminator 1
	call one_wire__temperature_sensors__read_raw_value	 ; 
.LVL78:
	call temperatures__to_temperature_12bit	 ; 
.LVL79:
	movw r4,r24	 ;  temp,
.LVL80:
.LBB62:
.LBB63:
	.loc 3 148 0 discriminator 1
	mov r24,r14	 ; , byte
	call avr__uart__put_raw	 ; 
.LVL81:
.LBE63:
.LBE62:
	.loc 1 192 0 discriminator 1
	ldi r18,lo8(.LC35)	 ; ,
	ldi r19,hi8(.LC35)	 ; ,
	adiw r28,106-62	 ;  %sfp
	std Y+63,r19	 ; 
	std Y+62,r18	 ; 
	sbiw r28,106-62	 ;  %sfp
	ldi r20,lo8(.LC2)	 ; ,
	ldi r21,hi8(.LC2)	 ; ,
	adiw r28,108-62	 ;  %sfp
	std Y+63,r21	 ; 
	std Y+62,r20	 ; 
	sbiw r28,108-62	 ;  %sfp
	adiw r28,106-60	 ;  %sfp
	ldd r22,Y+60	 ; 
	ldd r23,Y+61	 ; 
	ldd r24,Y+62	 ; 
	ldd r25,Y+63	 ; 
	sbiw r28,106-60	 ;  %sfp
	call avr__uart__put__2	 ; 
.LVL82:
	.loc 1 193 0 discriminator 1
	ldi r22,lo8(.LC36)	 ; ,
	ldi r23,hi8(.LC36)	 ; ,
	adiw r28,102-62	 ;  %sfp
	std Y+63,r23	 ; 
	std Y+62,r22	 ; 
	sbiw r28,102-62	 ;  %sfp
	ldi r26,lo8(.LC3)	 ; ,
	ldi r27,hi8(.LC3)	 ; ,
	adiw r28,104-62	 ;  %sfp
	std Y+63,r27	 ; 
	std Y+62,r26	 ; 
	sbiw r28,104-62	 ;  %sfp
	adiw r28,102-60	 ;  %sfp
	ldd r22,Y+60	 ; 
	ldd r23,Y+61	 ; 
	ldd r24,Y+62	 ; 
	ldd r25,Y+63	 ; 
	sbiw r28,102-60	 ;  %sfp
	call avr__uart__put__2	 ; 
.LVL83:
	.loc 1 194 0 discriminator 1
	movw r24,r4	 ; , temp
	call temperatures__image__2	 ; 
.LVL84:
	std Y+27,r18	 ;  D.1836, tmp171
	std Y+28,r19	 ;  D.1836, tmp172
	std Y+29,r20	 ;  D.1836, tmp173
	std Y+30,r21	 ;  D.1836, tmp174
	std Y+31,r22	 ;  D.1836, tmp175
	adiw r28,98-62	 ;  %sfp
	std Y+63,r7	 ;  tmp181
	std Y+62,r6	 ;  tmp181
	sbiw r28,98-62	 ;  %sfp
	ldi r24,lo8(.LC4)	 ; ,
	ldi r25,hi8(.LC4)	 ; ,
	adiw r28,100-62	 ;  %sfp
	std Y+63,r25	 ; 
	std Y+62,r24	 ; 
	sbiw r28,100-62	 ;  %sfp
	adiw r28,98-60	 ;  %sfp
	ldd r22,Y+60	 ; 
	ldd r23,Y+61	 ; 
	ldd r24,Y+62	 ; 
	ldd r25,Y+63	 ; 
	sbiw r28,98-60	 ;  %sfp
	call avr__uart__put__2	 ; 
.LVL85:
	.loc 1 195 0 discriminator 1
	ldi r30,lo8(.LC37)	 ; ,
	ldi r31,hi8(.LC37)	 ; ,
	adiw r28,94-62	 ;  %sfp
	std Y+63,r31	 ; 
	std Y+62,r30	 ; 
	sbiw r28,94-62	 ;  %sfp
	ldi r18,lo8(.LC5)	 ; ,
	ldi r19,hi8(.LC5)	 ; ,
	adiw r28,96-62	 ;  %sfp
	std Y+63,r19	 ; 
	std Y+62,r18	 ; 
	sbiw r28,96-62	 ;  %sfp
	adiw r28,94-60	 ;  %sfp
	ldd r22,Y+60	 ; 
	ldd r23,Y+61	 ; 
	ldd r24,Y+62	 ; 
	ldd r25,Y+63	 ; 
	sbiw r28,94-60	 ;  %sfp
	call avr__uart__put__2	 ; 
.LVL86:
	.loc 1 196 0 discriminator 1
	call avr__uart__crlf	 ; 
.LVL87:
	.loc 1 197 0 discriminator 1
	call main__wait_long.1441	 ; 
.LVL88:
	.loc 1 198 0 discriminator 1
	movw r24,r10	 ; , wait_time
	movw r22,r8	 ; , wait_time
	call ada__calendar__delays__delay_for	 ; 
.LVL89:
	rjmp .L16	 ; 
.LVL90:
.L14:
.LBE61:
	.loc 1 202 0
	ldi r22,lo8(.LC38)	 ;  D.1841,
	ldi r23,hi8(.LC38)	 ;  D.1841,
	ldi r24,lo8(.LC6)	 ;  D.1841,
	ldi r25,hi8(.LC6)	 ;  D.1841,
.LVL91:
	call avr__uart__put__2	 ; 
.LVL92:
	.loc 1 203 0
	call avr__uart__crlf	 ; 
.LVL93:
.L17:
.LBB64:
	.loc 1 207 0 discriminator 1
	ldi r24,lo8(.LC17)	 ; ,
	ldi r25,hi8(.LC17)	 ; ,
	adiw r28,90-62	 ;  %sfp
	std Y+63,r25	 ; 
	std Y+62,r24	 ; 
	sbiw r28,90-62	 ;  %sfp
	ldi r16,lo8(.LC5)	 ; ,
	ldi r17,hi8(.LC5)	 ; ,
	adiw r28,92-62	 ;  %sfp
	std Y+63,r17	 ; 
	std Y+62,r16	 ; 
	sbiw r28,92-62	 ;  %sfp
	adiw r28,90-60	 ;  %sfp
	ldd r22,Y+60	 ; 
	ldd r23,Y+61	 ; 
	ldd r24,Y+62	 ; 
	ldd r25,Y+63	 ; 
	sbiw r28,90-60	 ;  %sfp
	call avr__uart__put__2	 ; 
.LVL94:
	.loc 1 208 0 discriminator 1
	call avr__uart__crlf	 ; 
.LVL95:
	.loc 1 209 0 discriminator 1
	ldi r22,lo8(96)	 ; ,
	ldi r23,lo8(-22)	 ; ,
	ldi r24,0	 ; 
	ldi r25,0	 ; 
	call ada__calendar__delays__delay_for	 ; 
.LVL96:
	rjmp .L17	 ; 
.LBE64:
.LFE1:
	.size	_ada_main, .-_ada_main
	.section	.rodata.CSWTCH.18,"a",@progbits
	.type	CSWTCH.18, @object
	.size	CSWTCH.18, 20
CSWTCH.18:
	.byte	96
	.byte	-22
	.byte	0
	.byte	0
	.byte	-64
	.byte	39
	.byte	9
	.byte	0
	.byte	64
	.byte	119
	.byte	27
	.byte	0
	.byte	-128
	.byte	-18
	.byte	54
	.byte	0
	.byte	0
	.byte	92
	.byte	38
	.byte	5
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
	.long	.LFB5
	.long	.LFE5-.LFB5
	.p2align	2
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB1
	.long	.LFE1-.LFB1
	.byte	0x4
	.long	.LCFI0-.LFB1
	.byte	0xe
	.uleb128 0x3
	.byte	0x9c
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x4
	.byte	0x9d
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xd
	.uleb128 0x1c
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x71
	.p2align	2
.LEFDE2:
	.text
.Letext0:
	.file 4 "/opt/avrada/avr/lib/gnat/avr_lib/avr.ads"
	.file 5 "/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adainclude/interfac.ads"
	.file 6 "/opt/avrada/avr/lib/gnat/avr_lib/avr-uart.ads"
	.file 7 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-rom.ads"
	.file 8 "/opt/avrada/avr/lib/gnat/avr_lib/avr-real_time.ads"
	.file 9 "/opt/avrada/avr/lib/gnat/avr_lib/avr-strings.ads"
	.file 10 "/opt/avrada/avr/lib/gnat/avr_lib/avr-wait.ads"
	.file 11 "/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/avr-atmega328p.ads"
	.file 12 "/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adainclude/a-caldel.ads"
	.file 13 "/opt/avrada/avr/lib/gnat/avr_lib/avr-eeprom.ads"
	.file 14 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-temperature_sensors.ads"
	.file 15 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/temperatures.ads"
	.file 16 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire.ads"
	.file 17 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/one_wire-search.ads"
	.file 18 "/opt/avrada/avr/lib/gnat/avr_lib/avr-real_time-clock.adb"
	.file 19 "/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/crc8.ads"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xe4e
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF87
	.byte	0xd
	.long	.LASF88
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
	.long	.LASF89
	.long	0x25
	.uleb128 0x4
	.long	.LASF6
	.byte	0x2
	.byte	0x5
	.byte	0x35
	.byte	0x1
	.long	0x61
	.uleb128 0x5
	.string	"LB0"
	.byte	0x4
	.byte	0x4a
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.string	"UB0"
	.byte	0x4
	.byte	0x4a
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0
	.uleb128 0x6
	.long	.LASF9
	.byte	0x4
	.byte	0x4a
	.long	0x6c
	.uleb128 0x7
	.long	.LASF9
	.long	0x2c
	.long	0x7f
	.uleb128 0x8
	.long	0x7f
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x9
	.long	.LASF18
	.byte	0x4
	.byte	0x4
	.byte	0x4a
	.long	0xaf
	.uleb128 0xa
	.long	.LASF2
	.byte	0x5
	.byte	0x35
	.long	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xa
	.long	.LASF3
	.byte	0x5
	.byte	0x35
	.long	0xb5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0xb
	.byte	0x2
	.long	0x61
	.uleb128 0xb
	.byte	0x2
	.long	0x37
	.uleb128 0xc
	.long	.LASF61
	.long	0xffffffff
	.byte	0x5
	.byte	0x35
	.long	0xf5
	.byte	0x1
	.long	0xf5
	.uleb128 0xa
	.long	.LASF4
	.byte	0x5
	.byte	0x35
	.long	0x37
	.byte	0xb
	.byte	0x23
	.uleb128 0xfffffffffffffffe
	.uleb128 0xa
	.long	.LASF5
	.byte	0x5
	.byte	0x35
	.long	0x61
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x4
	.long	.LASF7
	.byte	0x1
	.byte	0x5
	.byte	0x35
	.byte	0x1
	.long	0x11f
	.uleb128 0xa
	.long	.LASF4
	.byte	0x5
	.byte	0x35
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xa
	.long	.LASF8
	.byte	0x5
	.byte	0x35
	.long	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x6
	.long	.LASF10
	.byte	0x6
	.byte	0x4a
	.long	0x86
	.uleb128 0x6
	.long	.LASF11
	.byte	0x7
	.byte	0x22
	.long	0x135
	.uleb128 0x7
	.long	.LASF11
	.long	0x25
	.long	0x14a
	.uleb128 0xd
	.long	0x7f
	.byte	0x1
	.byte	0x8
	.byte	0
	.uleb128 0xe
	.word	0xfc90
	.word	0x7d0
	.long	.LASF13
	.long	0x157
	.uleb128 0xf
	.byte	0x2
	.byte	0x5
	.long	.LASF15
	.byte	0x1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF12
	.uleb128 0xe
	.word	0x8000
	.word	0x7fff
	.long	.LASF14
	.long	0x173
	.uleb128 0xf
	.byte	0x2
	.byte	0x5
	.long	.LASF16
	.byte	0x1
	.uleb128 0x10
	.byte	0
	.long	0x5265c00
	.long	.LASF90
	.long	0x189
	.uleb128 0xf
	.byte	0x4
	.byte	0x5
	.long	.LASF17
	.byte	0x1
	.uleb128 0x9
	.long	.LASF19
	.byte	0x6
	.byte	0x8
	.byte	0xc7
	.long	0x1ba
	.uleb128 0xa
	.long	.LASF20
	.byte	0x8
	.byte	0xc8
	.long	0x166
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xa
	.long	.LASF21
	.byte	0x8
	.byte	0xc9
	.long	0x17b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0x11
	.long	0xfad9a400
	.long	0xa4cb800
	.long	.LASF91
	.long	0x189
	.uleb128 0x4
	.long	.LASF22
	.byte	0x2
	.byte	0x9
	.byte	0x21
	.byte	0x1
	.long	0x1f5
	.uleb128 0x5
	.string	"LB0"
	.byte	0x9
	.byte	0x21
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.string	"UB0"
	.byte	0x9
	.byte	0x21
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0
	.uleb128 0x6
	.long	.LASF23
	.byte	0x9
	.byte	0x21
	.long	0x200
	.uleb128 0x7
	.long	.LASF23
	.long	0x213
	.long	0x213
	.uleb128 0x8
	.long	0x7f
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF24
	.uleb128 0x9
	.long	.LASF25
	.byte	0x4
	.byte	0x9
	.byte	0x21
	.long	0x243
	.uleb128 0xa
	.long	.LASF2
	.byte	0x9
	.byte	0x21
	.long	0x243
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xa
	.long	.LASF3
	.byte	0x9
	.byte	0x21
	.long	0x249
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0xb
	.byte	0x2
	.long	0x1f5
	.uleb128 0xb
	.byte	0x2
	.long	0x1cb
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF26
	.uleb128 0x12
	.byte	0
	.word	0x3ff
	.long	.LASF28
	.long	0x24f
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF27
	.uleb128 0x12
	.byte	0
	.word	0xffff
	.long	.LASF29
	.long	0x275
	.uleb128 0xf
	.byte	0x2
	.byte	0x7
	.long	.LASF30
	.byte	0x1
	.uleb128 0x2
	.byte	0x1
	.byte	0x7
	.long	.LASF31
	.uleb128 0x4
	.long	.LASF32
	.byte	0x1
	.byte	0x4
	.byte	0x35
	.byte	0x1
	.long	0x2af
	.uleb128 0x13
	.long	.LASF92
	.byte	0x4
	.byte	0x35
	.long	0x2a2
	.byte	0x1
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x14
	.byte	0
	.byte	0xff
	.long	.LASF64
	.long	0x27d
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.byte	0x7
	.long	.LASF33
	.byte	0x1
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF34
	.uleb128 0x6
	.long	.LASF35
	.byte	0x9
	.byte	0x2b
	.long	0x2c9
	.uleb128 0x15
	.long	.LASF35
	.long	0x213
	.long	0x21a
	.long	0x2e2
	.uleb128 0xd
	.long	0x7f
	.byte	0x1
	.byte	0x5
	.byte	0
	.uleb128 0x16
	.long	0x2e8
	.byte	0x1
	.uleb128 0xf
	.byte	0x8
	.byte	0x5
	.long	.LASF36
	.byte	0x1
	.uleb128 0x17
	.long	0x15f
	.uleb128 0x18
	.byte	0x1
	.long	.LASF69
	.byte	0x3
	.byte	0x92
	.byte	0x3
	.long	0x30d
	.uleb128 0x19
	.string	"ch"
	.byte	0x6
	.byte	0x55
	.long	0x30d
	.byte	0
	.uleb128 0x17
	.long	0x213
	.uleb128 0xf
	.byte	0x4
	.byte	0x5
	.long	.LASF37
	.byte	0x1
	.uleb128 0x17
	.long	0x25
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF38
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF93
	.byte	0x1
	.byte	0x18
	.long	.LASF94
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.byte	0x1
	.long	0xbdf
	.uleb128 0x1b
	.long	.LASF39
	.byte	0x1
	.byte	0x19
	.long	0xc25
	.byte	0x2
	.byte	0x8c
	.sleb128 21
	.uleb128 0x1b
	.long	.LASF40
	.byte	0x1
	.byte	0x19
	.long	0xc4f
	.byte	0x4
	.byte	0x91
	.sleb128 -90
	.byte	0x9f
	.uleb128 0x1b
	.long	.LASF41
	.byte	0x1
	.byte	0x1b
	.long	0xc5a
	.byte	0xc
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x1c
	.long	.LASF42
	.byte	0xa
	.byte	0x29
	.long	0x2e2
	.long	0xf42400
	.uleb128 0x1d
	.long	.LASF43
	.byte	0xa
	.byte	0x2a
	.long	0x2e2
	.word	0x3e8
	.uleb128 0x1e
	.long	.LASF95
	.byte	0x1
	.byte	0x3
	.long	0x3ba
	.uleb128 0x1f
	.long	.LASF44
	.byte	0x2
	.byte	0x3a
	.long	0x2e2
	.byte	0x3e
	.uleb128 0x1d
	.long	.LASF45
	.byte	0x2
	.byte	0x3d
	.long	0x2f0
	.word	0x3f01
	.byte	0
	.uleb128 0x20
	.long	.LASF47
	.byte	0x1
	.byte	0x22
	.long	0x312
	.byte	0x1
	.long	0x3d6
	.uleb128 0x21
	.long	.LASF46
	.byte	0x1
	.byte	0x22
	.long	0x30d
	.byte	0
	.uleb128 0x20
	.long	.LASF48
	.byte	0x1
	.byte	0x2e
	.long	0x312
	.byte	0x1
	.long	0x3f2
	.uleb128 0x21
	.long	.LASF46
	.byte	0x1
	.byte	0x2e
	.long	0x31a
	.byte	0
	.uleb128 0x22
	.long	.LASF96
	.byte	0x1
	.byte	0x33
	.long	.LFB5
	.long	.LFE5
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x455
	.uleb128 0x23
	.long	.LBB16
	.long	.LBE16
	.uleb128 0x24
	.string	"j"
	.byte	0x1
	.byte	0x35
	.long	0x31f
	.long	.LLST0
	.uleb128 0x25
	.long	0x395
	.long	.LBB17
	.long	.LBE17
	.byte	0x1
	.byte	0x36
	.uleb128 0x23
	.long	.LBB18
	.long	.LBE18
	.uleb128 0x1f
	.long	.LASF44
	.byte	0x2
	.byte	0x3a
	.long	0x2e2
	.byte	0x3e
	.uleb128 0x1d
	.long	.LASF45
	.byte	0x2
	.byte	0x3d
	.long	0x2f0
	.word	0x3f01
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	.LASF49
	.byte	0x1
	.byte	0x3a
	.long	0x2b7
	.byte	0x1
	.long	0x489
	.uleb128 0x26
	.long	.LASF50
	.byte	0x1
	.byte	0x3a
	.long	0x2b7
	.uleb128 0x27
	.uleb128 0x26
	.long	.LASF51
	.byte	0x1
	.byte	0x3c
	.long	0x191
	.uleb128 0x28
	.string	"ch"
	.byte	0x1
	.byte	0x3d
	.long	0x213
	.uleb128 0x29
	.byte	0
	.byte	0
	.uleb128 0x2a
	.long	.LASF52
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.long	0x4a0
	.uleb128 0x28
	.string	"ch"
	.byte	0x1
	.byte	0x57
	.long	0x213
	.byte	0
	.uleb128 0x2a
	.long	.LASF53
	.byte	0x1
	.byte	0x60
	.byte	0x1
	.long	0x4b7
	.uleb128 0x28
	.string	"ch"
	.byte	0x1
	.byte	0x62
	.long	0x213
	.byte	0
	.uleb128 0x2a
	.long	.LASF54
	.byte	0x1
	.byte	0x74
	.byte	0x1
	.long	0x4cf
	.uleb128 0x28
	.string	"ch"
	.byte	0x1
	.byte	0x76
	.long	0x213
	.uleb128 0x29
	.byte	0
	.uleb128 0x2b
	.long	.LASF55
	.byte	0x1
	.byte	0x8c
	.long	0x2b7
	.long	.LLST2
	.uleb128 0x1b
	.long	.LASF56
	.byte	0x1
	.byte	0x8d
	.long	0x12a
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.uleb128 0x24
	.string	"crc"
	.byte	0x1
	.byte	0x8e
	.long	0x25
	.long	.LLST3
	.uleb128 0x2b
	.long	.LASF57
	.byte	0x1
	.byte	0x8f
	.long	0x14a
	.long	.LLST4
	.uleb128 0x26
	.long	.LASF50
	.byte	0x1
	.byte	0x90
	.long	0x2b7
	.uleb128 0x1b
	.long	.LASF58
	.byte	0x1
	.byte	0x91
	.long	0x312
	.byte	0xc
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.byte	0x5a
	.byte	0x93
	.uleb128 0x1
	.byte	0x5b
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x2b
	.long	.LASF59
	.byte	0x1
	.byte	0x92
	.long	0x25
	.long	.LLST5
	.uleb128 0x1b
	.long	.LASF60
	.byte	0x1
	.byte	0x93
	.long	0x213
	.byte	0x1
	.byte	0x5e
	.uleb128 0x2c
	.long	0x455
	.long	.LBB43
	.long	.LBE43
	.byte	0x1
	.byte	0x9b
	.long	0x61c
	.uleb128 0x23
	.long	.LBB44
	.long	.LBE44
	.uleb128 0x2d
	.long	0x465
	.long	.LLST6
	.uleb128 0x23
	.long	.LBB45
	.long	.LBE45
	.uleb128 0x2e
	.long	0x471
	.byte	0x2
	.byte	0x8c
	.sleb128 15
	.uleb128 0x2f
	.long	0x47c
	.uleb128 0x30
	.long	.LBB46
	.long	.LBE46
	.long	0x610
	.uleb128 0x31
	.long	.LVL6
	.long	0xcc4
	.uleb128 0x31
	.long	.LVL7
	.long	0xcd5
	.uleb128 0x32
	.long	.LVL8
	.long	0xcf6
	.long	0x5c3
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0xa
	.word	0x1f4
	.byte	0
	.uleb128 0x32
	.long	.LVL9
	.long	0xd0f
	.long	0x5e2
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x31
	.long	.LVL10
	.long	0xd22
	.uleb128 0x31
	.long	.LVL11
	.long	0xd0f
	.uleb128 0x31
	.long	.LVL12
	.long	0xd30
	.uleb128 0x31
	.long	.LVL13
	.long	0xd22
	.uleb128 0x31
	.long	.LVL14
	.long	0xd3a
	.byte	0
	.uleb128 0x31
	.long	.LVL4
	.long	0xcc4
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.long	0x4b7
	.long	.LBB47
	.long	.LBE47
	.byte	0x1
	.byte	0x9e
	.long	0x8d4
	.uleb128 0x23
	.long	.LBB48
	.long	.LBE48
	.uleb128 0x2d
	.long	0x4c3
	.long	.LLST7
	.uleb128 0x23
	.long	.LBB49
	.long	.LBE49
	.uleb128 0x2c
	.long	0x489
	.long	.LBB50
	.long	.LBE50
	.byte	0x1
	.byte	0x83
	.long	0x6b7
	.uleb128 0x23
	.long	.LBB51
	.long	.LBE51
	.uleb128 0x2d
	.long	0x495
	.long	.LLST8
	.uleb128 0x32
	.long	.LVL25
	.long	0xd0f
	.long	0x68f
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x91
	.sleb128 -43
	.byte	0x6
	.byte	0
	.uleb128 0x31
	.long	.LVL26
	.long	0xd30
	.uleb128 0x31
	.long	.LVL27
	.long	0xd3a
	.uleb128 0x34
	.long	.LVL29
	.long	0xd47
	.uleb128 0x33
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.long	0x4a0
	.long	.LBB52
	.long	.LBE52
	.byte	0x1
	.byte	0x86
	.long	0x80a
	.uleb128 0x23
	.long	.LBB53
	.long	.LBE53
	.uleb128 0x2d
	.long	0x4ac
	.long	.LLST9
	.uleb128 0x32
	.long	.LVL32
	.long	0xd0f
	.long	0x6fd
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x4
	.byte	0x91
	.sleb128 -75
	.byte	0x6
	.byte	0
	.uleb128 0x31
	.long	.LVL33
	.long	0xd30
	.uleb128 0x32
	.long	.LVL34
	.long	0xd0f
	.long	0x727
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x4
	.byte	0x91
	.sleb128 -71
	.byte	0x6
	.byte	0
	.uleb128 0x31
	.long	.LVL35
	.long	0xd30
	.uleb128 0x32
	.long	.LVL36
	.long	0xd0f
	.long	0x751
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x4
	.byte	0x91
	.sleb128 -67
	.byte	0x6
	.byte	0
	.uleb128 0x31
	.long	.LVL37
	.long	0xd30
	.uleb128 0x32
	.long	.LVL38
	.long	0xd0f
	.long	0x77a
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x91
	.sleb128 -63
	.byte	0x6
	.byte	0
	.uleb128 0x31
	.long	.LVL39
	.long	0xd30
	.uleb128 0x32
	.long	.LVL40
	.long	0xd0f
	.long	0x7a3
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x91
	.sleb128 -59
	.byte	0x6
	.byte	0
	.uleb128 0x31
	.long	.LVL41
	.long	0xd30
	.uleb128 0x32
	.long	.LVL42
	.long	0xd0f
	.long	0x7cc
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x91
	.sleb128 -55
	.byte	0x6
	.byte	0
	.uleb128 0x31
	.long	.LVL43
	.long	0xd30
	.uleb128 0x31
	.long	.LVL44
	.long	0xd3a
	.uleb128 0x32
	.long	.LVL46
	.long	0xd47
	.long	0x7f6
	.uleb128 0x33
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x31
	.long	.LVL50
	.long	0xd0f
	.uleb128 0x31
	.long	.LVL51
	.long	0xd30
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	.LVL15
	.long	0xd0f
	.long	0x82a
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x91
	.sleb128 -35
	.byte	0x6
	.byte	0
	.uleb128 0x31
	.long	.LVL16
	.long	0xd30
	.uleb128 0x32
	.long	.LVL17
	.long	0xd0f
	.long	0x853
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x91
	.sleb128 -31
	.byte	0x6
	.byte	0
	.uleb128 0x31
	.long	.LVL18
	.long	0xd30
	.uleb128 0x32
	.long	.LVL19
	.long	0xd0f
	.long	0x87c
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x91
	.sleb128 -27
	.byte	0x6
	.byte	0
	.uleb128 0x31
	.long	.LVL20
	.long	0xd30
	.uleb128 0x32
	.long	.LVL21
	.long	0xd0f
	.long	0x8a4
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x31
	.long	.LVL22
	.long	0xd30
	.uleb128 0x31
	.long	.LVL23
	.long	0xd3a
	.uleb128 0x31
	.long	.LVL24
	.long	0xd30
	.uleb128 0x31
	.long	.LVL31
	.long	0xd30
	.uleb128 0x31
	.long	.LVL52
	.long	0xd30
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.long	0x2f5
	.long	.LBB54
	.long	.LBE54
	.byte	0x1
	.byte	0xa5
	.long	0x901
	.uleb128 0x35
	.long	0x302
	.long	.LLST10
	.uleb128 0x34
	.long	.LVL59
	.long	0xd64
	.uleb128 0x33
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x81
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.long	0x3d6
	.long	.LBB56
	.long	.LBE56
	.byte	0x1
	.byte	0xa7
	.long	0x937
	.uleb128 0x35
	.long	0x3e6
	.long	.LLST11
	.uleb128 0x25
	.long	0x3ba
	.long	.LBB57
	.long	.LBE57
	.byte	0x1
	.byte	0x30
	.uleb128 0x35
	.long	0x3ca
	.long	.LLST11
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	.LBB58
	.long	.LBE58
	.long	0x9ae
	.uleb128 0x24
	.string	"j"
	.byte	0x1
	.byte	0xaf
	.long	0x25
	.long	.LLST13
	.uleb128 0x2c
	.long	0x2f5
	.long	.LBB59
	.long	.LBE59
	.byte	0x1
	.byte	0xb2
	.long	0x97e
	.uleb128 0x35
	.long	0x302
	.long	.LLST14
	.uleb128 0x34
	.long	.LVL70
	.long	0xd64
	.uleb128 0x33
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	.LVL67
	.long	0xd77
	.long	0x998
	.uleb128 0x33
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x33
	.byte	0x1
	.byte	0x66
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x34
	.long	.LVL69
	.long	0xd97
	.uleb128 0x33
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x33
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x40
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	.LBB61
	.long	.LBE61
	.long	0xad3
	.uleb128 0x2c
	.long	0x2f5
	.long	.LBB62
	.long	.LBE62
	.byte	0x1
	.byte	0xc0
	.long	0x9e8
	.uleb128 0x35
	.long	0x302
	.long	.LLST15
	.uleb128 0x34
	.long	.LVL81
	.long	0xd64
	.uleb128 0x33
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x31
	.long	.LVL76
	.long	0xdaf
	.uleb128 0x31
	.long	.LVL77
	.long	0x3f2
	.uleb128 0x31
	.long	.LVL78
	.long	0xdb8
	.uleb128 0x31
	.long	.LVL79
	.long	0xdc5
	.uleb128 0x32
	.long	.LVL82
	.long	0xd0f
	.long	0xa2c
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x91
	.sleb128 -7
	.byte	0x6
	.byte	0
	.uleb128 0x32
	.long	.LVL83
	.long	0xd0f
	.long	0xa4c
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x91
	.sleb128 -11
	.byte	0x6
	.byte	0
	.uleb128 0x32
	.long	.LVL84
	.long	0xde1
	.long	0xa65
	.uleb128 0x33
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x32
	.long	.LVL85
	.long	0xd0f
	.long	0xa85
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x91
	.sleb128 -15
	.byte	0x6
	.byte	0
	.uleb128 0x32
	.long	.LVL86
	.long	0xd0f
	.long	0xaa5
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x91
	.sleb128 -19
	.byte	0x6
	.byte	0
	.uleb128 0x31
	.long	.LVL87
	.long	0xd30
	.uleb128 0x31
	.long	.LVL88
	.long	0x3f2
	.uleb128 0x34
	.long	.LVL89
	.long	0xcf6
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	.LBB64
	.long	.LBE64
	.long	0xb26
	.uleb128 0x32
	.long	.LVL94
	.long	0xd0f
	.long	0xb00
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0x91
	.sleb128 -23
	.byte	0x6
	.byte	0
	.uleb128 0x31
	.long	.LVL95
	.long	0xd30
	.uleb128 0x34
	.long	.LVL96
	.long	0xcf6
	.uleb128 0x33
	.byte	0xc
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x3
	.byte	0xa
	.word	0xea60
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	.LVL3
	.long	0xdfd
	.long	0xb44
	.uleb128 0x33
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x8
	.byte	0x67
	.uleb128 0x33
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x32
	.long	.LVL54
	.long	0xe24
	.long	0xb5c
	.uleb128 0x33
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x32
	.long	.LVL56
	.long	0xe24
	.long	0xb74
	.uleb128 0x33
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x31
	.long	.LVL58
	.long	0xd0f
	.uleb128 0x31
	.long	.LVL60
	.long	0xd30
	.uleb128 0x31
	.long	.LVL62
	.long	0xe3b
	.uleb128 0x31
	.long	.LVL63
	.long	0xe44
	.uleb128 0x31
	.long	.LVL71
	.long	0xd0f
	.uleb128 0x32
	.long	.LVL72
	.long	0xd97
	.long	0xbba
	.uleb128 0x33
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x33
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x40
	.byte	0
	.uleb128 0x31
	.long	.LVL73
	.long	0xd30
	.uleb128 0x31
	.long	.LVL74
	.long	0x3f2
	.uleb128 0x31
	.long	.LVL92
	.long	0xd0f
	.uleb128 0x31
	.long	.LVL93
	.long	0xd30
	.byte	0
	.uleb128 0x36
	.long	.LASF97
	.long	0x2c
	.long	0xbf9
	.byte	0x1
	.long	0xbf9
	.uleb128 0xd
	.long	0x7f
	.byte	0
	.byte	0x3
	.byte	0
	.uleb128 0x37
	.long	.LASF62
	.byte	0x1
	.byte	0x1
	.byte	0x19
	.long	0x86
	.byte	0x1
	.long	0xc25
	.uleb128 0xa
	.long	.LASF63
	.byte	0x1
	.byte	0x19
	.long	0xc18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x14
	.byte	0
	.byte	0x3
	.long	.LASF63
	.long	0x25
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.long	.LASF39
	.byte	0x6
	.byte	0x1
	.byte	0x19
	.byte	0x1
	.long	0xc4f
	.uleb128 0xa
	.long	.LASF4
	.byte	0x1
	.byte	0x19
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xa
	.long	.LASF5
	.byte	0x1
	.byte	0x19
	.long	0xbdf
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0x17
	.long	0xc54
	.uleb128 0x38
	.byte	0x2
	.long	0xbb
	.uleb128 0x17
	.long	0x11f
	.uleb128 0x39
	.long	.LASF65
	.byte	0xb
	.word	0x8f5
	.long	0xc6d
	.byte	0x1
	.byte	0x2a
	.uleb128 0x17
	.long	0xc72
	.uleb128 0x38
	.byte	0x2
	.long	0xc78
	.uleb128 0x3a
	.long	0x284
	.byte	0x1
	.uleb128 0x39
	.long	.LASF66
	.byte	0xb
	.word	0x8d4
	.long	0xc6d
	.byte	0x1
	.byte	0x2b
	.uleb128 0x3b
	.long	.LASF98
	.byte	0x7
	.byte	0x27
	.long	0x12a
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.long	.LASF67
	.byte	0xb
	.word	0x11f
	.long	0xc6d
	.byte	0x1
	.byte	0xc0
	.uleb128 0x3c
	.long	.LASF68
	.byte	0xb
	.byte	0x80
	.long	0xcb4
	.byte	0x1
	.byte	0xc6
	.uleb128 0x17
	.long	0xcb9
	.uleb128 0x38
	.byte	0x2
	.long	0xcbf
	.uleb128 0x3d
	.long	0x25
	.uleb128 0x3e
	.byte	0x1
	.long	.LASF99
	.byte	0x12
	.byte	0x16
	.long	.LASF100
	.long	0x191
	.byte	0x1
	.uleb128 0x3f
	.byte	0x1
	.long	.LASF80
	.byte	0x8
	.byte	0x8c
	.long	0x1ba
	.byte	0x1
	.long	0xcf1
	.uleb128 0x40
	.long	0xcf1
	.uleb128 0x40
	.long	0xcf1
	.byte	0
	.uleb128 0x17
	.long	0x191
	.uleb128 0x41
	.byte	0x1
	.long	.LASF70
	.byte	0xc
	.byte	0x36
	.byte	0x1
	.long	0xd09
	.uleb128 0x40
	.long	0xd09
	.byte	0
	.uleb128 0x16
	.long	0x312
	.byte	0x1
	.uleb128 0x41
	.byte	0x1
	.long	.LASF71
	.byte	0x6
	.byte	0x59
	.byte	0x1
	.long	0xd22
	.uleb128 0x40
	.long	0x21a
	.byte	0
	.uleb128 0x42
	.byte	0x1
	.long	.LASF72
	.byte	0x3
	.word	0x1a7
	.long	0x2b7
	.byte	0x1
	.uleb128 0x43
	.byte	0x1
	.long	.LASF77
	.byte	0x3
	.word	0x108
	.byte	0x1
	.uleb128 0x44
	.byte	0x1
	.long	.LASF73
	.byte	0x6
	.byte	0x72
	.long	0x213
	.byte	0x1
	.uleb128 0x41
	.byte	0x1
	.long	.LASF74
	.byte	0xd
	.byte	0x29
	.byte	0x1
	.long	0xd5f
	.uleb128 0x40
	.long	0xd5f
	.uleb128 0x40
	.long	0x31a
	.byte	0
	.uleb128 0x17
	.long	0x256
	.uleb128 0x41
	.byte	0x1
	.long	.LASF75
	.byte	0x3
	.byte	0x98
	.byte	0x1
	.long	0xd77
	.uleb128 0x40
	.long	0x31a
	.byte	0
	.uleb128 0x45
	.byte	0x1
	.long	.LASF101
	.byte	0x13
	.byte	0x16
	.long	.LASF102
	.long	0x25
	.byte	0x1
	.long	0xd97
	.uleb128 0x40
	.long	0x31a
	.uleb128 0x40
	.long	0x31a
	.byte	0
	.uleb128 0x41
	.byte	0x1
	.long	.LASF76
	.byte	0x6
	.byte	0x65
	.byte	0x1
	.long	0xdaf
	.uleb128 0x40
	.long	0x31a
	.uleb128 0x40
	.long	0x31a
	.byte	0
	.uleb128 0x46
	.byte	0x1
	.long	.LASF78
	.byte	0xe
	.byte	0x35
	.byte	0x1
	.uleb128 0x44
	.byte	0x1
	.long	.LASF79
	.byte	0xe
	.byte	0x39
	.long	0x262
	.byte	0x1
	.uleb128 0x3f
	.byte	0x1
	.long	.LASF81
	.byte	0xf
	.byte	0x30
	.long	0x14a
	.byte	0x1
	.long	0xddc
	.uleb128 0x40
	.long	0xddc
	.byte	0
	.uleb128 0x17
	.long	0x262
	.uleb128 0x3f
	.byte	0x1
	.long	.LASF82
	.byte	0xf
	.byte	0x3b
	.long	0x2be
	.byte	0x1
	.long	0xdf8
	.uleb128 0x40
	.long	0xdf8
	.byte	0
	.uleb128 0x17
	.long	0x14a
	.uleb128 0x41
	.byte	0x1
	.long	.LASF83
	.byte	0x6
	.byte	0x4b
	.byte	0x1
	.long	0xe1a
	.uleb128 0x40
	.long	0xe1a
	.uleb128 0x40
	.long	0xe1f
	.uleb128 0x40
	.long	0xc5a
	.byte	0
	.uleb128 0x17
	.long	0x269
	.uleb128 0x17
	.long	0x2b7
	.uleb128 0x3f
	.byte	0x1
	.long	.LASF84
	.byte	0xd
	.byte	0x20
	.long	0x25
	.byte	0x1
	.long	0xe3b
	.uleb128 0x40
	.long	0xd5f
	.byte	0
	.uleb128 0x46
	.byte	0x1
	.long	.LASF85
	.byte	0x10
	.byte	0x37
	.byte	0x1
	.uleb128 0x44
	.byte	0x1
	.long	.LASF86
	.byte	0x11
	.byte	0x19
	.long	0x2b7
	.byte	0x1
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
	.uleb128 0x5
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x6
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2302
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x22
	.uleb128 0xb
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.uleb128 0x2f
	.uleb128 0x5
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.uleb128 0xb
	.uleb128 0x2f
	.uleb128 0x6
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.uleb128 0x6
	.uleb128 0x2f
	.uleb128 0x6
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.uleb128 0xb
	.uleb128 0x2f
	.uleb128 0x5
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2302
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x2007
	.uleb128 0xe
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2302
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
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
	.uleb128 0x2302
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x39
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
	.uleb128 0x3a
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x3b
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x3c
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3e
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
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x3f
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x41
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x44
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x45
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
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x46
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST1:
	.long	.LFB1
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
	.long	.LCFI3
	.word	0x2
	.byte	0x8c
	.sleb128 4
	.long	.LCFI3
	.long	.LFE1
	.word	0x3
	.byte	0x8c
	.sleb128 113
	.long	0
	.long	0
.LLST0:
	.long	.LVL0
	.long	.LVL1
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST2:
	.long	.LVL63
	.long	.LVL65
	.word	0x1
	.byte	0x68
	.long	.LVL90
	.long	.LVL91
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST3:
	.long	.LVL64
	.long	.LVL66
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL66
	.long	.LVL90
	.word	0x1
	.byte	0x5d
	.long	0
	.long	0
.LLST4:
	.long	.LVL80
	.long	.LVL90
	.word	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x1
	.byte	0x55
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST5:
	.long	.LVL55
	.long	.LVL57
	.word	0x1
	.byte	0x5e
	.long	.LVL57
	.long	.LVL61
	.word	0x1
	.byte	0x61
	.long	.LVL61
	.long	.LVL75
	.word	0x3
	.byte	0x81
	.sleb128 49
	.byte	0x9f
	.long	.LVL90
	.long	.LFE1
	.word	0x3
	.byte	0x81
	.sleb128 49
	.byte	0x9f
	.long	0
	.long	0
.LLST6:
	.long	.LVL5
	.long	.LVL12
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL12
	.long	.LVL53
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	0
	.long	0
.LLST7:
	.long	.LVL23
	.long	.LVL24-1
	.word	0x1
	.byte	0x68
	.long	.LVL30
	.long	.LVL31-1
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST8:
	.long	.LVL27
	.long	.LVL28
	.word	0x1
	.byte	0x68
	.long	.LVL28
	.long	.LVL29-1
	.word	0x1
	.byte	0x66
	.long	0
	.long	0
.LLST9:
	.long	.LVL44
	.long	.LVL45
	.word	0x1
	.byte	0x68
	.long	.LVL45
	.long	.LVL46-1
	.word	0x1
	.byte	0x66
	.long	.LVL47
	.long	.LVL48
	.word	0x1
	.byte	0x68
	.long	.LVL48
	.long	.LVL49
	.word	0x3
	.byte	0x89
	.sleb128 49
	.byte	0x9f
	.long	0
	.long	0
.LLST10:
	.long	.LVL58
	.long	.LVL61
	.word	0x1
	.byte	0x61
	.long	.LVL61
	.long	.LVL75
	.word	0x3
	.byte	0x81
	.sleb128 49
	.byte	0x9f
	.long	.LVL90
	.long	.LFE1
	.word	0x3
	.byte	0x81
	.sleb128 49
	.byte	0x9f
	.long	0
	.long	0
.LLST11:
	.long	.LVL60
	.long	.LVL61
	.word	0x1
	.byte	0x61
	.long	.LVL61
	.long	.LVL75
	.word	0x3
	.byte	0x81
	.sleb128 49
	.byte	0x9f
	.long	.LVL90
	.long	.LFE1
	.word	0x3
	.byte	0x81
	.sleb128 49
	.byte	0x9f
	.long	0
	.long	0
.LLST13:
	.long	.LVL64
	.long	.LVL66
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST14:
	.long	.LVL69
	.long	.LVL90
	.word	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.long	0
	.long	0
.LLST15:
	.long	.LVL80
	.long	.LVL90
	.word	0x1
	.byte	0x5e
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x24
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB5
	.long	.LFE5-.LFB5
	.long	.LFB1
	.long	.LFE1-.LFB1
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB5
	.long	.LFE5
	.long	.LFB1
	.long	.LFE1
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF81:
	.string	"temperatures__to_temperature_12bit"
.LASF33:
	.string	"avr__Tbit_numberB"
.LASF84:
	.string	"avr__eeprom__get"
.LASF65:
	.string	"avr__atmega328p__ddrd_bits"
.LASF97:
	.string	"main__T2b"
.LASF2:
	.string	"P_ARRAY"
.LASF27:
	.string	"interfaces__unsigned_16"
.LASF43:
	.string	"wait_1msGP620__micro_seconds"
.LASF4:
	.string	"BOUNDS"
.LASF88:
	.string	"/home/helipse/Dropbox/AdaProg/AdaProg/26_1 - 18B20/main.adb"
.LASF13:
	.string	"temperatures__temperature_12bit___XF_1_16"
.LASF57:
	.string	"temp"
.LASF68:
	.string	"avr__atmega328p__udr0"
.LASF1:
	.string	"sizetype"
.LASF20:
	.string	"days"
.LASF58:
	.string	"wait_time"
.LASF89:
	.string	"avr__nat8"
.LASF54:
	.string	"main__do_main_menu"
.LASF93:
	.string	"main"
.LASF10:
	.string	"avr__uart__buffer_ptr"
.LASF0:
	.string	"interfaces__unsigned_8"
.LASF21:
	.string	"secs"
.LASF60:
	.string	"device_id"
.LASF37:
	.string	"duration___XF_1_1000"
.LASF64:
	.string	"avr__bits_in_byte___XP1"
.LASF83:
	.string	"avr__uart__init_interrupt_read"
.LASF46:
	.string	"option"
.LASF40:
	.string	"input_buffer"
.LASF29:
	.string	"avr__uart__serial_speed"
.LASF8:
	.string	"ARRAY___XVL"
.LASF26:
	.string	"system__address"
.LASF67:
	.string	"avr__atmega328p__ucsr0a_bits"
.LASF48:
	.string	"main__get_delay__2"
.LASF94:
	.string	"_ada_main"
.LASF100:
	.string	"_ada_avr__real_time__clock"
.LASF7:
	.string	"avr__nat8_array___XUT___XVE"
.LASF76:
	.string	"avr__uart__put__5"
.LASF71:
	.string	"avr__uart__put__2"
.LASF90:
	.string	"avr__real_time__day_duration___XF_1_1000"
.LASF82:
	.string	"temperatures__image__2"
.LASF5:
	.string	"ARRAY"
.LASF15:
	.string	"temperatures__Ttemperature_12bitB___XF_1_16"
.LASF50:
	.string	"enter_menu"
.LASF45:
	.string	"cycles_to_wait"
.LASF73:
	.string	"avr__uart__get"
.LASF72:
	.string	"avr__uart__have_input"
.LASF85:
	.string	"one_wire__init_comm"
.LASF38:
	.string	"integer"
.LASF91:
	.string	"avr__real_time__duration___XF_1_1000"
.LASF24:
	.string	"character"
.LASF70:
	.string	"ada__calendar__delays__delay_for"
.LASF3:
	.string	"P_BOUNDS"
.LASF32:
	.string	"avr__bits_in_byte___XP1___JM"
.LASF31:
	.string	"system__unsigned_types__short_short_unsigned"
.LASF28:
	.string	"avr__eeprom__eeprom_address___XDLU_0__1023"
.LASF14:
	.string	"avr__real_time__day_count"
.LASF78:
	.string	"one_wire__temperature_sensors__init_t_conversion"
.LASF62:
	.string	"main__T2b___XA"
.LASF47:
	.string	"main__get_delay"
.LASF16:
	.string	"interfaces__Tinteger_16B"
.LASF44:
	.string	"cycle_length"
.LASF79:
	.string	"one_wire__temperature_sensors__read_raw_value"
.LASF39:
	.string	"input_buffer___UNC"
.LASF19:
	.string	"avr__real_time__time"
.LASF12:
	.string	"interfaces__unsigned_32"
.LASF42:
	.string	"wait_1msGP620__crystal_hertz"
.LASF69:
	.string	"avr__uart__put"
.LASF74:
	.string	"avr__eeprom__put"
.LASF52:
	.string	"main__do_device_id_query"
.LASF95:
	.string	"main__wait_1ms"
.LASF36:
	.string	"long_long_integer"
.LASF53:
	.string	"main__do_reporting_cycle_query"
.LASF9:
	.string	"avr__nat8_array___XUA"
.LASF6:
	.string	"avr__nat8_array___XUB"
.LASF30:
	.string	"avr__uart__Tserial_speedB"
.LASF56:
	.string	"serial"
.LASF63:
	.string	"main__T1b___XDLU_0__3"
.LASF66:
	.string	"avr__atmega328p__portd_bits"
.LASF35:
	.string	"avr__strings__astr5"
.LASF51:
	.string	"start_time"
.LASF18:
	.string	"avr__nat8_array___XUP"
.LASF96:
	.string	"main__wait_long"
.LASF61:
	.string	"avr__nat8_array___XUT"
.LASF11:
	.string	"one_wire__rom__unique_serial_code"
.LASF55:
	.string	"found"
.LASF77:
	.string	"avr__uart__crlf"
.LASF101:
	.string	"crc8"
.LASF23:
	.string	"avr__strings__avr_string___XUA"
.LASF22:
	.string	"avr__strings__avr_string___XUB"
.LASF87:
	.string	"GNU Ada 4.7.0"
.LASF99:
	.string	"avr__real_time__clock"
.LASF59:
	.string	"byte"
.LASF98:
	.string	"one_wire__rom__identifier"
.LASF86:
	.string	"one_wire__search__first"
.LASF17:
	.string	"avr__real_time__TdurationB___XF_1_1000"
.LASF92:
	.string	"OBJECT"
.LASF25:
	.string	"avr__strings__avr_string___XUP"
.LASF80:
	.string	"avr__real_time__Osubtract__2"
.LASF102:
	.string	"_ada_crc8"
.LASF75:
	.string	"avr__uart__put_raw"
.LASF41:
	.string	"i_ptr"
.LASF34:
	.string	"boolean"
.LASF49:
	.string	"main__wait_input"
	.ident	"GCC: (GNU) 4.7.0"
.global __do_copy_data
