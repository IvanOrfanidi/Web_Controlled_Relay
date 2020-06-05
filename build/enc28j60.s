	.file	"enc28j60.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.Enc28j60ReadOp,"ax",@progbits
.global	Enc28j60ReadOp
	.type	Enc28j60ReadOp, @function
Enc28j60ReadOp:
.LFB6:
	.file 1 "../src/net/enc28j60.c"
	.loc 1 17 0
	.cfi_startproc
.LVL0:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 18 0
	cbi 0x5,2
	.loc 1 20 0
	mov r25,r22
	andi r25,lo8(31)
	or r24,r25
.LVL1:
	out 0x2e,r24
.L2:
	.loc 1 21 0
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L2
	.loc 1 23 0
	out 0x2e,__zero_reg__
.L3:
	.loc 1 24 0
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L3
	.loc 1 26 0
	sbrc r22,7
	rjmp .L4
.L6:
	.loc 1 31 0
	sbi 0x5,2
	.loc 1 32 0
	in r24,0x2e
	ret
.L4:
	.loc 1 27 0
	out 0x2e,__zero_reg__
.L5:
	.loc 1 28 0
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L5
	rjmp .L6
	.cfi_endproc
.LFE6:
	.size	Enc28j60ReadOp, .-Enc28j60ReadOp
	.section	.text.Enc28j60WriteOp,"ax",@progbits
.global	Enc28j60WriteOp
	.type	Enc28j60WriteOp, @function
Enc28j60WriteOp:
.LFB7:
	.loc 1 37 0
	.cfi_startproc
.LVL2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 38 0
	cbi 0x5,2
	.loc 1 40 0
	andi r22,lo8(31)
.LVL3:
	or r24,r22
.LVL4:
	out 0x2e,r24
.L13:
	.loc 1 41 0
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L13
	.loc 1 43 0
	out 0x2e,r20
.L14:
	.loc 1 44 0
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L14
	.loc 1 45 0
	sbi 0x5,2
	ret
	.cfi_endproc
.LFE7:
	.size	Enc28j60WriteOp, .-Enc28j60WriteOp
	.section	.text.Enc28j60ReadBuffer,"ax",@progbits
.global	Enc28j60ReadBuffer
	.type	Enc28j60ReadBuffer, @function
Enc28j60ReadBuffer:
.LFB8:
	.loc 1 50 0
	.cfi_startproc
.LVL5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r22
	.loc 1 51 0
	cbi 0x5,2
	.loc 1 53 0
	ldi r18,lo8(58)
	out 0x2e,r18
.L18:
	.loc 1 54 0
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L18
	add r24,r30
	adc r25,r31
.LVL6:
.L19:
	.loc 1 55 0
	cp r30,r24
	cpc r31,r25
	breq .L24
.LVL7:
	.loc 1 58 0
	out 0x2e,__zero_reg__
.L20:
	.loc 1 59 0
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L20
	.loc 1 60 0
	in r18,0x2e
	.loc 1 60 0
	st Z+,r18
.LVL8:
	rjmp .L19
.LVL9:
.L24:
	.loc 1 63 0
	st Z,__zero_reg__
	.loc 1 64 0
	sbi 0x5,2
	ret
	.cfi_endproc
.LFE8:
	.size	Enc28j60ReadBuffer, .-Enc28j60ReadBuffer
	.section	.text.Enc28j60WriteBuffer,"ax",@progbits
.global	Enc28j60WriteBuffer
	.type	Enc28j60WriteBuffer, @function
Enc28j60WriteBuffer:
.LFB9:
	.loc 1 69 0
	.cfi_startproc
.LVL10:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 70 0
	cbi 0x5,2
	.loc 1 72 0
	ldi r18,lo8(122)
	out 0x2e,r18
.L26:
	.loc 1 73 0
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L26
	add r24,r22
	adc r25,r23
.LVL11:
.L27:
	.loc 1 74 0
	cp r22,r24
	cpc r23,r25
	breq .L32
.LVL12:
	.loc 1 77 0
	movw r30,r22
	ld r18,Z+
	movw r22,r30
.LVL13:
	out 0x2e,r18
.LVL14:
.L28:
	.loc 1 79 0
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L28
	rjmp .L27
.LVL15:
.L32:
	.loc 1 81 0
	sbi 0x5,2
	ret
	.cfi_endproc
.LFE9:
	.size	Enc28j60WriteBuffer, .-Enc28j60WriteBuffer
	.section	.text.Enc28j60SetBank,"ax",@progbits
.global	Enc28j60SetBank
	.type	Enc28j60SetBank, @function
Enc28j60SetBank:
.LFB10:
	.loc 1 86 0
	.cfi_startproc
.LVL16:
	push r17
	.cfi_def_cfa_offset 3
	.cfi_offset 17, -2
	push r28
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	mov r17,r24
	andi r17,lo8(96)
	.loc 1 88 0
	mov r28,r17
	ldi r29,0
	lds r24,Enc28j60Bank
.LVL17:
	ldi r25,0
	cp r28,r24
	cpc r29,r25
	breq .L33
	.loc 1 90 0
	ldi r20,lo8(3)
	ldi r22,lo8(31)
	ldi r24,lo8(-96)
	rcall Enc28j60WriteOp
.LVL18:
	.loc 1 92 0
	movw r20,r28
	ldi r24,5
	1:
	asr r21
	ror r20
	dec r24
	brne 1b
	ldi r22,lo8(31)
	ldi r24,lo8(-128)
	rcall Enc28j60WriteOp
.LVL19:
	.loc 1 94 0
	sts Enc28j60Bank,r17
.L33:
/* epilogue start */
	.loc 1 96 0
	pop r29
	pop r28
	pop r17
	ret
	.cfi_endproc
.LFE10:
	.size	Enc28j60SetBank, .-Enc28j60SetBank
	.section	.text.Enc28j60Read,"ax",@progbits
.global	Enc28j60Read
	.type	Enc28j60Read, @function
Enc28j60Read:
.LFB11:
	.loc 1 100 0
	.cfi_startproc
.LVL20:
	push r28
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	.loc 1 102 0
	rcall Enc28j60SetBank
.LVL21:
	.loc 1 104 0
	mov r22,r28
	ldi r24,0
/* epilogue start */
	.loc 1 105 0
	pop r28
.LVL22:
	.loc 1 104 0
	rjmp Enc28j60ReadOp
.LVL23:
	.cfi_endproc
.LFE11:
	.size	Enc28j60Read, .-Enc28j60Read
	.section	.text.Enc28j60Write,"ax",@progbits
.global	Enc28j60Write
	.type	Enc28j60Write, @function
Enc28j60Write:
.LFB12:
	.loc 1 109 0
	.cfi_startproc
.LVL24:
	push r28
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r28,r24
	mov r29,r22
	.loc 1 111 0
	rcall Enc28j60SetBank
.LVL25:
	.loc 1 113 0
	mov r20,r29
	mov r22,r28
	ldi r24,lo8(64)
/* epilogue start */
	.loc 1 114 0
	pop r29
.LVL26:
	pop r28
.LVL27:
	.loc 1 113 0
	rjmp Enc28j60WriteOp
.LVL28:
	.cfi_endproc
.LFE12:
	.size	Enc28j60Write, .-Enc28j60Write
	.section	.text.Enc28j60PhyWrite,"ax",@progbits
.global	Enc28j60PhyWrite
	.type	Enc28j60PhyWrite, @function
Enc28j60PhyWrite:
.LFB13:
	.loc 1 118 0
	.cfi_startproc
.LVL29:
	push r28
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r29,r22
	mov r28,r23
	.loc 1 120 0
	mov r22,r24
.LVL30:
	ldi r24,lo8(-44)
.LVL31:
	rcall Enc28j60Write
.LVL32:
	.loc 1 122 0
	mov r22,r29
	ldi r24,lo8(-42)
	rcall Enc28j60Write
.LVL33:
	.loc 1 123 0
	mov r22,r28
	ldi r24,lo8(-41)
	rcall Enc28j60Write
.LVL34:
.L38:
	.loc 1 125 0
	ldi r24,lo8(-22)
	rcall Enc28j60Read
.LVL35:
	sbrs r24,0
	rjmp .L40
.LVL36:
.LBB18:
.LBB19:
	.file 2 "/usr/lib/avr/include/util/delay.h"
	.loc 2 276 0
	ldi r24,lo8(74)
1:	dec r24
	brne 1b
	rjmp .L38
.LVL37:
.L40:
/* epilogue start */
.LBE19:
.LBE18:
	.loc 1 128 0
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE13:
	.size	Enc28j60PhyWrite, .-Enc28j60PhyWrite
	.section	.text.InitPhy,"ax",@progbits
.global	InitPhy
	.type	InitPhy, @function
InitPhy:
.LFB14:
	.loc 1 133 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 139 0
	ldi r22,lo8(-128)
	ldi r23,lo8(8)
	ldi r24,lo8(20)
	rcall Enc28j60PhyWrite
.LVL38:
.LBB20:
.LBB21:
	.loc 2 187 0
	ldi r18,lo8(1474559)
	ldi r24,hi8(1474559)
	ldi r25,hlo8(1474559)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
.LVL39:
.LBE21:
.LBE20:
	.loc 1 144 0
	ldi r22,lo8(-112)
	ldi r23,lo8(9)
	ldi r24,lo8(20)
	rcall Enc28j60PhyWrite
.LVL40:
.LBB22:
.LBB23:
	.loc 2 187 0
	ldi r18,lo8(1474559)
	ldi r24,hi8(1474559)
	ldi r25,hlo8(1474559)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
.LVL41:
.LBE23:
.LBE22:
	.loc 1 149 0
	ldi r22,lo8(-128)
	ldi r23,lo8(8)
	ldi r24,lo8(20)
	rcall Enc28j60PhyWrite
.LVL42:
.LBB24:
.LBB25:
	.loc 2 187 0
	ldi r18,lo8(1474559)
	ldi r24,hi8(1474559)
	ldi r25,hlo8(1474559)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
.LVL43:
.LBE25:
.LBE24:
	.loc 1 154 0
	ldi r22,lo8(-112)
	ldi r23,lo8(9)
	ldi r24,lo8(20)
	rcall Enc28j60PhyWrite
.LVL44:
.LBB26:
.LBB27:
	.loc 2 187 0
	ldi r18,lo8(1474559)
	ldi r24,hi8(1474559)
	ldi r25,hlo8(1474559)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
.LVL45:
.LBE27:
.LBE26:
	.loc 1 159 0
	ldi r22,lo8(118)
	ldi r23,lo8(4)
	ldi r24,lo8(20)
	rcall Enc28j60PhyWrite
.LVL46:
.LBB28:
.LBB29:
	.loc 2 187 0
	ldi r18,lo8(294911)
	ldi r24,hi8(294911)
	ldi r25,hlo8(294911)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
.LVL47:
	ret
.LBE29:
.LBE28:
	.cfi_endproc
.LFE14:
	.size	InitPhy, .-InitPhy
	.section	.text.Enc28j60Init,"ax",@progbits
.global	Enc28j60Init
	.type	Enc28j60Init, @function
Enc28j60Init:
.LFB15:
	.loc 1 165 0
	.cfi_startproc
.LVL48:
	push r28
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	.loc 1 168 0
	sbi 0x4,2
	.loc 1 169 0
	sbi 0x5,2
	.loc 1 171 0
	in r24,0x4
.LVL49:
	ori r24,lo8(40)
	out 0x4,r24
	.loc 1 173 0
	cbi 0x4,4
	.loc 1 175 0
	cbi 0x5,3
	.loc 1 176 0
	cbi 0x5,5
	.loc 1 180 0
	ldi r24,lo8(80)
	out 0x2c,r24
	.loc 1 181 0
	in r24,0x2d
	ori r24,lo8(1)
	out 0x2d,r24
	.loc 1 184 0
	ldi r20,lo8(-1)
	ldi r22,0
	ldi r24,lo8(-1)
	rcall Enc28j60WriteOp
.LVL50:
.LBB30:
.LBB31:
	.loc 2 187 0
	ldi r18,lo8(147455)
	ldi r24,hi8(147455)
	ldi r25,hlo8(147455)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
.LVL51:
.LBE31:
.LBE30:
	.loc 1 193 0
	sts NextPacketPtr+1,__zero_reg__
	sts NextPacketPtr,__zero_reg__
	.loc 1 195 0
	ldi r22,0
	ldi r24,lo8(8)
	rcall Enc28j60Write
.LVL52:
	.loc 1 196 0
	ldi r22,0
	ldi r24,lo8(9)
	rcall Enc28j60Write
.LVL53:
	.loc 1 198 0
	ldi r22,0
	ldi r24,lo8(12)
	rcall Enc28j60Write
.LVL54:
	.loc 1 199 0
	ldi r22,0
	ldi r24,lo8(13)
	rcall Enc28j60Write
.LVL55:
	.loc 1 201 0
	ldi r22,lo8(-2)
	ldi r24,lo8(10)
	rcall Enc28j60Write
.LVL56:
	.loc 1 202 0
	ldi r22,lo8(25)
	ldi r24,lo8(11)
	rcall Enc28j60Write
.LVL57:
	.loc 1 204 0
	ldi r22,lo8(-1)
	ldi r24,lo8(4)
	rcall Enc28j60Write
.LVL58:
	.loc 1 205 0
	ldi r22,lo8(25)
	ldi r24,lo8(5)
	rcall Enc28j60Write
.LVL59:
	.loc 1 207 0
	ldi r22,lo8(-1)
	ldi r24,lo8(6)
	rcall Enc28j60Write
.LVL60:
	.loc 1 208 0
	ldi r22,lo8(31)
	ldi r24,lo8(7)
	rcall Enc28j60Write
.LVL61:
	.loc 1 219 0
	ldi r22,lo8(-80)
	ldi r24,lo8(56)
	rcall Enc28j60Write
.LVL62:
	.loc 1 220 0
	ldi r22,lo8(63)
	ldi r24,lo8(40)
	rcall Enc28j60Write
.LVL63:
	.loc 1 221 0
	ldi r22,lo8(48)
	ldi r24,lo8(41)
	rcall Enc28j60Write
.LVL64:
	.loc 1 222 0
	ldi r22,lo8(-7)
	ldi r24,lo8(48)
	rcall Enc28j60Write
.LVL65:
	.loc 1 223 0
	ldi r22,lo8(-9)
	ldi r24,lo8(49)
	rcall Enc28j60Write
.LVL66:
	.loc 1 228 0
	ldi r22,lo8(13)
	ldi r24,lo8(-64)
	rcall Enc28j60Write
.LVL67:
	.loc 1 230 0
	ldi r22,0
	ldi r24,lo8(-63)
	rcall Enc28j60Write
.LVL68:
	.loc 1 232 0
	ldi r20,lo8(50)
	ldi r22,lo8(-62)
	ldi r24,lo8(-128)
	rcall Enc28j60WriteOp
.LVL69:
	.loc 1 236 0
	ldi r22,lo8(18)
	ldi r24,lo8(-58)
	rcall Enc28j60Write
.LVL70:
	.loc 1 237 0
	ldi r22,lo8(12)
	ldi r24,lo8(-57)
	rcall Enc28j60Write
.LVL71:
	.loc 1 239 0
	ldi r22,lo8(18)
	ldi r24,lo8(-60)
	rcall Enc28j60Write
.LVL72:
	.loc 1 242 0
	ldi r22,lo8(-36)
	ldi r24,lo8(-54)
	rcall Enc28j60Write
.LVL73:
	.loc 1 243 0
	ldi r22,lo8(5)
	ldi r24,lo8(-53)
	rcall Enc28j60Write
.LVL74:
	.loc 1 247 0
	ld r22,Y
	ldi r24,lo8(-28)
	rcall Enc28j60Write
.LVL75:
	.loc 1 248 0
	ldd r22,Y+1
	ldi r24,lo8(-27)
	rcall Enc28j60Write
.LVL76:
	.loc 1 249 0
	ldd r22,Y+2
	ldi r24,lo8(-30)
	rcall Enc28j60Write
.LVL77:
	.loc 1 250 0
	ldd r22,Y+3
	ldi r24,lo8(-29)
	rcall Enc28j60Write
.LVL78:
	.loc 1 251 0
	ldd r22,Y+4
	ldi r24,lo8(-32)
	rcall Enc28j60Write
.LVL79:
	.loc 1 252 0
	ldd r22,Y+5
	ldi r24,lo8(-31)
	rcall Enc28j60Write
.LVL80:
	.loc 1 254 0
	ldi r22,0
	ldi r23,lo8(1)
	ldi r24,lo8(16)
	rcall Enc28j60PhyWrite
.LVL81:
	.loc 1 256 0
	ldi r24,lo8(31)
	rcall Enc28j60SetBank
.LVL82:
	.loc 1 258 0
	ldi r20,lo8(-64)
	ldi r22,lo8(27)
	ldi r24,lo8(-128)
	rcall Enc28j60WriteOp
.LVL83:
	.loc 1 260 0
	ldi r20,lo8(4)
	ldi r22,lo8(31)
	ldi r24,lo8(-128)
	rcall Enc28j60WriteOp
.LVL84:
.LBB32:
.LBB33:
	.loc 2 187 0
	ldi r18,lo8(294911)
	ldi r24,hi8(294911)
	ldi r25,hlo8(294911)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
.LVL85:
/* epilogue start */
.LBE33:
.LBE32:
	.loc 1 262 0
	pop r29
	pop r28
.LVL86:
	ret
	.cfi_endproc
.LFE15:
	.size	Enc28j60Init, .-Enc28j60Init
	.section	.text.Enc28j60getrev,"ax",@progbits
.global	Enc28j60getrev
	.type	Enc28j60getrev, @function
Enc28j60getrev:
.LFB16:
	.loc 1 266 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 267 0
	ldi r24,lo8(114)
	rjmp Enc28j60Read
.LVL87:
	.cfi_endproc
.LFE16:
	.size	Enc28j60getrev, .-Enc28j60getrev
	.section	.text.Enc28j60PacketSend,"ax",@progbits
.global	Enc28j60PacketSend
	.type	Enc28j60PacketSend, @function
Enc28j60PacketSend:
.LFB17:
	.loc 1 272 0
	.cfi_startproc
.LVL88:
	push r16
	.cfi_def_cfa_offset 3
	.cfi_offset 16, -2
	push r17
	.cfi_def_cfa_offset 4
	.cfi_offset 17, -3
	push r28
	.cfi_def_cfa_offset 5
	.cfi_offset 28, -4
	push r29
	.cfi_def_cfa_offset 6
	.cfi_offset 29, -5
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	movw r16,r22
	.loc 1 274 0
	ldi r22,lo8(-1)
.LVL89:
	ldi r24,lo8(2)
.LVL90:
	rcall Enc28j60Write
.LVL91:
	.loc 1 275 0
	ldi r22,lo8(25)
	ldi r24,lo8(3)
	rcall Enc28j60Write
.LVL92:
	.loc 1 277 0
	mov r22,r28
	subi r22,lo8(-(-1))
	ldi r24,lo8(6)
	rcall Enc28j60Write
.LVL93:
	.loc 1 278 0
	movw r24,r28
	subi r24,1
	sbci r25,-26
	mov r22,r25
	ldi r24,lo8(7)
	rcall Enc28j60Write
.LVL94:
	.loc 1 280 0
	ldi r20,0
	ldi r22,0
	ldi r24,lo8(122)
	rcall Enc28j60WriteOp
.LVL95:
	.loc 1 282 0
	movw r22,r16
	movw r24,r28
	rcall Enc28j60WriteBuffer
.LVL96:
	.loc 1 284 0
	ldi r20,lo8(8)
	ldi r22,lo8(31)
	ldi r24,lo8(-128)
	rcall Enc28j60WriteOp
.LVL97:
	.loc 1 286 0
	ldi r24,lo8(28)
	rcall Enc28j60Read
.LVL98:
	sbrs r24,1
	rjmp .L44
	.loc 1 287 0
	ldi r20,lo8(8)
	ldi r22,lo8(31)
	ldi r24,lo8(-96)
/* epilogue start */
	.loc 1 289 0
	pop r29
	pop r28
.LVL99:
	pop r17
	pop r16
.LVL100:
	.loc 1 287 0
	rjmp Enc28j60WriteOp
.LVL101:
.L44:
/* epilogue start */
	.loc 1 289 0
	pop r29
	pop r28
.LVL102:
	pop r17
	pop r16
.LVL103:
	ret
	.cfi_endproc
.LFE17:
	.size	Enc28j60PacketSend, .-Enc28j60PacketSend
	.section	.text.Enc28j60PacketReceive,"ax",@progbits
.global	Enc28j60PacketReceive
	.type	Enc28j60PacketReceive, @function
Enc28j60PacketReceive:
.LFB18:
	.loc 1 298 0
	.cfi_startproc
.LVL104:
	push r9
	.cfi_def_cfa_offset 3
	.cfi_offset 9, -2
	push r10
	.cfi_def_cfa_offset 4
	.cfi_offset 10, -3
	push r11
	.cfi_def_cfa_offset 5
	.cfi_offset 11, -4
	push r12
	.cfi_def_cfa_offset 6
	.cfi_offset 12, -5
	push r13
	.cfi_def_cfa_offset 7
	.cfi_offset 13, -6
	push r14
	.cfi_def_cfa_offset 8
	.cfi_offset 14, -7
	push r15
	.cfi_def_cfa_offset 9
	.cfi_offset 15, -8
	push r16
	.cfi_def_cfa_offset 10
	.cfi_offset 16, -9
	push r17
	.cfi_def_cfa_offset 11
	.cfi_offset 17, -10
	push r28
	.cfi_def_cfa_offset 12
	.cfi_offset 28, -11
	push r29
	.cfi_def_cfa_offset 13
	.cfi_offset 29, -12
/* prologue: function */
/* frame size = 0 */
/* stack size = 11 */
.L__stack_usage = 11
	movw r12,r24
	movw r14,r22
	.loc 1 304 0
	ldi r24,lo8(57)
.LVL105:
	rcall Enc28j60Read
.LVL106:
	tst r24
	brne .+2
	rjmp .L50
	.loc 1 309 0
	lds r22,NextPacketPtr
	lds r28,NextPacketPtr+1
	ldi r24,0
	rcall Enc28j60Write
.LVL107:
	.loc 1 310 0
	mov r22,r28
	ldi r24,lo8(1)
	rcall Enc28j60Write
.LVL108:
	.loc 1 313 0
	ldi r22,0
	ldi r24,lo8(58)
	rcall Enc28j60ReadOp
.LVL109:
	mov r16,r24
	.loc 1 314 0
	ldi r22,0
	ldi r24,lo8(58)
	rcall Enc28j60ReadOp
.LVL110:
	ldi r17,0
	or r17,r24
	sts NextPacketPtr+1,r17
	sts NextPacketPtr,r16
	.loc 1 317 0
	ldi r22,0
	ldi r24,lo8(58)
	rcall Enc28j60ReadOp
.LVL111:
	mov r28,r24
.LVL112:
	.loc 1 318 0
	ldi r22,0
	ldi r24,lo8(58)
.LVL113:
	rcall Enc28j60ReadOp
.LVL114:
	mov r9,r24
.LVL115:
	.loc 1 322 0
	ldi r22,0
	ldi r24,lo8(58)
	rcall Enc28j60ReadOp
.LVL116:
	mov r10,r24
	.loc 1 323 0
	ldi r22,0
	ldi r24,lo8(58)
	rcall Enc28j60ReadOp
.LVL117:
	.loc 1 332 0
	sbrs r10,7
	rjmp .L51
	.loc 1 326 0
	movw r24,r12
	sbiw r24,1
.LVL118:
	.loc 1 318 0
	ldi r29,0
	or r29,r9
	sbiw r28,4
.LVL119:
	cp r24,r28
	cpc r25,r29
	brsh .L49
	movw r28,r24
.L49:
	.loc 1 337 0
	movw r22,r14
	movw r24,r28
	rcall Enc28j60ReadBuffer
.LVL120:
	rjmp .L48
.LVL121:
.L51:
	.loc 1 334 0
	ldi r28,0
	ldi r29,0
.LVL122:
.L48:
	.loc 1 342 0
	mov r22,r16
	ldi r24,lo8(12)
	rcall Enc28j60Write
.LVL123:
	.loc 1 343 0
	mov r22,r17
	ldi r24,lo8(13)
	rcall Enc28j60Write
.LVL124:
	.loc 1 346 0
	ldi r20,lo8(64)
	ldi r22,lo8(30)
	ldi r24,lo8(-128)
	rcall Enc28j60WriteOp
.LVL125:
	.loc 1 347 0
	movw r24,r28
	rjmp .L47
.LVL126:
.L50:
	.loc 1 305 0
	ldi r24,0
	ldi r25,0
.L47:
/* epilogue start */
	.loc 1 348 0
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
.LVL127:
	pop r13
	pop r12
.LVL128:
	pop r11
	pop r10
	pop r9
	ret
	.cfi_endproc
.LFE18:
	.size	Enc28j60PacketReceive, .-Enc28j60PacketReceive
	.local	NextPacketPtr
	.comm	NextPacketPtr,2,1
	.local	Enc28j60Bank
	.comm	Enc28j60Bank,1,1
	.text
.Letext0:
	.file 3 "/usr/lib/avr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x511
	.word	0x3
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF37
	.byte	0xc
	.long	.LASF38
	.long	.LASF39
	.long	.Ldebug_ranges0+0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x3
	.byte	0x7e
	.long	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x3
	.byte	0x80
	.long	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF6
	.byte	0x3
	.byte	0x82
	.long	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x5
	.long	.LASF13
	.byte	0x2
	.byte	0xff
	.byte	0x1
	.byte	0x3
	.long	0xba
	.uleb128 0x6
	.long	.LASF15
	.byte	0x2
	.byte	0xff
	.long	0xba
	.uleb128 0x7
	.long	.LASF10
	.byte	0x2
	.word	0x101
	.long	0xba
	.uleb128 0x7
	.long	.LASF11
	.byte	0x2
	.word	0x105
	.long	0x5e
	.uleb128 0x8
	.byte	0x1
	.long	.LASF17
	.byte	0x2
	.word	0x106
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF12
	.uleb128 0x5
	.long	.LASF14
	.byte	0x2
	.byte	0xa6
	.byte	0x1
	.byte	0x3
	.long	0xfa
	.uleb128 0x6
	.long	.LASF16
	.byte	0x2
	.byte	0xa6
	.long	0xba
	.uleb128 0x9
	.long	.LASF10
	.byte	0x2
	.byte	0xa8
	.long	0xba
	.uleb128 0x9
	.long	.LASF11
	.byte	0x2
	.byte	0xac
	.long	0x5e
	.uleb128 0xa
	.byte	0x1
	.long	.LASF17
	.byte	0x2
	.byte	0xad
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF24
	.byte	0x1
	.byte	0x10
	.byte	0x1
	.long	0x2c
	.long	.LFB6
	.long	.LFE6
	.byte	0x1
	.byte	0x9c
	.long	0x131
	.uleb128 0xc
	.string	"op"
	.byte	0x1
	.byte	0x10
	.long	0x2c
	.long	.LLST0
	.uleb128 0xd
	.long	.LASF18
	.byte	0x1
	.byte	0x10
	.long	0x2c
	.byte	0x1
	.byte	0x66
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.byte	0x24
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.byte	0x1
	.byte	0x9c
	.long	0x173
	.uleb128 0xc
	.string	"op"
	.byte	0x1
	.byte	0x24
	.long	0x2c
	.long	.LLST1
	.uleb128 0xf
	.long	.LASF18
	.byte	0x1
	.byte	0x24
	.long	0x2c
	.long	.LLST2
	.uleb128 0xd
	.long	.LASF19
	.byte	0x1
	.byte	0x24
	.long	0x2c
	.byte	0x1
	.byte	0x64
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.byte	0x31
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.byte	0x1
	.byte	0x9c
	.long	0x1a9
	.uleb128 0xc
	.string	"len"
	.byte	0x1
	.byte	0x31
	.long	0x45
	.long	.LLST3
	.uleb128 0xf
	.long	.LASF19
	.byte	0x1
	.byte	0x31
	.long	0x1a9
	.long	.LLST4
	.byte	0
	.uleb128 0x10
	.byte	0x2
	.long	0x2c
	.uleb128 0xe
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.byte	0x44
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.byte	0x1
	.byte	0x9c
	.long	0x1e5
	.uleb128 0xc
	.string	"len"
	.byte	0x1
	.byte	0x44
	.long	0x45
	.long	.LLST5
	.uleb128 0xf
	.long	.LASF19
	.byte	0x1
	.byte	0x44
	.long	0x1a9
	.long	.LLST6
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF23
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.byte	0x1
	.byte	0x9c
	.long	0x20c
	.uleb128 0xf
	.long	.LASF18
	.byte	0x1
	.byte	0x55
	.long	0x2c
	.long	.LLST7
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF25
	.byte	0x1
	.byte	0x63
	.byte	0x1
	.long	0x2c
	.long	.LFB11
	.long	.LFE11
	.byte	0x1
	.byte	0x9c
	.long	0x237
	.uleb128 0xf
	.long	.LASF18
	.byte	0x1
	.byte	0x63
	.long	0x2c
	.long	.LLST8
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF26
	.byte	0x1
	.byte	0x6c
	.byte	0x1
	.long	.LFB12
	.long	.LFE12
	.byte	0x1
	.byte	0x9c
	.long	0x26d
	.uleb128 0xf
	.long	.LASF18
	.byte	0x1
	.byte	0x6c
	.long	0x2c
	.long	.LLST9
	.uleb128 0xf
	.long	.LASF19
	.byte	0x1
	.byte	0x6c
	.long	0x2c
	.long	.LLST10
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF27
	.byte	0x1
	.byte	0x75
	.byte	0x1
	.long	.LFB13
	.long	.LFE13
	.byte	0x1
	.byte	0x9c
	.long	0x2cc
	.uleb128 0xf
	.long	.LASF18
	.byte	0x1
	.byte	0x75
	.long	0x2c
	.long	.LLST11
	.uleb128 0xf
	.long	.LASF19
	.byte	0x1
	.byte	0x75
	.long	0x45
	.long	.LLST12
	.uleb128 0x11
	.long	0x7e
	.long	.LBB18
	.long	.LBE18
	.byte	0x1
	.byte	0x7e
	.uleb128 0x12
	.long	0x8b
	.uleb128 0x13
	.long	.LBB19
	.long	.LBE19
	.uleb128 0x14
	.long	0x96
	.uleb128 0x14
	.long	0xa2
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF40
	.byte	0x1
	.byte	0x84
	.long	.LFB14
	.long	.LFE14
	.byte	0x1
	.byte	0x9c
	.long	0x3c0
	.uleb128 0x16
	.long	0xc1
	.long	.LBB20
	.long	.LBE20
	.byte	0x1
	.byte	0x8c
	.long	0x30f
	.uleb128 0x12
	.long	0xce
	.uleb128 0x13
	.long	.LBB21
	.long	.LBE21
	.uleb128 0x14
	.long	0xd9
	.uleb128 0x14
	.long	0xe4
	.byte	0
	.byte	0
	.uleb128 0x16
	.long	0xc1
	.long	.LBB22
	.long	.LBE22
	.byte	0x1
	.byte	0x91
	.long	0x33c
	.uleb128 0x12
	.long	0xce
	.uleb128 0x13
	.long	.LBB23
	.long	.LBE23
	.uleb128 0x14
	.long	0xd9
	.uleb128 0x14
	.long	0xe4
	.byte	0
	.byte	0
	.uleb128 0x16
	.long	0xc1
	.long	.LBB24
	.long	.LBE24
	.byte	0x1
	.byte	0x96
	.long	0x369
	.uleb128 0x12
	.long	0xce
	.uleb128 0x13
	.long	.LBB25
	.long	.LBE25
	.uleb128 0x14
	.long	0xd9
	.uleb128 0x14
	.long	0xe4
	.byte	0
	.byte	0
	.uleb128 0x16
	.long	0xc1
	.long	.LBB26
	.long	.LBE26
	.byte	0x1
	.byte	0x9b
	.long	0x396
	.uleb128 0x12
	.long	0xce
	.uleb128 0x13
	.long	.LBB27
	.long	.LBE27
	.uleb128 0x14
	.long	0xd9
	.uleb128 0x14
	.long	0xe4
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	0xc1
	.long	.LBB28
	.long	.LBE28
	.byte	0x1
	.byte	0xa0
	.uleb128 0x12
	.long	0xce
	.uleb128 0x13
	.long	.LBB29
	.long	.LBE29
	.uleb128 0x14
	.long	0xd9
	.uleb128 0x14
	.long	0xe4
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF28
	.byte	0x1
	.byte	0xa4
	.byte	0x1
	.long	.LFB15
	.long	.LFE15
	.byte	0x1
	.byte	0x9c
	.long	0x43e
	.uleb128 0xf
	.long	.LASF29
	.byte	0x1
	.byte	0xa4
	.long	0x43e
	.long	.LLST13
	.uleb128 0x16
	.long	0xc1
	.long	.LBB30
	.long	.LBE30
	.byte	0x1
	.byte	0xb9
	.long	0x413
	.uleb128 0x12
	.long	0xce
	.uleb128 0x13
	.long	.LBB31
	.long	.LBE31
	.uleb128 0x14
	.long	0xd9
	.uleb128 0x14
	.long	0xe4
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	0xc1
	.long	.LBB32
	.long	.LBE32
	.byte	0x1
	.word	0x105
	.uleb128 0x12
	.long	0xce
	.uleb128 0x13
	.long	.LBB33
	.long	.LBE33
	.uleb128 0x14
	.long	0xd9
	.uleb128 0x14
	.long	0xe4
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.byte	0x2
	.long	0x444
	.uleb128 0x18
	.long	0x2c
	.uleb128 0x19
	.byte	0x1
	.long	.LASF41
	.byte	0x1
	.word	0x109
	.long	0x2c
	.long	.LFB16
	.long	.LFE16
	.byte	0x1
	.byte	0x9c
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.word	0x10f
	.byte	0x1
	.long	.LFB17
	.long	.LFE17
	.byte	0x1
	.byte	0x9c
	.long	0x499
	.uleb128 0x1b
	.string	"len"
	.byte	0x1
	.word	0x10f
	.long	0x45
	.long	.LLST14
	.uleb128 0x1c
	.long	.LASF31
	.byte	0x1
	.word	0x10f
	.long	0x1a9
	.long	.LLST15
	.byte	0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF32
	.byte	0x1
	.word	0x129
	.byte	0x1
	.long	0x45
	.long	.LFB18
	.long	.LFE18
	.byte	0x1
	.byte	0x9c
	.long	0x4f2
	.uleb128 0x1c
	.long	.LASF33
	.byte	0x1
	.word	0x129
	.long	0x45
	.long	.LLST16
	.uleb128 0x1c
	.long	.LASF31
	.byte	0x1
	.word	0x129
	.long	0x1a9
	.long	.LLST17
	.uleb128 0x7
	.long	.LASF34
	.byte	0x1
	.word	0x12b
	.long	0x45
	.uleb128 0x1e
	.string	"len"
	.byte	0x1
	.word	0x12c
	.long	0x45
	.long	.LLST18
	.byte	0
	.uleb128 0x1f
	.long	.LASF35
	.byte	0x1
	.byte	0x5
	.long	0x2c
	.byte	0x5
	.byte	0x3
	.long	Enc28j60Bank
	.uleb128 0x1f
	.long	.LASF36
	.byte	0x1
	.byte	0x6
	.long	0x45
	.byte	0x5
	.byte	0x3
	.long	NextPacketPtr
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
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
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
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
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
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
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
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x1d
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
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL0
	.long	.LVL1
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST1:
	.long	.LVL2
	.long	.LVL4
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST2:
	.long	.LVL2
	.long	.LVL3
	.word	0x1
	.byte	0x66
	.long	0
	.long	0
.LLST3:
	.long	.LVL5
	.long	.LVL6
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST4:
	.long	.LVL5
	.long	.LVL6
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL6
	.long	.LFE8
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST5:
	.long	.LVL10
	.long	.LVL11
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST6:
	.long	.LVL10
	.long	.LVL13
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL14
	.long	.LFE9
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST7:
	.long	.LVL16
	.long	.LVL17
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST8:
	.long	.LVL20
	.long	.LVL21-1
	.word	0x1
	.byte	0x68
	.long	.LVL21-1
	.long	.LVL22
	.word	0x1
	.byte	0x6c
	.long	.LVL22
	.long	.LVL23-1
	.word	0x1
	.byte	0x66
	.long	0
	.long	0
.LLST9:
	.long	.LVL24
	.long	.LVL25-1
	.word	0x1
	.byte	0x68
	.long	.LVL25-1
	.long	.LVL27
	.word	0x1
	.byte	0x6c
	.long	.LVL27
	.long	.LVL28-1
	.word	0x1
	.byte	0x66
	.long	0
	.long	0
.LLST10:
	.long	.LVL24
	.long	.LVL25-1
	.word	0x1
	.byte	0x66
	.long	.LVL25-1
	.long	.LVL26
	.word	0x1
	.byte	0x6d
	.long	.LVL26
	.long	.LVL28-1
	.word	0x1
	.byte	0x64
	.long	0
	.long	0
.LLST11:
	.long	.LVL29
	.long	.LVL31
	.word	0x1
	.byte	0x68
	.long	.LVL31
	.long	.LVL32-1
	.word	0x1
	.byte	0x66
	.long	0
	.long	0
.LLST12:
	.long	.LVL29
	.long	.LVL30
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST13:
	.long	.LVL48
	.long	.LVL49
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL49
	.long	.LVL86
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST14:
	.long	.LVL88
	.long	.LVL90
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL90
	.long	.LVL99
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL101
	.long	.LVL102
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST15:
	.long	.LVL88
	.long	.LVL89
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL89
	.long	.LVL100
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL101
	.long	.LVL103
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST16:
	.long	.LVL104
	.long	.LVL105
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL105
	.long	.LVL128
	.word	0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST17:
	.long	.LVL104
	.long	.LVL106-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL106-1
	.long	.LVL127
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST18:
	.long	.LVL122
	.long	.LVL126
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x7c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
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
	.long	.LFB17
	.long	.LFE17-.LFB17
	.long	.LFB18
	.long	.LFE18-.LFB18
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
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
	.long	.LFB17
	.long	.LFE17
	.long	.LFB18
	.long	.LFE18
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF28:
	.string	"Enc28j60Init"
.LASF22:
	.string	"Enc28j60WriteBuffer"
.LASF37:
	.string	"GNU C99 5.4.0 -mn-flash=1 -mno-skip-bug -mmcu=avr4 -g -gdwarf-3 -gstrict-dwarf -Os -pedantic-errors -std=gnu99 -fpack-struct -fshort-enums -funsigned-char -funsigned-bitfields -ffunction-sections"
.LASF34:
	.string	"rxstat"
.LASF26:
	.string	"Enc28j60Write"
.LASF15:
	.string	"__us"
.LASF32:
	.string	"Enc28j60PacketReceive"
.LASF17:
	.string	"__builtin_avr_delay_cycles"
.LASF40:
	.string	"InitPhy"
.LASF19:
	.string	"data"
.LASF1:
	.string	"unsigned char"
.LASF33:
	.string	"maxlen"
.LASF18:
	.string	"address"
.LASF7:
	.string	"long unsigned int"
.LASF14:
	.string	"_delay_ms"
.LASF39:
	.string	"/home/orfanidi/AVR/Web_Controlled_Relay/build"
.LASF36:
	.string	"NextPacketPtr"
.LASF20:
	.string	"Enc28j60WriteOp"
.LASF38:
	.string	"../src/net/enc28j60.c"
.LASF12:
	.string	"double"
.LASF21:
	.string	"Enc28j60ReadBuffer"
.LASF10:
	.string	"__tmp"
.LASF30:
	.string	"Enc28j60PacketSend"
.LASF31:
	.string	"packet"
.LASF25:
	.string	"Enc28j60Read"
.LASF29:
	.string	"macaddr"
.LASF4:
	.string	"unsigned int"
.LASF13:
	.string	"_delay_us"
.LASF9:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF24:
	.string	"Enc28j60ReadOp"
.LASF35:
	.string	"Enc28j60Bank"
.LASF8:
	.string	"long long int"
.LASF11:
	.string	"__ticks_dc"
.LASF3:
	.string	"uint16_t"
.LASF41:
	.string	"Enc28j60getrev"
.LASF6:
	.string	"uint32_t"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF23:
	.string	"Enc28j60SetBank"
.LASF16:
	.string	"__ms"
.LASF27:
	.string	"Enc28j60PhyWrite"
	.ident	"GCC: (GNU) 5.4.0"
.global __do_clear_bss
