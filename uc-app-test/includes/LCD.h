#define LCDCTRLREG (*(volatile unsigned char *)0xfeff)
#define LCDDATAREG (*(volatile unsigned char *)0xffff)

#define INITBKCOLOR_R      0//51 //10
#define INITBKCOLOR_G      0//127//50
#define INITBKCOLOR_B      255//199//10

#define INITTEXTCOLOR_R    0
#define INITTEXTCOLOR_G    0
#define INITTEXTCOLOR_B    255

extern uchar COMMONTEMP[1063];
extern uchar BLKGND_R;
extern uchar BLKGND_G;
extern uchar BLKGND_B;
extern uchar Text_R;
extern uchar Text_G;
extern uchar Text_B;
extern uchar BK_Trans1;   //cited in comm
extern uchar BK_Trans2;
extern uchar Text_Trans1; //cited in comm
extern uchar Text_Trans2;

extern OS_EVENT *DispSem;
/*************************************************************
*
*                        define macro
*
*************************************************************/

#define    PD1      1
#define LCD_CHIP_ENABLE()  PORTD &= ~(1<<PD1)       //changed by Jack
#define LCD_CHIP_DISABLE() PORTD |= (1<<PD1)        //changed by Jack

#define    PG3      3
#define LCD_RST_VALID()    PORTG &= ~(1<<PG3)       //changed by Jack
#define LCD_RST_INVALID()  PORTG |=  (1<<PG3)       //changed by Jack

#define WRITE_DATA0(p0)    LCDDATAREG = p0;

#define WRITE_CMD0(cmd)    LCDCTRLREG = cmd;

#define READ_DATA0(r)       {                   \
                            LCD_CHIP_ENABLE();  \
                            r = LCDDATAREG;     \
                            LCD_CHIP_DISABLE(); \
                            }

#define READ_CMD0(r)        {                   \
                            LCD_CHIP_ENABLE();  \
                            r = LCDCTRLREG;     \
                            LCD_CHIP_DISABLE(); \
                            }

#define LCD_BK_LIGHT_ON() PORTB |= (1<<PB6)
#define LCD_BK_LIGHT_OFF() PORTB &= ~(1<<PB6)

#define LCD_XSIZE               (128)
#define LCD_YSIZE               (160)

#define SELECT 1
#define UNSELECT 0
/***********************************************************************
*
*                         function define
*
************************************************************************/

void LCD_Reset(void);
void LCD_WriteData0(char Data);
void LCD_WriteNonParaCommand0(char cmd);
void LCD_WriteSingleCommand0(char cmd,char P1);
void LCD_WriteDoubleCommand0(char cmd,char P1, char P2);
void LCD_WriteTripleCommand0(char cmd,char P1, char P2, char P3);
uchar LCD_ReadData0(void);
uchar LCD_ReadCmd0(void);

void DispInit(void);
void DispClrScr(void);
void DispChar(uchar Col,uchar Row,uchar pos,uchar type);//display one character at the given Row and Col
void SetBKColor(uchar R,uchar G,uchar B);
void SetTextColor(uchar R,uchar G,uchar B);
void DispNewChar(uint ColRow,uint postype);//display a new character at the given Row and Col
void DispClrRow(uchar Row);
void DispClrCol(uchar Col);
void DispCharColor(uchar Col,uchar Row,uchar pos,uchar type,uchar R,uchar G,uchar B);//display one character at the given Row and Col with color
void Logo_disp(void);
void DispMenuSelect(uchar Col,uchar Row, uchar select);
