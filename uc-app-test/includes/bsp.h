/*
*********************************************************************************************************
*                                           Atmel ATmega128
*                                         Board Support Package
*
*                                (c) Copyright 2005, Micrium, Weston, FL
*                                          All Rights Reserved
*
*
* File : BSP.H
* By   : Jean J. Labrosse
*********************************************************************************************************
*/

/*
*********************************************************************************************************
*                                               CONSTANTS
*********************************************************************************************************
*/

#define  CPU_CLK_FREQ                  3684000L


/*
*********************************************************************************************************
*                                           FUNCTION PROTOTYPES
*********************************************************************************************************
*/
void BSP_InitTickISR (void);
void  BSP_Init(void);
void  BSP_TickISR(void);
void  BSP_TickISR_Handler(void);
void port_init(void);

//jack
void MCU_sleep(void);
void blink(void);
void beeper(unsigned char num,unsigned char times);
void delay10ms(void);
void delayms(unsigned int num);
void LCDtoSleep(void);

#define SRAM_DISABLE()  PORTD |= (1<<PD4)
