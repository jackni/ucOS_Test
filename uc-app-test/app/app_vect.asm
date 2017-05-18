;********************************************************************************************************
;                              APPLICATION SPECIFIC INTERRUPT VECTOR TABLE
;
;                                (c) Copyright 2005, Micrium, Weston, FL
;                                          All Rights Reserved
;
;                                               ATmega128
;
;
; File     : APP_VECT.S90
; By       : Jean J. Labrosse
;********************************************************************************************************


    NAME    app_vect

;********************************************************************************************************
;                                          PUBLIC DECLARATIONS
;********************************************************************************************************

;********************************************************************************************************
;                                         EXTERNAL DECLARATIONS
;********************************************************************************************************

    EXTERN  BSP_TickISR

;********************************************************************************************************
;                                                INTVEC
;
; Description : Set up the AVR interrupt vector table for the ATmega128
;********************************************************************************************************
    COMMON  INTVEC

APP_INT_VECT_TBL:
                          ; Vector #   Program Address   Interrupt Definition
                          ; --------   ---------------   ------------------------------------------
    DS      4             ;     1          0x0000        Reset
    DS      4             ;     2          0x0002        IRQ0 Handler
    DS      4             ;     3          0x0004        IRQ1 Handler
    DS      4             ;     4          0x0006        IRQ2 Handler
    DS      4             ;     5          0x0008        IRQ3 Handler
    DS      4             ;     6          0x000A        IRQ4 Handler
    DS      4             ;     7          0x000C        IRQ5 Handler
    DS      4             ;     8          0x000E        IRQ6 Handler
    DS      4             ;     9          0x0010        IRQ7 Handler
    DS      4             ;    10          0x0012        Timer2 Compare Match
    DS      4             ;    11          0x0014        Timer2 Overflow
    DS      4             ;    12          0x0016        Timer1 Capture
    DS      4             ;    13          0x0018        Timer1 Compare A
    DS      4             ;    14          0x001A        Timer1 Compare B
    DS      4             ;    15          0x001C        Timer1 Overflow
    JMP     BSP_TickISR   ;    16          0x001E        Timer0 Compare
    DS      4             ;    17          0x0020        Timer0 Overflow
    DS      4             ;    18          0x0022        SPI, STC Transfer Complete
    DS      4             ;    19          0x0024        USART0 RX Complete
    DS      4             ;    20          0x0026        USART0 UDR Empty
    DS      4             ;    21          0x0028        USART0 TX Complete
    DS      4             ;    22          0x002A        ADC    Conversion Complete
    DS      4             ;    23          0x002C        EEPROM Ready
    DS      4             ;    24          0x002E        Analog Compare Interrupt
    DS      4             ;    25          0x0030        Timer1 Compare C
    DS      4             ;    26          0x0032        Timer3 Capture
    DS      4             ;    27          0x0034        Timer3 Compare A
    DS      4             ;    28          0x0036        Timer3 Compare B
    DS      4             ;    29          0x0038        Timer3 Compare C
    DS      4             ;    30          0x003A        Timer3 Overflow
    DS      4             ;    31          0x003C        USART1 RX Complete
    DS      4             ;    32          0x003E        USART1 UDR Empty
    DS      4             ;    33          0x0040        USART1 TX Complete
    DS      4             ;    34          0x0042        Two-wire Serial Interface
    DS      4             ;    35          0x0044        SPM Ready

    END
