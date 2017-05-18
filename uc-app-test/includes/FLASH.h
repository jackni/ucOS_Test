
/*
*
* Macro definition
*
*/

#define BUSY 1
#define FLASH_BUSY_CHECK()  PINF & 0x02        //FLASH BUSY CHECK
#define FLASH_CHIP_SELECT() PORTD &=~ (1<<PD5) //PD5 = 0 flash select
#define FLASH_CHIP_UNSELECT() PORTD |= (1<<PD5)//PD5 = 1 flash select
#define FLASH_BUSY_CHECK_ENABLE()  {\
                                    DDRF &=~ (1<<DDF1); /*set the pf1 input mode to get the state of Flash*/\
                                    PORTF |= (1<<PF1);  /*enable internal pullup resister*/\
                                   }


/*
*
* Function definiation
*
*/

void Flash_Init(void);
void Flash_busy_check(void);
uchar *address_convert(uint pagenumber, uint offset);
void  SPI_command_set(uchar char_opcode, uchar  page_addr_high, uchar page_addr_low_buff_high, uchar buff_low);
uchar Flash_Write(uint PageNo,uint offset,uchar * WrData, uint TotalBytes);
uchar Flash_Read(uint PageNo,uint offset,uchar * RdData, uint TotalBytes);

