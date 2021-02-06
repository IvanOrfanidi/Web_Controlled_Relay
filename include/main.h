#ifndef __MAIN_H
#define __MAIN_H

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

#define DEF_IP_ADDRESS "192.168.0.222"
#define DEF_MAC_ADDRESS "00:21:68:3F:D6:35"
#define DEF_TCP_PORT "80"
#define DEF_STATE_BUZZER "0"

#define TIMEOUT_IS_ENABLED_BUZZER 0xFFFF;

/* Tools */
#define enable_interrupt() sei()
#define disable_interrupt() cli()
#define disable_analog_comparator() ACSR |= _BV(ACD)

#endif /* __MAIN_H */