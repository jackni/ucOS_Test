;********************************************************************************************************
;                                               uC/OS-II
;                                         The Real-Time Kernel
;
;                                       ATMEL  AVR Specific code
;
;
; File     : OS_CPU_A.S90
; By       : Jean J. Labrosse
;********************************************************************************************************

//#include        <os_cpu_i.s90>


BIT00   = 0x01
BIT01   = 0x02
BIT02   = 0x04
BIT03   = 0x08
BIT04   = 0x10
BIT05   = 0x20
BIT06   = 0x40
BIT07   = 0x80

;********************************************************************************************************
;                                           I/O PORT ADDRESSES
;********************************************************************************************************

SREG    = 0x3F
SPH     = 0x3E
SPL     = 0x3D
RAMPZ   = 0x3B

;********************************************************************************************************
;                                                MACROS
;********************************************************************************************************

PUSH_ALL        MACRO                               ; Save all registers
                ST      -Y,R0
                ST      -Y,R1
                ST      -Y,R2
                ST      -Y,R3
                ST      -Y,R4
                ST      -Y,R5
                ST      -Y,R6
                ST      -Y,R7
                ST      -Y,R8
                ST      -Y,R9
                ST      -Y,R10
                ST      -Y,R11
                ST      -Y,R12
                ST      -Y,R13
                ST      -Y,R14
                ST      -Y,R15
                ST      -Y,R16
                ST      -Y,R17
                ST      -Y,R18
                ST      -Y,R19
                ST      -Y,R20
                ST      -Y,R21
                ST      -Y,R22
                ST      -Y,R23
                ST      -Y,R24
                ST      -Y,R25
                ST      -Y,R26
                ST      -Y,R27
                ST      -Y,R30
                ST      -Y,R31
                IN      R16,RAMPZ
                ST      -Y,R16
                ENDM

POP_ALL         MACRO                               ; Restore all registers
                LD      R16,Y+
                OUT     RAMPZ,R16
                LD      R31,Y+
                LD      R30,Y+
                LD      R27,Y+
                LD      R26,Y+
                LD      R25,Y+
                LD      R24,Y+
                LD      R23,Y+
                LD      R22,Y+
                LD      R21,Y+
                LD      R20,Y+
                LD      R19,Y+
                LD      R18,Y+
                LD      R17,Y+
                LD      R16,Y+
                LD      R15,Y+
                LD      R14,Y+
                LD      R13,Y+
                LD      R12,Y+
                LD      R11,Y+
                LD      R10,Y+
                LD      R9,Y+
                LD      R8,Y+
                LD      R7,Y+
                LD      R6,Y+
                LD      R5,Y+
                LD      R4,Y+
                LD      R3,Y+
                LD      R2,Y+
                LD      R1,Y+
                LD      R0,Y+
                ENDM

PUSH_SP         MACRO                               ; Save stack pointer
                IN      R16,SPH
                ST      -Y,R16
                IN      R16,SPL
                ST      -Y,R16
                ENDM

POP_SP          MACRO                               ; Restore stack pointer
                LD      R16,Y+
                OUT     SPL,R16
                LD      R16,Y+
                OUT     SPH,R16
                ENDM

PUSH_SREG       MACRO                               ; Save status register
                IN      R16,SREG
                ST      -Y,R16
                ENDM

POP_SREG        MACRO                               ; Restore status registers
                LD      R16,Y+
                OUT     SREG,R16
                ENDM

PUSH_SREG_INT   MACRO                               ; Save status register with interrupts ENABLED
                IN      R16,SREG
                SBR     R16,BIT07
                ST      -Y,R16
                ENDM

POP_SREG_INT    MACRO                               ; Restore status registers but DISABLE interrupts
                LD      R16,Y+
                CBR     R16,BIT07
                OUT     SREG,R16
                ENDM




;********************************************************************************************************
;                                          PUBLIC DECLARATIONS
;********************************************************************************************************

                MODULE  OS_CPU_A

                PUBLIC  OS_CPU_SR_Save
                PUBLIC  OS_CPU_SR_Restore
                PUBLIC  OSStartHighRdy
                PUBLIC  OSCtxSw
                PUBLIC  OSIntCtxSw

;********************************************************************************************************
;                                         EXTERNAL DECLARATIONS
;********************************************************************************************************

                EXTERN  OSIntExit
                EXTERN  OSIntNesting
                EXTERN  OSPrioCur
                EXTERN  OSPrioHighRdy
                EXTERN  OSRunning
                EXTERN  OSTaskSwHook
                EXTERN  OSTCBCur
                EXTERN  OSTCBHighRdy

;/*$PAGE*/
;********************************************************************************************************
;                            DISABLE/ENABLE INTERRUPTS USING OS_CRITICAL_METHOD #3
;
; Description : These functions are used to disable and enable interrupts using OS_CRITICAL_METHOD #3.
;
;               OS_CPU_SR  OSCPUSaveSR (void)
;                     Get current value of SREG
;                     Disable interrupts
;                     Return original value of SREG
;
;               void  OSCPURestoreSR (OS_CPU_SR cpu_sr)
;                     Set SREG to cpu_sr
;                     Return
;********************************************************************************************************

                   RSEG    CODE:CODE:NOROOT(1)

OS_CPU_SR_Save:    IN      R16,SREG                 ; Get current state of interrupts disable flag
                   CLI                              ; Disable interrupts
                   RET                              ; Return original SREG value in R16


OS_CPU_SR_Restore: OUT     SREG,R16                 ; Restore SREG
                   RET                              ; Return

;/*$PAGE*/
;********************************************************************************************************
;                               START HIGHEST PRIORITY TASK READY-TO-RUN
;
; Description : This function is called by OSStart() to start the highest priority task that was created
;               by your application before calling OSStart().
;
; Note(s)     : 1) The (data)stack frame is assumed to look as follows:
;
;                                                       Hardware Stack points to EMPTY
;                                                       <----------------------------\
;                                                PC (H)                              |
;                                                PC (L)                              |
;                                                                                    |
;                                                                                    |
;                  OSTCBHighRdy->OSTCBStkPtr --> SPL of (return) stack pointer   ----/   (Low memory)
;                                                SPH of (return) stack pointer
;                                                Flags to load in status register
;                                                RAMPZ
;                                                R31
;                                                R30
;                                                R27
;                                                .
;                                                .
;                                                R0                                      (High memory)
;
;                  where the stack pointer points to the task start address.
;
;               2) OSStartHighRdy() MUST:
;                      a) Call OSTaskSwHook() then,
;                      b) Set OSRunning to TRUE,
;                      c) Switch to the highest priority task.
;********************************************************************************************************

OSStartHighRdy: CALL    OSTaskSwHook                ; Invoke user defined context switch hook
                LDS     R16,OSRunning               ; Indicate that we are multitasking
                INC     R16                         ;
                STS     OSRunning,R16               ;

                LDS     R30,OSTCBHighRdy            ; Let Z point to TCB of highest priority task
                LDS     R31,OSTCBHighRdy+1          ; ready to run
                LD      R28,Z+                      ; Load Y (R29:R28) pointer
                LD      R29,Z+                      ;

                POP_SP                              ; Restore stack pointer
                POP_SREG_INT                        ; Restore status register (DISABLE interrupts)
                POP_ALL                             ; Restore all registers
                RETI

;/*$PAGE*/
;********************************************************************************************************
;                                       TASK LEVEL CONTEXT SWITCH
;
; Description : This function is called when a task makes a higher priority task ready-to-run.
;
; Note(s)     : 1) Upon entry,
;                  OSTCBCur     points to the OS_TCB of the task to suspend
;                  OSTCBHighRdy points to the OS_TCB of the task to resume
;
;               2) The stack frame of the task to suspend looks as follows:
;
;                                       SP+0 --> LSB of task code address
;                                         +1     MSB of task code address                (High memory)
;
;               3) The saved context of the task to resume looks as follows:
;
;                                                       Hardware Stack points to EMPTY
;                                                       <----------------------------\
;                                                PC (H)                              |
;                                                PC (L)                              |
;                                                                                    |
;                                                                                    |
;                  OSTCBHighRdy->OSTCBStkPtr --> SPL of (return) stack pointer   ----/   (Low memory)
;                                                SPH of (return) stack pointer
;                                                Flags to load in status register
;                                                RAMPZ
;                                                R31
;                                                R30
;                                                R27
;                                                .
;                                                .
;                                                R0                                      (High memory)
;********************************************************************************************************

OSCtxSw:        PUSH_ALL                            ; Save current task's context
                PUSH_SREG
                PUSH_SP

                LDS     R30,OSTCBCur                ; Z = OSTCBCur->OSTCBStkPtr
                LDS     R31,OSTCBCur+1              ;
                ST      Z+,R28                      ; Save Y (R29:R28) pointer
                ST      Z+,R29                      ;

                CALL    OSTaskSwHook                ; Call user defined task switch hook

                LDS     R16,OSPrioHighRdy           ; OSPrioCur = OSPrioHighRdy
                STS     OSPrioCur,R16

                LDS     R30,OSTCBHighRdy            ; Let Z point to TCB of highest priority task
                LDS     R31,OSTCBHighRdy+1          ; ready to run
                STS     OSTCBCur,R30                ; OSTCBCur = OSTCBHighRdy
                STS     OSTCBCur+1,R31              ;

                LD      R28,Z+                      ; Restore Y pointer
                LD      R29,Z+                      ;

                POP_SP                              ; Restore stack pointer
                LD      R16,Y+                      ; Restore status register
                SBRC    R16,7                       ; Skip next instruction in interrupts DISABLED
                RJMP    OSCtxSw_1

                OUT     SREG,R16                    ; Interrupts of task to return to are DISABLED
                POP_ALL
                RET

OSCtxSw_1:      CBR     R16,BIT07                   ; Interrupts of task to return to are ENABLED
                OUT     SREG,R16
                POP_ALL                             ; Restore all registers
                RETI

;/*$PAGE*/
;*********************************************************************************************************
;                                INTERRUPT LEVEL CONTEXT SWITCH
;
; Description : This function is called by OSIntExit() to perform a context switch to a task that has
;               been made ready-to-run by an ISR.
;
; Note(s)     : 1) Upon entry,
;                  OSTCBCur     points to the OS_TCB of the task to suspend
;                  OSTCBHighRdy points to the OS_TCB of the task to resume
;
;               2) The stack frame of the task to suspend looks as follows:
;
;                                                       Hardware Stack points to EMPTY
;                                                       <----------------------------\
;                                                PC (H)                              |
;                                                PC (L)                              |
;                                                                                    |
;                                                                                    |
;                  OSTCBCur->OSTCBStkPtr ------> SPL of (return) stack pointer    ---/   (Low memory)
;                                                SPH of (return) stack pointer
;                                                Flags to load in status register
;                                                RAMPZ
;                                                R31
;                                                R30
;                                                R27
;                                                .
;                                                .
;                                                R0                                      (High memory)
;
;               3) The saved context of the task to resume looks as follows:
;
;                                                       Hardware Stack points to EMPTY
;                                                       <----------------------------\
;                                                PC (H)                              |
;                                                PC (L)                              |
;                                                                                    |
;                                                                                    |
;                  OSTCBHighRdy->OSTCBStkPtr --> SPL of (return) stack pointer    ---/   (Low memory)
;                                                SPH of (return) stack pointer
;                                                Flags to load in status register
;                                                RAMPZ
;                                                R31
;                                                R30
;                                                R27
;                                                .
;                                                .
;                                                R0                                      (High memory)
;*********************************************************************************************************

OSIntCtxSw:
                CALL    OSTaskSwHook                ; Call user defined task switch hook

                LDS     R16,OSPrioHighRdy           ; OSPrioCur = OSPrioHighRdy
                STS     OSPrioCur,R16

                LDS     R30,OSTCBHighRdy            ; Let Z point to TCB of highest priority task
                LDS     R31,OSTCBHighRdy+1          ; ready to run
                STS     OSTCBCur,R30                ; OSTCBCur = OSTCBHighRdy
                STS     OSTCBCur+1,R31              ;

                LD      R28,Z+                      ; Restore Y pointer
                LD      R29,Z+                      ;

                POP_SP                              ; Restore stack pointer
                LD      R16,Y+                      ; Restore status register
                SBRC    R16,7                       ; Skip next instruction in interrupts DISABLED
                RJMP    OSIntCtxSw_1

                OUT     SREG,R16                    ; Interrupts of task to return to are DISABLED
                POP_ALL
                RET

OSIntCtxSw_1:   CBR     R16,BIT07                   ; Interrupts of task to return to are ENABLED
                OUT     SREG,R16
                POP_ALL                             ; Restore all registers
                RETI

                END
