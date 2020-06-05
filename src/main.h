#ifndef __MAIN_H
#define __MAIN_H

#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE !FALSE
#endif

/* HW Config */
#define RELAY (1 << PB0)
#define PORT_OUT PORTB
#define TURN_ON_RELAY PORT_OUT &= ~RELAY
#define TURN_OFF_RELAY PORT_OUT |= RELAY

#define BUZ (1 << PD6)
#define PORT_BUZ PORTD
#define ENABLE_BUZ PORT_BUZ |= BUZ
#define DISABLE_BUZ PORT_BUZ &= ~BUZ

#define CS_SPI_ENC28J60 (1 << PC4)

#define JUMPER (1 << PD5)
#define PIN_JUMPER PIND

inline void enable_interrupt()
{
	sei();
}

inline void disable_interrupt()
{
	cli();
}

inline _Bool GetStateJumper()
{
	return !(PIN_JUMPER & JUMPER);
}

void InitWatchdog(uint8_t timeout);
void InitGpio();
void InitInterrupt();

#endif /* __MAIN_H */