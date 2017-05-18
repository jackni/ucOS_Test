
//keyboard: ASC15 set or release

#define  KEY_BUF_SIZE               10      /* Size of the KEYBOARD buffer*/
#define KEY_SCAN_ENABLE() PORTD &=~(1<<PD7)//0b01111111
#define KEY_SCAN_DISABLE() PORTD |= (1<<PD7)//0b10000000

#define KEY_SCAN_IN (*(volatile unsigned char *)0xfffc)
#define KEY_SCAN_OUT (*(volatile unsigned char *)0xfffe)

#define KEY_STATE_UP                 1      /* Key scanning states used in KeyScan()                   */
#define KEY_STATE_DEBOUNCE           2
#define KEY_STATE_RPT_START_DLY      3
#define KEY_STATE_RPT_DLY            4
#define KEY_SCAN_TASK_DLY           50      /* Number of milliseconds between keyboard scans           */
#define KEY_RPT_DLY                  2      /* Number of scan times before auto repeat executes again  */
#define KEY_RPT_START_DLY           10      /* Number of scan times before auto repeat function engages*/


extern OS_EVENT *KeySemPtr;
extern uchar keypressed;
extern INT8U KeyBuf[KEY_BUF_SIZE];     /* Keyboard buffer                                         */
extern INT8U KeyBufInIx;               /* Index into key buf where next scan code will be inserted*/
extern INT8U KeyBufOutIx;              /* Index into key buf where next scan code will be removed */
extern INT8U KeyNRead;                 /* Number of keys read from the keyboard                   */
extern INT16U KeyDownTmr;               /* Counts how long key has been pressed  */
extern INT8U  KeyRptStartDlyCtr;        /* Number of scan times before auto repeat is started */
extern INT8U  KeyRptDlyCtr;             /* Number of scan times before auto repeat executes again  */
extern INT8U  KeyScanState;             /* Current state of key scanning function */

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

/*
*************************************************************************************************
*
*  Key board scan Function
*
*************************************************************************************************
*/

void KeyBoard_Init(void);
INT8U  KeyDecode (void);
void  KeyBufIn (INT8U code);
INT8U  KeyGetKey (INT16U to);
uchar KeyHit(void);
BOOLEAN  KeyIsKeyDown (void);
