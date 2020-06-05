#ifndef __MAIN_H
#define __MAIN_H

/* HW Config */
#define RELAY (1 << PB0)
#define PORT_OUT PORTB

#define TURN_ON_RELAY PORT_OUT &= ~RELAY
#define TURN_OFF_RELAY PORT_OUT |= RELAY

#define BUZ (1 << PD6)
#define PORT_BUZ PORTD

#define CS_SPI_ENC28J60 (1 << PC4)

/* NET Config */
static const uint8_t MAC_ADDR[6] = {0x00, 0x21, 0x68, 0x33, 0xD6, 0x30};
static const uint8_t IP_ADDR[4] = {192, 168, 109, 14};
static const char SRT_IP_ADDR[] = "192.168.109.14";
#define TCP_PORT 80U // listen port for tcp/www (max range 1-254)

inline void enable_interrupt()
{
	sei();
}

void InitWatchdog();
void InitGpio();
void InitInterrupt();

#endif /* __MAIN_H */