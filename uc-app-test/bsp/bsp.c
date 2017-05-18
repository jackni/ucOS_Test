
#include <includes.h>
/*
*********************************************************************************************************
*                                              PROTOTYPES
*********************************************************************************************************
*/

void  BSP_InitTickISR(void);

/*
******************************************************************************************
function: set MCU to power down mode and sleep,only uart signal can wake MCU up
******************************************************************************************
*/

void MCU_sleep(void)
{
  MCUCR = 0xB0;    //bits 10010000
  asm("sleep");
}

/*
*********************************************************************************************************
*                                         BSP INITIALIZATION
*
* Description : This function should be called by your application code before you make use of any of the
*               functions found in this module.
*
* Arguments   : none
*********************************************************************************************************
*/

void  BSP_Init (void)
{
    MCUCR = 0xB0;    //bits 10010000
    port_init();
    //BSP_InitTickISR();
}


/*
*********************************************************************************************************
*                                        SETUP THE TICK RATE
*
* Note(s): 1) OCR0 = CPU_CLK_FREQ / (2 * Prescaler * OC_freq) - 1
*          2) The equation actually performs rounding by multiplying by 2, adding 1 and then divising by 2
*             in integer math, this is equivalent to adding 0.5
*********************************************************************************************************
*/

void BSP_InitTickISR (void)
{
    INT32U  num;
    INT32U  denom;
    //EICRB  = 0x20;EIFR |=0x10; EIMSK |= 0x10;
    asm("SEI");
    TCCR0  = 0x0E;                                      /* Set TIMER0 prescaler to CTC Mode, CLK/256   */
    TCNT0  =    0;                                      /* Start TCNT at 0 for a new cycle             */
    num    = (INT32U)CPU_CLK_FREQ;
    denom  = 2 * 256 * (INT32U)OS_TICKS_PER_SEC;
    OCR0   = (INT8U)((2 * num / denom + 1) / 2 - 1);
    TIFR  |= 0x02;                                      /* Clear  TIMER0 compare Interrupt Flag        */
    TIMSK |= 0x02;                                      /* Enable TIMER0 compare Interrupt             */
}


/*
*********************************************************************************************************
*                                     HANDLE THE TICK INTERRUPT
*
* Note(s): 1) No need to clear the interrupt source since we use output compare mode for Timer #0 and
*             the interrupt is automatically cleard in hardware when the ISR runs.
*********************************************************************************************************
*/

void  BSP_TickISR_Handler (void)
{
    OSTimeTick();
}

void port_init(void)
{
  /*
  PORTA,PORTC is used as DATA address bus
  */
  DDRA  = 0x00;  //address&data don't care
  PORTA = 0x00;  //address&data don't care
  DDRC  = 0x00;  //don't care
  PORTC = 0x00;  //address only

  /*
  PORTB:
  0:RXDS  1:SCK    2:SI    3:SO
  4:BUZZ  5:LED    6:LCDBK 7:KEYBK
  */
  DDRB = 0xf0;

  /*
  PORTD
  0:A16   1:LCD   2:MPD1  3:POWER
  4:SRAM  5:FLASH 6:RTC   7:KEYBOARD
  */
  DDRD  = 0xf7;//0b11110111;

  /*
  PORTE:
  0:    1:    2:    3:
  4:    5:    6:    7:
  */

  /*
  PORTF
  0:    1:    2:    3:
  4:    5:    6:    7:
  */

  /*
  PORTG
  0:    1:    2:    3:
  */
  DDRG  = 0x08;
}

//jack for test///////////////////////////////////////////////////////////////////////////////////////
void blink(void)
{

  int i;
  if ((PINB & 0x20) == 0x20)
  {
    PORTB &=~ (1<<PB5);  //led on
    for (i=0;i<100;i++)
    asm("nop");
  }
  else
  {
    PORTB |=  (1<<PB5);  //led off
    for (i=0;i<100;i++)
    asm("nop");
  }
}

void beeper(unsigned char num,unsigned char times)
{
  unsigned int i,j;
  unsigned char DDRBtemp = 0x00,PORTBtemp = 0x00;
  DDRBtemp |= DDRB&0xff;
  PORTBtemp |= PORTB&0xff;
  DDRB|=0x10;
  PORTB|=0x10;
  for(j=0;j<num;j++)
  {
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    for(i=0;i<times;i++);
    {
      PORTB^=(1<<PB4);
      asm("nop");
      asm("nop");
      asm("nop");
      asm("nop");
      asm("nop");
      asm("nop");
      asm("nop");
      asm("nop");
    }
  }
  PORTB&=~0x10;
  DDRB = DDRBtemp;
  PORTB = PORTBtemp;
}

void delay10ms(void)
{
  unsigned int i;
  for(i=1;i<9100;i++)
  {
    asm("nop");
  }
}


void delayms(unsigned int num)
{
  unsigned int i;
  unsigned int j;
  for(j=0;j<num;j++)
    for(i=1;i<455;i++)asm("nop");
}
//jack for test/////////////////////////////////////////////////////////
