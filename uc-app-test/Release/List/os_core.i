












 













 







 






 











 





 










 








 





 
 





 
































 


                                        


                                        


                                        



                                        






                                        



                                        


                                        


                                        


                                        


                                        


                                        


                                        













 







 

typedef unsigned char  BOOLEAN;
typedef unsigned char  INT8U;                     
typedef signed   char  INT8S;                     
typedef unsigned int   INT16U;                    
typedef signed   int   INT16S;                    
typedef unsigned long  INT32U;                    
typedef signed   long  INT32S;                    
typedef float          FP32;                      

typedef unsigned char  OS_STK;                    
typedef unsigned char  OS_CPU_SR;                 
































 









 







 

extern  INT16U  OSTaskStkSize;
extern  INT16U  OSTaskStkSizeHard;





 

OS_CPU_SR  OS_CPU_SR_Save(void);
void       OS_CPU_SR_Restore(OS_CPU_SR  cpu_sr);

void       OSStartHighRdy(void);
void       OSCtxSw(void);
void       OSIntCtxSw(void);





 











 




 






 

                                             





 














 






 







 





 





 







 





 



















 




 

typedef struct os_event {
    INT8U    OSEventType;                     
    void    *OSEventPtr;                      
    INT16U   OSEventCnt;                      
    INT8U    OSEventGrp;                      
    INT8U    OSEventTbl[((16) / 8 + 1)];   

    INT8U    OSEventName[20];
} OS_EVENT;






 


 




 






 


 




 






 






 

typedef struct os_sem_data {
    INT16U  OSCnt;                           
    INT8U   OSEventTbl[((16) / 8 + 1)];   
    INT8U   OSEventGrp;                      
} OS_SEM_DATA;





 


 




 

typedef struct os_tcb {
    OS_STK          *OSTCBStkPtr;       


    struct os_tcb   *OSTCBNext;         
    struct os_tcb   *OSTCBPrev;         

    OS_EVENT        *OSTCBEventPtr;     



    INT16U           OSTCBDly;          
    INT8U            OSTCBStat;         
    BOOLEAN          OSTCBPendTO;       
    INT8U            OSTCBPrio;         

    INT8U            OSTCBX;            
    INT8U            OSTCBY;            
    INT8U            OSTCBBitX;         
    INT8U            OSTCBBitY;         


    INT32U           OSTCBCtxSwCtr;     
    INT32U           OSTCBCyclesTot;    
    INT32U           OSTCBCyclesStart;  
    OS_STK          *OSTCBStkBase;      
    INT32U           OSTCBStkUsed;      

    INT8U            OSTCBTaskName[16];
} OS_TCB;

 




 


 




 

  INT32U            OSCtxSwCtr;                

  OS_EVENT         *OSEventFreeList;           
  OS_EVENT          OSEventTbl[5]; 



  INT8U             OSIntNesting;              

  INT8U             OSLockNesting;             

  INT8U             OSPrioCur;                 
  INT8U             OSPrioHighRdy;             

  INT8U             OSRdyGrp;                         
  INT8U             OSRdyTbl[((16) / 8 + 1)];        

  BOOLEAN           OSRunning;                        

  INT8U             OSTaskCtr;                        

  volatile  INT32U  OSIdleCtr;                                  

  OS_STK            OSTaskIdleStk[100];       


  OS_TCB           *OSTCBCur;                         
  OS_TCB           *OSTCBFreeList;                    
  OS_TCB           *OSTCBHighRdy;                     
  OS_TCB           *OSTCBList;                        
  OS_TCB           *OSTCBPrioTbl[16 + 1]; 
  OS_TCB            OSTCBTbl[16 + 1u];    

  INT8U             OSTickStepState;           





extern  INT8U   const     OSUnMapTbl[256];           

 





 





 

INT8U         OSEventNameGet        (OS_EVENT        *pevent, 
                                     INT8U           *pname, 
                                     INT8U           *err);

void          OSEventNameSet        (OS_EVENT        *pevent, 
                                     INT8U           *pname, 
                                     INT8U           *err);





 






 






 






 


 




 


 




 

INT16U        OSSemAccept           (OS_EVENT        *pevent);

OS_EVENT     *OSSemCreate           (INT16U           cnt);

OS_EVENT     *OSSemDel              (OS_EVENT        *pevent, 
                                     INT8U            opt, 
                                     INT8U           *err);

void          OSSemPend             (OS_EVENT        *pevent, 
                                     INT16U           timeout, 
                                     INT8U           *err);

INT8U         OSSemPost             (OS_EVENT        *pevent);


void          OSSemSet              (OS_EVENT        *pevent, 
                                     INT16U           cnt, 
                                     INT8U           *err);


 




 

INT8U         OSTaskCreate          (void           (*task)(void *p_arg), 
                                     void            *p_arg, 
                                     OS_STK          *ptos, 
                                     INT8U            prio);



INT8U         OSTaskNameGet         (INT8U            prio, 
                                     INT8U           *pname, 
                                     INT8U           *err);

void          OSTaskNameSet         (INT8U            prio, 
                                     INT8U           *pname, 
                                     INT8U           *err);




 




 

void          OSTimeDly             (INT16U           ticks);

INT8U         OSTimeDlyHMSM         (INT8U            hours, 
                                     INT8U            minutes, 
                                     INT8U            seconds, 
                                     INT16U           milli);



void          OSTimeTick            (void);





 






 

void          OSInit                (void);

void          OSIntEnter            (void);
void          OSIntExit             (void);


void          OSStart               (void);

void          OSStatInit            (void);

INT16U        OSVersion             (void);

 





 


INT8U         OS_EventTaskRdy       (OS_EVENT        *pevent, 
                                     void            *msg, 
                                     INT8U            msk);

void          OS_EventTaskWait      (OS_EVENT        *pevent);

void          OS_EventTO            (OS_EVENT        *pevent);

void          OS_EventWaitListInit  (OS_EVENT        *pevent);


void          OS_MemClr             (INT8U           *pdest, 
                                     INT16U           size);

void          OS_MemCopy            (INT8U           *pdest, 
                                     INT8U           *psrc, 
                                     INT16U           size);



void          OS_Sched              (void);

INT8U         OS_StrCopy            (INT8U           *pdest, 
                                     INT8U           *psrc);

INT8U         OS_StrLen             (INT8U           *psrc);

void          OS_TaskIdle           (void            *p_arg);




INT8U         OS_TCBInit            (INT8U            prio, 
                                     OS_STK          *ptos, 
                                     OS_STK          *pbos, 
                                     INT16U           id, 
                                     INT32U           stk_size, 
                                     void            *pext, 
                                     INT16U           opt);


 





 


void          OSInitHookBegin       (void);
void          OSInitHookEnd         (void);

void          OSTaskCreateHook      (OS_TCB          *ptcb);
void          OSTaskDelHook         (OS_TCB          *ptcb);

void          OSTaskIdleHook        (void);

void          OSTaskStatHook        (void);
OS_STK       *OSTaskStkInit         (void           (*task)(void *p_arg), 
                                     void            *p_arg, 
                                     OS_STK          *ptos, 
                                     INT16U           opt);

void          OSTaskSwHook          (void);

void          OSTCBInitHook         (OS_TCB          *ptcb);

void          OSTimeTickHook        (void);







 


 










 





 












 










 








 








 













 









 





















 









 







 































 

INT8U  const  OSUnMapTbl[256] = {
    0, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    7, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0         
};

 




 

static  void  OS_InitEventList(void);

static  void  OS_InitMisc(void);

static  void  OS_InitRdyList(void);

static  void  OS_InitTaskIdle(void);


static  void  OS_InitTCBList(void);

static  void  OS_SchedNew(void);

 
























 

INT8U  OSEventNameGet (OS_EVENT *pevent, INT8U *pname, INT8U *err)
{
    INT8U      len;
    OS_CPU_SR  cpu_sr = 0;



    switch (pevent->OSEventType) {
        case 3u:
        case 4u:
        case 1u:
        case 2u:
             break;

        default:
             *err = 1u;
             return (0);
    }
    (cpu_sr = OS_CPU_SR_Save());
    len  = OS_StrCopy(pname, pevent->OSEventName);     
    (OS_CPU_SR_Restore(cpu_sr));
    *err = 0u;
    return (len);
}

 
























 

void  OSEventNameSet (OS_EVENT *pevent, INT8U *pname, INT8U *err)
{
    INT8U      len;
    OS_CPU_SR  cpu_sr = 0;



    switch (pevent->OSEventType) {
        case 3u:
        case 4u:
        case 1u:
        case 2u:
             break;

        default:
             *err = 1u;
             return;
    }
    (cpu_sr = OS_CPU_SR_Save());
    len = OS_StrLen(pname);                            
    if (len > (20 - 1)) {              
        (OS_CPU_SR_Restore(cpu_sr));
        *err = 12u;
        return;
    }
    (void)OS_StrCopy(pevent->OSEventName, pname);      
    (OS_CPU_SR_Restore(cpu_sr));
    *err = 0u;
}

 











 

void  OSInit (void)
{
    OSInitHookBegin();                                            

    OS_InitMisc();                                                

    OS_InitRdyList();                                             

    OS_InitTCBList();                                             

    OS_InitEventList();                                           




    OS_InitTaskIdle();                                            


    OSInitHookEnd();                                              

}
 























 

void  OSIntEnter (void)
{
    if (OSRunning == 1u) {
        if (OSIntNesting < 255u) {
            OSIntNesting++;                       
        }
    }
}
 

















 

void  OSIntExit (void)
{
    OS_CPU_SR  cpu_sr = 0;



    if (OSRunning == 1u) {
        (cpu_sr = OS_CPU_SR_Save());
        if (OSIntNesting > 0) {                             
            OSIntNesting--;
        }
        if (OSIntNesting == 0) {                            
            if (OSLockNesting == 0) {                       
                OS_SchedNew();
                if (OSPrioHighRdy != OSPrioCur) {           
                    OSTCBHighRdy  = OSTCBPrioTbl[OSPrioHighRdy];
                    OSTCBHighRdy->OSTCBCtxSwCtr++;          
                    OSCtxSwCtr++;                           
                    OSIntCtxSw();                           
                }
            }
        }
        (OS_CPU_SR_Restore(cpu_sr));
    }
}
 














 


 













 


 


















 

void  OSStart (void)
{
    if (OSRunning == 0u) {
        OS_SchedNew();                                
        OSPrioCur     = OSPrioHighRdy;
        OSTCBHighRdy  = OSTCBPrioTbl[OSPrioHighRdy];  
        OSTCBCur      = OSTCBHighRdy;
        OSStartHighRdy();                             
    }
}
 


















 

 












 

void  OSTimeTick (void)
{
    OS_TCB    *ptcb;
    BOOLEAN    step;
    OS_CPU_SR  cpu_sr = 0;



    OSTimeTickHook();                                       
    if (OSRunning == 1u) {
        switch (OSTickStepState) {                          
            case 0u:                          
                 step = 1u;
                 break;

            case 1u:                         
                 step = 0u;                           
                 break;

            case 2u:                         
                 step            = 1u;                 
                 OSTickStepState = 1u;
                 break;

            default:                                        
                 step            = 1u;
                 OSTickStepState = 0u;
                 break;
        }
        if (step == 0u) {                             
            return;
        }
        ptcb = OSTCBList;                                   
        while (ptcb->OSTCBPrio != (16)) {      
            (cpu_sr = OS_CPU_SR_Save());
            if (ptcb->OSTCBDly != 0) {                      
                if (--ptcb->OSTCBDly == 0) {                
                                                            
                    if ((ptcb->OSTCBStat & (0x01u | 0x02u | 0x04u | 0x10u | 0x20u)) != 0x00u) {
                        ptcb->OSTCBStat   &= ~(0x01u | 0x02u | 0x04u | 0x10u | 0x20u);                 
                        ptcb->OSTCBPendTO  = 1u;                           
                    } else {
                        ptcb->OSTCBPendTO  = 0u;
                    }

                    if ((ptcb->OSTCBStat & 0x08u) == 0x00u) {   
                        OSRdyGrp               |= ptcb->OSTCBBitY;              
                        OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
                    }
                }
            }
            ptcb = ptcb->OSTCBNext;                         
            (OS_CPU_SR_Restore(cpu_sr));
        }
    }
}
 












 

INT16U  OSVersion (void)
{
    return (283u);
}

 










 


 




















 
INT8U  OS_EventTaskRdy (OS_EVENT *pevent, void *msg, INT8U msk)
{
    OS_TCB  *ptcb;
    INT8U    x;
    INT8U    y;
    INT8U    prio;
    INT8U    bitx;
    INT8U    bity;


    y     = OSUnMapTbl[pevent->OSEventGrp];              
    bity  = (INT8U)(1 << y);
    x     = OSUnMapTbl[pevent->OSEventTbl[y]];
    bitx  = (INT8U)(1 << x);
    prio  = (INT8U)((y << 3) + x);                       

    pevent->OSEventTbl[y] &= ~bitx;                      
    if (pevent->OSEventTbl[y] == 0) {
        pevent->OSEventGrp &= ~bity;                     
    }
    ptcb                 =  OSTCBPrioTbl[prio];          
    ptcb->OSTCBDly       =  0;                           
    ptcb->OSTCBEventPtr  = (OS_EVENT *)0;                
    msg                  = msg;                          
    ptcb->OSTCBPendTO    = 0u;                     
    ptcb->OSTCBStat     &= ~msk;                         
    if (ptcb->OSTCBStat == 0x00u) {                
        OSRdyGrp        |=  bity;                        
        OSRdyTbl[y]     |=  bitx;
    }
    return (prio);
}
 













 
void  OS_EventTaskWait (OS_EVENT *pevent)
{
    INT8U  y;


    OSTCBCur->OSTCBEventPtr = pevent;              
    y                       = OSTCBCur->OSTCBY;    
    OSRdyTbl[y]            &= ~OSTCBCur->OSTCBBitX;
    if (OSRdyTbl[y] == 0) {
        OSRdyGrp &= ~OSTCBCur->OSTCBBitY;          
    }
    pevent->OSEventTbl[OSTCBCur->OSTCBY] |= OSTCBCur->OSTCBBitX;           
    pevent->OSEventGrp                   |= OSTCBCur->OSTCBBitY;
}
 













 
void  OS_EventTO (OS_EVENT *pevent)
{
    INT8U  y;


    y                      = OSTCBCur->OSTCBY;
    pevent->OSEventTbl[y] &= ~OSTCBCur->OSTCBBitX;      
    if (pevent->OSEventTbl[y] == 0x00) {
        pevent->OSEventGrp &= ~OSTCBCur->OSTCBBitY;
    }
    OSTCBCur->OSTCBPendTO   = 0u;                 
    OSTCBCur->OSTCBStat     = 0x00u;              
    OSTCBCur->OSTCBEventPtr = (OS_EVENT *)0;            
}
 












 
void  OS_EventWaitListInit (OS_EVENT *pevent)
{
    INT8U  *ptbl;
    INT8U   i;


    pevent->OSEventGrp = 0;                       
    ptbl               = &pevent->OSEventTbl[0];

    for (i = 0; i < ((16) / 8 + 1); i++) {
        *ptbl++ = 0;
    }
}
 











 

static  void  OS_InitEventList (void)
{
    INT16U     i;
    OS_EVENT  *pevent1;
    OS_EVENT  *pevent2;


    OS_MemClr((INT8U *)&OSEventTbl[0], sizeof(OSEventTbl));  
    pevent1 = &OSEventTbl[0];
    pevent2 = &OSEventTbl[1];
    for (i = 0; i < (5 - 1); i++) {              
        pevent1->OSEventType    = 0u;
        pevent1->OSEventPtr     = pevent2;
        pevent1->OSEventName[0] = '?';                       
        pevent1->OSEventName[1] = (INT8U)0;
        pevent1++;
        pevent2++;
    }
    pevent1->OSEventType            = 0u;
    pevent1->OSEventPtr             = (OS_EVENT *)0;
    pevent1->OSEventName[0]         = '?';
    pevent1->OSEventName[1]         = (INT8U)0;
    OSEventFreeList                 = &OSEventTbl[0];
}
 











 

static  void  OS_InitMisc (void)
{

    OSIntNesting  = 0;                                      
    OSLockNesting = 0;                                      

    OSTaskCtr     = 0;                                      

    OSRunning     = 0u;                               

    OSCtxSwCtr    = 0;                                      
    OSIdleCtr     = 0L;                                     

}
 











 

static  void  OS_InitRdyList (void)
{
    INT8U    i;
    INT8U   *prdytbl;


    OSRdyGrp      = 0;                                      
    prdytbl       = &OSRdyTbl[0];
    for (i = 0; i < ((16) / 8 + 1); i++) {
        *prdytbl++ = 0;
    }

    OSPrioCur     = 0;
    OSPrioHighRdy = 0;

    OSTCBHighRdy  = (OS_TCB *)0;
    OSTCBCur      = (OS_TCB *)0;
}

 











 

static  void  OS_InitTaskIdle (void)
{
    INT8U  err;


    (void)OSTaskCreate(OS_TaskIdle,
                       (void *)0,
                       &OSTaskIdleStk[100 - 1],
                       (16));

    OSTaskNameSet((16), (INT8U *)"uC/OS-II Idle", &err);
}
 











 

 











 

static  void  OS_InitTCBList (void)
{
    INT8U    i;
    OS_TCB  *ptcb1;
    OS_TCB  *ptcb2;


    OS_MemClr((INT8U *)&OSTCBTbl[0],     sizeof(OSTCBTbl));       
    OS_MemClr((INT8U *)&OSTCBPrioTbl[0], sizeof(OSTCBPrioTbl));   
    ptcb1 = &OSTCBTbl[0];
    ptcb2 = &OSTCBTbl[1];
    for (i = 0; i < (16 + 1u - 1); i++) {   
        ptcb1->OSTCBNext = ptcb2;
        ptcb1->OSTCBTaskName[0] = '?';                            
        ptcb1->OSTCBTaskName[1] = (INT8U)0;
        ptcb1++;
        ptcb2++;
    }
    ptcb1->OSTCBNext = (OS_TCB *)0;                               
    ptcb1->OSTCBTaskName[0] = '?';                                
    ptcb1->OSTCBTaskName[1] = (INT8U)0;
    OSTCBList               = (OS_TCB *)0;                        
    OSTCBFreeList           = &OSTCBTbl[0];
}
 


















 

void  OS_MemClr (INT8U *pdest, INT16U size)
{
    while (size > 0) {
        *pdest++ = (INT8U)0;
        size--;
    }
}
 






















 

void  OS_MemCopy (INT8U *pdest, INT8U *psrc, INT16U size)
{
    while (size > 0) {
        *pdest++ = *psrc++;
        size--;
    }
}
 















 

void  OS_Sched (void)
{
    OS_CPU_SR  cpu_sr = 0;



    (cpu_sr = OS_CPU_SR_Save());
    if (OSIntNesting == 0) {                            
        if (OSLockNesting == 0) {                       
            OS_SchedNew();
            if (OSPrioHighRdy != OSPrioCur) {           
                OSTCBHighRdy = OSTCBPrioTbl[OSPrioHighRdy];
                OSTCBHighRdy->OSTCBCtxSwCtr++;          
                OSCtxSwCtr++;                           
                OSCtxSw();                           
            }
        }
    }
    (OS_CPU_SR_Restore(cpu_sr));
}
















 

static  void  OS_SchedNew (void)
{
    INT8U   y;


    y             = OSUnMapTbl[OSRdyGrp];
    OSPrioHighRdy = (INT8U)((y << 3) + OSUnMapTbl[OSRdyTbl[y]]);
}

 

















 

INT8U  OS_StrCopy (INT8U *pdest, INT8U *psrc)
{
    INT8U  len;


    len = 0;
    while (*psrc != (INT8U)0) {
        *pdest++ = *psrc++;
        len++;
    }
    *pdest = (INT8U)0;
    return (len);
}
 














 

INT8U  OS_StrLen (INT8U *psrc)
{
    INT8U  len;


    len = 0;
    while (*psrc != (INT8U)0) {
        psrc++;
        len++;
    }
    return (len);
}
 



















 

void  OS_TaskIdle (void *p_arg)
{
    OS_CPU_SR  cpu_sr = 0;



    (void)p_arg;                                  
    for (;;) {
        (cpu_sr = OS_CPU_SR_Save());
        OSIdleCtr++;
        (OS_CPU_SR_Restore(cpu_sr));
        OSTaskIdleHook();                         
    }
}
 






















 

 










 

 









































 

INT8U  OS_TCBInit (INT8U prio, OS_STK *ptos, OS_STK *pbos, INT16U id, INT32U stk_size, void *pext, INT16U opt)
{
    OS_TCB    *ptcb;
    OS_CPU_SR  cpu_sr = 0;



    (cpu_sr = OS_CPU_SR_Save());
    ptcb = OSTCBFreeList;                                   
    if (ptcb != (OS_TCB *)0) {
        OSTCBFreeList        = ptcb->OSTCBNext;             
        (OS_CPU_SR_Restore(cpu_sr));
        ptcb->OSTCBStkPtr    = ptos;                        
        ptcb->OSTCBPrio      = prio;                        
        ptcb->OSTCBStat      = 0x00u;                 
        ptcb->OSTCBPendTO    = 0u;                    
        ptcb->OSTCBDly       = 0;                           

        pext                 = pext;                        
        stk_size             = stk_size;
        pbos                 = pbos;
        opt                  = opt;
        id                   = id;


        ptcb->OSTCBY         = (INT8U)(prio >> 3);          
        ptcb->OSTCBBitY      = (INT8U)(1 << ptcb->OSTCBY);
        ptcb->OSTCBX         = (INT8U)(prio & 0x07);
        ptcb->OSTCBBitX      = (INT8U)(1 << ptcb->OSTCBX);

        ptcb->OSTCBEventPtr  = (OS_EVENT *)0;               



        ptcb->OSTCBCtxSwCtr    = 0L;                        
        ptcb->OSTCBCyclesStart = 0L;
        ptcb->OSTCBCyclesTot   = 0L;
        ptcb->OSTCBStkBase     = (OS_STK *)0;
        ptcb->OSTCBStkUsed     = 0L;

        ptcb->OSTCBTaskName[0] = '?';                       
        ptcb->OSTCBTaskName[1] = (INT8U)0;

        OSTCBInitHook(ptcb);

        OSTaskCreateHook(ptcb);                             

        (cpu_sr = OS_CPU_SR_Save());
        OSTCBPrioTbl[prio] = ptcb;
        ptcb->OSTCBNext    = OSTCBList;                     
        ptcb->OSTCBPrev    = (OS_TCB *)0;
        if (OSTCBList != (OS_TCB *)0) {
            OSTCBList->OSTCBPrev = ptcb;
        }
        OSTCBList               = ptcb;
        OSRdyGrp               |= ptcb->OSTCBBitY;          
        OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
        OSTaskCtr++;                                        
        (OS_CPU_SR_Restore(cpu_sr));
        return (0u);
    }
    (OS_CPU_SR_Restore(cpu_sr));
    return (70u);
}
