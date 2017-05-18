#include  "includes.h"

OS_STK AppTaskStartStk[OS_TASK_START_STK_SIZE];
OS_STK AppTask1Stk[OS_TASK_1_STK_SIZE];
//OS_STK AppTask2Stk[OS_TASK_2_STK_SIZE];
OS_STK KeyScanTaskStk[OS_TASK_4_STK_SIZE];

void AppTaskStart(void *p_arg);
void AppTask1(void *p_arg);
void AppTask2(void *p_arg);
void KeyScanTask(void *p_arg);
void loading_display(void);
void Keyvaltst(uchar value);

void  main (void)
{
  OSTaskStkSize     = OS_TASK_IDLE_STK_SIZE;       /* Setup the default stack size                        */
  OSTaskStkSizeHard = OS_TASK_IDLE_STK_SIZE_HARD;  /* Setup the default hardware stack size               */

  BSP_Init();
  DispInit();
  loading_display();
  KeyBoard_Init();

  OSInit();

  KeySemPtr = OSSemCreate(0);
  DispSem = OSSemCreate(1);

  OSTaskStkSize = OS_TASK_START_STK_SIZE;
  OSTaskStkSizeHard = OS_TASK_START_STK_SIZE_HARD;
  OSTaskCreate(AppTaskStart,(void*)0,&AppTaskStartStk[OSTaskStkSize-1],OS_TASK_START_PRIO);

  OSTaskStkSize     = OS_TASK_1_STK_SIZE;        /* Setup the default stack size                     */
  OSTaskStkSizeHard = OS_TASK_1_STK_SIZE_HARD;   /* Setup the default hardware stack size            */
  OSTaskCreate(AppTask1,(void*)0,(OS_STK*)&AppTask1Stk[OSTaskStkSize - 1],OS_TASK_1_PRIO);

  //OSTaskStkSize     = OS_TASK_2_STK_SIZE;        /* Setup the default stack size                     */
  //OSTaskStkSizeHard = OS_TASK_2_STK_SIZE_HARD;   /* Setup the default hardware stack size            */
  //OSTaskCreate(AppTask2,(void*)0,(OS_STK*)&AppTask2Stk[OSTaskStkSize - 1],OS_TASK_2_PRIO);

  OSTaskStkSize = OS_TASK_4_STK_SIZE;
  OSTaskStkSizeHard = OS_TASK_4_STK_SIZE_HARD;
  OSTaskCreate(KeyScanTask,(void*)0,(OS_STK*)&KeyScanTaskStk[OSTaskStkSize-1],OS_KEY_PRIO);

  OSStart();
}

void AppTaskStart(void *p_arg)
{
  p_arg = p_arg;
  BSP_Init();
  while(1)
  {
    BSP_InitTickISR();
    OSTimeDly(100);
  }
}

void AppTask1(void *p_arg)  //for keyboard test
{
  uchar temp;
  p_arg = p_arg;
  while(1)
  {
    if (KeyHit())
    {
      temp = KeyGetKey(0);
      if (temp != 0xff)
      {
        beeper(170,170);
        Keyvaltst(temp);
      }
    }
    OSTimeDlyHMSM(0,0,0,200);
  }
}

void AppTask2(void *p_arg)
{
  p_arg = p_arg;
  while(1)
  {
    blink();
    OSTimeDlyHMSM(0,0,0,200);
  }
}

void  KeyScanTask (void *data)
{
  INT8U code;
  data = data;                                           /* Avoid compiler warning (uC/OS-II req.)   */
    while(1)
    {
        OSTimeDlyHMSM(0, 0, 0, 200 );         /* Delay between keyboard scans             */
        switch (KeyScanState) {
            case KEY_STATE_UP:                             /* See if need to look for a key pressed    */
                 if (KeyIsKeyDown()) {                     /* See if key is pressed                    */
                     KeyScanState = KEY_STATE_DEBOUNCE;    /* Next call we will have debounced the key */
                     KeyDownTmr   = 0;                     /* Reset key down timer                     */
                 }
                 break;

            case KEY_STATE_DEBOUNCE:                       /* Key pressed, get scan code and buffer    */
                 if (KeyIsKeyDown()) {                     /* See if key is pressed                    */
                     code              = KeyDecode();      /* Determine the key scan code              */
                     KeyBufIn(code);                       /* Input scan code in buffer                */
                     KeyRptStartDlyCtr = KEY_RPT_START_DLY;/* Start delay to auto-repeat function      */
                     KeyScanState      = KEY_STATE_RPT_START_DLY;
                 } else {
                   KEY_SCAN_ENABLE();
                   KEY_SCAN_OUT=0x00;
                   KEY_SCAN_DISABLE();
                   KeyScanState      = KEY_STATE_UP;     /* Key was not pressed after all!           */
                 }
                 break;

            case KEY_STATE_RPT_START_DLY:
                 if (KeyIsKeyDown()) {                     /* See if key is still pressed              */
                     if (KeyRptStartDlyCtr > 0) {          /* See if we need to delay before auto rpt  */
                         KeyRptStartDlyCtr--;              /* Yes, decrement counter to start of rpt   */
                         if (KeyRptStartDlyCtr == 0) {     /* If delay to auto repeat is completed ... */
                             code         = KeyDecode();   /* Determine the key scan code              */
                             KeyBufIn(code);               /* Input scan code in buffer                */
                             KeyRptDlyCtr = KEY_RPT_DLY;   /* Load delay before next repeat            */
                             KeyScanState = KEY_STATE_RPT_DLY;
                         }
                     }
                 } else {
                     KeyScanState = KEY_STATE_DEBOUNCE;    /* Key was not pressed after all            */
                 }
                 break;

            case KEY_STATE_RPT_DLY:
                 if (KeyIsKeyDown()) {                     /* See if key is still pressed              */
                     if (KeyRptDlyCtr > 0) {               /* See if we need to wait before repeat key */
                         KeyRptDlyCtr--;                   /* Yes, dec. wait time to next key repeat   */
                         if (KeyRptDlyCtr == 0) {          /* See if it's time to repeat key           */
                             code         = KeyDecode();   /* Determine the key scan code              */
                             KeyBufIn(code);               /* Input scan code in buffer                */
                             KeyRptDlyCtr = KEY_RPT_DLY;   /* Reload delay counter before auto repeat  */
                         }
                     }
                 } else {
                     KeyScanState = KEY_STATE_DEBOUNCE;    /* Key was not pressed after all            */
                 }
                 break;
        }
    }
}


void loading_display(void)
{
   DispClrScr();
   //DispCharColor (Col,Row,character postion, type,color )
   //DispCharColor(4,0,21,1,255,0,0);//L
   //DispCharColor(5,0,50,1,0,255,0);//o
   //DispCharColor(6,0,36,1,0,0,255);//a
   //DispCharColor(7,0,39,1,255,255,0);//d
   //DispCharColor(8,0,44,1,0,255,255);//i
   //DispCharColor(9,0,49,1,255,0,255);//n
   //DispCharColor(10,0,42,1,0,0,0);//g
   Logo_disp();

}


void Keyvaltst(uchar value)
{
  //DispCharColor (Col,Row,character postion, type,color )
  switch (value)
  {
    case KeyNum0:
    {
      DispCharColor(10,2,0,1,255,0,255);break;
    }
    case KeyNum1:
    {
      DispCharColor(1,2,1,1,255,0,255);break;
    }
    case KeyNum2:
    {
      DispCharColor(2,2,2,1,255,0,255);break;
    }
    case KeyNum3:
    {
      DispCharColor(3,2,3,1,255,0,255);break;
    }
    case KeyNum4:
    {
      DispCharColor(4,2,4,1,255,0,255);break;
    }
    case KeyNum5:
    {
      DispCharColor(5,2,5,1,255,0,255);break;
    }
    case KeyNum6:
    {
      DispCharColor(6,2,6,1,255,0,255);break;
    }
    case KeyNum7:
    {
      DispCharColor(7,2,7,1,255,0,255);break;
    }
    case KeyNum8:
    {
      DispCharColor(8,2,8,1,255,0,255);break;
    }
    case KeyNum9:
    {
      DispCharColor(9,2,9,1,255,0,255);break;
    }
    case keyCancel:
    {
      DispClrRow(2);break;
    }
    case keyReturn:
    {
      DispClrScr();break;
    }
    case keyF1:
    {
      DispMenuSelect(7,2,1); break;
    }
  }
}
