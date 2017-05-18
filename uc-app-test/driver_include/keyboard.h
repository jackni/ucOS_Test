
//keyboard: ASC15 set or release
#define KEY_SCAN_ENABLE() PORTD&=0x7f//0b01111111
#define KEY_SCAN_DISABLE() PORTD|=0x80//0b10000000
#define KEY_SCAN_IN (*(volatile unsigned char *)0xfffc)
#define KEY_SCAN_OUT (*(volatile unsigned char *)0xfffd)

/*
**************************************************************************************************
*  Function1 key: up; down; right; left; ok; F1; F2 .
**************************************************************************************************
*/

#define keyup  2
#define keydown 8
#define keyleft 4
#define keyright 6
#define keyok 5
#define keyF1 7
#define keyF2 9
#define keyCancel 3
#define keyReturn 1
#

/*
*************************************************************************************************
*
*  Fucntion2 key: plus; chinese mode
*
*************************************************************************************************
*/

#define keyPlus 10
#define keyMiddle 18

/*
*************************************************************************************************
*
*  Number key: number 0~9
*
*************************************************************************************************
*/

#define KeyNum0 14
#define KeyNum1 11
#define KeyNum2 12
#define KeyNum3 13
#define KeyNum4 15
#define KeyNum5 16
#define KeyNum6 17
#define KeyNum7 19
#define KeyNum8 20
#define KeyNum9 21


