











 













 




 











  
























 

















 


























 












 

#pragma language=extended

 
 
 





























































 

__io union { unsigned char PINF; struct { unsigned char PINF_Bit0:1, PINF_Bit1:1, PINF_Bit2:1, PINF_Bit3:1, PINF_Bit4:1, PINF_Bit5:1, PINF_Bit6:1, PINF_Bit7:1; }; struct { unsigned char PINF_PINF0:1, PINF_PINF1:1, PINF_PINF2:1, PINF_PINF3:1, PINF_PINF4:1, PINF_PINF5:1, PINF_PINF6:1, PINF_PINF7:1; }; } @ 0x00;      
__io union { unsigned char PINE; struct { unsigned char PINE_Bit0:1, PINE_Bit1:1, PINE_Bit2:1, PINE_Bit3:1, PINE_Bit4:1, PINE_Bit5:1, PINE_Bit6:1, PINE_Bit7:1; }; struct { unsigned char PINE_PINE0:1, PINE_PINE1:1, PINE_PINE2:1, PINE_PINE3:1, PINE_PINE4:1, PINE_PINE5:1, PINE_PINE6:1, PINE_PINE7:1; }; } @ 0x01;      
__io union { unsigned char DDRE; struct { unsigned char DDRE_Bit0:1, DDRE_Bit1:1, DDRE_Bit2:1, DDRE_Bit3:1, DDRE_Bit4:1, DDRE_Bit5:1, DDRE_Bit6:1, DDRE_Bit7:1; }; struct { unsigned char DDRE_DDE0:1, DDRE_DDE1:1, DDRE_DDE2:1, DDRE_DDE3:1, DDRE_DDE4:1, DDRE_DDE5:1, DDRE_DDE6:1, DDRE_DDE7:1; }; } @ 0x02;       
__io union { unsigned char PORTE; struct { unsigned char PORTE_Bit0:1, PORTE_Bit1:1, PORTE_Bit2:1, PORTE_Bit3:1, PORTE_Bit4:1, PORTE_Bit5:1, PORTE_Bit6:1, PORTE_Bit7:1; }; struct { unsigned char PORTE_PORTE0:1, PORTE_PORTE1:1, PORTE_PORTE2:1, PORTE_PORTE3:1, PORTE_PORTE4:1, PORTE_PORTE5:1, PORTE_PORTE6:1, PORTE_PORTE7:1; }; } @ 0x03;  
__io union { unsigned short ADC; struct { unsigned char ADC_Bit0:1, ADC_Bit1:1, ADC_Bit2:1, ADC_Bit3:1, ADC_Bit4:1, ADC_Bit5:1, ADC_Bit6:1, ADC_Bit7:1; unsigned char ADC_Bit8:1, ADC_Bit9:1, ADC_Bit10:1, ADC_Bit11:1, ADC_Bit12:1, ADC_Bit13:1, ADC_Bit14:1, ADC_Bit15:1; }; struct { unsigned char ADCL; unsigned char ADCH; }; struct { unsigned char ADCL_Bit0:1, ADCL_Bit1:1, ADCL_Bit2:1, ADCL_Bit3:1, ADCL_Bit4:1, ADCL_Bit5:1, ADCL_Bit6:1, ADCL_Bit7:1; unsigned char ADCH_Bit0:1, ADCH_Bit1:1, ADCH_Bit2:1, ADCH_Bit3:1, ADCH_Bit4:1, ADCH_Bit5:1, ADCH_Bit6:1, ADCH_Bit7:1; }; } @ 0x04;      
__io union { unsigned char ADCSR; unsigned char ADCSRA; struct { unsigned char ADCSR_Bit0:1, ADCSR_Bit1:1, ADCSR_Bit2:1, ADCSR_Bit3:1, ADCSR_Bit4:1, ADCSR_Bit5:1, ADCSR_Bit6:1, ADCSR_Bit7:1; }; struct { unsigned char ADCSRA_Bit0:1, ADCSRA_Bit1:1, ADCSRA_Bit2:1, ADCSRA_Bit3:1, ADCSRA_Bit4:1, ADCSRA_Bit5:1, ADCSRA_Bit6:1, ADCSRA_Bit7:1; }; struct { unsigned char ADCSR_ADPS0:1, ADCSR_ADPS1:1, ADCSR_ADPS2:1, ADCSR_ADIE:1, ADCSR_ADIF:1, ADCSR_ADFR:1, ADCSR_ADSC:1, ADCSR_ADEN:1; }; struct { unsigned char ADCSRA_ADPS0:1, ADCSRA_ADPS1:1, ADCSRA_ADPS2:1, ADCSRA_ADIE:1, ADCSRA_ADIF:1, ADCSRA_ADFR:1, ADCSRA_ADSC:1, ADCSRA_ADEN:1; }; } @ 0x06;   
__io union { unsigned char ADMUX; struct { unsigned char ADMUX_Bit0:1, ADMUX_Bit1:1, ADMUX_Bit2:1, ADMUX_Bit3:1, ADMUX_Bit4:1, ADMUX_Bit5:1, ADMUX_Bit6:1, ADMUX_Bit7:1; }; struct { unsigned char ADMUX_MUX0:1, ADMUX_MUX1:1, ADMUX_MUX2:1, ADMUX_MUX3:1, ADMUX_MUX4:1, ADMUX_ADLAR:1, ADMUX_REFS0:1, ADMUX_REFS1:1; }; } @ 0x07;           
__io union { unsigned char ACSR; struct { unsigned char ACSR_Bit0:1, ACSR_Bit1:1, ACSR_Bit2:1, ACSR_Bit3:1, ACSR_Bit4:1, ACSR_Bit5:1, ACSR_Bit6:1, ACSR_Bit7:1; }; struct { unsigned char ACSR_ACIS0:1, ACSR_ACIS1:1, ACSR_ACIC:1, ACSR_ACIE:1, ACSR_ACI:1, ACSR_ACO:1, ACSR_ACBG:1, ACSR_ACD:1; }; } @ 0x08;               
__io union { unsigned char UBRR0L; struct { unsigned char UBRR0L_Bit0:1, UBRR0L_Bit1:1, UBRR0L_Bit2:1, UBRR0L_Bit3:1, UBRR0L_Bit4:1, UBRR0L_Bit5:1, UBRR0L_Bit6:1, UBRR0L_Bit7:1; }; } @ 0x09;      
__io union { unsigned char UCSR0B; struct { unsigned char UCSR0B_Bit0:1, UCSR0B_Bit1:1, UCSR0B_Bit2:1, UCSR0B_Bit3:1, UCSR0B_Bit4:1, UCSR0B_Bit5:1, UCSR0B_Bit6:1, UCSR0B_Bit7:1; }; struct { unsigned char UCSR0B_TXB80:1, UCSR0B_RXB80:1, UCSR0B_UCSZ02:1, UCSR0B_TXEN0:1, UCSR0B_RXEN0:1, UCSR0B_UDRIE0:1, UCSR0B_TXCIE0:1, UCSR0B_RXCIE0:1; }; } @ 0x0A;  
__io union { unsigned char UCSR0A; struct { unsigned char UCSR0A_Bit0:1, UCSR0A_Bit1:1, UCSR0A_Bit2:1, UCSR0A_Bit3:1, UCSR0A_Bit4:1, UCSR0A_Bit5:1, UCSR0A_Bit6:1, UCSR0A_Bit7:1; }; struct { unsigned char UCSR0A_MPCM0:1, UCSR0A_U2X0:1, UCSR0A_UPE0:1, UCSR0A_DOR0:1, UCSR0A_FE0:1, UCSR0A_UDRE0:1, UCSR0A_TXC0:1, UCSR0A_RXC0:1; }; } @ 0x0B;             
__io union { unsigned char UDR0; struct { unsigned char UDR0_Bit0:1, UDR0_Bit1:1, UDR0_Bit2:1, UDR0_Bit3:1, UDR0_Bit4:1, UDR0_Bit5:1, UDR0_Bit6:1, UDR0_Bit7:1; }; } @ 0x0C;      
__io union { unsigned char SPCR; struct { unsigned char SPCR_Bit0:1, SPCR_Bit1:1, SPCR_Bit2:1, SPCR_Bit3:1, SPCR_Bit4:1, SPCR_Bit5:1, SPCR_Bit6:1, SPCR_Bit7:1; }; struct { unsigned char SPCR_SPR0:1, SPCR_SPR1:1, SPCR_CPHA:1, SPCR_CPOL:1, SPCR_MSTR:1, SPCR_DORD:1, SPCR_SPE:1, SPCR_SPIE:1; }; } @ 0x0D;               
__io union { unsigned char SPSR; struct { unsigned char SPSR_Bit0:1, SPSR_Bit1:1, SPSR_Bit2:1, SPSR_Bit3:1, SPSR_Bit4:1, SPSR_Bit5:1, SPSR_Bit6:1, SPSR_Bit7:1; }; struct { unsigned char SPSR_SPI2X:1, SPSR_Dummy1:1, SPSR_Dummy2:1, SPSR_Dummy3:1, SPSR_Dummy4:1, SPSR_Dummy5:1, SPSR_WCOL:1, SPSR_SPIF:1; }; } @ 0x0E;   
__io union { unsigned char SPDR; struct { unsigned char SPDR_Bit0:1, SPDR_Bit1:1, SPDR_Bit2:1, SPDR_Bit3:1, SPDR_Bit4:1, SPDR_Bit5:1, SPDR_Bit6:1, SPDR_Bit7:1; }; } @ 0x0F;      
__io union { unsigned char PIND; struct { unsigned char PIND_Bit0:1, PIND_Bit1:1, PIND_Bit2:1, PIND_Bit3:1, PIND_Bit4:1, PIND_Bit5:1, PIND_Bit6:1, PIND_Bit7:1; }; struct { unsigned char PIND_PIND0:1, PIND_PIND1:1, PIND_PIND2:1, PIND_PIND3:1, PIND_PIND4:1, PIND_PIND5:1, PIND_PIND6:1, PIND_PIND7:1; }; } @ 0x10;      
__io union { unsigned char DDRD; struct { unsigned char DDRD_Bit0:1, DDRD_Bit1:1, DDRD_Bit2:1, DDRD_Bit3:1, DDRD_Bit4:1, DDRD_Bit5:1, DDRD_Bit6:1, DDRD_Bit7:1; }; struct { unsigned char DDRD_DDD0:1, DDRD_DDD1:1, DDRD_DDD2:1, DDRD_DDD3:1, DDRD_DDD4:1, DDRD_DDD5:1, DDRD_DDD6:1, DDRD_DDD7:1; }; } @ 0x11;              
__io union { unsigned char PORTD; struct { unsigned char PORTD_Bit0:1, PORTD_Bit1:1, PORTD_Bit2:1, PORTD_Bit3:1, PORTD_Bit4:1, PORTD_Bit5:1, PORTD_Bit6:1, PORTD_Bit7:1; }; struct { unsigned char PORTD_PORTD0:1, PORTD_PORTD1:1, PORTD_PORTD2:1, PORTD_PORTD3:1, PORTD_PORTD4:1, PORTD_PORTD5:1, PORTD_PORTD6:1, PORTD_PORTD7:1; }; } @ 0x12;  
__io union { unsigned char PINC; struct { unsigned char PINC_Bit0:1, PINC_Bit1:1, PINC_Bit2:1, PINC_Bit3:1, PINC_Bit4:1, PINC_Bit5:1, PINC_Bit6:1, PINC_Bit7:1; }; struct { unsigned char PINC_PINC0:1, PINC_PINC1:1, PINC_PINC2:1, PINC_PINC3:1, PINC_PINC4:1, PINC_PINC5:1, PINC_PINC6:1, PINC_PINC7:1; }; } @ 0x13;      
__io union { unsigned char DDRC; struct { unsigned char DDRC_Bit0:1, DDRC_Bit1:1, DDRC_Bit2:1, DDRC_Bit3:1, DDRC_Bit4:1, DDRC_Bit5:1, DDRC_Bit6:1, DDRC_Bit7:1; }; struct { unsigned char DDRC_DDC0:1, DDRC_DDC1:1, DDRC_DDC2:1, DDRC_DDC3:1, DDRC_DDC4:1, DDRC_DDC5:1, DDRC_DDC6:1, DDRC_DDC7:1; }; } @ 0x14;              
__io union { unsigned char PORTC; struct { unsigned char PORTC_Bit0:1, PORTC_Bit1:1, PORTC_Bit2:1, PORTC_Bit3:1, PORTC_Bit4:1, PORTC_Bit5:1, PORTC_Bit6:1, PORTC_Bit7:1; }; struct { unsigned char PORTC_PORTC0:1, PORTC_PORTC1:1, PORTC_PORTC2:1, PORTC_PORTC3:1, PORTC_PORTC4:1, PORTC_PORTC5:1, PORTC_PORTC6:1, PORTC_PORTC7:1; }; } @ 0x15;  
__io union { unsigned char PINB; struct { unsigned char PINB_Bit0:1, PINB_Bit1:1, PINB_Bit2:1, PINB_Bit3:1, PINB_Bit4:1, PINB_Bit5:1, PINB_Bit6:1, PINB_Bit7:1; }; struct { unsigned char PINB_PINB0:1, PINB_PINB1:1, PINB_PINB2:1, PINB_PINB3:1, PINB_PINB4:1, PINB_PINB5:1, PINB_PINB6:1, PINB_PINB7:1; }; } @ 0x16;      
__io union { unsigned char DDRB; struct { unsigned char DDRB_Bit0:1, DDRB_Bit1:1, DDRB_Bit2:1, DDRB_Bit3:1, DDRB_Bit4:1, DDRB_Bit5:1, DDRB_Bit6:1, DDRB_Bit7:1; }; struct { unsigned char DDRB_DDB0:1, DDRB_DDB1:1, DDRB_DDB2:1, DDRB_DDB3:1, DDRB_DDB4:1, DDRB_DDB5:1, DDRB_DDB6:1, DDRB_DDB7:1; }; } @ 0x17;              
__io union { unsigned char PORTB; struct { unsigned char PORTB_Bit0:1, PORTB_Bit1:1, PORTB_Bit2:1, PORTB_Bit3:1, PORTB_Bit4:1, PORTB_Bit5:1, PORTB_Bit6:1, PORTB_Bit7:1; }; struct { unsigned char PORTB_PORTB0:1, PORTB_PORTB1:1, PORTB_PORTB2:1, PORTB_PORTB3:1, PORTB_PORTB4:1, PORTB_PORTB5:1, PORTB_PORTB6:1, PORTB_PORTB7:1; }; } @ 0x18;  
__io union { unsigned char PINA; struct { unsigned char PINA_Bit0:1, PINA_Bit1:1, PINA_Bit2:1, PINA_Bit3:1, PINA_Bit4:1, PINA_Bit5:1, PINA_Bit6:1, PINA_Bit7:1; }; struct { unsigned char PINA_PINA0:1, PINA_PINA1:1, PINA_PINA2:1, PINA_PINA3:1, PINA_PINA4:1, PINA_PINA5:1, PINA_PINA6:1, PINA_PINA7:1; }; } @ 0x19;      
__io union { unsigned char DDRA; struct { unsigned char DDRA_Bit0:1, DDRA_Bit1:1, DDRA_Bit2:1, DDRA_Bit3:1, DDRA_Bit4:1, DDRA_Bit5:1, DDRA_Bit6:1, DDRA_Bit7:1; }; struct { unsigned char DDRA_DDA0:1, DDRA_DDA1:1, DDRA_DDA2:1, DDRA_DDA3:1, DDRA_DDA4:1, DDRA_DDA5:1, DDRA_DDA6:1, DDRA_DDA7:1; }; } @ 0x1A;              
__io union { unsigned char PORTA; struct { unsigned char PORTA_Bit0:1, PORTA_Bit1:1, PORTA_Bit2:1, PORTA_Bit3:1, PORTA_Bit4:1, PORTA_Bit5:1, PORTA_Bit6:1, PORTA_Bit7:1; }; struct { unsigned char PORTA_PORTA0:1, PORTA_PORTA1:1, PORTA_PORTA2:1, PORTA_PORTA3:1, PORTA_PORTA4:1, PORTA_PORTA5:1, PORTA_PORTA6:1, PORTA_PORTA7:1; }; } @ 0x1B;  
__io union { unsigned char EECR; struct { unsigned char EECR_Bit0:1, EECR_Bit1:1, EECR_Bit2:1, EECR_Bit3:1, EECR_Bit4:1, EECR_Bit5:1, EECR_Bit6:1, EECR_Bit7:1; }; struct { unsigned char EECR_EERE:1, EECR_EEWE:1, EECR_EEMWE:1, EECR_EERIE:1, EECR_Dummy4:1, EECR_Dummy5:1, EECR_Dummy6:1, EECR_Dummy7:1; }; } @ 0x1C;    
__io union { unsigned char EEDR; struct { unsigned char EEDR_Bit0:1, EEDR_Bit1:1, EEDR_Bit2:1, EEDR_Bit3:1, EEDR_Bit4:1, EEDR_Bit5:1, EEDR_Bit6:1, EEDR_Bit7:1; }; } @ 0x1D;      
__io union { unsigned short EEAR; struct { unsigned char EEAR_Bit0:1, EEAR_Bit1:1, EEAR_Bit2:1, EEAR_Bit3:1, EEAR_Bit4:1, EEAR_Bit5:1, EEAR_Bit6:1, EEAR_Bit7:1; unsigned char EEAR_Bit8:1, EEAR_Bit9:1, EEAR_Bit10:1, EEAR_Bit11:1, EEAR_Bit12:1, EEAR_Bit13:1, EEAR_Bit14:1, EEAR_Bit15:1; }; struct { unsigned char EEARL; unsigned char EEARH; }; struct { unsigned char EEARL_Bit0:1, EEARL_Bit1:1, EEARL_Bit2:1, EEARL_Bit3:1, EEARL_Bit4:1, EEARL_Bit5:1, EEARL_Bit6:1, EEARL_Bit7:1; unsigned char EEARH_Bit0:1, EEARH_Bit1:1, EEARH_Bit2:1, EEARH_Bit3:1, EEARH_Bit4:1, EEARH_Bit5:1, EEARH_Bit6:1, EEARH_Bit7:1; }; } @ 0x1E;      
__io union { unsigned char SFIOR; struct { unsigned char SFIOR_Bit0:1, SFIOR_Bit1:1, SFIOR_Bit2:1, SFIOR_Bit3:1, SFIOR_Bit4:1, SFIOR_Bit5:1, SFIOR_Bit6:1, SFIOR_Bit7:1; }; struct { unsigned char SFIOR_PSR321:1, SFIOR_PSR0:1, SFIOR_PUD:1, SFIOR_ACME:1, SFIOR_Dummy4:1, SFIOR_Dummy5:1, SFIOR_Dummy6:1, SFIOR_TSM:1; }; } @ 0x20;        
__io union { unsigned char WDTCR; struct { unsigned char WDTCR_Bit0:1, WDTCR_Bit1:1, WDTCR_Bit2:1, WDTCR_Bit3:1, WDTCR_Bit4:1, WDTCR_Bit5:1, WDTCR_Bit6:1, WDTCR_Bit7:1; }; struct { unsigned char WDTCR_WDP0:1, WDTCR_WDP1:1, WDTCR_WDP2:1, WDTCR_WDE:1, WDTCR_WDCE:1, WDTCR_Dummy5:1, WDTCR_Dummy6:1, WDTCR_Dummy7:1; }; } @ 0x21;         
__io union { unsigned char OCDR; struct { unsigned char OCDR_Bit0:1, OCDR_Bit1:1, OCDR_Bit2:1, OCDR_Bit3:1, OCDR_Bit4:1, OCDR_Bit5:1, OCDR_Bit6:1, OCDR_Bit7:1; }; struct { unsigned char OCDR_OCDR0:1, OCDR_OCDR1:1, OCDR_OCDR2:1, OCDR_OCDR3:1, OCDR_OCDR4:1, OCDR_OCDR5:1, OCDR_OCDR6:1, OCDR_OCDR7:1; }; } @ 0x22;      
__io union { unsigned char OCR2; struct { unsigned char OCR2_Bit0:1, OCR2_Bit1:1, OCR2_Bit2:1, OCR2_Bit3:1, OCR2_Bit4:1, OCR2_Bit5:1, OCR2_Bit6:1, OCR2_Bit7:1; }; } @ 0x23;      
__io union { unsigned char TCNT2; struct { unsigned char TCNT2_Bit0:1, TCNT2_Bit1:1, TCNT2_Bit2:1, TCNT2_Bit3:1, TCNT2_Bit4:1, TCNT2_Bit5:1, TCNT2_Bit6:1, TCNT2_Bit7:1; }; } @ 0x24;      
__io union { unsigned char TCCR2; struct { unsigned char TCCR2_Bit0:1, TCCR2_Bit1:1, TCCR2_Bit2:1, TCCR2_Bit3:1, TCCR2_Bit4:1, TCCR2_Bit5:1, TCCR2_Bit6:1, TCCR2_Bit7:1; }; struct { unsigned char TCCR2_CS20:1, TCCR2_CS21:1, TCCR2_CS22:1, TCCR2_WGM21:1, TCCR2_COM20:1, TCCR2_COM21:1, TCCR2_WGM20:1, TCCR2_FOC2:1; }; } @ 0x25;          
__io union { unsigned short ICR1; struct { unsigned char ICR1_Bit0:1, ICR1_Bit1:1, ICR1_Bit2:1, ICR1_Bit3:1, ICR1_Bit4:1, ICR1_Bit5:1, ICR1_Bit6:1, ICR1_Bit7:1; unsigned char ICR1_Bit8:1, ICR1_Bit9:1, ICR1_Bit10:1, ICR1_Bit11:1, ICR1_Bit12:1, ICR1_Bit13:1, ICR1_Bit14:1, ICR1_Bit15:1; }; struct { unsigned char ICR1L; unsigned char ICR1H; }; struct { unsigned char ICR1L_Bit0:1, ICR1L_Bit1:1, ICR1L_Bit2:1, ICR1L_Bit3:1, ICR1L_Bit4:1, ICR1L_Bit5:1, ICR1L_Bit6:1, ICR1L_Bit7:1; unsigned char ICR1H_Bit0:1, ICR1H_Bit1:1, ICR1H_Bit2:1, ICR1H_Bit3:1, ICR1H_Bit4:1, ICR1H_Bit5:1, ICR1H_Bit6:1, ICR1H_Bit7:1; }; } @ 0x26;      
__io union { unsigned short OCR1B; struct { unsigned char OCR1B_Bit0:1, OCR1B_Bit1:1, OCR1B_Bit2:1, OCR1B_Bit3:1, OCR1B_Bit4:1, OCR1B_Bit5:1, OCR1B_Bit6:1, OCR1B_Bit7:1; unsigned char OCR1B_Bit8:1, OCR1B_Bit9:1, OCR1B_Bit10:1, OCR1B_Bit11:1, OCR1B_Bit12:1, OCR1B_Bit13:1, OCR1B_Bit14:1, OCR1B_Bit15:1; }; struct { unsigned char OCR1BL; unsigned char OCR1BH; }; struct { unsigned char OCR1BL_Bit0:1, OCR1BL_Bit1:1, OCR1BL_Bit2:1, OCR1BL_Bit3:1, OCR1BL_Bit4:1, OCR1BL_Bit5:1, OCR1BL_Bit6:1, OCR1BL_Bit7:1; unsigned char OCR1BH_Bit0:1, OCR1BH_Bit1:1, OCR1BH_Bit2:1, OCR1BH_Bit3:1, OCR1BH_Bit4:1, OCR1BH_Bit5:1, OCR1BH_Bit6:1, OCR1BH_Bit7:1; }; } @ 0x28;      
__io union { unsigned short OCR1A; struct { unsigned char OCR1A_Bit0:1, OCR1A_Bit1:1, OCR1A_Bit2:1, OCR1A_Bit3:1, OCR1A_Bit4:1, OCR1A_Bit5:1, OCR1A_Bit6:1, OCR1A_Bit7:1; unsigned char OCR1A_Bit8:1, OCR1A_Bit9:1, OCR1A_Bit10:1, OCR1A_Bit11:1, OCR1A_Bit12:1, OCR1A_Bit13:1, OCR1A_Bit14:1, OCR1A_Bit15:1; }; struct { unsigned char OCR1AL; unsigned char OCR1AH; }; struct { unsigned char OCR1AL_Bit0:1, OCR1AL_Bit1:1, OCR1AL_Bit2:1, OCR1AL_Bit3:1, OCR1AL_Bit4:1, OCR1AL_Bit5:1, OCR1AL_Bit6:1, OCR1AL_Bit7:1; unsigned char OCR1AH_Bit0:1, OCR1AH_Bit1:1, OCR1AH_Bit2:1, OCR1AH_Bit3:1, OCR1AH_Bit4:1, OCR1AH_Bit5:1, OCR1AH_Bit6:1, OCR1AH_Bit7:1; }; } @ 0x2A;      
__io union { unsigned short TCNT1; struct { unsigned char TCNT1_Bit0:1, TCNT1_Bit1:1, TCNT1_Bit2:1, TCNT1_Bit3:1, TCNT1_Bit4:1, TCNT1_Bit5:1, TCNT1_Bit6:1, TCNT1_Bit7:1; unsigned char TCNT1_Bit8:1, TCNT1_Bit9:1, TCNT1_Bit10:1, TCNT1_Bit11:1, TCNT1_Bit12:1, TCNT1_Bit13:1, TCNT1_Bit14:1, TCNT1_Bit15:1; }; struct { unsigned char TCNT1L; unsigned char TCNT1H; }; struct { unsigned char TCNT1L_Bit0:1, TCNT1L_Bit1:1, TCNT1L_Bit2:1, TCNT1L_Bit3:1, TCNT1L_Bit4:1, TCNT1L_Bit5:1, TCNT1L_Bit6:1, TCNT1L_Bit7:1; unsigned char TCNT1H_Bit0:1, TCNT1H_Bit1:1, TCNT1H_Bit2:1, TCNT1H_Bit3:1, TCNT1H_Bit4:1, TCNT1H_Bit5:1, TCNT1H_Bit6:1, TCNT1H_Bit7:1; }; } @ 0x2C;      
__io union { unsigned char TCCR1B; struct { unsigned char TCCR1B_Bit0:1, TCCR1B_Bit1:1, TCCR1B_Bit2:1, TCCR1B_Bit3:1, TCCR1B_Bit4:1, TCCR1B_Bit5:1, TCCR1B_Bit6:1, TCCR1B_Bit7:1; }; struct { unsigned char TCCR1B_CS10:1, TCCR1B_CS11:1, TCCR1B_CS12:1, TCCR1B_WGM12:1, TCCR1B_WGM13:1, TCCR1B_Dummy5:1, TCCR1B_ICES1:1, TCCR1B_ICNC1:1; }; } @ 0x2E;        
__io union { unsigned char TCCR1A; struct { unsigned char TCCR1A_Bit0:1, TCCR1A_Bit1:1, TCCR1A_Bit2:1, TCCR1A_Bit3:1, TCCR1A_Bit4:1, TCCR1A_Bit5:1, TCCR1A_Bit6:1, TCCR1A_Bit7:1; }; struct { unsigned char TCCR1A_WGM10:1, TCCR1A_WGM11:1, TCCR1A_COM1C0:1, TCCR1A_COM1C1:1, TCCR1A_COM1B0:1, TCCR1A_COM1B1:1, TCCR1A_COM1A0:1, TCCR1A_COM1A1:1; }; } @ 0x2F;  
__io union { unsigned char ASSR; struct { unsigned char ASSR_Bit0:1, ASSR_Bit1:1, ASSR_Bit2:1, ASSR_Bit3:1, ASSR_Bit4:1, ASSR_Bit5:1, ASSR_Bit6:1, ASSR_Bit7:1; }; struct { unsigned char ASSR_TCR0UB:1, ASSR_OCR0UB:1, ASSR_TCN0UB:1, ASSR_AS0:1, ASSR_Dummy4:1, ASSR_Dummy5:1, ASSR_Dummy6:1, ASSR_Dummy7:1; }; } @ 0x30;  
__io union { unsigned char OCR0; struct { unsigned char OCR0_Bit0:1, OCR0_Bit1:1, OCR0_Bit2:1, OCR0_Bit3:1, OCR0_Bit4:1, OCR0_Bit5:1, OCR0_Bit6:1, OCR0_Bit7:1; }; } @ 0x31;      
__io union { unsigned char TCNT0; struct { unsigned char TCNT0_Bit0:1, TCNT0_Bit1:1, TCNT0_Bit2:1, TCNT0_Bit3:1, TCNT0_Bit4:1, TCNT0_Bit5:1, TCNT0_Bit6:1, TCNT0_Bit7:1; }; } @ 0x32;      
__io union { unsigned char TCCR0; struct { unsigned char TCCR0_Bit0:1, TCCR0_Bit1:1, TCCR0_Bit2:1, TCCR0_Bit3:1, TCCR0_Bit4:1, TCCR0_Bit5:1, TCCR0_Bit6:1, TCCR0_Bit7:1; }; struct { unsigned char TCCR0_CS00:1, TCCR0_CS01:1, TCCR0_CS02:1, TCCR0_WGM01:1, TCCR0_COM00:1, TCCR0_COM01:1, TCCR0_WGM00:1, TCCR0_FOC0:1; }; } @ 0x33;          
__io union { unsigned char MCUCSR; struct { unsigned char MCUCSR_Bit0:1, MCUCSR_Bit1:1, MCUCSR_Bit2:1, MCUCSR_Bit3:1, MCUCSR_Bit4:1, MCUCSR_Bit5:1, MCUCSR_Bit6:1, MCUCSR_Bit7:1; }; struct { unsigned char MCUCSR_PORF:1, MCUCSR_EXTRF:1, MCUCSR_BORF:1, MCUCSR_WDRF:1, MCUCSR_JTRF:1, MCUCSR_Dummy5:1, MCUCSR_Dummy6:1, MCUCSR_JTD:1; }; } @ 0x34;          
__io union { unsigned char MCUCR; struct { unsigned char MCUCR_Bit0:1, MCUCR_Bit1:1, MCUCR_Bit2:1, MCUCR_Bit3:1, MCUCR_Bit4:1, MCUCR_Bit5:1, MCUCR_Bit6:1, MCUCR_Bit7:1; }; struct { unsigned char MCUCR_IVCE:1, MCUCR_IVSEL:1, MCUCR_SM2:1, MCUCR_SM0:1, MCUCR_SM1:1, MCUCR_SE:1, MCUCR_SRW10:1, MCUCR_SRE:1; }; } @ 0x35;                  
__io union { unsigned char TIFR; struct { unsigned char TIFR_Bit0:1, TIFR_Bit1:1, TIFR_Bit2:1, TIFR_Bit3:1, TIFR_Bit4:1, TIFR_Bit5:1, TIFR_Bit6:1, TIFR_Bit7:1; }; struct { unsigned char TIFR_TOV0:1, TIFR_OCF0:1, TIFR_TOV1:1, TIFR_OCF1B:1, TIFR_OCF1A:1, TIFR_ICF1:1, TIFR_TOV2:1, TIFR_OCF2:1; }; } @ 0x36;            
__io union { unsigned char TIMSK; struct { unsigned char TIMSK_Bit0:1, TIMSK_Bit1:1, TIMSK_Bit2:1, TIMSK_Bit3:1, TIMSK_Bit4:1, TIMSK_Bit5:1, TIMSK_Bit6:1, TIMSK_Bit7:1; }; struct { unsigned char TIMSK_TOIE0:1, TIMSK_OCIE0:1, TIMSK_TOIE1:1, TIMSK_OCIE1B:1, TIMSK_OCIE1A:1, TIMSK_TICIE1:1, TIMSK_TOIE2:1, TIMSK_OCIE2:1; }; } @ 0x37;   
__io union { unsigned char EIFR; struct { unsigned char EIFR_Bit0:1, EIFR_Bit1:1, EIFR_Bit2:1, EIFR_Bit3:1, EIFR_Bit4:1, EIFR_Bit5:1, EIFR_Bit6:1, EIFR_Bit7:1; }; struct { unsigned char EIFR_INTF0:1, EIFR_INTF1:1, EIFR_INTF2:1, EIFR_INTF3:1, EIFR_INTF4:1, EIFR_INTF5:1, EIFR_INTF6:1, EIFR_INTF7:1; }; } @ 0x38;      
__io union { unsigned char EIMSK; struct { unsigned char EIMSK_Bit0:1, EIMSK_Bit1:1, EIMSK_Bit2:1, EIMSK_Bit3:1, EIMSK_Bit4:1, EIMSK_Bit5:1, EIMSK_Bit6:1, EIMSK_Bit7:1; }; struct { unsigned char EIMSK_INT0:1, EIMSK_INT1:1, EIMSK_INT2:1, EIMSK_INT3:1, EIMSK_INT4:1, EIMSK_INT5:1, EIMSK_INT6:1, EIMSK_INT7:1; }; } @ 0x39;              
__io union { unsigned char EICRB; struct { unsigned char EICRB_Bit0:1, EICRB_Bit1:1, EICRB_Bit2:1, EICRB_Bit3:1, EICRB_Bit4:1, EICRB_Bit5:1, EICRB_Bit6:1, EICRB_Bit7:1; }; struct { unsigned char EICRB_ISC40:1, EICRB_ISC41:1, EICRB_ISC50:1, EICRB_ISC51:1, EICRB_ISC60:1, EICRB_ISC61:1, EICRB_ISC70:1, EICRB_ISC71:1; }; } @ 0x3A;      
__io union { unsigned char RAMPZ; struct { unsigned char RAMPZ_Bit0:1, RAMPZ_Bit1:1, RAMPZ_Bit2:1, RAMPZ_Bit3:1, RAMPZ_Bit4:1, RAMPZ_Bit5:1, RAMPZ_Bit6:1, RAMPZ_Bit7:1; }; struct { unsigned char RAMPZ_RAMPZ0:1, RAMPZ_Dummy1:1, RAMPZ_Dummy2:1, RAMPZ_Dummy3:1, RAMPZ_Dummy4:1, RAMPZ_Dummy5:1, RAMPZ_Dummy6:1, RAMPZ_Dummy7:1; }; } @ 0x3B;  
__io union { unsigned char XDIV; struct { unsigned char XDIV_Bit0:1, XDIV_Bit1:1, XDIV_Bit2:1, XDIV_Bit3:1, XDIV_Bit4:1, XDIV_Bit5:1, XDIV_Bit6:1, XDIV_Bit7:1; }; struct { unsigned char XDIV_XDIV0:1, XDIV_XDIV1:1, XDIV_XDIV2:1, XDIV_XDIV3:1, XDIV_XDIV4:1, XDIV_XDIV5:1, XDIV_XDIV6:1, XDIV_XDIVEN:1; }; } @ 0x3C;     
__io union { unsigned short SP; struct { unsigned char SP_Bit0:1, SP_Bit1:1, SP_Bit2:1, SP_Bit3:1, SP_Bit4:1, SP_Bit5:1, SP_Bit6:1, SP_Bit7:1; unsigned char SP_Bit8:1, SP_Bit9:1, SP_Bit10:1, SP_Bit11:1, SP_Bit12:1, SP_Bit13:1, SP_Bit14:1, SP_Bit15:1; }; struct { unsigned char SP_SP0:1, SP_SP1:1, SP_SP2:1, SP_SP3:1, SP_SP4:1, SP_SP5:1, SP_SP6:1, SP_SP7:1; unsigned char SP_SP8:1, SP_SP9:1, SP_SP10:1, SP_SP11:1, SP_SP12:1, SP_SP13:1, SP_SP14:1, SP_SP15:1; }; struct { unsigned char SPL; unsigned char SPH; }; struct { unsigned char SPL_Bit0:1, SPL_Bit1:1, SPL_Bit2:1, SPL_Bit3:1, SPL_Bit4:1, SPL_Bit5:1, SPL_Bit6:1, SPL_Bit7:1; unsigned char SPH_Bit0:1, SPH_Bit1:1, SPH_Bit2:1, SPH_Bit3:1, SPH_Bit4:1, SPH_Bit5:1, SPH_Bit6:1, SPH_Bit7:1; }; struct { unsigned char SPL_SP0:1, SPL_SP1:1, SPL_SP2:1, SPL_SP3:1, SPL_SP4:1, SPL_SP5:1, SPL_SP6:1, SPL_SP7:1; unsigned char SPH_SP8:1, SPH_SP9:1, SPH_SP10:1, SPH_SP11:1, SPH_SP12:1, SPH_SP13:1, SPH_SP14:1, SPH_SP15:1; }; } @ 0x3D;      
__io union { unsigned char SREG; struct { unsigned char SREG_Bit0:1, SREG_Bit1:1, SREG_Bit2:1, SREG_Bit3:1, SREG_Bit4:1, SREG_Bit5:1, SREG_Bit6:1, SREG_Bit7:1; }; struct { unsigned char SREG_C:1, SREG_Z:1, SREG_N:1, SREG_V:1, SREG_S:1, SREG_H:1, SREG_T:1, SREG_I:1; }; } @ 0x3F;                                      

 
__io union { unsigned char DDRF; struct { unsigned char DDRF_Bit0:1, DDRF_Bit1:1, DDRF_Bit2:1, DDRF_Bit3:1, DDRF_Bit4:1, DDRF_Bit5:1, DDRF_Bit6:1, DDRF_Bit7:1; }; struct { unsigned char DDRF_DDF0:1, DDRF_DDF1:1, DDRF_DDF2:1, DDRF_DDF3:1, DDRF_DDF4:1, DDRF_DDF5:1, DDRF_DDF6:1, DDRF_DDF7:1; }; } @ 0x61;              
__io union { unsigned char PORTF; struct { unsigned char PORTF_Bit0:1, PORTF_Bit1:1, PORTF_Bit2:1, PORTF_Bit3:1, PORTF_Bit4:1, PORTF_Bit5:1, PORTF_Bit6:1, PORTF_Bit7:1; }; struct { unsigned char PORTF_PORTF0:1, PORTF_PORTF1:1, PORTF_PORTF2:1, PORTF_PORTF3:1, PORTF_PORTF4:1, PORTF_PORTF5:1, PORTF_PORTF6:1, PORTF_PORTF7:1; }; } @ 0x62;  
__io union { unsigned char PING; struct { unsigned char PING_Bit0:1, PING_Bit1:1, PING_Bit2:1, PING_Bit3:1, PING_Bit4:1, PING_Bit5:1, PING_Bit6:1, PING_Bit7:1; }; struct { unsigned char PING_PING0:1, PING_PING1:1, PING_PING2:1, PING_PING3:1, PING_PING4:1, PING_Dummy5:1, PING_Dummy6:1, PING_Dummy7:1; }; } @ 0x63;   
__io union { unsigned char DDRG; struct { unsigned char DDRG_Bit0:1, DDRG_Bit1:1, DDRG_Bit2:1, DDRG_Bit3:1, DDRG_Bit4:1, DDRG_Bit5:1, DDRG_Bit6:1, DDRG_Bit7:1; }; struct { unsigned char DDRG_DDG0:1, DDRG_DDG1:1, DDRG_DDG2:1, DDRG_DDG3:1, DDRG_DDG4:1, DDRG_Dummy5:1, DDRG_Dummy6:1, DDRG_Dummy7:1; }; } @ 0x64;       
__io union { unsigned char PORTG; struct { unsigned char PORTG_Bit0:1, PORTG_Bit1:1, PORTG_Bit2:1, PORTG_Bit3:1, PORTG_Bit4:1, PORTG_Bit5:1, PORTG_Bit6:1, PORTG_Bit7:1; }; struct { unsigned char PORTG_PORTG0:1, PORTG_PORTG1:1, PORTG_PORTG2:1, PORTG_PORTG3:1, PORTG_PORTG4:1, PORTG_Dummy5:1, PORTG_Dummy6:1, PORTG_Dummy7:1; }; } @ 0x65;  
__io union { unsigned char SPMCSR; struct { unsigned char SPMCSR_Bit0:1, SPMCSR_Bit1:1, SPMCSR_Bit2:1, SPMCSR_Bit3:1, SPMCSR_Bit4:1, SPMCSR_Bit5:1, SPMCSR_Bit6:1, SPMCSR_Bit7:1; }; struct { unsigned char SPMCSR_SPMEN:1, SPMCSR_PGERS:1, SPMCSR_PGWRT:1, SPMCSR_BLBSET:1, SPMCSR_RWWSRE:1, SPMCSR_Dummy5:1, SPMCSR_RWWSB:1, SPMCSR_SPMIE:1; }; } @ 0x68;   
__io union { unsigned char EICRA; struct { unsigned char EICRA_Bit0:1, EICRA_Bit1:1, EICRA_Bit2:1, EICRA_Bit3:1, EICRA_Bit4:1, EICRA_Bit5:1, EICRA_Bit6:1, EICRA_Bit7:1; }; struct { unsigned char EICRA_ISC00:1, EICRA_ISC01:1, EICRA_ISC10:1, EICRA_ISC11:1, EICRA_ISC20:1, EICRA_ISC21:1, EICRA_ISC30:1, EICRA_ISC31:1; }; } @ 0x6A;      
__io union { unsigned char XMCRB; struct { unsigned char XMCRB_Bit0:1, XMCRB_Bit1:1, XMCRB_Bit2:1, XMCRB_Bit3:1, XMCRB_Bit4:1, XMCRB_Bit5:1, XMCRB_Bit6:1, XMCRB_Bit7:1; }; struct { unsigned char XMCRB_XMM0:1, XMCRB_XMM1:1, XMCRB_XMM2:1, XMCRB_Dummy3:1, XMCRB_Dummy4:1, XMCRB_Dummy5:1, XMCRB_Dummy6:1, XMCRB_XMBK:1; }; } @ 0x6C;      
__io union { unsigned char XMCRA; struct { unsigned char XMCRA_Bit0:1, XMCRA_Bit1:1, XMCRA_Bit2:1, XMCRA_Bit3:1, XMCRA_Bit4:1, XMCRA_Bit5:1, XMCRA_Bit6:1, XMCRA_Bit7:1; }; struct { unsigned char XMCRA_Dummy0:1, XMCRA_SRW11:1, XMCRA_SRW00:1, XMCRA_SRW01:1, XMCRA_SRL0:1, XMCRA_SRL1:1, XMCRA_SRL2:1, XMCRA_Dummy7:1; }; } @ 0x6D;       
__io union { unsigned char OSCCAL; struct { unsigned char OSCCAL_Bit0:1, OSCCAL_Bit1:1, OSCCAL_Bit2:1, OSCCAL_Bit3:1, OSCCAL_Bit4:1, OSCCAL_Bit5:1, OSCCAL_Bit6:1, OSCCAL_Bit7:1; }; } @ 0x6F;      
__io union { unsigned char TWBR; struct { unsigned char TWBR_Bit0:1, TWBR_Bit1:1, TWBR_Bit2:1, TWBR_Bit3:1, TWBR_Bit4:1, TWBR_Bit5:1, TWBR_Bit6:1, TWBR_Bit7:1; }; } @ 0x70;      
__io union { unsigned char TWSR; struct { unsigned char TWSR_Bit0:1, TWSR_Bit1:1, TWSR_Bit2:1, TWSR_Bit3:1, TWSR_Bit4:1, TWSR_Bit5:1, TWSR_Bit6:1, TWSR_Bit7:1; }; struct { unsigned char TWSR_TWPS0:1, TWSR_TWPS1:1, TWSR_Dummy2:1, TWSR_TWS3:1, TWSR_TWS4:1, TWSR_TWS5:1, TWSR_TWS6:1, TWSR_TWS7:1; }; } @ 0x71;          
__io union { unsigned char TWAR; struct { unsigned char TWAR_Bit0:1, TWAR_Bit1:1, TWAR_Bit2:1, TWAR_Bit3:1, TWAR_Bit4:1, TWAR_Bit5:1, TWAR_Bit6:1, TWAR_Bit7:1; }; struct { unsigned char TWAR_TWGCE:1, TWAR_TWA0:1, TWAR_TWA1:1, TWAR_TWA2:1, TWAR_TWA3:1, TWAR_TWA4:1, TWAR_TWA5:1, TWAR_TWA6:1; }; } @ 0x72;             
__io union { unsigned char TWDR; struct { unsigned char TWDR_Bit0:1, TWDR_Bit1:1, TWDR_Bit2:1, TWDR_Bit3:1, TWDR_Bit4:1, TWDR_Bit5:1, TWDR_Bit6:1, TWDR_Bit7:1; }; } @ 0x73;      
__io union { unsigned char TWCR; struct { unsigned char TWCR_Bit0:1, TWCR_Bit1:1, TWCR_Bit2:1, TWCR_Bit3:1, TWCR_Bit4:1, TWCR_Bit5:1, TWCR_Bit6:1, TWCR_Bit7:1; }; struct { unsigned char TWCR_TWIE:1, TWCR_Dummy1:1, TWCR_TWEN:1, TWCR_TWWC:1, TWCR_TWSTO:1, TWCR_TWSTA:1, TWCR_TWEA:1, TWCR_TWINT:1; }; } @ 0x74;         
__io union { unsigned short OCR1C; struct { unsigned char OCR1C_Bit0:1, OCR1C_Bit1:1, OCR1C_Bit2:1, OCR1C_Bit3:1, OCR1C_Bit4:1, OCR1C_Bit5:1, OCR1C_Bit6:1, OCR1C_Bit7:1; unsigned char OCR1C_Bit8:1, OCR1C_Bit9:1, OCR1C_Bit10:1, OCR1C_Bit11:1, OCR1C_Bit12:1, OCR1C_Bit13:1, OCR1C_Bit14:1, OCR1C_Bit15:1; }; struct { unsigned char OCR1CL; unsigned char OCR1CH; }; struct { unsigned char OCR1CL_Bit0:1, OCR1CL_Bit1:1, OCR1CL_Bit2:1, OCR1CL_Bit3:1, OCR1CL_Bit4:1, OCR1CL_Bit5:1, OCR1CL_Bit6:1, OCR1CL_Bit7:1; unsigned char OCR1CH_Bit0:1, OCR1CH_Bit1:1, OCR1CH_Bit2:1, OCR1CH_Bit3:1, OCR1CH_Bit4:1, OCR1CH_Bit5:1, OCR1CH_Bit6:1, OCR1CH_Bit7:1; }; } @ 0x78;      
__io union { unsigned char TCCR1C; struct { unsigned char TCCR1C_Bit0:1, TCCR1C_Bit1:1, TCCR1C_Bit2:1, TCCR1C_Bit3:1, TCCR1C_Bit4:1, TCCR1C_Bit5:1, TCCR1C_Bit6:1, TCCR1C_Bit7:1; }; struct { unsigned char TCCR1C_Dummy0:1, TCCR1C_Dummy1:1, TCCR1C_Dummy2:1, TCCR1C_Dummy3:1, TCCR1C_Dummy4:1, TCCR1C_FOC1C:1, TCCR1C_FOC1B:1, TCCR1C_FOC1A:1; }; } @ 0x7A; 
__io union { unsigned char ETIFR; struct { unsigned char ETIFR_Bit0:1, ETIFR_Bit1:1, ETIFR_Bit2:1, ETIFR_Bit3:1, ETIFR_Bit4:1, ETIFR_Bit5:1, ETIFR_Bit6:1, ETIFR_Bit7:1; }; struct { unsigned char ETIFR_OCF1C:1, ETIFR_OCF3C:1, ETIFR_TOV3:1, ETIFR_OCF3B:1, ETIFR_OCF3A:1, ETIFR_ICF3:1, ETIFR_Dummy6:1, ETIFR_Dummy7:1; }; } @ 0x7C;      
__io union { unsigned char ETIMSK; struct { unsigned char ETIMSK_Bit0:1, ETIMSK_Bit1:1, ETIMSK_Bit2:1, ETIMSK_Bit3:1, ETIMSK_Bit4:1, ETIMSK_Bit5:1, ETIMSK_Bit6:1, ETIMSK_Bit7:1; }; struct { unsigned char ETIMSK_OCIE1C:1, ETIMSK_OCIE3C:1, ETIMSK_TOIE3:1, ETIMSK_OCIE3B:1, ETIMSK_OCIE3A:1, ETIMSK_TICIE3:1, ETIMSK_Dummy6:1, ETIMSK_Dummy7:1; }; } @ 0x7D;  
__io union { unsigned short ICR3; struct { unsigned char ICR3_Bit0:1, ICR3_Bit1:1, ICR3_Bit2:1, ICR3_Bit3:1, ICR3_Bit4:1, ICR3_Bit5:1, ICR3_Bit6:1, ICR3_Bit7:1; unsigned char ICR3_Bit8:1, ICR3_Bit9:1, ICR3_Bit10:1, ICR3_Bit11:1, ICR3_Bit12:1, ICR3_Bit13:1, ICR3_Bit14:1, ICR3_Bit15:1; }; struct { unsigned char ICR3L; unsigned char ICR3H; }; struct { unsigned char ICR3L_Bit0:1, ICR3L_Bit1:1, ICR3L_Bit2:1, ICR3L_Bit3:1, ICR3L_Bit4:1, ICR3L_Bit5:1, ICR3L_Bit6:1, ICR3L_Bit7:1; unsigned char ICR3H_Bit0:1, ICR3H_Bit1:1, ICR3H_Bit2:1, ICR3H_Bit3:1, ICR3H_Bit4:1, ICR3H_Bit5:1, ICR3H_Bit6:1, ICR3H_Bit7:1; }; } @ 0x80;      
__io union { unsigned short OCR3C; struct { unsigned char OCR3C_Bit0:1, OCR3C_Bit1:1, OCR3C_Bit2:1, OCR3C_Bit3:1, OCR3C_Bit4:1, OCR3C_Bit5:1, OCR3C_Bit6:1, OCR3C_Bit7:1; unsigned char OCR3C_Bit8:1, OCR3C_Bit9:1, OCR3C_Bit10:1, OCR3C_Bit11:1, OCR3C_Bit12:1, OCR3C_Bit13:1, OCR3C_Bit14:1, OCR3C_Bit15:1; }; struct { unsigned char OCR3CL; unsigned char OCR3CH; }; struct { unsigned char OCR3CL_Bit0:1, OCR3CL_Bit1:1, OCR3CL_Bit2:1, OCR3CL_Bit3:1, OCR3CL_Bit4:1, OCR3CL_Bit5:1, OCR3CL_Bit6:1, OCR3CL_Bit7:1; unsigned char OCR3CH_Bit0:1, OCR3CH_Bit1:1, OCR3CH_Bit2:1, OCR3CH_Bit3:1, OCR3CH_Bit4:1, OCR3CH_Bit5:1, OCR3CH_Bit6:1, OCR3CH_Bit7:1; }; } @ 0x82;      
__io union { unsigned short OCR3B; struct { unsigned char OCR3B_Bit0:1, OCR3B_Bit1:1, OCR3B_Bit2:1, OCR3B_Bit3:1, OCR3B_Bit4:1, OCR3B_Bit5:1, OCR3B_Bit6:1, OCR3B_Bit7:1; unsigned char OCR3B_Bit8:1, OCR3B_Bit9:1, OCR3B_Bit10:1, OCR3B_Bit11:1, OCR3B_Bit12:1, OCR3B_Bit13:1, OCR3B_Bit14:1, OCR3B_Bit15:1; }; struct { unsigned char OCR3BL; unsigned char OCR3BH; }; struct { unsigned char OCR3BL_Bit0:1, OCR3BL_Bit1:1, OCR3BL_Bit2:1, OCR3BL_Bit3:1, OCR3BL_Bit4:1, OCR3BL_Bit5:1, OCR3BL_Bit6:1, OCR3BL_Bit7:1; unsigned char OCR3BH_Bit0:1, OCR3BH_Bit1:1, OCR3BH_Bit2:1, OCR3BH_Bit3:1, OCR3BH_Bit4:1, OCR3BH_Bit5:1, OCR3BH_Bit6:1, OCR3BH_Bit7:1; }; } @ 0x84;      
__io union { unsigned short OCR3A; struct { unsigned char OCR3A_Bit0:1, OCR3A_Bit1:1, OCR3A_Bit2:1, OCR3A_Bit3:1, OCR3A_Bit4:1, OCR3A_Bit5:1, OCR3A_Bit6:1, OCR3A_Bit7:1; unsigned char OCR3A_Bit8:1, OCR3A_Bit9:1, OCR3A_Bit10:1, OCR3A_Bit11:1, OCR3A_Bit12:1, OCR3A_Bit13:1, OCR3A_Bit14:1, OCR3A_Bit15:1; }; struct { unsigned char OCR3AL; unsigned char OCR3AH; }; struct { unsigned char OCR3AL_Bit0:1, OCR3AL_Bit1:1, OCR3AL_Bit2:1, OCR3AL_Bit3:1, OCR3AL_Bit4:1, OCR3AL_Bit5:1, OCR3AL_Bit6:1, OCR3AL_Bit7:1; unsigned char OCR3AH_Bit0:1, OCR3AH_Bit1:1, OCR3AH_Bit2:1, OCR3AH_Bit3:1, OCR3AH_Bit4:1, OCR3AH_Bit5:1, OCR3AH_Bit6:1, OCR3AH_Bit7:1; }; } @ 0x86;      
__io union { unsigned short TCNT3; struct { unsigned char TCNT3_Bit0:1, TCNT3_Bit1:1, TCNT3_Bit2:1, TCNT3_Bit3:1, TCNT3_Bit4:1, TCNT3_Bit5:1, TCNT3_Bit6:1, TCNT3_Bit7:1; unsigned char TCNT3_Bit8:1, TCNT3_Bit9:1, TCNT3_Bit10:1, TCNT3_Bit11:1, TCNT3_Bit12:1, TCNT3_Bit13:1, TCNT3_Bit14:1, TCNT3_Bit15:1; }; struct { unsigned char TCNT3L; unsigned char TCNT3H; }; struct { unsigned char TCNT3L_Bit0:1, TCNT3L_Bit1:1, TCNT3L_Bit2:1, TCNT3L_Bit3:1, TCNT3L_Bit4:1, TCNT3L_Bit5:1, TCNT3L_Bit6:1, TCNT3L_Bit7:1; unsigned char TCNT3H_Bit0:1, TCNT3H_Bit1:1, TCNT3H_Bit2:1, TCNT3H_Bit3:1, TCNT3H_Bit4:1, TCNT3H_Bit5:1, TCNT3H_Bit6:1, TCNT3H_Bit7:1; }; } @ 0x88;       
__io union { unsigned char TCCR3B; struct { unsigned char TCCR3B_Bit0:1, TCCR3B_Bit1:1, TCCR3B_Bit2:1, TCCR3B_Bit3:1, TCCR3B_Bit4:1, TCCR3B_Bit5:1, TCCR3B_Bit6:1, TCCR3B_Bit7:1; }; struct { unsigned char TCCR3B_CS30:1, TCCR3B_CS31:1, TCCR3B_CS32:1, TCCR3B_WGM32:1, TCCR3B_WGM33:1, TCCR3B_Dummy5:1, TCCR3B_ICES3:1, TCCR3B_ICNC3:1; }; } @ 0x8A;        
__io union { unsigned char TCCR3A; struct { unsigned char TCCR3A_Bit0:1, TCCR3A_Bit1:1, TCCR3A_Bit2:1, TCCR3A_Bit3:1, TCCR3A_Bit4:1, TCCR3A_Bit5:1, TCCR3A_Bit6:1, TCCR3A_Bit7:1; }; struct { unsigned char TCCR3A_WGM30:1, TCCR3A_WGM31:1, TCCR3A_COM3C0:1, TCCR3A_COM3C1:1, TCCR3A_COM3B0:1, TCCR3A_COM3B1:1, TCCR3A_COM3A0:1, TCCR3A_COM3A1:1; }; } @ 0x8B;  
__io union { unsigned char TCCR3C; struct { unsigned char TCCR3C_Bit0:1, TCCR3C_Bit1:1, TCCR3C_Bit2:1, TCCR3C_Bit3:1, TCCR3C_Bit4:1, TCCR3C_Bit5:1, TCCR3C_Bit6:1, TCCR3C_Bit7:1; }; struct { unsigned char TCCR3C_Dummy0:1, TCCR3C_Dummy1:1, TCCR3C_Dummy2:1, TCCR3C_Dummy3:1, TCCR3C_Dummy4:1, TCCR3C_FOC3C:1, TCCR3C_FOC3B:1, TCCR3C_FOC3A:1; }; } @ 0x8C; 

__io union { unsigned char UBRR0H; struct { unsigned char UBRR0H_Bit0:1, UBRR0H_Bit1:1, UBRR0H_Bit2:1, UBRR0H_Bit3:1, UBRR0H_Bit4:1, UBRR0H_Bit5:1, UBRR0H_Bit6:1, UBRR0H_Bit7:1; }; } @ 0x90;      

__io union { unsigned char UCSR0C; struct { unsigned char UCSR0C_Bit0:1, UCSR0C_Bit1:1, UCSR0C_Bit2:1, UCSR0C_Bit3:1, UCSR0C_Bit4:1, UCSR0C_Bit5:1, UCSR0C_Bit6:1, UCSR0C_Bit7:1; }; struct { unsigned char UCSR0C_UCPOL0:1, UCSR0C_UCSZ00:1, UCSR0C_UCSZ01:1, UCSR0C_USBS0:1, UCSR0C_UPM00:1, UCSR0C_UPM01:1, UCSR0C_UMSEL0:1, UCSR0C_Dummy7:1; }; } @ 0x95; 
__io union { unsigned char UBRR1H; struct { unsigned char UBRR1H_Bit0:1, UBRR1H_Bit1:1, UBRR1H_Bit2:1, UBRR1H_Bit3:1, UBRR1H_Bit4:1, UBRR1H_Bit5:1, UBRR1H_Bit6:1, UBRR1H_Bit7:1; }; } @ 0x98;      
__io union { unsigned char UBRR1L; struct { unsigned char UBRR1L_Bit0:1, UBRR1L_Bit1:1, UBRR1L_Bit2:1, UBRR1L_Bit3:1, UBRR1L_Bit4:1, UBRR1L_Bit5:1, UBRR1L_Bit6:1, UBRR1L_Bit7:1; }; } @ 0x99;      
__io union { unsigned char UCSR1B; struct { unsigned char UCSR1B_Bit0:1, UCSR1B_Bit1:1, UCSR1B_Bit2:1, UCSR1B_Bit3:1, UCSR1B_Bit4:1, UCSR1B_Bit5:1, UCSR1B_Bit6:1, UCSR1B_Bit7:1; }; struct { unsigned char UCSR1B_TXB81:1, UCSR1B_RXB81:1, UCSR1B_UCSZ12:1, UCSR1B_TXEN1:1, UCSR1B_RXEN1:1, UCSR1B_UDRIE1:1, UCSR1B_TXCIE1:1, UCSR1B_RXCIE1:1; }; } @ 0x9A;  
__io union { unsigned char UCSR1A; struct { unsigned char UCSR1A_Bit0:1, UCSR1A_Bit1:1, UCSR1A_Bit2:1, UCSR1A_Bit3:1, UCSR1A_Bit4:1, UCSR1A_Bit5:1, UCSR1A_Bit6:1, UCSR1A_Bit7:1; }; struct { unsigned char UCSR1A_MPCM1:1, UCSR1A_U2X1:1, UCSR1A_UPE1:1, UCSR1A_DOR1:1, UCSR1A_FE1:1, UCSR1A_UDRE1:1, UCSR1A_TXC1:1, UCSR1A_RXC1:1; }; } @ 0x9B;             
__io union { unsigned char UDR1; struct { unsigned char UDR1_Bit0:1, UDR1_Bit1:1, UDR1_Bit2:1, UDR1_Bit3:1, UDR1_Bit4:1, UDR1_Bit5:1, UDR1_Bit6:1, UDR1_Bit7:1; }; } @ 0x9C;      
__io union { unsigned char UCSR1C; struct { unsigned char UCSR1C_Bit0:1, UCSR1C_Bit1:1, UCSR1C_Bit2:1, UCSR1C_Bit3:1, UCSR1C_Bit4:1, UCSR1C_Bit5:1, UCSR1C_Bit6:1, UCSR1C_Bit7:1; }; struct { unsigned char UCSR1C_UCPOL1:1, UCSR1C_UCSZ10:1, UCSR1C_UCSZ11:1, UCSR1C_USBS1:1, UCSR1C_UPM10:1, UCSR1C_UPM11:1, UCSR1C_UMSEL1:1, UCSR1C_Dummy7:1; }; } @ 0x9D; 



 
 
 

 
 
 

 







 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

  

 

 

 
 
 
 
 
 
 

 

 

 

 

 

 

 

 

 


 

 

 

 

 

 

 

 

 

 

 

 

 
 
 
 
 
 
 

 
 
 
 
 
 
 

 
 
 
 
 
 
 

 
 
 
 
 
 
 

 

 

 

 

 

 
 
 
 
 
 
 


 

 












 





 










 








 





 
 





 































 







 






 











 





 










 








 





 
 





 
































 


                                        


                                        


                                        



                                        






                                        



                                        


                                        


                                        


                                        


                                        


                                        


                                        













 







 

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







 


 










 





 












 










 








 








 













 









 





















 









 







 



































 





 







 

void  BSP_Init(void);
void  BSP_TickISR(void);
void  BSP_TickISR_Handler(void);


void MCU_sleep(void);
void blink(void);
void beeper(unsigned char num,unsigned char times);
void delay10ms(void);
void led_torgge(unsigned char times);
void backlight(void);
void delayms(unsigned int num);




typedef unsigned char uchar;

typedef unsigned int  uint;

typedef unsigned long ulong;






extern OS_EVENT *KeySemPtr;
extern uchar keypressed;
extern INT8U KeyBuf[5];      
extern INT8U KeyBufInIx;                
extern INT8U KeyBufOutIx;               
extern INT8U KeyNRead;                  
extern INT16U    KeyDownTmr;                
extern INT8U     KeyRptStartDlyCtr;         
extern INT8U     KeyRptDlyCtr;              
extern INT8U     KeyScanState;              





 








 








 








 

void KeyBoard_Init(void);
INT8U  KeyDecode (void);
void  KeyBufIn (INT8U code);
INT8U  KeyGetKey (INT16U to);
uchar KeyHit(void);
BOOLEAN  KeyIsKeyDown (void);



extern uchar COMMONTEMP[1063];
extern uchar BLKGND_R;
extern uchar BLKGND_G;
extern uchar BLKGND_B;
extern uchar Text_R;
extern uchar Text_G;
extern uchar Text_B;
extern uchar BK_Trans1;   
extern uchar BK_Trans2;
extern uchar Text_Trans1; 
extern uchar Text_Trans2;





 



















 

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
void DispChar(uchar x,uchar y,uchar pos,uchar type);
void SetBKColor(uchar R,uchar G,uchar B);
void SetTextColor(uchar R,uchar G,uchar B);
void DispNewChar(uint xy,uint postype);

extern OS_EVENT *DispSem;







extern __flash unsigned char alphanum[];
OS_EVENT *DispSem;
uchar BLKGND_R;
uchar BLKGND_G;
uchar BLKGND_B;
uchar Text_R;
uchar Text_G;
uchar Text_B;
uchar BK_Trans1;   
uchar BK_Trans2;
uchar Text_Trans1; 
uchar Text_Trans2;

void LCD_Reset(void)
{
   PORTG &= ~(1<<3);
   delay10ms();
   delay10ms();
   PORTG |= (1<<3);
   delay10ms();        
}


        



 

void LCD_WriteData0(char Data)
{
  PORTD &= ~(1<<1);
  (*(volatile unsigned char *)0xffff) = Data;;
  PORTD |= (1<<1);
}


        



 
void LCD_WriteNonParaCommand0(char cmd)
{
   PORTD &= ~(1<<1);
   (*(volatile unsigned char *)0xfeff) = 0x00;;
   (*(volatile unsigned char *)0xfeff) = cmd;;
   PORTD |= (1<<1);
}


        



 

void LCD_WriteSingleCommand0(char cmd,char P1)
{
  PORTD &= ~(1<<1);
  (*(volatile unsigned char *)0xfeff) = cmd;;
  (*(volatile unsigned char *)0xffff) = P1;;
  PORTD |= (1<<1);
}


        



 

void LCD_WriteDoubleCommand0(char cmd,char P1, char P2)
{
  PORTD &= ~(1<<1);
  (*(volatile unsigned char *)0xfeff) = 0x00;;
  (*(volatile unsigned char *)0xfeff) = cmd;;
  (*(volatile unsigned char *)0xffff) = P1;;
  (*(volatile unsigned char *)0xffff) = P2;;
  PORTD |= (1<<1);
}

        



 

void LCD_WriteTripleCommand0(char cmd,char P1, char P2, char P3)
{
  PORTD &= ~(1<<1);
  (*(volatile unsigned char *)0xfeff) = 0x00;;
  (*(volatile unsigned char *)0xfeff) = cmd;;
  (*(volatile unsigned char *)0xffff) = P1;;
  (*(volatile unsigned char *)0xffff) = P2;;
  (*(volatile unsigned char *)0xffff) = P3;;
  PORTD |= (1<<1);
}


        



 


uchar LCD_ReadData0(void)
{
  volatile uchar r1,r2;
  PORTD &= ~(1<<1);
  { PORTD &= ~(1<<1); r1 = (*(volatile unsigned char *)0xffff); PORTD |= (1<<1); };
  { PORTD &= ~(1<<1); r2 = (*(volatile unsigned char *)0xffff); PORTD |= (1<<1); };
  PORTD |= (1<<1);
  return r1;
}

        



 

uchar LCD_ReadCmd0(void)
{
  uchar r;
  PORTD &= ~(1<<1);
  { PORTD &= ~(1<<1); r = (*(volatile unsigned char *)0xfeff); PORTD |= (1<<1); };
  PORTD |= (1<<1);
  return r;
}





 
void DispInit(void)
{
  uchar cpu_sr;
  
  
  
  (cpu_sr = OS_CPU_SR_Save());
  LCD_Reset();


     
     LCD_WriteDoubleCommand0(0x00,0x00,0x01);
     delayms(50);
LCD_ReadData0();
	 LCD_WriteDoubleCommand0(0x03,0x00,0x00);
	
     


     
     LCD_WriteDoubleCommand0(0x07,0x00,0x04);
     delayms(1);
     
     LCD_WriteDoubleCommand0(0x0d,0x03,0x04);
     delayms(1);
     
     LCD_WriteDoubleCommand0(0x0e,0x16,0x1A);
     delayms(70);

     
     LCD_WriteDoubleCommand0(0x01,0x01,0x13);
     delayms(1);

     
     LCD_WriteDoubleCommand0(0x02,0x07,0x00);
     delayms(1);

     
     LCD_WriteDoubleCommand0(0x05,0x10,0x08);
     delayms(1);

     
     LCD_WriteDoubleCommand0(0x06,0x00,0x00);
     delayms(1);

     
     LCD_WriteDoubleCommand0(0x0b,0x00,0x00);
     delayms(1);

     
     LCD_WriteDoubleCommand0(0x0c,0x00,0x0d);
     
     LCD_WriteDoubleCommand0(0x03,0x04,0x10);
     
     LCD_WriteDoubleCommand0(0x04,0x00,0x00);
     
     LCD_WriteDoubleCommand0(0x0E,0x12,0x1A);
     
     LCD_WriteDoubleCommand0(0x0D,0x01,0x19);
     
     LCD_WriteDoubleCommand0(0x0F,0x00,0x00);
     
     LCD_WriteDoubleCommand0(0x11,0x00,0x00);
     
     LCD_WriteDoubleCommand0(0x14,0x9F,0x00);
     
     LCD_WriteDoubleCommand0(0x15,0x00,0x00);
     
     LCD_WriteDoubleCommand0(0x16,0x7F,0x00);
     
     LCD_WriteDoubleCommand0(0x17,0x9F,0x00);
     
     LCD_WriteDoubleCommand0(0x21,0x00,0x00);

     LCD_WriteDoubleCommand0(0x07,0x00,0x05);
     delayms(10);

     LCD_WriteDoubleCommand0(0x07,0x00,0x25);
     delayms(10);

     LCD_WriteDoubleCommand0(0x07,0x00,0x27);
     delayms(10);

     LCD_WriteDoubleCommand0(0x07,0x00,0x37);
     delayms(10);

     BLKGND_R = 51;
     BLKGND_G = 127;
     BLKGND_B = 199;
   PORTB = PORTB|(1<<6);
   
   
   (OS_CPU_SR_Restore(cpu_sr));
}

void DispClrScr(void)
{
  uint  i,j;
  
  
  
  
  uchar err;
  
  {
    LCD_WriteDoubleCommand0(0x21,0x9F,0x7F);
    SetBKColor(51,127,199);
    
    for(i=0; i<128; i++)
    {
      for(j=0; j<160; j++)
      {
        LCD_WriteDoubleCommand0(0x22,BK_Trans1,BK_Trans2);
      }
    }
  }
  
}

void DispChar(uchar x,uchar y,uchar pos,uchar type)
{
  
  
  
  uchar cpu_sr,err;
  
  (cpu_sr = OS_CPU_SR_Save());
  if(type==1)
  {
    uint  column;
    uchar i,j;
    if((x >((128)-8))||(y >((160)-16)))
    {
      return;
    }
    for(i=0;i<8;i++)
    {
      LCD_WriteDoubleCommand0(0x21,159-y,127-x-i);
      column=(alphanum[(uint)pos*16+i])|(alphanum[(uint)pos*16+i+8]<<8);
      for(j=0;j<16;j++)
      {
       if((column & (0x01<<j))==0)
       {
         LCD_WriteDoubleCommand0(0x21,159-y-j-1,127-x-i);
       }
       else
       {
         LCD_WriteDoubleCommand0(0x22,Text_Trans1,Text_Trans2);
       }
      }
    }
  }




















 
  (OS_CPU_SR_Restore(cpu_sr));
  
}

void SetBKColor(uchar R,uchar G,uchar B)
{
  BLKGND_R = R;
  BLKGND_G = G;
  BLKGND_B = B;
  BK_Trans1 = (BLKGND_R & 0xf8) | ((BLKGND_G & 0xe0)>>5);
  BK_Trans2 = ((BLKGND_G &0x1c)<<3) | ((BLKGND_B & 0xf8)>>3);
}

void SetTextColor(uchar R,uchar G,uchar B)
{
  Text_R = R;
  Text_G = G;
  Text_B = B;
  Text_Trans1 = (Text_R & 0xf8) | ((Text_G & 0xe0)>>5);
  Text_Trans2 = ((Text_G &0x1c)<<3) | ((Text_B & 0xf8)>>3);
}

void DispNewChar(uint xy,uint postype)
{
  uchar x,y,pos,type;
  x=xy>>8;
  y=xy&0x00ff;
  pos=postype>>8;
  type=postype&0x00ff;
  DispChar(x,y,pos,type);
}
