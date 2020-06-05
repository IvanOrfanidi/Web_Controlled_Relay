	.file	"ip_arp_udp_tcp.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.Checksum,"ax",@progbits
.global	Checksum
	.type	Checksum, @function
Checksum:
.LFB1:
	.file 1 "../src/net/ip_arp_udp_tcp.c"
	.loc 1 40 0
	.cfi_startproc
.LVL0:
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
	movw r30,r24
	movw r18,r22
.LVL1:
	.loc 1 46 0
	cpi r20,lo8(1)
	brne .L2
.LVL2:
	.loc 1 50 0
	movw r20,r22
.LVL3:
	subi r20,8
	sbc r21,__zero_reg__
	ldi r22,0
	ldi r23,0
.LVL4:
	subi r20,-17
	sbci r21,-1
	sbci r22,-1
	sbci r23,-1
.LVL5:
	rjmp .L3
.LVL6:
.L2:
	.loc 1 52 0
	cpi r20,lo8(2)
	brne .L9
.LVL7:
	.loc 1 56 0
	movw r20,r22
.LVL8:
	subi r20,8
	sbc r21,__zero_reg__
	ldi r22,0
	ldi r23,0
	subi r20,-6
	sbci r21,-1
	sbci r22,-1
	sbci r23,-1
.LVL9:
	rjmp .L3
.LVL10:
.L9:
	.loc 1 44 0
	ldi r20,0
	ldi r21,0
	movw r22,r20
.LVL11:
.L3:
	movw r24,r18
.LVL12:
	movw r28,r30
.LVL13:
.L4:
	.loc 1 59 0
	cpi r24,2
	cpc r25,__zero_reg__
	brlo .L14
	.loc 1 60 0
	ld r26,Y+
	ld r27,Y+
.LVL14:
	eor r27,r26
	eor r26,r27
	eor r27,r26
	add r20,r26
	adc r21,r27
	adc r22,__zero_reg__
	adc r23,__zero_reg__
.LVL15:
	.loc 1 62 0
	sbiw r24,2
.LVL16:
	rjmp .L4
.L14:
	movw r24,r18
.LVL17:
	andi r24,254
	add r30,r24
	adc r31,r25
	.loc 1 65 0
	cp r18,r24
	cpc r19,r25
	breq .L7
	.loc 1 66 0
	ld r24,Z
	ldi r25,0
	mov r25,r24
	clr r24
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
	add r20,r24
	adc r21,r25
	adc r22,r26
	adc r23,r27
.LVL18:
.L7:
	.loc 1 70 0
	movw r16,r22
	clr r18
	clr r19
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	cpc r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L15
	.loc 1 71 0
	clr r22
	clr r23
.LVL19:
	add r20,r16
	adc r21,r17
	adc r22,r18
	adc r23,r19
.LVL20:
	rjmp .L7
.L15:
	.loc 1 74 0
	movw r24,r20
	com r24
	com r25
/* epilogue start */
	.loc 1 75 0
	pop r29
	pop r28
.LVL21:
	pop r17
	pop r16
	ret
	.cfi_endproc
.LFE1:
	.size	Checksum, .-Checksum
	.section	.text.Init_ip_arp_udp_tcp,"ax",@progbits
.global	Init_ip_arp_udp_tcp
	.type	Init_ip_arp_udp_tcp, @function
Init_ip_arp_udp_tcp:
.LFB2:
	.loc 1 82 0
	.cfi_startproc
.LVL22:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 85 0
	sts wwwport+1,r21
	sts wwwport,r20
	movw r30,r22
	ldi r26,lo8(ipaddr)
	ldi r27,hi8(ipaddr)
.LVL23:
.L17:
	.loc 1 87 0
	ld r18,Z+
.LVL24:
	st X+,r18
.LVL25:
	.loc 1 86 0
	ldi r18,hi8(ipaddr+4)
	cpi r26,lo8(ipaddr+4)
	cpc r27,r18
	brne .L17
	movw r30,r24
.LVL26:
	ldi r26,lo8(macaddr)
	ldi r27,hi8(macaddr)
.LVL27:
.L18:
	.loc 1 92 0
	ld r24,Z+
.LVL28:
	st X+,r24
.LVL29:
	.loc 1 91 0
	ldi r24,hi8(macaddr+6)
	cpi r26,lo8(macaddr+6)
	cpc r27,r24
	brne .L18
/* epilogue start */
	.loc 1 95 0
	ret
	.cfi_endproc
.LFE2:
	.size	Init_ip_arp_udp_tcp, .-Init_ip_arp_udp_tcp
	.section	.text.Eth_type_is_arp_and_my_ip,"ax",@progbits
.global	Eth_type_is_arp_and_my_ip
	.type	Eth_type_is_arp_and_my_ip, @function
Eth_type_is_arp_and_my_ip:
.LFB3:
	.loc 1 99 0
	.cfi_startproc
.LVL30:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 102 0
	cpi r22,41
	cpc r23,__zero_reg__
	brlo .L27
	.loc 1 105 0
	movw r30,r24
	ldd r18,Z+12
	cpi r18,lo8(8)
	brne .L27
	.loc 1 105 0 is_stmt 0
	ldd r18,Z+13
	cpi r18,lo8(6)
	brne .L27
	adiw r30,38
	ldi r26,lo8(ipaddr)
	ldi r27,hi8(ipaddr)
	adiw r24,42
.LVL31:
.L23:
	.loc 1 110 0 is_stmt 1
	ld r19,Z+
.LVL32:
	ld r18,X+
	cpse r19,r18
	rjmp .L27
.LVL33:
	.loc 1 109 0
	cp r30,r24
	cpc r31,r25
	brne .L23
	.loc 1 115 0
	ldi r24,lo8(1)
.LVL34:
	ret
.LVL35:
.L27:
	.loc 1 103 0
	ldi r24,0
	.loc 1 116 0
	ret
	.cfi_endproc
.LFE3:
	.size	Eth_type_is_arp_and_my_ip, .-Eth_type_is_arp_and_my_ip
	.section	.text.Eth_type_is_ip_and_my_ip,"ax",@progbits
.global	Eth_type_is_ip_and_my_ip
	.type	Eth_type_is_ip_and_my_ip, @function
Eth_type_is_ip_and_my_ip:
.LFB4:
	.loc 1 120 0
	.cfi_startproc
.LVL36:
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
	movw r30,r24
.LVL37:
	.loc 1 124 0
	cpi r22,42
	cpc r23,__zero_reg__
	brlo .L34
	.loc 1 127 0
	ldd r24,Z+12
.LVL38:
	cpi r24,lo8(8)
	brne .L34
	.loc 1 128 0
	ldd r24,Z+13
	.loc 1 127 0
	cpse r24,__zero_reg__
	rjmp .L34
	.loc 1 131 0
	ldd r25,Z+14
	cpi r25,lo8(69)
	brne .L30
	movw r26,r30
	adiw r26,30
	ldi r28,lo8(ipaddr)
	ldi r29,hi8(ipaddr)
	adiw r30,34
.LVL39:
.L31:
	.loc 1 136 0
	ld r18,X+
.LVL40:
	ld r25,Y+
	cpse r18,r25
	rjmp .L30
.LVL41:
	.loc 1 135 0
	cp r26,r30
	cpc r27,r31
	brne .L31
	.loc 1 141 0
	ldi r24,lo8(1)
	rjmp .L30
.LVL42:
.L34:
	.loc 1 125 0
	ldi r24,0
.LVL43:
.L30:
/* epilogue start */
	.loc 1 142 0
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE4:
	.size	Eth_type_is_ip_and_my_ip, .-Eth_type_is_ip_and_my_ip
	.section	.text.Make_eth,"ax",@progbits
.global	Make_eth
	.type	Make_eth, @function
Make_eth:
.LFB5:
	.loc 1 147 0
	.cfi_startproc
.LVL44:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
.LVL45:
	ldi r26,lo8(macaddr)
	ldi r27,hi8(macaddr)
	adiw r24,6
.LVL46:
.L37:
	.loc 1 152 0
	ldd r18,Z+6
	st Z+,r18
.LVL47:
	.loc 1 153 0
	ld r18,X+
	std Z+5,r18
.LVL48:
	.loc 1 151 0
	cp r30,r24
	cpc r31,r25
	brne .L37
/* epilogue start */
	.loc 1 156 0
	ret
	.cfi_endproc
.LFE5:
	.size	Make_eth, .-Make_eth
	.section	.text.Make_eth_ip_new,"ax",@progbits
.global	Make_eth_ip_new
	.type	Make_eth_ip_new, @function
Make_eth_ip_new:
.LFB6:
	.loc 1 161 0
	.cfi_startproc
.LVL49:
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
.LVL50:
	movw r30,r24
	ldi r26,lo8(macaddr)
	ldi r27,hi8(macaddr)
	movw r18,r24
	subi r18,-6
	sbci r19,-1
.LVL51:
.L40:
	.loc 1 166 0
	movw r28,r22
	ld r20,Y+
	movw r22,r28
.LVL52:
	st Z+,r20
	.loc 1 167 0
	ld r20,X+
	std Z+5,r20
.LVL53:
	.loc 1 165 0
	cp r30,r18
	cpc r31,r19
	brne .L40
	.loc 1 171 0
	ldi r18,lo8(8)
	movw r30,r24
	std Z+12,r18
	.loc 1 172 0
	std Z+13,__zero_reg__
/* epilogue start */
	.loc 1 173 0
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE6:
	.size	Make_eth_ip_new, .-Make_eth_ip_new
	.section	.text.Fill_ip_hdr_checksum,"ax",@progbits
.global	Fill_ip_hdr_checksum
	.type	Fill_ip_hdr_checksum, @function
Fill_ip_hdr_checksum:
.LFB7:
	.loc 1 177 0
	.cfi_startproc
.LVL54:
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
	.loc 1 181 0
	std Y+24,__zero_reg__
	.loc 1 182 0
	std Y+25,__zero_reg__
	.loc 1 183 0
	ldi r24,lo8(64)
.LVL55:
	std Y+20,r24
	.loc 1 184 0
	std Y+21,__zero_reg__
	.loc 1 185 0
	std Y+22,r24
	.loc 1 187 0
	ldi r20,0
	ldi r22,lo8(20)
	ldi r23,0
	movw r24,r28
	adiw r24,14
	rcall Checksum
.LVL56:
	.loc 1 188 0
	std Y+24,r25
	.loc 1 189 0
	std Y+25,r24
/* epilogue start */
	.loc 1 190 0
	pop r29
	pop r28
.LVL57:
	ret
	.cfi_endproc
.LFE7:
	.size	Fill_ip_hdr_checksum, .-Fill_ip_hdr_checksum
	.section	.text.Make_ip_tcp_new,"ax",@progbits
.global	Make_ip_tcp_new
	.type	Make_ip_tcp_new, @function
Make_ip_tcp_new:
.LFB8:
	.loc 1 196 0
	.cfi_startproc
.LVL58:
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
	movw r30,r24
.LVL59:
	.loc 1 200 0
	ldi r24,lo8(69)
.LVL60:
	std Z+14,r24
	.loc 1 203 0
	std Z+15,__zero_reg__
	.loc 1 206 0
	std Z+16,r23
	.loc 1 207 0
	std Z+17,r22
	.loc 1 210 0
	lds r24,ip_identifier
	lds r25,ip_identifier+1
	std Z+18,r25
	.loc 1 211 0
	std Z+19,r24
	.loc 1 212 0
	adiw r24,1
	sts ip_identifier+1,r25
	sts ip_identifier,r24
	.loc 1 215 0
	std Z+20,__zero_reg__
	.loc 1 216 0
	std Z+21,__zero_reg__
	.loc 1 219 0
	ldi r24,lo8(-128)
	std Z+22,r24
	.loc 1 222 0
	ldi r24,lo8(6)
	std Z+23,r24
	movw r22,r20
.LVL61:
	ldi r28,lo8(ipaddr)
	ldi r29,hi8(ipaddr)
	movw r24,r30
	adiw r24,26
.LVL62:
.L44:
	.loc 1 226 0
	movw r26,r22
	ld r18,X+
	movw r22,r26
.LVL63:
	movw r26,r24
	adiw r26,4
	st X,r18
	sbiw r26,4
	.loc 1 227 0
	ld r18,Y+
	st X+,r18
	movw r24,r26
.LVL64:
	.loc 1 225 0
	ldi r27,hi8(ipaddr+4)
	cpi r28,lo8(ipaddr+4)
	cpc r29,r27
	brne .L44
	.loc 1 230 0
	movw r24,r30
/* epilogue start */
	.loc 1 231 0
	pop r29
	pop r28
	.loc 1 230 0
	rjmp Fill_ip_hdr_checksum
.LVL65:
	.cfi_endproc
.LFE8:
	.size	Make_ip_tcp_new, .-Make_ip_tcp_new
	.section	.text.Make_ip,"ax",@progbits
.global	Make_ip
	.type	Make_ip, @function
Make_ip:
.LFB9:
	.loc 1 236 0
	.cfi_startproc
.LVL66:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r26,lo8(ipaddr)
	ldi r27,hi8(ipaddr)
	movw r30,r24
	adiw r30,26
	movw r18,r24
	subi r18,-30
	sbci r19,-1
.LVL67:
.L47:
	.loc 1 240 0
	ld r20,Z
	std Z+4,r20
	.loc 1 241 0
	ld r20,X+
	st Z+,r20
.LVL68:
	.loc 1 239 0
	cp r30,r18
	cpc r31,r19
	brne .L47
	.loc 1 244 0
	rjmp Fill_ip_hdr_checksum
.LVL69:
	.cfi_endproc
.LFE9:
	.size	Make_ip, .-Make_ip
	.section	.text.Make_tcphead,"ax",@progbits
.global	Make_tcphead
	.type	Make_tcphead, @function
Make_tcphead:
.LFB10:
	.loc 1 260 0
	.cfi_startproc
.LVL70:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
.LVL71:
	.loc 1 265 0
	ldd r24,Z+34
.LVL72:
	std Z+36,r24
.LVL73:
	ldd r24,Z+35
	std Z+37,r24
.LVL74:
	.loc 1 271 0
	lds r24,wwwport
	lds r25,wwwport+1
	std Z+34,r25
	.loc 1 272 0
	std Z+35,r24
.LVL75:
	movw r26,r30
	adiw r26,42
	movw r24,r30
	adiw r24,38
.LVL76:
.L52:
	.loc 1 278 0
	ld r19,-X
.LVL77:
	add r22,r19
	adc r23,__zero_reg__
.LVL78:
	.loc 1 279 0
	adiw r26,4
	ld r19,X
	sbiw r26,4
.LVL79:
	.loc 1 280 0
	adiw r26,4
	st X,r22
	sbiw r26,4
	.loc 1 281 0
	tst r18
	breq .L50
	.loc 1 283 0
	st X,r19
	rjmp .L51
.L50:
	.loc 1 285 0
	st X,__zero_reg__
.L51:
	.loc 1 287 0
	mov r22,r23
	clr r23
.LVL80:
	.loc 1 277 0
	cp r24,r26
	cpc r25,r27
	brne .L52
	.loc 1 290 0
	cpse r18,__zero_reg__
	rjmp .L53
	.loc 1 292 0
	std Z+38,__zero_reg__
	.loc 1 293 0
	std Z+39,__zero_reg__
	.loc 1 296 0
	lds r24,seqnum
	std Z+40,r24
	.loc 1 297 0
	std Z+41,__zero_reg__
	.loc 1 300 0
	subi r24,lo8(-(2))
	sts seqnum,r24
.L53:
	.loc 1 303 0
	std Z+50,__zero_reg__
	.loc 1 304 0
	std Z+51,__zero_reg__
	.loc 1 310 0
	tst r20
	breq .L54
	.loc 1 313 0
	ldi r24,lo8(2)
	std Z+54,r24
	.loc 1 314 0
	ldi r24,lo8(4)
	std Z+55,r24
	.loc 1 315 0
	ldi r24,lo8(5)
	std Z+56,r24
	.loc 1 316 0
	ldi r24,lo8(-128)
	std Z+57,r24
	.loc 1 318 0
	ldi r24,lo8(96)
	rjmp .L57
.L54:
	.loc 1 322 0
	ldi r24,lo8(80)
.L57:
	std Z+46,r24
	ret
	.cfi_endproc
.LFE10:
	.size	Make_tcphead, .-Make_tcphead
	.section	.text.Make_arp_answer_from_request,"ax",@progbits
.global	Make_arp_answer_from_request
	.type	Make_arp_answer_from_request, @function
Make_arp_answer_from_request:
.LFB11:
	.loc 1 328 0
	.cfi_startproc
.LVL81:
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
.LVL82:
	.loc 1 331 0
	rcall Make_eth
.LVL83:
	.loc 1 332 0
	std Y+20,__zero_reg__
	.loc 1 333 0
	ldi r24,lo8(2)
	std Y+21,r24
	ldi r24,lo8(macaddr)
	ldi r25,hi8(macaddr)
	movw r20,r28
	subi r20,-22
	sbci r21,-1
	movw r30,r28
	adiw r30,28
.LVL84:
.L59:
	.loc 1 336 0
	movw r26,r20
	ld r18,X
	adiw r26,10
	st X,r18
	.loc 1 337 0
	movw r26,r24
	ld r18,X+
	movw r24,r26
	movw r26,r20
	st X+,r18
	movw r20,r26
.LVL85:
	.loc 1 335 0
	cp r26,r30
	cpc r27,r31
	brne .L59
	ldi r26,lo8(ipaddr)
	ldi r27,hi8(ipaddr)
	movw r24,r28
	adiw r24,32
.LVL86:
.L60:
	.loc 1 342 0
	ld r18,Z
	std Z+10,r18
	.loc 1 343 0
	ld r18,X+
	st Z+,r18
.LVL87:
	.loc 1 341 0
	cp r30,r24
	cpc r31,r25
	brne .L60
	.loc 1 347 0
	movw r22,r28
	ldi r24,lo8(42)
	ldi r25,0
/* epilogue start */
	.loc 1 348 0
	pop r29
	pop r28
.LVL88:
	.loc 1 347 0
	rjmp Enc28j60PacketSend
.LVL89:
	.cfi_endproc
.LFE11:
	.size	Make_arp_answer_from_request, .-Make_arp_answer_from_request
	.section	.text.Make_echo_reply_from_request,"ax",@progbits
.global	Make_echo_reply_from_request
	.type	Make_echo_reply_from_request, @function
Make_echo_reply_from_request:
.LFB12:
	.loc 1 352 0
	.cfi_startproc
.LVL90:
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
	.loc 1 353 0
	rcall Make_eth
.LVL91:
	.loc 1 354 0
	movw r24,r28
	rcall Make_ip
.LVL92:
	.loc 1 355 0
	std Y+34,__zero_reg__
	.loc 1 358 0
	ldd r24,Y+36
	cpi r24,lo8(-8)
	brlo .L64
	.loc 1 359 0
	ldd r25,Y+37
	subi r25,lo8(-(1))
	std Y+37,r25
.L64:
	.loc 1 361 0
	subi r24,lo8(-(8))
	std Y+36,r24
	.loc 1 363 0
	movw r22,r28
	movw r24,r16
/* epilogue start */
	.loc 1 364 0
	pop r29
	pop r28
.LVL93:
	pop r17
	pop r16
.LVL94:
	.loc 1 363 0
	rjmp Enc28j60PacketSend
.LVL95:
	.cfi_endproc
.LFE12:
	.size	Make_echo_reply_from_request, .-Make_echo_reply_from_request
	.section	.text.Make_udp_reply_from_request,"ax",@progbits
.global	Make_udp_reply_from_request
	.type	Make_udp_reply_from_request, @function
Make_udp_reply_from_request:
.LFB13:
	.loc 1 372 0
	.cfi_startproc
.LVL96:
	push r13
	.cfi_def_cfa_offset 3
	.cfi_offset 13, -2
	push r14
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -3
	push r15
	.cfi_def_cfa_offset 5
	.cfi_offset 15, -4
	push r16
	.cfi_def_cfa_offset 6
	.cfi_offset 16, -5
	push r17
	.cfi_def_cfa_offset 7
	.cfi_offset 17, -6
	push r28
	.cfi_def_cfa_offset 8
	.cfi_offset 28, -7
	push r29
	.cfi_def_cfa_offset 9
	.cfi_offset 29, -8
/* prologue: function */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	movw r28,r24
	mov r17,r22
	mov r15,r23
	mov r16,r20
	mov r14,r18
	mov r13,r19
.LVL97:
	.loc 1 376 0
	rcall Make_eth
.LVL98:
	cpi r16,lo8(-35)
	brlo .L66
	ldi r16,lo8(-36)
.LVL99:
.L66:
	.loc 1 381 0
	std Y+16,__zero_reg__
	.loc 1 382 0
	ldi r24,lo8(28)
	add r24,r16
	std Y+17,r24
	.loc 1 383 0
	movw r24,r28
	rcall Make_ip
.LVL100:
	.loc 1 385 0
	ldd r24,Y+34
	std Y+36,r24
	.loc 1 386 0
	ldd r24,Y+35
	std Y+37,r24
	.loc 1 388 0
	std Y+34,r13
	.loc 1 389 0
	std Y+35,r14
	.loc 1 393 0
	std Y+38,__zero_reg__
	.loc 1 394 0
	ldi r24,lo8(8)
	add r24,r16
	std Y+39,r24
	.loc 1 396 0
	std Y+40,__zero_reg__
	.loc 1 397 0
	std Y+41,__zero_reg__
	mov r25,r17
	movw r26,r28
	adiw r26,42
	.loc 1 399 0
	mov r30,r17
	mov r31,r15
.LVL101:
.L67:
	mov r24,r30
	sub r24,r25
	cp r24,r16
	brsh .L69
	.loc 1 400 0
	ld r24,Z+
.LVL102:
	st X+,r24
.LVL103:
	rjmp .L67
.L69:
	.loc 1 403 0
	ldi r17,0
	movw r22,r16
	subi r22,-16
	sbci r23,-1
	ldi r20,lo8(1)
	movw r24,r28
	adiw r24,26
	rcall Checksum
.LVL104:
	.loc 1 404 0
	std Y+40,r25
	.loc 1 405 0
	std Y+41,r24
	.loc 1 406 0
	movw r22,r28
	movw r24,r16
.LVL105:
	adiw r24,42
/* epilogue start */
	.loc 1 408 0
	pop r29
	pop r28
.LVL106:
	pop r17
	pop r16
.LVL107:
	pop r15
	pop r14
	pop r13
	.loc 1 406 0
	rjmp Enc28j60PacketSend
.LVL108:
	.cfi_endproc
.LFE13:
	.size	Make_udp_reply_from_request, .-Make_udp_reply_from_request
	.section	.text.Make_tcp_synack_from_syn,"ax",@progbits
.global	Make_tcp_synack_from_syn
	.type	Make_tcp_synack_from_syn, @function
Make_tcp_synack_from_syn:
.LFB14:
	.loc 1 412 0
	.cfi_startproc
.LVL109:
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
	.loc 1 415 0
	rcall Make_eth
.LVL110:
	.loc 1 418 0
	std Y+16,__zero_reg__
	.loc 1 419 0
	ldi r24,lo8(44)
	std Y+17,r24
	.loc 1 420 0
	movw r24,r28
	rcall Make_ip
.LVL111:
	.loc 1 421 0
	ldi r24,lo8(18)
	std Y+47,r24
	.loc 1 422 0
	ldi r18,0
	ldi r20,lo8(1)
	ldi r22,lo8(1)
	ldi r23,0
	movw r24,r28
	rcall Make_tcphead
.LVL112:
	.loc 1 424 0
	ldi r20,lo8(2)
	ldi r22,lo8(32)
	ldi r23,0
	movw r24,r28
	adiw r24,26
	rcall Checksum
.LVL113:
	.loc 1 425 0
	std Y+50,r25
	.loc 1 426 0
	std Y+51,r24
	.loc 1 428 0
	movw r22,r28
	ldi r24,lo8(58)
	ldi r25,0
.LVL114:
/* epilogue start */
	.loc 1 430 0
	pop r29
	pop r28
.LVL115:
	.loc 1 428 0
	rjmp Enc28j60PacketSend
.LVL116:
	.cfi_endproc
.LFE14:
	.size	Make_tcp_synack_from_syn, .-Make_tcp_synack_from_syn
	.section	.text.Get_tcp_data_pointer,"ax",@progbits
.global	Get_tcp_data_pointer
	.type	Get_tcp_data_pointer, @function
Get_tcp_data_pointer:
.LFB15:
	.loc 1 437 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 438 0
	lds r24,info_data_len
	lds r25,info_data_len+1
	cp __zero_reg__,r24
	cpc __zero_reg__,r25
	brge .L73
	.loc 1 439 0
	lds r24,info_hdr_len
	lds r25,info_hdr_len+1
	adiw r24,34
	ret
.L73:
	.loc 1 441 0
	ldi r24,0
	ldi r25,0
	.loc 1 443 0
	ret
	.cfi_endproc
.LFE15:
	.size	Get_tcp_data_pointer, .-Get_tcp_data_pointer
	.section	.text.Get_tcp_data_len,"ax",@progbits
.global	Get_tcp_data_len
	.type	Get_tcp_data_len, @function
Get_tcp_data_len:
.LFB16:
	.loc 1 447 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 449 0
	lds r24,info_data_len
	lds r25,info_data_len+1
	ret
	.cfi_endproc
.LFE16:
	.size	Get_tcp_data_len, .-Get_tcp_data_len
	.section	.text.Init_len_info,"ax",@progbits
.global	Init_len_info
	.type	Init_len_info, @function
Init_len_info:
.LFB17:
	.loc 1 454 0
	.cfi_startproc
.LVL117:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 456 0
	movw r30,r24
	ldd r18,Z+16
	ldd r19,Z+17
	eor r19,r18
	eor r18,r19
	eor r19,r18
	subi r18,20
	sbc r19,__zero_reg__
	.loc 1 457 0
	ldd r24,Z+46
.LVL118:
	swap r24
	andi r24,lo8(15)
	ldi r31,lo8(4)
	mul r24,r31
	movw r24,r0
	clr __zero_reg__
	sts info_hdr_len+1,r25
	sts info_hdr_len,r24
	.loc 1 458 0
	movw r20,r18
	sub r20,r24
	sbc r21,r25
	movw r24,r20
	.loc 1 459 0
	cp __zero_reg__,r24
	cpc __zero_reg__,r25
	brge .L76
	.loc 1 458 0
	sts info_data_len+1,r21
	sts info_data_len,r20
	ret
.L76:
	.loc 1 460 0
	sts info_data_len+1,__zero_reg__
	sts info_data_len,__zero_reg__
	ret
	.cfi_endproc
.LFE17:
	.size	Init_len_info, .-Init_len_info
	.section	.text.Fill_tcp_data_p,"ax",@progbits
.global	Fill_tcp_data_p
	.type	Fill_tcp_data_p, @function
Fill_tcp_data_p:
.LFB18:
	.loc 1 469 0
	.cfi_startproc
.LVL119:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r22
	adiw r26,54
	add r26,r24
	adc r27,r25
	.loc 1 474 0
	movw r30,r20
	sub r22,r20
	sbc r23,r21
.LVL120:
.L79:
	movw r18,r22
	add r18,r30
	adc r19,r31
.LVL121:
.LBB2:
	.loc 1 474 0
/* #APP */
 ;  474 "../src/net/ip_arp_udp_tcp.c" 1
	lpm r25, Z
	
 ;  0 "" 2
.LVL122:
/* #NOAPP */
	adiw r30,1
.LVL123:
.LBE2:
	.loc 1 474 0
	tst r25
	breq .L81
	.loc 1 475 0
	st X+,r25
.LVL124:
	rjmp .L79
.LVL125:
.L81:
	.loc 1 479 0
	movw r24,r18
.LVL126:
	ret
	.cfi_endproc
.LFE18:
	.size	Fill_tcp_data_p, .-Fill_tcp_data_p
	.section	.text.Fill_tcp_data_len,"ax",@progbits
.global	Fill_tcp_data_len
	.type	Fill_tcp_data_len, @function
Fill_tcp_data_len:
.LFB19:
	.loc 1 487 0
	.cfi_startproc
.LVL127:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r19,r20
	movw r26,r22
	adiw r26,54
	add r26,r24
	adc r27,r25
.LBB3:
	.loc 1 490 0
	movw r30,r20
.LVL128:
.L83:
	.loc 1 490 0 is_stmt 0
	mov r24,r30
	sub r24,r19
	cp r24,r18
	brsh .L85
	.loc 1 491 0 is_stmt 1
	ld r24,Z+
.LVL129:
	st X+,r24
.LVL130:
	rjmp .L83
.L85:
.LBE3:
	.loc 1 497 0
	movw r24,r22
	add r24,r18
	adc r25,__zero_reg__
	ret
	.cfi_endproc
.LFE19:
	.size	Fill_tcp_data_len, .-Fill_tcp_data_len
	.section	.text.Fill_tcp_data,"ax",@progbits
.global	Fill_tcp_data
	.type	Fill_tcp_data, @function
Fill_tcp_data:
.LFB20:
	.loc 1 506 0
	.cfi_startproc
.LVL131:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r22
	adiw r26,54
	add r26,r24
	adc r27,r25
	.loc 1 509 0
	movw r30,r20
	sub r22,r20
	sbc r23,r21
.LVL132:
.L87:
	movw r18,r22
	add r18,r30
	adc r19,r31
.LVL133:
	ld r25,Z+
.LVL134:
	tst r25
	breq .L89
	.loc 1 510 0
	st X+,r25
.LVL135:
	rjmp .L87
.LVL136:
.L89:
	.loc 1 515 0
	movw r24,r18
.LVL137:
	ret
	.cfi_endproc
.LFE20:
	.size	Fill_tcp_data, .-Fill_tcp_data
	.section	.text.Make_tcp_ack_from_any,"ax",@progbits
.global	Make_tcp_ack_from_any
	.type	Make_tcp_ack_from_any, @function
Make_tcp_ack_from_any:
.LFB21:
	.loc 1 521 0
	.cfi_startproc
.LVL138:
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
	.loc 1 524 0
	rcall Make_eth
.LVL139:
	.loc 1 526 0
	ldi r24,lo8(16)
	std Y+47,r24
	.loc 1 527 0
	lds r22,info_data_len
	lds r23,info_data_len+1
	.loc 1 529 0
	ldi r18,lo8(1)
	ldi r20,0
	.loc 1 527 0
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L91
	.loc 1 529 0
	ldi r22,lo8(1)
	ldi r23,0
.L91:
	.loc 1 531 0
	movw r24,r28
	rcall Make_tcphead
.LVL140:
	.loc 1 537 0
	std Y+16,__zero_reg__
	.loc 1 538 0
	ldi r24,lo8(40)
	std Y+17,r24
	.loc 1 539 0
	movw r24,r28
	rcall Make_ip
.LVL141:
	.loc 1 541 0
	ldi r20,lo8(2)
	ldi r22,lo8(28)
	ldi r23,0
	movw r24,r28
	adiw r24,26
	rcall Checksum
.LVL142:
	.loc 1 542 0
	std Y+50,r25
	.loc 1 543 0
	std Y+51,r24
	.loc 1 544 0
	movw r22,r28
	ldi r24,lo8(54)
	ldi r25,0
.LVL143:
/* epilogue start */
	.loc 1 546 0
	pop r29
	pop r28
.LVL144:
	.loc 1 544 0
	rjmp Enc28j60PacketSend
.LVL145:
	.cfi_endproc
.LFE21:
	.size	Make_tcp_ack_from_any, .-Make_tcp_ack_from_any
	.section	.text.Make_tcp_ack_with_data,"ax",@progbits
.global	Make_tcp_ack_with_data
	.type	Make_tcp_ack_with_data, @function
Make_tcp_ack_with_data:
.LFB22:
	.loc 1 555 0
	.cfi_startproc
.LVL146:
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
	.loc 1 562 0
	ldi r24,lo8(25)
.LVL147:
	std Y+47,r24
	.loc 1 566 0
	movw r24,r22
	adiw r24,40
.LVL148:
	.loc 1 567 0
	std Y+16,r25
	.loc 1 568 0
	std Y+17,r24
	.loc 1 569 0
	movw r24,r28
.LVL149:
	rcall Fill_ip_hdr_checksum
.LVL150:
	.loc 1 571 0
	std Y+50,__zero_reg__
	.loc 1 572 0
	std Y+51,__zero_reg__
	.loc 1 574 0
	movw r22,r16
	subi r22,-28
	sbci r23,-1
	ldi r20,lo8(2)
	movw r24,r28
	adiw r24,26
	rcall Checksum
.LVL151:
	.loc 1 575 0
	std Y+50,r25
	.loc 1 576 0
	std Y+51,r24
	.loc 1 577 0
	movw r22,r28
	movw r24,r16
.LVL152:
	adiw r24,54
/* epilogue start */
	.loc 1 579 0
	pop r29
	pop r28
.LVL153:
	pop r17
	pop r16
.LVL154:
	.loc 1 577 0
	rjmp Enc28j60PacketSend
.LVL155:
	.cfi_endproc
.LFE22:
	.size	Make_tcp_ack_with_data, .-Make_tcp_ack_with_data
	.section	.text.Make_tcp_ack_with_full_data,"ax",@progbits
.global	Make_tcp_ack_with_full_data
	.type	Make_tcp_ack_with_full_data, @function
Make_tcp_ack_with_full_data:
.LFB23:
	.loc 1 585 0
	.cfi_startproc
.LVL156:
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
	.loc 1 592 0
	ldi r24,lo8(24)
.LVL157:
	std Y+47,r24
	.loc 1 597 0
	movw r24,r22
	adiw r24,40
.LVL158:
	.loc 1 598 0
	std Y+16,r25
	.loc 1 599 0
	std Y+17,r24
	.loc 1 600 0
	movw r24,r28
.LVL159:
	rcall Fill_ip_hdr_checksum
.LVL160:
	.loc 1 602 0
	std Y+50,__zero_reg__
	.loc 1 603 0
	std Y+51,__zero_reg__
	.loc 1 605 0
	movw r22,r16
	subi r22,-28
	sbci r23,-1
	ldi r20,lo8(2)
	movw r24,r28
	adiw r24,26
	rcall Checksum
.LVL161:
	.loc 1 606 0
	std Y+50,r25
	.loc 1 607 0
	std Y+51,r24
	.loc 1 608 0
	movw r22,r28
	movw r24,r16
.LVL162:
	adiw r24,54
/* epilogue start */
	.loc 1 610 0
	pop r29
	pop r28
.LVL163:
	pop r17
	pop r16
.LVL164:
	.loc 1 608 0
	rjmp Enc28j60PacketSend
.LVL165:
	.cfi_endproc
.LFE23:
	.size	Make_tcp_ack_with_full_data, .-Make_tcp_ack_with_full_data
	.section	.text.Tcp_get_dlength,"ax",@progbits
.global	Tcp_get_dlength
	.type	Tcp_get_dlength, @function
Tcp_get_dlength:
.LFB24:
	.loc 1 614 0
	.cfi_startproc
.LVL166:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r18,Z+16
	ldd r19,Z+17
	eor r19,r18
	eor r18,r19
	eor r19,r18
.LVL167:
	.loc 1 618 0
	subi r18,20
	sbc r19,__zero_reg__
.LVL168:
	.loc 1 619 0
	ldd r24,Z+46
.LVL169:
	swap r24
	andi r24,lo8(15)
.LVL170:
	.loc 1 624 0
	movw r20,r18
	ldi r22,lo8(4)
	mul r24,r22
	sub r20,r0
	sbc r21,r1
	clr __zero_reg__
	movw r24,r20
.LVL171:
	sbrs r21,7
	rjmp .L96
	ldi r24,0
	ldi r25,0
.L96:
	.loc 1 625 0
	ret
	.cfi_endproc
.LFE24:
	.size	Tcp_get_dlength, .-Tcp_get_dlength
	.data
	.type	ip_identifier, @object
	.size	ip_identifier, 2
ip_identifier:
	.word	1
	.type	seqnum, @object
	.size	seqnum, 1
seqnum:
	.byte	10
	.local	info_data_len
	.comm	info_data_len,2,1
	.local	info_hdr_len
	.comm	info_hdr_len,2,1
	.local	ipaddr
	.comm	ipaddr,4,1
	.local	macaddr
	.comm	macaddr,6,1
	.local	wwwport
	.comm	wwwport,2,1
	.text
.Letext0:
	.file 2 "/usr/lib/avr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x7d2
	.word	0x3
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF62
	.byte	0xc
	.long	.LASF63
	.long	.LASF64
	.long	.Ldebug_ranges0+0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x2
	.byte	0x7e
	.long	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x7f
	.long	0x49
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF4
	.byte	0x2
	.byte	0x80
	.long	0x5b
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF6
	.uleb128 0x3
	.long	.LASF7
	.byte	0x2
	.byte	0x82
	.long	0x74
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.byte	0x27
	.byte	0x1
	.long	0x50
	.long	.LFB1
	.long	.LFE1
	.byte	0x1
	.byte	0x9c
	.long	0xe1
	.uleb128 0x6
	.string	"buf"
	.byte	0x1
	.byte	0x27
	.long	0xe1
	.long	.LLST0
	.uleb128 0x6
	.string	"len"
	.byte	0x1
	.byte	0x27
	.long	0x50
	.long	.LLST1
	.uleb128 0x7
	.long	.LASF11
	.byte	0x1
	.byte	0x27
	.long	0x2c
	.long	.LLST2
	.uleb128 0x8
	.string	"sum"
	.byte	0x1
	.byte	0x2c
	.long	0x69
	.long	.LLST3
	.byte	0
	.uleb128 0x9
	.byte	0x2
	.long	0x2c
	.uleb128 0xa
	.byte	0x1
	.long	.LASF18
	.byte	0x1
	.byte	0x4f
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.byte	0x1
	.byte	0x9c
	.long	0x13b
	.uleb128 0x7
	.long	.LASF12
	.byte	0x1
	.byte	0x4f
	.long	0x13b
	.long	.LLST4
	.uleb128 0xb
	.long	.LASF13
	.byte	0x1
	.byte	0x50
	.long	0x13b
	.byte	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.uleb128 0xb
	.long	.LASF14
	.byte	0x1
	.byte	0x51
	.long	0x50
	.byte	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.uleb128 0xc
	.string	"i"
	.byte	0x1
	.byte	0x53
	.long	0x2c
	.byte	0
	.uleb128 0x9
	.byte	0x2
	.long	0x141
	.uleb128 0xd
	.long	0x2c
	.uleb128 0x5
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0x62
	.byte	0x1
	.long	0x2c
	.long	.LFB3
	.long	.LFE3
	.byte	0x1
	.byte	0x9c
	.long	0x18c
	.uleb128 0x6
	.string	"buf"
	.byte	0x1
	.byte	0x62
	.long	0xe1
	.long	.LLST5
	.uleb128 0xe
	.string	"len"
	.byte	0x1
	.byte	0x62
	.long	0x50
	.byte	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.uleb128 0xc
	.string	"i"
	.byte	0x1
	.byte	0x64
	.long	0x2c
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.long	.LASF17
	.byte	0x1
	.byte	0x77
	.byte	0x1
	.long	0x2c
	.long	.LFB4
	.long	.LFE4
	.byte	0x1
	.byte	0x9c
	.long	0x1d2
	.uleb128 0x6
	.string	"buf"
	.byte	0x1
	.byte	0x77
	.long	0xe1
	.long	.LLST6
	.uleb128 0xe
	.string	"len"
	.byte	0x1
	.byte	0x77
	.long	0x50
	.byte	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.uleb128 0xc
	.string	"i"
	.byte	0x1
	.byte	0x79
	.long	0x2c
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.byte	0x92
	.byte	0x1
	.long	.LFB5
	.long	.LFE5
	.byte	0x1
	.byte	0x9c
	.long	0x202
	.uleb128 0x6
	.string	"buf"
	.byte	0x1
	.byte	0x92
	.long	0xe1
	.long	.LLST7
	.uleb128 0xc
	.string	"i"
	.byte	0x1
	.byte	0x94
	.long	0x2c
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.byte	0xa0
	.byte	0x1
	.long	.LFB6
	.long	.LFE6
	.byte	0x1
	.byte	0x9c
	.long	0x244
	.uleb128 0xe
	.string	"buf"
	.byte	0x1
	.byte	0xa0
	.long	0xe1
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x7
	.long	.LASF21
	.byte	0x1
	.byte	0xa0
	.long	0xe1
	.long	.LLST8
	.uleb128 0xc
	.string	"i"
	.byte	0x1
	.byte	0xa2
	.long	0x2c
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.byte	0xb0
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.byte	0x1
	.byte	0x9c
	.long	0x27c
	.uleb128 0x6
	.string	"buf"
	.byte	0x1
	.byte	0xb0
	.long	0xe1
	.long	.LLST9
	.uleb128 0xf
	.string	"ck"
	.byte	0x1
	.byte	0xb2
	.long	0x50
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF23
	.byte	0x1
	.byte	0xc3
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.byte	0x1
	.byte	0x9c
	.long	0x2ca
	.uleb128 0x6
	.string	"buf"
	.byte	0x1
	.byte	0xc3
	.long	0xe1
	.long	.LLST10
	.uleb128 0x6
	.string	"len"
	.byte	0x1
	.byte	0xc3
	.long	0x50
	.long	.LLST11
	.uleb128 0x7
	.long	.LASF24
	.byte	0x1
	.byte	0xc3
	.long	0xe1
	.long	.LLST12
	.uleb128 0xc
	.string	"i"
	.byte	0x1
	.byte	0xc5
	.long	0x2c
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF25
	.byte	0x1
	.byte	0xeb
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.byte	0x1
	.byte	0x9c
	.long	0x2fa
	.uleb128 0x6
	.string	"buf"
	.byte	0x1
	.byte	0xeb
	.long	0xe1
	.long	.LLST13
	.uleb128 0xc
	.string	"i"
	.byte	0x1
	.byte	0xed
	.long	0x2c
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF26
	.byte	0x1
	.word	0x100
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.byte	0x1
	.byte	0x9c
	.long	0x369
	.uleb128 0x11
	.string	"buf"
	.byte	0x1
	.word	0x100
	.long	0xe1
	.long	.LLST14
	.uleb128 0x12
	.long	.LASF27
	.byte	0x1
	.word	0x101
	.long	0x50
	.long	.LLST15
	.uleb128 0x13
	.string	"mss"
	.byte	0x1
	.word	0x102
	.long	0x2c
	.byte	0x1
	.byte	0x64
	.uleb128 0x14
	.long	.LASF28
	.byte	0x1
	.word	0x103
	.long	0x2c
	.byte	0x1
	.byte	0x62
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.word	0x105
	.long	0x2c
	.uleb128 0x16
	.long	.LASF29
	.byte	0x1
	.word	0x106
	.long	0x2c
	.long	.LLST16
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.word	0x147
	.byte	0x1
	.long	.LFB11
	.long	.LFE11
	.byte	0x1
	.byte	0x9c
	.long	0x39c
	.uleb128 0x11
	.string	"buf"
	.byte	0x1
	.word	0x147
	.long	0xe1
	.long	.LLST17
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.word	0x149
	.long	0x2c
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF31
	.byte	0x1
	.word	0x15f
	.byte	0x1
	.long	.LFB12
	.long	.LFE12
	.byte	0x1
	.byte	0x9c
	.long	0x3d5
	.uleb128 0x11
	.string	"buf"
	.byte	0x1
	.word	0x15f
	.long	0xe1
	.long	.LLST18
	.uleb128 0x11
	.string	"len"
	.byte	0x1
	.word	0x15f
	.long	0x50
	.long	.LLST19
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF32
	.byte	0x1
	.word	0x170
	.byte	0x1
	.long	.LFB13
	.long	.LFE13
	.byte	0x1
	.byte	0x9c
	.long	0x447
	.uleb128 0x11
	.string	"buf"
	.byte	0x1
	.word	0x170
	.long	0xe1
	.long	.LLST20
	.uleb128 0x12
	.long	.LASF33
	.byte	0x1
	.word	0x171
	.long	0x447
	.long	.LLST21
	.uleb128 0x12
	.long	.LASF34
	.byte	0x1
	.word	0x172
	.long	0x2c
	.long	.LLST22
	.uleb128 0x12
	.long	.LASF35
	.byte	0x1
	.word	0x173
	.long	0x50
	.long	.LLST23
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.word	0x175
	.long	0x2c
	.uleb128 0x17
	.string	"ck"
	.byte	0x1
	.word	0x176
	.long	0x50
	.long	.LLST24
	.byte	0
	.uleb128 0x9
	.byte	0x2
	.long	0x44d
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF36
	.uleb128 0x10
	.byte	0x1
	.long	.LASF37
	.byte	0x1
	.word	0x19b
	.byte	0x1
	.long	.LFB14
	.long	.LFE14
	.byte	0x1
	.byte	0x9c
	.long	0x48c
	.uleb128 0x11
	.string	"buf"
	.byte	0x1
	.word	0x19b
	.long	0xe1
	.long	.LLST25
	.uleb128 0x17
	.string	"ck"
	.byte	0x1
	.word	0x19d
	.long	0x50
	.long	.LLST26
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF38
	.byte	0x1
	.word	0x1b4
	.byte	0x1
	.long	0x50
	.long	.LFB15
	.long	.LFE15
	.byte	0x1
	.byte	0x9c
	.uleb128 0x18
	.byte	0x1
	.long	.LASF39
	.byte	0x1
	.word	0x1be
	.byte	0x1
	.long	0x50
	.long	.LFB16
	.long	.LFE16
	.byte	0x1
	.byte	0x9c
	.uleb128 0x10
	.byte	0x1
	.long	.LASF40
	.byte	0x1
	.word	0x1c5
	.byte	0x1
	.long	.LFB17
	.long	.LFE17
	.byte	0x1
	.byte	0x9c
	.long	0x4e5
	.uleb128 0x11
	.string	"buf"
	.byte	0x1
	.word	0x1c5
	.long	0xe1
	.long	.LLST27
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF41
	.byte	0x1
	.word	0x1d4
	.byte	0x1
	.long	0x50
	.long	.LFB18
	.long	.LFE18
	.byte	0x1
	.byte	0x9c
	.long	0x566
	.uleb128 0x11
	.string	"buf"
	.byte	0x1
	.word	0x1d4
	.long	0xe1
	.long	.LLST28
	.uleb128 0x11
	.string	"pos"
	.byte	0x1
	.word	0x1d4
	.long	0x50
	.long	.LLST29
	.uleb128 0x12
	.long	.LASF42
	.byte	0x1
	.word	0x1d4
	.long	0x566
	.long	.LLST30
	.uleb128 0x1a
	.string	"c"
	.byte	0x1
	.word	0x1d6
	.long	0x44d
	.byte	0x1
	.byte	0x69
	.uleb128 0x1b
	.long	.LBB2
	.long	.LBE2
	.uleb128 0x16
	.long	.LASF43
	.byte	0x1
	.word	0x1da
	.long	0x50
	.long	.LLST31
	.uleb128 0x1c
	.long	.LASF44
	.byte	0x1
	.word	0x1da
	.long	0x2c
	.byte	0x1
	.byte	0x69
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x2
	.long	0x56c
	.uleb128 0xd
	.long	0x44d
	.uleb128 0x19
	.byte	0x1
	.long	.LASF45
	.byte	0x1
	.word	0x1e3
	.byte	0x1
	.long	0x50
	.long	.LFB19
	.long	.LFE19
	.byte	0x1
	.byte	0x9c
	.long	0x5de
	.uleb128 0x11
	.string	"buf"
	.byte	0x1
	.word	0x1e3
	.long	0xe1
	.long	.LLST32
	.uleb128 0x11
	.string	"pos"
	.byte	0x1
	.word	0x1e4
	.long	0x50
	.long	.LLST33
	.uleb128 0x11
	.string	"s"
	.byte	0x1
	.word	0x1e5
	.long	0x566
	.long	.LLST34
	.uleb128 0x13
	.string	"len"
	.byte	0x1
	.word	0x1e6
	.long	0x2c
	.byte	0x1
	.byte	0x62
	.uleb128 0x1b
	.long	.LBB3
	.long	.LBE3
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.word	0x1ea
	.long	0x2c
	.byte	0
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF46
	.byte	0x1
	.word	0x1f9
	.byte	0x1
	.long	0x50
	.long	.LFB20
	.long	.LFE20
	.byte	0x1
	.byte	0x9c
	.long	0x629
	.uleb128 0x11
	.string	"buf"
	.byte	0x1
	.word	0x1f9
	.long	0xe1
	.long	.LLST35
	.uleb128 0x11
	.string	"pos"
	.byte	0x1
	.word	0x1f9
	.long	0x50
	.long	.LLST36
	.uleb128 0x11
	.string	"s"
	.byte	0x1
	.word	0x1f9
	.long	0x566
	.long	.LLST37
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF47
	.byte	0x1
	.word	0x208
	.byte	0x1
	.long	.LFB21
	.long	.LFE21
	.byte	0x1
	.byte	0x9c
	.long	0x660
	.uleb128 0x11
	.string	"buf"
	.byte	0x1
	.word	0x208
	.long	0xe1
	.long	.LLST38
	.uleb128 0x17
	.string	"j"
	.byte	0x1
	.word	0x20a
	.long	0x50
	.long	.LLST39
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF48
	.byte	0x1
	.word	0x22a
	.byte	0x1
	.long	.LFB22
	.long	.LFE22
	.byte	0x1
	.byte	0x9c
	.long	0x6a7
	.uleb128 0x11
	.string	"buf"
	.byte	0x1
	.word	0x22a
	.long	0xe1
	.long	.LLST40
	.uleb128 0x12
	.long	.LASF49
	.byte	0x1
	.word	0x22a
	.long	0x50
	.long	.LLST41
	.uleb128 0x17
	.string	"j"
	.byte	0x1
	.word	0x22c
	.long	0x50
	.long	.LLST42
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF50
	.byte	0x1
	.word	0x247
	.byte	0x1
	.long	.LFB23
	.long	.LFE23
	.byte	0x1
	.byte	0x9c
	.long	0x6ee
	.uleb128 0x11
	.string	"buf"
	.byte	0x1
	.word	0x247
	.long	0xe1
	.long	.LLST43
	.uleb128 0x12
	.long	.LASF49
	.byte	0x1
	.word	0x248
	.long	0x50
	.long	.LLST44
	.uleb128 0x17
	.string	"j"
	.byte	0x1
	.word	0x24a
	.long	0x50
	.long	.LLST45
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF51
	.byte	0x1
	.word	0x265
	.byte	0x1
	.long	0x50
	.long	.LFB24
	.long	.LFE24
	.byte	0x1
	.byte	0x9c
	.long	0x737
	.uleb128 0x11
	.string	"buf"
	.byte	0x1
	.word	0x265
	.long	0xe1
	.long	.LLST46
	.uleb128 0x16
	.long	.LASF52
	.byte	0x1
	.word	0x267
	.long	0x49
	.long	.LLST47
	.uleb128 0x1d
	.long	.LASF53
	.byte	0x1
	.word	0x267
	.long	0x49
	.byte	0
	.uleb128 0x1e
	.long	.LASF54
	.byte	0x1
	.byte	0x8
	.long	0x50
	.byte	0x5
	.byte	0x3
	.long	wwwport
	.uleb128 0x1f
	.long	0x2c
	.long	0x758
	.uleb128 0x20
	.long	0x758
	.byte	0x5
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF55
	.uleb128 0x1e
	.long	.LASF56
	.byte	0x1
	.byte	0x9
	.long	0x748
	.byte	0x5
	.byte	0x3
	.long	macaddr
	.uleb128 0x1f
	.long	0x2c
	.long	0x780
	.uleb128 0x20
	.long	0x758
	.byte	0x3
	.byte	0
	.uleb128 0x1e
	.long	.LASF57
	.byte	0x1
	.byte	0xa
	.long	0x770
	.byte	0x5
	.byte	0x3
	.long	ipaddr
	.uleb128 0x1e
	.long	.LASF58
	.byte	0x1
	.byte	0xb
	.long	0x3e
	.byte	0x5
	.byte	0x3
	.long	info_hdr_len
	.uleb128 0x1e
	.long	.LASF59
	.byte	0x1
	.byte	0xc
	.long	0x3e
	.byte	0x5
	.byte	0x3
	.long	info_data_len
	.uleb128 0x1e
	.long	.LASF60
	.byte	0x1
	.byte	0xd
	.long	0x2c
	.byte	0x5
	.byte	0x3
	.long	seqnum
	.uleb128 0x1e
	.long	.LASF61
	.byte	0x1
	.byte	0xe
	.long	0x50
	.byte	0x5
	.byte	0x3
	.long	ip_identifier
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x2
	.uleb128 0x6
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL0
	.long	.LVL12
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL12
	.long	.LVL13
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL13
	.long	.LVL14
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL15
	.long	.LVL21
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST1:
	.long	.LVL0
	.long	.LVL4
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL4
	.long	.LVL13
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL13
	.long	.LVL17
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST2:
	.long	.LVL0
	.long	.LVL3
	.word	0x1
	.byte	0x64
	.long	.LVL6
	.long	.LVL8
	.word	0x1
	.byte	0x64
	.long	.LVL10
	.long	.LVL11
	.word	0x1
	.byte	0x64
	.long	0
	.long	0
.LLST3:
	.long	.LVL5
	.long	.LVL6
	.word	0xc
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL9
	.long	.LVL10
	.word	0xc
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL13
	.long	.LVL19
	.word	0xc
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL20
	.long	.LFE1
	.word	0xc
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST4:
	.long	.LVL22
	.long	.LVL27
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST5:
	.long	.LVL30
	.long	.LVL31
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
	.long	.LVL36
	.long	.LVL38
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL38
	.long	.LVL39
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL42
	.long	.LVL43
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST7:
	.long	.LVL44
	.long	.LVL46
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST8:
	.long	.LVL49
	.long	.LVL51
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST9:
	.long	.LVL54
	.long	.LVL55
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL55
	.long	.LVL57
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST10:
	.long	.LVL58
	.long	.LVL60
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL60
	.long	.LVL65-1
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST11:
	.long	.LVL58
	.long	.LVL61
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST12:
	.long	.LVL58
	.long	.LVL65-1
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST13:
	.long	.LVL66
	.long	.LVL69-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST14:
	.long	.LVL70
	.long	.LVL72
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL72
	.long	.LFE10
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST15:
	.long	.LVL70
	.long	.LVL78
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL78
	.long	.LFE10
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST16:
	.long	.LVL79
	.long	.LVL80
	.word	0x1
	.byte	0x63
	.long	0
	.long	0
.LLST17:
	.long	.LVL81
	.long	.LVL83-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL83-1
	.long	.LVL88
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL88
	.long	.LVL89-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST18:
	.long	.LVL90
	.long	.LVL91-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL91-1
	.long	.LVL93
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL93
	.long	.LVL95-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST19:
	.long	.LVL90
	.long	.LVL91-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL91-1
	.long	.LVL94
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL94
	.long	.LVL95-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST20:
	.long	.LVL96
	.long	.LVL98-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL98-1
	.long	.LVL106
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL106
	.long	.LVL108-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST21:
	.long	.LVL96
	.long	.LVL98-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST22:
	.long	.LVL96
	.long	.LVL98-1
	.word	0x1
	.byte	0x64
	.long	.LVL98-1
	.long	.LVL107
	.word	0x1
	.byte	0x60
	.long	0
	.long	0
.LLST23:
	.long	.LVL96
	.long	.LVL98-1
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST24:
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
	.long	.LVL106
	.word	0x7
	.byte	0x8c
	.sleb128 41
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL106
	.long	.LVL108-1
	.word	0x7
	.byte	0x86
	.sleb128 41
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST25:
	.long	.LVL109
	.long	.LVL110-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL110-1
	.long	.LVL115
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL115
	.long	.LVL116-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST26:
	.long	.LVL113
	.long	.LVL114
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL114
	.long	.LVL115
	.word	0x7
	.byte	0x8c
	.sleb128 51
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL115
	.long	.LVL116-1
	.word	0x7
	.byte	0x86
	.sleb128 51
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST27:
	.long	.LVL117
	.long	.LVL118
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL118
	.long	.LFE17
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST28:
	.long	.LVL119
	.long	.LVL126
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST29:
	.long	.LVL119
	.long	.LVL120
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL121
	.long	.LVL124
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL125
	.long	.LFE18
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST30:
	.long	.LVL119
	.long	.LVL120
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL120
	.long	.LVL121
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL123
	.long	.LFE18
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST31:
	.long	.LVL121
	.long	.LVL123
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST32:
	.long	.LVL127
	.long	.LVL128
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST33:
	.long	.LVL127
	.long	.LVL128
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST34:
	.long	.LVL127
	.long	.LVL128
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL128
	.long	.LVL129
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL130
	.long	.LFE19
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST35:
	.long	.LVL131
	.long	.LVL137
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST36:
	.long	.LVL131
	.long	.LVL132
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL133
	.long	.LVL135
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL136
	.long	.LFE20
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST37:
	.long	.LVL131
	.long	.LVL132
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL132
	.long	.LVL134
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL135
	.long	.LVL136
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST38:
	.long	.LVL138
	.long	.LVL139-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL139-1
	.long	.LVL144
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL144
	.long	.LVL145-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST39:
	.long	.LVL142
	.long	.LVL143
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL143
	.long	.LVL144
	.word	0x7
	.byte	0x8c
	.sleb128 51
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL144
	.long	.LVL145-1
	.word	0x7
	.byte	0x86
	.sleb128 51
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST40:
	.long	.LVL146
	.long	.LVL147
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL147
	.long	.LVL153
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL153
	.long	.LVL155-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST41:
	.long	.LVL146
	.long	.LVL150-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL150-1
	.long	.LVL154
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST42:
	.long	.LVL148
	.long	.LVL149
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL151
	.long	.LVL152
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL152
	.long	.LVL153
	.word	0x7
	.byte	0x8c
	.sleb128 51
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL153
	.long	.LVL155-1
	.word	0x7
	.byte	0x86
	.sleb128 51
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST43:
	.long	.LVL156
	.long	.LVL157
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL157
	.long	.LVL163
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL163
	.long	.LVL165-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST44:
	.long	.LVL156
	.long	.LVL160-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL160-1
	.long	.LVL164
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST45:
	.long	.LVL158
	.long	.LVL159
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL161
	.long	.LVL162
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL162
	.long	.LVL163
	.word	0x7
	.byte	0x8c
	.sleb128 51
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL163
	.long	.LVL165-1
	.word	0x7
	.byte	0x86
	.sleb128 51
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST46:
	.long	.LVL166
	.long	.LVL169
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL169
	.long	.LFE24
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST47:
	.long	.LVL168
	.long	.LVL170
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0xd4
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB1
	.long	.LFE1-.LFB1
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
	.long	.LFB17
	.long	.LFE17-.LFB17
	.long	.LFB18
	.long	.LFE18-.LFB18
	.long	.LFB19
	.long	.LFE19-.LFB19
	.long	.LFB20
	.long	.LFE20-.LFB20
	.long	.LFB21
	.long	.LFE21-.LFB21
	.long	.LFB22
	.long	.LFE22-.LFB22
	.long	.LFB23
	.long	.LFE23-.LFB23
	.long	.LFB24
	.long	.LFE24-.LFB24
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB1
	.long	.LFE1
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
	.long	.LFB17
	.long	.LFE17
	.long	.LFB18
	.long	.LFE18
	.long	.LFB19
	.long	.LFE19
	.long	.LFB20
	.long	.LFE20
	.long	.LFB21
	.long	.LFE21
	.long	.LFB22
	.long	.LFE22
	.long	.LFB23
	.long	.LFE23
	.long	.LFB24
	.long	.LFE24
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF47:
	.string	"Make_tcp_ack_from_any"
.LASF16:
	.string	"Eth_type_is_arp_and_my_ip"
.LASF49:
	.string	"dlen"
.LASF58:
	.string	"info_hdr_len"
.LASF57:
	.string	"ipaddr"
.LASF11:
	.string	"type"
.LASF55:
	.string	"sizetype"
.LASF28:
	.string	"cp_seq"
.LASF63:
	.string	"../src/net/ip_arp_udp_tcp.c"
.LASF60:
	.string	"seqnum"
.LASF61:
	.string	"ip_identifier"
.LASF18:
	.string	"Init_ip_arp_udp_tcp"
.LASF2:
	.string	"uint8_t"
.LASF19:
	.string	"Make_eth"
.LASF41:
	.string	"Fill_tcp_data_p"
.LASF43:
	.string	"__addr16"
.LASF12:
	.string	"mymac"
.LASF25:
	.string	"Make_ip"
.LASF34:
	.string	"datalen"
.LASF9:
	.string	"long long int"
.LASF29:
	.string	"tseq"
.LASF6:
	.string	"long int"
.LASF40:
	.string	"Init_len_info"
.LASF13:
	.string	"myip"
.LASF26:
	.string	"Make_tcphead"
.LASF31:
	.string	"Make_echo_reply_from_request"
.LASF42:
	.string	"progmem_s"
.LASF14:
	.string	"wwwp"
.LASF30:
	.string	"Make_arp_answer_from_request"
.LASF1:
	.string	"unsigned char"
.LASF24:
	.string	"dst_ip"
.LASF37:
	.string	"Make_tcp_synack_from_syn"
.LASF22:
	.string	"Fill_ip_hdr_checksum"
.LASF0:
	.string	"signed char"
.LASF10:
	.string	"long long unsigned int"
.LASF7:
	.string	"uint32_t"
.LASF5:
	.string	"unsigned int"
.LASF4:
	.string	"uint16_t"
.LASF27:
	.string	"rel_ack_num"
.LASF20:
	.string	"Make_eth_ip_new"
.LASF53:
	.string	"hlength"
.LASF50:
	.string	"Make_tcp_ack_with_full_data"
.LASF36:
	.string	"char"
.LASF38:
	.string	"Get_tcp_data_pointer"
.LASF3:
	.string	"int16_t"
.LASF62:
	.string	"GNU C99 5.4.0 -mn-flash=1 -mno-skip-bug -mmcu=avr4 -g -gdwarf-3 -gstrict-dwarf -Os -pedantic-errors -std=gnu99 -fpack-struct -fshort-enums -funsigned-char -funsigned-bitfields -ffunction-sections"
.LASF44:
	.string	"__result"
.LASF39:
	.string	"Get_tcp_data_len"
.LASF33:
	.string	"data"
.LASF35:
	.string	"port"
.LASF15:
	.string	"Checksum"
.LASF8:
	.string	"long unsigned int"
.LASF59:
	.string	"info_data_len"
.LASF51:
	.string	"Tcp_get_dlength"
.LASF48:
	.string	"Make_tcp_ack_with_data"
.LASF23:
	.string	"Make_ip_tcp_new"
.LASF32:
	.string	"Make_udp_reply_from_request"
.LASF54:
	.string	"wwwport"
.LASF45:
	.string	"Fill_tcp_data_len"
.LASF52:
	.string	"dlength"
.LASF56:
	.string	"macaddr"
.LASF17:
	.string	"Eth_type_is_ip_and_my_ip"
.LASF46:
	.string	"Fill_tcp_data"
.LASF21:
	.string	"dst_mac"
.LASF64:
	.string	"/home/orfanidi/AVR/Web_Controlled_Relay/build"
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
.global __do_clear_bss
