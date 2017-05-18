

#include "includes.h"

INT8U     KeyBuf[KEY_BUF_SIZE];     /* Keyboard buffer                                         */
INT8U     KeyBufInIx;               /* Index into key buf where next scan code will be inserted*/
INT8U     KeyBufOutIx;              /* Index into key buf where next scan code will be removed */
INT8U     KeyNRead;                 /* Number of keys read from the keyboard                   */
INT16U    KeyDownTmr;
INT8U     KeyRptStartDlyCtr;
INT8U     KeyRptDlyCtr;
INT8U     KeyScanState;

uchar keypressed;  /*key press flag to see whether */
OS_EVENT *KeySemPtr;
/*
**************************************************************************************************
Function discription:   keyboard scan

Global variable: key_number

**************************************************************************************************
*/
void KeyBoard_Init(void)
{
  uchar PORT_temp = 0x00;
  PORT_temp |= PORTD&0xff;               //save port status

  KeyNRead     = 0;                            /* Clear the number of keys read                      */
  KeyDownTmr   = 0;
  KeyBufInIx   = 0;                            /* Key codes inserted at  the beginning of the buffer */
  KeyBufOutIx  = 0;                            /* Key codes removed from the beginning of the buffer */

  SRAM_DISABLE();

  KeyScanState = KEY_STATE_UP;
  KEY_SCAN_ENABLE();
  KEY_SCAN_OUT=0x00;
  keypressed = 0;
  KEY_SCAN_DISABLE();
  PORTD = PORT_temp;
}

void  KeyBufIn (INT8U code)
{
    uchar cpu_sr;
    OS_ENTER_CRITICAL();                         /* Start of critical section of code, disable ints    */
    if (KeyNRead < KEY_BUF_SIZE) {               /* Make sure that we don't overflow the buffer        */
        KeyNRead++;                              /* Increment the number of keys read                  */
        KeyBuf[KeyBufInIx++] = code;             /* Store the scan code into the buffer                */
        if (KeyBufInIx >= KEY_BUF_SIZE) {        /* Adjust index to the next scan code to put in buffer*/
            KeyBufInIx = 0;
        }
        OS_EXIT_CRITICAL();                      /* End of critical section of code                    */
        OSSemPost(KeySemPtr);                    /* Signal sem if scan code inserted in the buffer     */
    } else {                                     /* Buffer is full, key scan code is lost              */
        OS_EXIT_CRITICAL();                      /* End of critical section of code                    */
    }
}


INT8U  KeyDecode (void)
{
  INT8U msk,code=0xff;
  uchar PORT_temp =0x00;
  PORT_temp |= PORTD&0xff; //save port status

  SRAM_DISABLE();//disable exrern sram
  msk=0x3f;//b00111111;
  KEY_SCAN_ENABLE();
  KEY_SCAN_OUT=msk&0xfe;//0b11111110;  //KO0
  if(!(KEY_SCAN_IN&0x01))code=1; //KI0 R
  if(!(KEY_SCAN_IN&0x02))code=2; //KI1 UP
  if(!(KEY_SCAN_IN&0x04))code=3; //KI2 C
  KEY_SCAN_OUT=msk&0xfd;//0b11111101;  //KO1
  if(!(KEY_SCAN_IN&0x01))code=4; //KI0 LEFT
  if(!(KEY_SCAN_IN&0x02))code=5; //KI1 OK
  if(!(KEY_SCAN_IN&0x04))code=6; //KI2 RIGHT
  KEY_SCAN_OUT=msk&0xfb;//0b11111011;  //KO2
  if(!(KEY_SCAN_IN&0x01))code=7; //KI0 F1
  if(!(KEY_SCAN_IN&0x02))code=8; //KI1 down
  if(!(KEY_SCAN_IN&0x04))code=9; //KI2 F2
  if(!(KEY_SCAN_IN&0x08))code=10;//KI3 +/-
  KEY_SCAN_OUT=msk&0xf7;//0b11110111;  //KO3
  if(!(KEY_SCAN_IN&0x01))code=11; //KI0 1
  if(!(KEY_SCAN_IN&0x02))code=12; //KI1 2
  if(!(KEY_SCAN_IN&0x04))code=13; //KI2 3
  if(!(KEY_SCAN_IN&0x08))code=14; //KI3 0
  KEY_SCAN_OUT=msk&0xef;//0b11101111;  //KO4
  if(!(KEY_SCAN_IN&0x01))code=15; //KI0 4
  if(!(KEY_SCAN_IN&0x02))code=16; //KI1 5
  if(!(KEY_SCAN_IN&0x04))code=17; //KI2 6
  if(!(KEY_SCAN_IN&0x08))code=18;//KI3  mode
  KEY_SCAN_OUT=msk&0xdf;//b11011111;  //KO5
  if(!(KEY_SCAN_IN&0x01))code=19; //KI0 7
  if(!(KEY_SCAN_IN&0x02))code=20; //KI1 8
  if(!(KEY_SCAN_IN&0x04))code=21; //KI2
  KEY_SCAN_OUT=0x00;
  PORTD = PORT_temp;//restore the port status
  KEY_SCAN_DISABLE();
  return (code);    /* Return scan code  */
}

uchar KeyHit(void) /*to see */
{
  BOOLEAN hit;
  uchar cpu_sr;
  OS_ENTER_CRITICAL();
  hit = (BOOLEAN)(KeyNRead > 0) ? 1 : 0;
  OS_EXIT_CRITICAL();
  return (hit);
}

INT8U  KeyGetKey (INT16U to)
{
    INT8U code;
    INT8U err;
    uchar cpu_sr;
    OSSemPend(KeySemPtr, to, &err);              /* Wait for a key to be pressed                       */
    OS_ENTER_CRITICAL();                         /* Start of critical section of code, disable ints    */
    if (KeyNRead > 0) {                          /* See if we have keys in the buffer                  */
        KeyNRead--;                              /* Decrement the number of keys read                  */
        code = KeyBuf[KeyBufOutIx];              /* Get scan code from the buffer                      */
        KeyBufOutIx++;
        if (KeyBufOutIx >= KEY_BUF_SIZE) {       /* Adjust index into the keyboard buffer              */
            KeyBufOutIx = 0;
        }
        OS_EXIT_CRITICAL();                      /* End of critical section of code                    */
        return (code);                           /* Return the scan code of the key pressed            */
    } else {
        OS_EXIT_CRITICAL();                      /* End of critical section of code                    */
        return (0xFF);                           /* No scan codes in the buffer, return -1             */
    }
}

INT32U  KeyGetKeyDownTime (void)
{
    INT16U tmr;
    uchar cpu_sr;
    OS_ENTER_CRITICAL();
    tmr = KeyDownTmr;
    OS_EXIT_CRITICAL();
    return (tmr * KEY_SCAN_TASK_DLY);
}

BOOLEAN  KeyIsKeyDown (void)
{
  uchar cpu_sr;
  if ((PINE&0x40) == 0)
  {
    OS_ENTER_CRITICAL();
    KeyDownTmr++;                                      /* Update key down counter                  */
    OS_EXIT_CRITICAL();
    keypressed = 0;
    return (1);
  }
  else
  {
    keypressed = 0;
    return (0);
  }
}

