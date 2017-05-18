#include "includes.h"

void  SPI_Init(void)
{
    //congigure the port & interupt
    DDRB  &=~ (1<<DDB3);                        //DDB3 is set to input mode(PB3=MISO)
    DDRB  |=  (1<<DDB0)|(1<<DDB1)|(1<<DDB2);    //DDB0~2 are set to output mode(PB0=SS low value enable,PB1=SCK,PB2=MOSI)
    PORTB |=  (1<<PB0);                         //PB0 orignal (high value)PB0=SS
    SPCR  = 0x50;                               //SPCR=01010000, SCK=fosc/2, mode 0, sampling at low to up
    SPSR  |=  (1<<SPI2X);
    return;
}

uchar SPI_read(void)
{
  SPDR  = 0xff;
  while ( ! (SPSR & 0x80));   //check whether SPI read has finished
  return (SPDR);
}

void SPI_write(uchar data)
{
  SPDR = data;
  while ( ! (SPSR & 0x80));  //check whether SPI write has finished
  return;
}
