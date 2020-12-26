#ifndef __WEB_H
#define __WEB_H

#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE !FALSE
#endif

#define BUFFER_SIZE 512U

extern void LanTask();
extern char g_strIP[];
extern char g_strPort[];
extern uint16_t g_port;
extern _Bool g_status;
extern _Bool g_buzzer;
extern uint16_t g_timeout_is_enabled_buzzer;

#endif /* __WEB_H */