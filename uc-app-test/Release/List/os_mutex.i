












 













 







 






 











 





 










 








 





 
 





 
































 


                                        


                                        


                                        



                                        






                                        



                                        


                                        


                                        


                                        


                                        


                                        


                                        













 







 

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

 




 


 




 

extern  INT32U            OSCtxSwCtr;                

extern  OS_EVENT         *OSEventFreeList;           
extern  OS_EVENT          OSEventTbl[5]; 



extern  INT8U             OSIntNesting;              

extern  INT8U             OSLockNesting;             

extern  INT8U             OSPrioCur;                 
extern  INT8U             OSPrioHighRdy;             

extern  INT8U             OSRdyGrp;                         
extern  INT8U             OSRdyTbl[((16) / 8 + 1)];        

extern  BOOLEAN           OSRunning;                        

extern  INT8U             OSTaskCtr;                        

extern  volatile  INT32U  OSIdleCtr;                                  

extern  OS_STK            OSTaskIdleStk[100];       


extern  OS_TCB           *OSTCBCur;                         
extern  OS_TCB           *OSTCBFreeList;                    
extern  OS_TCB           *OSTCBHighRdy;                     
extern  OS_TCB           *OSTCBList;                        
extern  OS_TCB           *OSTCBPrioTbl[16 + 1]; 
extern  OS_TCB            OSTCBTbl[16 + 1u];    

extern  INT8U             OSTickStepState;           





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







 


 










 





 












 










 








 








 













 









 





















 









 







 

























