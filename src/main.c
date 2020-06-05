//Functions Device
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/wdt.h>

// Standard Input/Output functions
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#include "main.h"
#include "net/enc28j60.h"
#include "net/ip_arp_udp_tcp.h"
#include "web/web.h"

int main()
{
	// HW init
	InitWatchdog();
	InitGpio();
	InitInterrupt();

	wdt_reset();

	// Initialize enc28j60
	Enc28j60Init(MAC_ADDR);
	wdt_reset();

	InitPhy();
	wdt_reset();

	// Init the ethernet/ip layer
	Init_ip_arp_udp_tcp(MAC_ADDR, IP_ADDR, TCP_PORT);
	wdt_reset();

	enable_interrupt();
	for(;;) {
		wdt_reset();
	}
}

void InitWatchdog()
{
	cli();
	wdt_reset();
	wdt_enable(WDTO_8S);
}

void InitGpio()
{
	DDRB = (RELAY);
	PORT_OUT = 0xFF & !RELAY;

	DDRC = (CS_SPI_ENC28J60);
	PORTC = (CS_SPI_ENC28J60);

	DDRD = (BUZ);
	PORT_BUZ = 0xFF;
	PORT_BUZ &= ~(BUZ);
}

void InitInterrupt()
{
	EICRA &= 0xFE; // INT 0 sense on falling edge

	EICRA |= 0x02;
	EIMSK |= (1 << INT0); // enable interrupt on INT 0
}

/* Interrupt Ext. Int0 */
ISR(INT0_vect)
{
	LanTask();
}