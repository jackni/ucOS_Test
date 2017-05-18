#include "includes.h"


OS_EVENT *DispSem;

uchar BLKGND_R;
uchar BLKGND_G;
uchar BLKGND_B;
uchar Text_R;
uchar Text_G;
uchar Text_B;
uchar BK_Trans1;   //cited in comm
uchar BK_Trans2;
uchar Text_Trans1; //cited in comm
uchar Text_Trans2;

void LCD_Reset(void)
{
   LCD_RST_VALID();
   delay10ms();
   delay10ms();
   LCD_RST_INVALID();
   delay10ms();        //waiting internal reset
}


        /****************************************
        *                                       *
        *        Write Data                     *
        *                                       *
        ****************************************/

void LCD_WriteData0(char Data)
{
  LCD_CHIP_ENABLE();
  WRITE_DATA0(Data);
  LCD_CHIP_DISABLE();
}


        /****************************************
        *                                       *
        *        Write Data                     *
        *                                       *
        ****************************************/
void LCD_WriteNonParaCommand0(char cmd)
{
   LCD_CHIP_ENABLE();
   WRITE_CMD0(0x00);
   WRITE_CMD0(cmd);
   LCD_CHIP_DISABLE();
}


        /****************************************
        *                                       *
        *        Write single command           *
        *                                       *
        ****************************************/

void LCD_WriteSingleCommand0(char cmd,char P1)
{
  LCD_CHIP_ENABLE();
  WRITE_CMD0(cmd);
  WRITE_DATA0(P1);
  LCD_CHIP_DISABLE();
}


        /****************************************
        *                                       *
        *        Write double command           *
        *                                       *
        ****************************************/

void LCD_WriteDoubleCommand0(char cmd,char P1, char P2)
{
  LCD_CHIP_ENABLE();
  WRITE_CMD0(0x00);
  WRITE_CMD0(cmd);
  WRITE_DATA0(P1);
  WRITE_DATA0(P2);
  LCD_CHIP_DISABLE();
}

        /****************************************
        *                                       *
        *        Write double command           *
        *                                       *
        ****************************************/

void LCD_WriteTripleCommand0(char cmd,char P1, char P2, char P3)
{
  LCD_CHIP_ENABLE();
  WRITE_CMD0(0x00);
  WRITE_CMD0(cmd);
  WRITE_DATA0(P1);
  WRITE_DATA0(P2);
  WRITE_DATA0(P3);
  LCD_CHIP_DISABLE();
}


        /****************************************
        *                                       *
        *          Read data                    *
        *                                       *
        ****************************************/


uchar LCD_ReadData0(void)
{
  volatile uchar r1,r2;
  LCD_CHIP_ENABLE();
  READ_DATA0(r1);
  READ_DATA0(r2);
  LCD_CHIP_DISABLE();
  return r1;
}

        /****************************************
        *                                       *
        *          Read command (status)        *
        *                                       *
        ****************************************/

uchar LCD_ReadCmd0(void)
{
  uchar r;
  LCD_CHIP_ENABLE();
  READ_CMD0(r);
  LCD_CHIP_DISABLE();
  return r;
}

/*****************************************************************
*
*                        API function
*
******************************************************************/
void DispInit(void)
{
  uchar cpu_sr;
  uchar PORT_temp =0x00;
  uchar tempsreg;
  PORT_temp = PORTD&0xff; //disable exrern sram
  SRAM_DISABLE() ;

  tempsreg=SREG;
  OS_ENTER_CRITICAL();
  LCD_Reset();
  //Start OSC
  LCD_WriteDoubleCommand0(0x00,0x00,0x01);
  delayms(50);
  LCD_ReadData0();
  LCD_WriteDoubleCommand0(0x03,0x00,0x00);
  //LCD_WriteNonParaCommand0(0x00);
  //Display Control Register 1
  LCD_WriteDoubleCommand0(0x07,0x00,0x04);//04?
  delayms(1);
  //Power Control Register 4
  LCD_WriteDoubleCommand0(0x0d,0x03,0x04);
  delayms(1);
  //Power Control Resister 5
  LCD_WriteDoubleCommand0(0x0e,0x16,0x1A);
  delayms(70);
  //Driver Output Control
  LCD_WriteDoubleCommand0(0x01,0x01,0x13);
  delayms(1);
  //LCD Driving Waveform Control
  LCD_WriteDoubleCommand0(0x02,0x07,0x00);
  delayms(1);
  //Entry Mode
  LCD_WriteDoubleCommand0(0x05,0x10,0x08);
  delayms(1);
  //16-bit Compare
  LCD_WriteDoubleCommand0(0x06,0x00,0x00);
  delayms(1);
  //Frame Cycle Control
  LCD_WriteDoubleCommand0(0x0b,0x00,0x00);
  delayms(1);
  //Power Control 3
  LCD_WriteDoubleCommand0(0x0c,0x00,0x0d);
  //Power Control 1
  LCD_WriteDoubleCommand0(0x03,0x04,0x10);
  //BT Bits and VLCD,VGH and VGL Outputs
  LCD_WriteDoubleCommand0(0x04,0x00,0x00);
  //Power Control Register 5
  LCD_WriteDoubleCommand0(0x0E,0x12,0x1A);
  //Power Control Register 4
  LCD_WriteDoubleCommand0(0x0D,0x01,0x19);
  //Gate Scan Position Register
  LCD_WriteDoubleCommand0(0x0F,0x00,0x00);
  //Vertical Scroll Control Register
  LCD_WriteDoubleCommand0(0x11,0x00,0x00);
  //First Display Window Driving Position Register
  LCD_WriteDoubleCommand0(0x14,0x9F,0x00);//9F?
  //Second Display Window Driving Position Register
  LCD_WriteDoubleCommand0(0x15,0x00,0x00);
  //Horizontal RAM Address Position Register
  LCD_WriteDoubleCommand0(0x16,0x7F,0x00);
  //Vertical RAM Address Position Register
  LCD_WriteDoubleCommand0(0x17,0x9F,0x00);
  //RAM Address Register
  LCD_WriteDoubleCommand0(0x21,0x00,0x00);
  LCD_WriteDoubleCommand0(0x07,0x00,0x05);
  delayms(10);
  LCD_WriteDoubleCommand0(0x07,0x00,0x25);
  delayms(10);
  LCD_WriteDoubleCommand0(0x07,0x00,0x27);
  delayms(10);
  LCD_WriteDoubleCommand0(0x07,0x00,0x37);
  delayms(10);
  BLKGND_R = INITBKCOLOR_R;
  BLKGND_G = INITBKCOLOR_G;
  BLKGND_B = INITBKCOLOR_B;

  LCD_BK_LIGHT_ON();

  SREG=tempsreg;
  PORTD = PORT_temp;
  OS_EXIT_CRITICAL();
}

void DispClrScr(void)  //clear the screen by using background color
{
  uchar i,j;
  uchar tempsreg,cpu_sr,err;
  uchar R,G,B;
  uchar PORT_temp =0x00;
  PORT_temp |= PORTD&0xff; //disable exrern sram
  SRAM_DISABLE();

  tempsreg=SREG;

  OS_ENTER_CRITICAL();
  OSSemPend(DispSem,0,&err);
  LCD_WriteDoubleCommand0(0x21,0x9F,0x7F);
  //SetBKColor(INITBKCOLOR_R,INITBKCOLOR_G,INITBKCOLOR_B);
  R = INITBKCOLOR_R;
  G = INITBKCOLOR_G;
  B = INITBKCOLOR_B;
  for(i=0;i<128;i++)
  {
    for(j=0;j<160;j++)
    {
      SetBKColor(R,G+j+5,B+j+5);
      LCD_WriteDoubleCommand0(0x22,BK_Trans1,BK_Trans2);
    }
  }
  SREG=tempsreg;
  PORTD = PORT_temp;
  OSSemPost(DispSem);
  OS_EXIT_CRITICAL();
}

void DispChar(uchar Col,uchar Row,uchar pos,uchar type)
{
  uchar tempsreg,cpu_sr,err;
  uint hzword;
  uint  column;
  uchar i,j;
  uchar PORT_temp =0x00;
  PORT_temp |= PORTD&0xff; //disable exrern sram
  SRAM_DISABLE();

  tempsreg=SREG;

  OS_ENTER_CRITICAL();
  //OSSemPend(DispSem,0,&err);
  if(type==1)
  {
    if((Col*8 >(LCD_XSIZE-8))||(Row*16 >(LCD_YSIZE-16)))
    {
      return;
    }
    for(i=0;i<8;i++)
    {
      LCD_WriteDoubleCommand0(0x21,159-Row*16,127-Col*8-i);//start address
      column=(alphanum[(uint)pos*16+i])|(alphanum[(uint)pos*16+i+8]<<8);
      for(j=0;j<16;j++)
      {
       if((column & (0x01<<j))==0)
       {
         LCD_WriteDoubleCommand0(0x21,159-Row*16-j-1,127-Col*8-i);
       }
       else
       {
         LCD_WriteDoubleCommand0(0x22,Text_Trans1,Text_Trans2);
       }
      }
    }
  }
/*
  if(type==0)
  {	
    if((Col*16 >(LCD_XSIZE-16))||(Row*16 >(LCD_YSIZE-16)))
      return;
		
    for(i=0;i<16;i++)
    {
     LCD_WriteDoubleCommand0(0x21,159-Row*16,127-Col*16-i);//start address
     hzword = (hz[(uint)pos*32+i])|(hz[(uint)pos*32+i+16]<<8);
     for(j=0;j<16;j++)
     {
      if((hzword & (0x01<<j))==0)
         LCD_WriteDoubleCommand0(0x21,159-Row*16-j-1,127-Col*16-i);
      else
         LCD_WriteDoubleCommand0(0x22,Text_Trans1,Text_Trans2);
     }
    }
  }*/
  SREG=tempsreg;
  PORTD = PORT_temp;
  //OSSemPost(DispSem);
  OS_EXIT_CRITICAL();
}

void SetBKColor(uchar R,uchar G,uchar B)
{
  BLKGND_R = R;
  BLKGND_G = G;
  BLKGND_B = B;
  BK_Trans1 = (BLKGND_R & 0xf8) | ((BLKGND_G & 0xe0)>>5);
  BK_Trans2 = ((BLKGND_G &0x1c)<<3) | ((BLKGND_B & 0xf8)>>3);
}

void SetTextColor(uchar R,uchar G,uchar B)
{
  Text_R = R;
  Text_G = G;
  Text_B = B;
  Text_Trans1 = (Text_R & 0xf8) | ((Text_G & 0xe0)>>5);
  Text_Trans2 = ((Text_G &0x1c)<<3) | ((Text_B & 0xf8)>>3);
}

void DispNewChar(uint ColRow,uint postype)
{
  uchar Row,Col,pos,type;
  Col=ColRow>>8;
  Row=ColRow&0x00ff;
  pos=postype>>8;
  type=postype&0x00ff;
  DispChar(Col,Row,pos,type);
}

void LCDtoSleep(void)
{
  uchar PORT_temp = 0X00;
  PORT_temp |= PORTD&0xff;
  //LCD_RESET
  LCD_RST_VALID();
  delayms(100);
  LCD_RST_INVALID();
  //LCD_RESET
  SRAM_DISABLE();
  LCD_WriteDoubleCommand0(0x07,0x00,0x32);
  delayms(1);
  LCD_WriteDoubleCommand0(0x07,0x00,0x22);
  delayms(1);
  LCD_WriteDoubleCommand0(0x07,0x00,0x00);
  delayms(1);
  LCD_WriteDoubleCommand0(0x03,0x00,0x00);
  delayms(1);
  LCD_WriteDoubleCommand0(0x03,0x00,0x02);
  delayms(1);

  LCD_BK_LIGHT_OFF();

  PORTD = PORT_temp;
}

void DispHorBar()
{

}

void DispClrCol(uchar Col)  //clear the column
{
  uchar i,j;
  uchar R,G,B;
  uchar tempsreg,cpu_sr,err;
  R = INITBKCOLOR_R;
  G = INITBKCOLOR_G;
  B = INITBKCOLOR_B;
  uchar PORT_temp =0x00;
  PORT_temp |= PORTD&0xff; //disable exrern sram
  SRAM_DISABLE();

  tempsreg=SREG;

  OS_ENTER_CRITICAL();
  //OSSemPend(DispSem,0,&err);
  //SetBKColor(INITBKCOLOR_R,INITBKCOLOR_G,INITBKCOLOR_B);

  for(i=0;i<8;i++)
  {
    for(j=0;j<160;j++)
    {
      SetBKColor(R,G+j+5,B+j+5);
      LCD_WriteDoubleCommand0(0x21,160-j-1,127-Col*8-i);
      LCD_WriteDoubleCommand0(0x22,BK_Trans1,BK_Trans2);
    }
  }
  SREG=tempsreg;
  PORTD = PORT_temp;
  //OSSemPost(DispSem);
  OS_EXIT_CRITICAL();
}

void DispClrRow(uchar Row) //clear the Row
{
  uchar i,j;
  uchar R,G,B;
  uchar tempsreg,cpu_sr,err;
  uchar PORT_temp =0x00;
  PORT_temp |= PORTD&0xff; //disable exrern sram
  R = INITBKCOLOR_R;
  G = INITBKCOLOR_G+Row*16;
  B = INITBKCOLOR_B+Row*16;

  SRAM_DISABLE();

  tempsreg=SREG;

  OS_ENTER_CRITICAL();
  //OSSemPend(DispSem,0,&err);
  //SetBKColor(INITBKCOLOR_R,INITBKCOLOR_G,INITBKCOLOR_B);
  for(i=0;i<128;i++)
  {
    for(j=0;j<16;j++)
    {
      SetBKColor(R,G+j+5,B+j+5);
      LCD_WriteDoubleCommand0(0x21,160-Row*16-j-1,127-i);
      LCD_WriteDoubleCommand0(0x22,BK_Trans1,BK_Trans2);
    }
  }
  SREG=tempsreg;
  PORTD = PORT_temp;
  //OSSemPost(DispSem);
  OS_EXIT_CRITICAL();
}

/*
*
* Discription : Menu select Display
* Argument: select 1:select, 0:unselect
*           Row: row_location, Col: col_location
*
*/
void DispMenuSelect(uchar Col,uchar Row, uchar select)
{
  uchar i,j;
  uchar tempsreg,cpu_sr,err;
  uchar PORT_temp =0x00;
  PORT_temp |= PORTD&0xff; //disable exrern sram
  SRAM_DISABLE();

  tempsreg=SREG;

  OS_ENTER_CRITICAL();
  //OSSemPend(DispSem,0,&err);
  if ((Col*16>128)||(Row*16>160)) //boundary execced
  {
    return;
  }
  if (select == SELECT) /*menu selected*/
  {
   for(i=0;i<(Col*16+16);i++)
   {
     LCD_WriteDoubleCommand0(0x21,160-Row*16-j-1,127-i);
     for (j=0;j<1;j++)
     {
       LCD_WriteDoubleCommand0(0x22,Text_Trans1,Text_Trans2);
     }
   }
  }
  if (select == UNSELECT)/*menu unselected*/
  {

  }
  SREG=tempsreg;
  PORTD = PORT_temp;
  //OSSemPost(DispSem);
  OS_EXIT_CRITICAL();
}

void DispCharColor(uchar Col,uchar Row,uchar pos,uchar type,uchar R,uchar G,uchar B)
{
  uchar Char_R,Char_G,Char_B;
  uchar tempsreg,cpu_sr,err;
  uchar PORT_temp =0x00;
  uint hzword;
  uchar i,j;
  uint  column;
  Char_R = R;     //set color
  Char_G = G;
  Char_B = B;
  Text_Trans1 = (Char_R & 0xf8) | ((Char_G & 0xe0)>>5);
  Text_Trans2 = ((Char_G &0x1c)<<3) | ((Char_B & 0xf8)>>3);

  PORT_temp |= PORTD&0xff; //disable exrern sram
  SRAM_DISABLE();

  tempsreg=SREG;

  OS_ENTER_CRITICAL();
  //OSSemPend(DispSem,0,&err);
  if(type==1)
  {
    if((Col*8 >(LCD_XSIZE-8))||(Row*16 >(LCD_YSIZE-16)))
    {
      return;
    }
    for(i=0;i<8;i++)
    {
      LCD_WriteDoubleCommand0(0x21,159-Row*16,127-Col*8-i);//start address
      column=(alphanum[(uint)pos*16+i])|(alphanum[(uint)pos*16+i+8]<<8);
      for(j=0;j<16;j++)
      {
       if((column & (0x01<<j))==0)
       {
         LCD_WriteDoubleCommand0(0x21,159-Row*16-j-1,127-Col*8-i);
       }
       else
       {
         LCD_WriteDoubleCommand0(0x22,Text_Trans1,Text_Trans2);
       }
      }
    }
  }
/*
  if(type==0)
  {
    if((Col*16 >(LCD_XSIZE-16))||(Row*16 >(LCD_YSIZE-16)))
      return;
		
    for(i=0;i<16;i++)
    {
     LCD_WriteDoubleCommand0(0x21,159-Row*16,127-Col*16-i);//start address
     hzword = (hz[(uint)pos*32+i])|(hz[(uint)pos*32+i+16]<<8);
     for(j=0;j<16;j++)
     {
      if((hzword & (0x01<<j))==0)
         LCD_WriteDoubleCommand0(0x21,159-Row*16-j-1,127-Col*16-i);
      else
         LCD_WriteDoubleCommand0(0x22,Text_Trans1,Text_Trans2);
     }
    }
  }*/
  SREG=tempsreg;
  PORTD = PORT_temp;
  //OSSemPost(DispSem);
  OS_EXIT_CRITICAL();
}

/*
*
*  Discription:  only for logo_disp_flag
*
*/
void Logo_disp(void) /*character bitmap is 19*28*/
{
  uchar x = 11,y = 3;
  uchar i = 0,j = 0,loop = 0;
  uint offset;
  ulong dot;

  /*Display logo M*/
  for(i=0;i<21;i++)
  {
    LCD_WriteDoubleCommand0(0x21,159-y*16,127-x-i);//start address
    dot = ((ulong)logoM[i])<<24|((ulong)logoM[i+21]<<16)
          |((ulong)logoM[i+42]<<8)|((ulong)logoM[i+63]);
    for(j=0;j<24;j++)
    {
       if((dot&(0x80000000>>j))== 0)
       {
         //LCD_WriteDoubleCommand0(0x22,0x55,BK_Trans2);
         LCD_WriteDoubleCommand0(0x21,159-y*16-j-1,127-x-i);
       }
       else
       {
         LCD_WriteDoubleCommand0(0x22,0x55,BK_Trans2);
       }
    }
  }
  x = x+21+3;
  /*Display double logo O*/
  for(i=0;i<19;i++)
  {
    LCD_WriteDoubleCommand0(0x21,159-y*16,127-x-i);//start address
    dot = ((ulong)logoO[i])<<24|((ulong)logoO[i+19]<<16)
          |((ulong)logoO[i+38]<<8)|((ulong)logoO[i+57]);
    for(j=0;j<24;j++)
    {
       if((dot&(0x80000000>>j))== 0)
       {
         //LCD_WriteDoubleCommand0(0x22,BK_Trans1,BK_Trans2);
         LCD_WriteDoubleCommand0(0x21,159-y*16-j-1,127-x-i);
       }
       else
       {
         LCD_WriteDoubleCommand0(0x22,0x55,BK_Trans2);
       }
    }
  }
  x = x+19+3;
  /*Display double logo O*/
  for(i=0;i<19;i++)
  {
    LCD_WriteDoubleCommand0(0x21,159-y*16,127-x-i);//start address
    dot = ((ulong)logoO[i])<<24|((ulong)logoO[i+19]<<16)
          |((ulong)logoO[i+38]<<8)|((ulong)logoO[i+57]);
    for(j=0;j<24;j++)
    {
       if((dot&(0x80000000>>j))== 0)
       {
         //LCD_WriteDoubleCommand0(0x22,0x55,BK_Trans2);
         LCD_WriteDoubleCommand0(0x21,159-y*16-j-1,127-x-i);
       }
       else
       {
         LCD_WriteDoubleCommand0(0x22,0x55,BK_Trans2);
       }
    }
  }
  /*display logo N*/
  x = x+19+3;
  for(i=0;i<19;i++)
  {
    LCD_WriteDoubleCommand0(0x21,159-y*16,127-x-i);//start address
    dot = ((ulong)logoN[i])<<24|((ulong)logoN[i+19]<<16)
          |((ulong)logoN[i+38]<<8)|((ulong)logoN[i+57]);
    for(j=0;j<24;j++)
    {
       if((dot&(0x80000000>>j))== 0)
       {
         //LCD_WriteDoubleCommand0(0x22,0x55,BK_Trans2);
         LCD_WriteDoubleCommand0(0x21,159-y*16-j-1,127-x-i);
       }
       else
       {
         LCD_WriteDoubleCommand0(0x22,0x55,BK_Trans2);
       }
    }
  }
  x = x+19+3;
  /*Display double logo S*/
  for(i=0;i<16;i++)
  {
    LCD_WriteDoubleCommand0(0x21,159-y*16,127-x-i);//start address
    dot = ((ulong)logoS[i])<<24|((ulong)logoS[i+16]<<16)
          |((ulong)logoS[i+32]<<8)|((ulong)logoS[i+48]);
    for(j=0;j<24;j++)
    {
       if((dot&(0x80000000>>j))== 0)
       {
         //LCD_WriteDoubleCommand0(0x22,0x55,BK_Trans2);
         LCD_WriteDoubleCommand0(0x21,159-y*16-j-1,127-x-i);
       }
       else
       {
         LCD_WriteDoubleCommand0(0x22,0x55,BK_Trans2);
       }
    }
  }

  /*disp chinese logo*/
  x = 15; y = 5;
  offset = 0;
  for(loop=0;loop<4;loop++)
  {
    for(i=0;i<23;i++)
    {
      LCD_WriteDoubleCommand0(0x21,159-y*16,127-x-i);//start address
      dot = ((ulong)logocn[i+offset])<<24|((ulong)logocn[i+offset+23]<<16)
            |((ulong)logocn[i+offset+46]<<8)|((ulong)logocn[i+offset+69]);
      for(j=0;j<27;j++)
      {
         if((dot&(0x80000000>>j))== 0)
         {
           //LCD_WriteDoubleCommand0(0x22,0x55,BK_Trans2);
           LCD_WriteDoubleCommand0(0x21,159-y*16-j-1,127-x-i);
         }
         else
         {
           LCD_WriteDoubleCommand0(0x22,0x55,BK_Trans2);
         }
       }
    }
    x=x+23;
    offset = offset+92;
  }
}
