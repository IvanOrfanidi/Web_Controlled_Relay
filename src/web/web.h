#ifndef __WEB_H
#define __WEB_H

#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE !FALSE
#endif

#define BUFFER_SIZE 512U //< Recommended 521 for ATMega8

extern void LanTask();
extern char g_strIP[];
extern char g_strPort[];
extern uint16_t g_port;
extern _Bool g_status;

#endif /* __WEB_H */