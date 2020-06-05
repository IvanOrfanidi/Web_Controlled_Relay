#ifndef __WEB_H
#define __WEB_H

#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE !FALSE
#endif

#define BUFFER_SIZE 512 //< Recommended 521 for ATMega8

extern void LanTask();

#endif /* __WEB_H */