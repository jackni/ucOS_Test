#include "includes.h"

/*
*
*         NOTE: SPI_Init() should be called first
*
*/
void Flash_Init(void)
{
  FLASH_CHIP_UNSELECT();    /* orignal state (high value) */
  FLASH_BUSY_CHECK_ENABLE() /* set PF1 high register status */
}

void Flash_busy_check(void)
{
  while(!FLASH_BUSY_CHECK())
  {
    ;                      /* wait SPI finish and exit busy status */
  }
}

/*
*
* Discription:
*
*/
uchar *address_convert(uint pagenumber, uint offset)  //return a pointer
{
     uchar *address_c = 0, *p;
     *address_c  = (pagenumber >>5);                             //???or 256
     p = address_c;
     address_c++;
     *address_c  = ((pagenumber & 0x1F)<<3)|(offset>>8);
     address_c++;
     *address_c = offset & 0xFF;
     address_c = p;
     return( address_c );
}

/*
*
* Discription:
*
*/
void  SPI_command_set(uchar char_opcode, uchar  page_addr_high, uchar page_addr_low_buff_high, uchar buff_low)
{
     SPI_write(char_opcode);                                       //send  command
     SPI_write(page_addr_high);                                    //send 3 bytes
     SPI_write(page_addr_low_buff_high);
     SPI_write(buff_low);
     return;
}

/*
*
* Discription:
*
*/
uchar Flash_Write(uint PageNo,uint offset,uchar * WrData, uint TotalBytes)
{
     uint int_i = 0;
     uint int_number;
     uchar cpu_sr,tempsreg,PORTtemp1 = 0,PORTtemp2 = 0;
     uchar char_opcode;                                 /* operation code */
     uchar *real_address;
     uchar real_pageaddr_H;                             /* PageNo+offset */
     uchar real_pageaddr_L;
     uchar Flash_buff_A;
     uint OFFSET = offset;
     uint total = TotalBytes;
     uint TOTAL;
     uchar flag, wrdata;                                /* flag for judgement */
     PORTtemp1 |= PORTD&0xff;                           /* save Port status */
     PORTtemp2 |= PORTF&0xff;
     tempsreg=SREG;                                     /* save SREG */
     OS_ENTER_CRITICAL();                              /* close interrput */
/******************************************************************************************************************/
     for ( ;total != 0 ; )
     {
        if ( total+OFFSET > 1056)
        {
             TOTAL = 1056 - OFFSET;
        }
        else
        {
            TOTAL = total;
        }
        real_address = address_convert(PageNo+int_i,OFFSET);
        real_pageaddr_H = *real_address;
        real_pageaddr_L = *(++real_address);
        Flash_buff_A = *(++real_address);
        /****************************protect mechanism*******************************/
        char_opcode  = 0x53;                                  /* transfer data from memory to buffer1 */
        FLASH_CHIP_SELECT();                                   /* select Flash */
        PORTB &=~ (1<<PB0);//                                   /* SS=0 startup the SPI */
        SPI_command_set( char_opcode, real_pageaddr_H, real_pageaddr_L, Flash_buff_A);
        FLASH_CHIP_UNSELECT();                                  /* startup transfer data from memory to buffer1 */
        PORTB  |=  (1<<PB0);//                                  /* release the SPI bus */
        Flash_busy_check();
        /****************************************************************************/
        char_opcode  = 0x84;                                  /* write buffer1 */
        FLASH_CHIP_SELECT();                                   /* select Flash  */
        PORTB &=~ (1<<PB0);//                                   /* SS=0 startup the SPI */
        /****************************************************************************/
        SPI_command_set( char_opcode, real_pageaddr_H, real_pageaddr_L, Flash_buff_A);
        for (int_number=0; int_number<TOTAL; int_number++ )  /* write to buffer1 */
        {
            wrdata  = * WrData;
            SPI_write(wrdata);
            WrData++;
        }
        FLASH_CHIP_UNSELECT();                                  /* startup write buffer1 address defined by user */
        /****************************************************************************/
        char_opcode  = 0x83;                                  /* buffer1 to main memory page with in-bulit earse */
        FLASH_CHIP_SELECT();                                   /* select Flash */
        SPI_command_set( char_opcode, real_pageaddr_H, real_pageaddr_L, Flash_buff_A);
        FLASH_CHIP_UNSELECT();                                  /* startup write to main memory page with in-bulit earse */
        PORTB  |=  (1<<PB0);//                                  /* SS=1 stop the SPI */
        Flash_busy_check();
/*********************************************data compare with Flash***********************************************/
        char_opcode   = 0x60;
        FLASH_CHIP_SELECT();                                   /* select Flash */
        PORTB &=~ (1<<PB0);//                                   /* SS=0 startup the SPI */
        SPI_command_set( char_opcode, real_pageaddr_H, real_pageaddr_L, Flash_buff_A);
        FLASH_CHIP_UNSELECT();                                  /* startup write to main memory page with in-bulit earse */
        PORTB  |=  (1<<PB0);//                                  /* SS=1 stop the SPI */
        Flash_busy_check();
        /***********************************register reading*************************/
        char_opcode   = 0xD7;
        FLASH_CHIP_SELECT();                                   /* select Flash */
        PORTB &=~ (1<<PB0);//                                   /* SS=0 startup the SPI */
        SPI_command_set( char_opcode, real_pageaddr_H, real_pageaddr_L, Flash_buff_A);
        FLASH_CHIP_UNSELECT();
        Flash_busy_check();
        if ( SPDR & 0x40 )
        {
            flag = 0;                                         /* page error */
        }
        else
        {
            flag = 1;                                        /* page right */
        }
/***********************************************addup page number***************************************************/
        total = total - TOTAL;
        int_i++;                                             /* turn next page */
        OFFSET = 0;
     }

     PORTD = PORTtemp1;                           /* restore the Port status */
     PORTF = PORTtemp2;
     SREG = tempsreg;                             /* restore the SREG */
     OS_EXIT_CRITICAL();                          /*open the interrupt */
     return (flag);
}


/*
*
* Discription:
*
*/
uchar Flash_Read(uint PageNo,uint offset,uchar * RdData, uint TotalBytes)
{
     uint number;
     uchar cpu_sr,tempsreg,PORTtemp1 = 0,PORTtemp2 = 0;
     uchar real_pageaddr_H;                        //PageNo+offset
     uchar real_pageaddr_L;
     uchar Flash_buff_A;
     uchar *real_address;
     uchar char_opcode  = 0xE8;                    //cuntinuous array read

     PORTtemp1 |= PORTD&0xff;                          /* save Port status */
     PORTtemp2 |= PORTF&0xff;
     tempsreg=SREG;                                    /* save SREG */
     OS_ENTER_CRITICAL();                              /* close interrput */

     if ( PageNo > 1819)
     {
          return(0);
     }
     real_address = address_convert( PageNo, offset );
     real_pageaddr_H = *real_address;
     real_pageaddr_L = *(++real_address);
     Flash_buff_A = *(++real_address);
     /********************************************************************************/
     FLASH_CHIP_SELECT();                                   //select Flash
     PORTB &=~ (1<<PB0);//                                   //SS=0 startup the SPI
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
     SPI_command_set( char_opcode, real_pageaddr_H, real_pageaddr_L, Flash_buff_A );
     SPI_write(0x00);                                //another 4 don't-care bytes
     SPI_write(0x00);
     SPI_write(0x00);
     SPI_write(0x00);
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
     for ( number=0; number<TotalBytes; number++)          //read from the flash
     {
       * RdData = SPI_read();
       RdData++;
     }
     FLASH_CHIP_UNSELECT();                                  //read block 0 stop
     PORTB  |=  (1<<PB0);//                                  //SS=1 stop the SPI
     Flash_busy_check();

     PORTD = PORTtemp1;                           /* restore the Port status */
     PORTF = PORTtemp2;
     SREG = tempsreg;                             /* restore the SREG */
     OS_EXIT_CRITICAL();                          /*open the interrupt */
     return (1);
}
