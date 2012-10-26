
_interrupt:

;lcddisplay.c,19 :: 		void interrupt() {
;lcddisplay.c,20 :: 		USB_Interrupt_Proc(); // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;lcddisplay.c,21 :: 		}
L_end_interrupt:
L__interrupt156:
	RETFIE      1
; end of _interrupt

_init_core:

;lcddisplay.c,23 :: 		void init_core() {
;lcddisplay.c,24 :: 		ADCON1 = 0x0F; // page 268, disable analaog
	MOVLW       15
	MOVWF       ADCON1+0 
;lcddisplay.c,25 :: 		CMCON = 0x07; // disable comparator
	MOVLW       7
	MOVWF       CMCON+0 
;lcddisplay.c,26 :: 		INTCON2 = 0x80; // disable pull up in port b
	MOVLW       128
	MOVWF       INTCON2+0 
;lcddisplay.c,28 :: 		LATA = 0x00; // Make all output ports 0
	CLRF        LATA+0 
;lcddisplay.c,29 :: 		LATC = 0x00; // Make all output ports 0
	CLRF        LATC+0 
;lcddisplay.c,30 :: 		LATD = 0x00; // Make all output ports 0
	CLRF        LATD+0 
;lcddisplay.c,31 :: 		LATE = 0x00; // Make all output ports 0
	CLRF        LATE+0 
;lcddisplay.c,33 :: 		TRISA = 0x03; // Make 00000011 directional ports.
	MOVLW       3
	MOVWF       TRISA+0 
;lcddisplay.c,34 :: 		TRISC = 0x00; // Make all ports output
	CLRF        TRISC+0 
;lcddisplay.c,35 :: 		TRISD = 0x00; // Make all ports output
	CLRF        TRISD+0 
;lcddisplay.c,36 :: 		TRISE = 0x00; // Make all ports output
	CLRF        TRISE+0 
;lcddisplay.c,38 :: 		PORTA = 0x00; // Make all ports 0
	CLRF        PORTA+0 
;lcddisplay.c,39 :: 		PORTC = 0x00; // Make all ports 0
	CLRF        PORTC+0 
;lcddisplay.c,40 :: 		PORTD = 0x00; // Make all ports 0
	CLRF        PORTD+0 
;lcddisplay.c,41 :: 		PORTE = 0x00; // Make all ports 0
	CLRF        PORTE+0 
;lcddisplay.c,43 :: 		LATA = 0x03;
	MOVLW       3
	MOVWF       LATA+0 
;lcddisplay.c,44 :: 		}
L_end_init_core:
	RETURN      0
; end of _init_core

_init_main:

;lcddisplay.c,46 :: 		void init_main() {
;lcddisplay.c,49 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,50 :: 		Lcd_Init(); // Initialize LCD
	CALL        _Lcd_Init+0, 0
;lcddisplay.c,51 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear LCD display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,52 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,54 :: 		GetEntriesStr(entry);
	MOVLW       init_main_entry_L0+0
	MOVWF       FARG_GetEntriesStr_out+0 
	MOVLW       hi_addr(init_main_entry_L0+0)
	MOVWF       FARG_GetEntriesStr_out+1 
	CALL        _GetEntriesStr+0, 0
;lcddisplay.c,55 :: 		LCD_2Row_Write("Chron Scheduler", entry); Delay_ms(1000);
	MOVLW       ?lstr1_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr1_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       init_main_entry_L0+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(init_main_entry_L0+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_init_main0:
	DECFSZ      R13, 1, 1
	BRA         L_init_main0
	DECFSZ      R12, 1, 1
	BRA         L_init_main0
	DECFSZ      R11, 1, 1
	BRA         L_init_main0
	NOP
	NOP
;lcddisplay.c,56 :: 		LCD_2Row_Write("Abestano", "Johannah Mae"); Delay_ms(1000);
	MOVLW       ?lstr2_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr2_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr3_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr3_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_init_main1:
	DECFSZ      R13, 1, 1
	BRA         L_init_main1
	DECFSZ      R12, 1, 1
	BRA         L_init_main1
	DECFSZ      R11, 1, 1
	BRA         L_init_main1
	NOP
	NOP
;lcddisplay.c,57 :: 		LCD_2Row_Write("Enanor", "Caryl Keen"); Delay_ms(1000);
	MOVLW       ?lstr4_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr4_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr5_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr5_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_init_main2:
	DECFSZ      R13, 1, 1
	BRA         L_init_main2
	DECFSZ      R12, 1, 1
	BRA         L_init_main2
	DECFSZ      R11, 1, 1
	BRA         L_init_main2
	NOP
	NOP
;lcddisplay.c,58 :: 		LCD_2Row_Write("Regalado", "Gil Michael"); Delay_ms(1000);
	MOVLW       ?lstr6_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr6_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr7_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr7_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_init_main3:
	DECFSZ      R13, 1, 1
	BRA         L_init_main3
	DECFSZ      R12, 1, 1
	BRA         L_init_main3
	DECFSZ      R11, 1, 1
	BRA         L_init_main3
	NOP
	NOP
;lcddisplay.c,59 :: 		}
L_end_init_main:
	RETURN      0
; end of _init_main

_USB_Mode:

;lcddisplay.c,61 :: 		void USB_Mode() {
;lcddisplay.c,62 :: 		unsigned char end_of_signal = 0;
	CLRF        USB_Mode_end_of_signal_L0+0 
	CLRF        USB_Mode_page_L0+0 
	CLRF        USB_Mode_address_L0+0 
	CLRF        USB_Mode_address_count_L0+0 
	CLRF        USB_Mode_entry_on_page_L0+0 
	CLRF        USB_Mode_is_read_broken_L0+0 
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,67 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,68 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,71 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,74 :: 		HID_Enable(&readbuff,&writebuff);
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;lcddisplay.c,76 :: 		while(GetOpMode() == USB_TEST){
L_USB_Mode4:
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode160
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode160:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode5
;lcddisplay.c,77 :: 		LCD_1Row_Write("USB MODE");
	MOVLW       ?lstr8_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr8_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,78 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);
L_USB_Mode6:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode7
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode161
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode161:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode7
L__USB_Mode152:
	GOTO        L_USB_Mode6
L_USB_Mode7:
;lcddisplay.c,80 :: 		if ((int)readbuff[0] == 0) {
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode162
	MOVLW       0
	XORWF       R1, 0 
L__USB_Mode162:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode10
;lcddisplay.c,81 :: 		EEPROM_Write(0x00, 0);
	CLRF        FARG_EEPROM_Write_address+0 
	CLRF        FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;lcddisplay.c,82 :: 		LCD_1Row_Write("Sending Time"); Delay_ms(500);
	MOVLW       ?lstr9_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr9_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_USB_Mode11:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode11
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode11
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode11
	NOP
;lcddisplay.c,83 :: 		USB_Buffer_Time();
	CALL        _USB_Buffer_Time+0, 0
;lcddisplay.c,84 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
L_USB_Mode12:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode13
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode163
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode163:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode13
L__USB_Mode151:
	GOTO        L_USB_Mode12
L_USB_Mode13:
;lcddisplay.c,85 :: 		LCD_1Row_Write("Time Sent"); Delay_ms(1000);
	MOVLW       ?lstr10_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr10_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode16:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode16
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode16
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode16
	NOP
	NOP
;lcddisplay.c,87 :: 		} else if ((int)readbuff[0] == 12) {
	GOTO        L_USB_Mode17
L_USB_Mode10:
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode164
	MOVLW       12
	XORWF       R1, 0 
L__USB_Mode164:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode18
;lcddisplay.c,88 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,89 :: 		writebuff[3] = readbuff[1];
	MOVF        1281, 0 
	MOVWF       1347 
;lcddisplay.c,90 :: 		switch (readbuff[1]) {
	GOTO        L_USB_Mode19
;lcddisplay.c,91 :: 		case ASTERISK:
L_USB_Mode21:
;lcddisplay.c,92 :: 		if (readbuff[2]) {
	MOVF        1282, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode22
;lcddisplay.c,93 :: 		LATD = 0xFF;
	MOVLW       255
	MOVWF       LATD+0 
;lcddisplay.c,94 :: 		writebuff[2] = 0xFF;
	MOVLW       255
	MOVWF       1346 
;lcddisplay.c,95 :: 		} else {
	GOTO        L_USB_Mode23
L_USB_Mode22:
;lcddisplay.c,96 :: 		LATD = 0x00;
	CLRF        LATD+0 
;lcddisplay.c,97 :: 		writebuff[2] = 0x00;
	CLRF        1346 
;lcddisplay.c,98 :: 		}
L_USB_Mode23:
;lcddisplay.c,99 :: 		break;
	GOTO        L_USB_Mode20
;lcddisplay.c,100 :: 		case 0:
L_USB_Mode24:
;lcddisplay.c,101 :: 		LATD0_bit = readbuff[2];
	BTFSC       1282, 0 
	GOTO        L__USB_Mode165
	BCF         LATD0_bit+0, 0 
	GOTO        L__USB_Mode166
L__USB_Mode165:
	BSF         LATD0_bit+0, 0 
L__USB_Mode166:
;lcddisplay.c,102 :: 		writebuff[2] = readbuff[2];
	MOVF        1282, 0 
	MOVWF       1346 
;lcddisplay.c,103 :: 		break;
	GOTO        L_USB_Mode20
;lcddisplay.c,104 :: 		case 1:
L_USB_Mode25:
;lcddisplay.c,105 :: 		LATD1_bit = readbuff[2];
	BTFSC       1282, 0 
	GOTO        L__USB_Mode167
	BCF         LATD1_bit+0, 1 
	GOTO        L__USB_Mode168
L__USB_Mode167:
	BSF         LATD1_bit+0, 1 
L__USB_Mode168:
;lcddisplay.c,106 :: 		writebuff[2] = readbuff[2];
	MOVF        1282, 0 
	MOVWF       1346 
;lcddisplay.c,107 :: 		break;
	GOTO        L_USB_Mode20
;lcddisplay.c,108 :: 		case 2:
L_USB_Mode26:
;lcddisplay.c,109 :: 		LATD2_bit = readbuff[2];
	BTFSC       1282, 0 
	GOTO        L__USB_Mode169
	BCF         LATD2_bit+0, 2 
	GOTO        L__USB_Mode170
L__USB_Mode169:
	BSF         LATD2_bit+0, 2 
L__USB_Mode170:
;lcddisplay.c,110 :: 		writebuff[2] = readbuff[2];
	MOVF        1282, 0 
	MOVWF       1346 
;lcddisplay.c,111 :: 		break;
	GOTO        L_USB_Mode20
;lcddisplay.c,112 :: 		case 3:
L_USB_Mode27:
;lcddisplay.c,113 :: 		LATD3_bit = readbuff[2];
	BTFSC       1282, 0 
	GOTO        L__USB_Mode171
	BCF         LATD3_bit+0, 3 
	GOTO        L__USB_Mode172
L__USB_Mode171:
	BSF         LATD3_bit+0, 3 
L__USB_Mode172:
;lcddisplay.c,114 :: 		writebuff[2] = readbuff[2];
	MOVF        1282, 0 
	MOVWF       1346 
;lcddisplay.c,115 :: 		break;
	GOTO        L_USB_Mode20
;lcddisplay.c,116 :: 		case 4:
L_USB_Mode28:
;lcddisplay.c,117 :: 		LATD4_bit = readbuff[2];
	BTFSC       1282, 0 
	GOTO        L__USB_Mode173
	BCF         LATD4_bit+0, 4 
	GOTO        L__USB_Mode174
L__USB_Mode173:
	BSF         LATD4_bit+0, 4 
L__USB_Mode174:
;lcddisplay.c,118 :: 		writebuff[2] = readbuff[2];
	MOVF        1282, 0 
	MOVWF       1346 
;lcddisplay.c,119 :: 		break;
	GOTO        L_USB_Mode20
;lcddisplay.c,120 :: 		case 5:
L_USB_Mode29:
;lcddisplay.c,121 :: 		LATD5_bit = readbuff[2];
	BTFSC       1282, 0 
	GOTO        L__USB_Mode175
	BCF         LATD5_bit+0, 5 
	GOTO        L__USB_Mode176
L__USB_Mode175:
	BSF         LATD5_bit+0, 5 
L__USB_Mode176:
;lcddisplay.c,122 :: 		writebuff[2] = readbuff[2];
	MOVF        1282, 0 
	MOVWF       1346 
;lcddisplay.c,123 :: 		break;
	GOTO        L_USB_Mode20
;lcddisplay.c,124 :: 		case 6:
L_USB_Mode30:
;lcddisplay.c,125 :: 		LATD6_bit = readbuff[2];
	BTFSC       1282, 0 
	GOTO        L__USB_Mode177
	BCF         LATD6_bit+0, 6 
	GOTO        L__USB_Mode178
L__USB_Mode177:
	BSF         LATD6_bit+0, 6 
L__USB_Mode178:
;lcddisplay.c,126 :: 		writebuff[2] = readbuff[2];
	MOVF        1282, 0 
	MOVWF       1346 
;lcddisplay.c,127 :: 		break;
	GOTO        L_USB_Mode20
;lcddisplay.c,128 :: 		case 7:
L_USB_Mode31:
;lcddisplay.c,129 :: 		LATD7_bit = readbuff[2];
	BTFSC       1282, 0 
	GOTO        L__USB_Mode179
	BCF         LATD7_bit+0, 7 
	GOTO        L__USB_Mode180
L__USB_Mode179:
	BSF         LATD7_bit+0, 7 
L__USB_Mode180:
;lcddisplay.c,130 :: 		writebuff[2] = readbuff[2];
	MOVF        1282, 0 
	MOVWF       1346 
;lcddisplay.c,131 :: 		break;
	GOTO        L_USB_Mode20
;lcddisplay.c,132 :: 		default:
L_USB_Mode32:
;lcddisplay.c,133 :: 		break;
	GOTO        L_USB_Mode20
;lcddisplay.c,134 :: 		}
L_USB_Mode19:
	MOVF        1281, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode21
	MOVF        1281, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode24
	MOVF        1281, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode25
	MOVF        1281, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode26
	MOVF        1281, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode27
	MOVF        1281, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode28
	MOVF        1281, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode29
	MOVF        1281, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode30
	MOVF        1281, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode31
	GOTO        L_USB_Mode32
L_USB_Mode20:
;lcddisplay.c,136 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,137 :: 		writebuff[1] = 13;
	MOVLW       13
	MOVWF       1345 
;lcddisplay.c,139 :: 		writebuff[4] = RD0_bit;
	MOVLW       0
	BTFSC       RD0_bit+0, 0 
	MOVLW       1
	MOVWF       1348 
;lcddisplay.c,140 :: 		writebuff[5] = RD1_bit;
	MOVLW       0
	BTFSC       RD1_bit+0, 1 
	MOVLW       1
	MOVWF       1349 
;lcddisplay.c,141 :: 		writebuff[6] = RD2_bit;
	MOVLW       0
	BTFSC       RD2_bit+0, 2 
	MOVLW       1
	MOVWF       1350 
;lcddisplay.c,142 :: 		writebuff[7] = RD3_bit;
	MOVLW       0
	BTFSC       RD3_bit+0, 3 
	MOVLW       1
	MOVWF       1351 
;lcddisplay.c,143 :: 		writebuff[8] = RD4_bit;
	MOVLW       0
	BTFSC       RD4_bit+0, 4 
	MOVLW       1
	MOVWF       1352 
;lcddisplay.c,144 :: 		writebuff[9] = RD5_bit;
	MOVLW       0
	BTFSC       RD5_bit+0, 5 
	MOVLW       1
	MOVWF       1353 
;lcddisplay.c,145 :: 		writebuff[10] = RD6_bit;
	MOVLW       0
	BTFSC       RD6_bit+0, 6 
	MOVLW       1
	MOVWF       1354 
;lcddisplay.c,146 :: 		writebuff[11] = RD7_bit;
	MOVLW       0
	BTFSC       RD7_bit+0, 7 
	MOVLW       1
	MOVWF       1355 
;lcddisplay.c,148 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
L_USB_Mode33:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode34
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode181
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode181:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode34
L__USB_Mode150:
	GOTO        L_USB_Mode33
L_USB_Mode34:
;lcddisplay.c,149 :: 		} else if ((int)readbuff[0] == 1) {
	GOTO        L_USB_Mode37
L_USB_Mode18:
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode182
	MOVLW       1
	XORWF       R1, 0 
L__USB_Mode182:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode38
;lcddisplay.c,151 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	CLRF        USB_Mode_page_L0+0 
L_USB_Mode39:
	MOVLW       8
	SUBWF       USB_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode40
;lcddisplay.c,152 :: 		if (is_read_broken == 1) {
	MOVF        USB_Mode_is_read_broken_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode42
;lcddisplay.c,153 :: 		is_read_broken = 0;
	CLRF        USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,154 :: 		break;
	GOTO        L_USB_Mode40
;lcddisplay.c,155 :: 		}
L_USB_Mode42:
;lcddisplay.c,156 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        USB_Mode_address_L0+0 
;lcddisplay.c,157 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        USB_Mode_entry_on_page_L0+0 
L_USB_Mode43:
	MOVLW       12
	SUBWF       USB_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode44
;lcddisplay.c,158 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,159 :: 		writebuff[0] = 0; // 0 start
	CLRF        1344 
;lcddisplay.c,160 :: 		writebuff[1] = 2; // command code
	MOVLW       2
	MOVWF       1345 
;lcddisplay.c,161 :: 		writebuff[2] = page; // page
	MOVF        USB_Mode_page_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,162 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        USB_Mode_address_count_L0+0 
L_USB_Mode46:
	MOVLW       21
	SUBWF       USB_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode47
;lcddisplay.c,163 :: 		writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
	MOVLW       3
	ADDWF       USB_Mode_address_count_L0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _writebuff+0
	ADDWF       R0, 0 
	MOVWF       FLOC__USB_Mode+0 
	MOVLW       hi_addr(_writebuff+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__USB_Mode+1 
	MOVLW       _mempages_write+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_mempages_write+0)
	MOVWF       FSR0H 
	MOVF        USB_Mode_page_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_Read_Byte_From_EEPROM_page_write+0 
	MOVLW       _mempages_read+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_mempages_read+0)
	MOVWF       FSR0H 
	MOVF        USB_Mode_page_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_Read_Byte_From_EEPROM_page_read+0 
	MOVF        USB_Mode_address_L0+0, 0 
	MOVWF       FARG_I2C_Read_Byte_From_EEPROM_address+0 
	CALL        _I2C_Read_Byte_From_EEPROM+0, 0
	MOVFF       FLOC__USB_Mode+0, FSR1
	MOVFF       FLOC__USB_Mode+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;lcddisplay.c,164 :: 		address++;
	INCF        USB_Mode_address_L0+0, 1 
;lcddisplay.c,162 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        USB_Mode_address_count_L0+0, 1 
;lcddisplay.c,165 :: 		}
	GOTO        L_USB_Mode46
L_USB_Mode47:
;lcddisplay.c,166 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode49:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode50
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode183
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode183:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode50
L__USB_Mode149:
	GOTO        L_USB_Mode49
L_USB_Mode50:
;lcddisplay.c,167 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);		// wait for respsonse to continue
L_USB_Mode53:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode54
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode184
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode184:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode54
L__USB_Mode148:
	GOTO        L_USB_Mode53
L_USB_Mode54:
;lcddisplay.c,168 :: 		if (!(readbuff[0] == 2)) {
	MOVF        1280, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode57
;lcddisplay.c,169 :: 		is_read_broken = 1;
	MOVLW       1
	MOVWF       USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,170 :: 		LCD_1Row_Write("Read Error"); Delay_ms(1000);
	MOVLW       ?lstr11_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr11_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode58:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode58
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode58
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode58
	NOP
	NOP
;lcddisplay.c,171 :: 		break;
	GOTO        L_USB_Mode44
;lcddisplay.c,172 :: 		}
L_USB_Mode57:
;lcddisplay.c,157 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        USB_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,173 :: 		}
	GOTO        L_USB_Mode43
L_USB_Mode44:
;lcddisplay.c,151 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	INCF        USB_Mode_page_L0+0, 1 
;lcddisplay.c,174 :: 		}
	GOTO        L_USB_Mode39
L_USB_Mode40:
;lcddisplay.c,176 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,177 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,178 :: 		writebuff[1] = 3;
	MOVLW       3
	MOVWF       1345 
;lcddisplay.c,179 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode59:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode60
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode185
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode185:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode60
L__USB_Mode147:
	GOTO        L_USB_Mode59
L_USB_Mode60:
;lcddisplay.c,180 :: 		if (is_read_broken == 0) {
	MOVF        USB_Mode_is_read_broken_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode63
;lcddisplay.c,181 :: 		LCD_1Row_Write("Entries Sent"); Delay_ms(1000);
	MOVLW       ?lstr12_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr12_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode64:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode64
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode64
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode64
	NOP
	NOP
;lcddisplay.c,182 :: 		} else {
	GOTO        L_USB_Mode65
L_USB_Mode63:
;lcddisplay.c,183 :: 		LCD_1Row_Write("Read Error"); Delay_ms(1000);
	MOVLW       ?lstr13_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr13_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode66:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode66
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode66
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode66
	NOP
	NOP
;lcddisplay.c,184 :: 		is_read_broken = 0;
	CLRF        USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,185 :: 		}
L_USB_Mode65:
;lcddisplay.c,186 :: 		} else if ((int)readbuff[0] == 7) {
	GOTO        L_USB_Mode67
L_USB_Mode38:
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode186
	MOVLW       7
	XORWF       R1, 0 
L__USB_Mode186:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode68
;lcddisplay.c,187 :: 		end_of_signal = 0;
	CLRF        USB_Mode_end_of_signal_L0+0 
;lcddisplay.c,188 :: 		EEPROM_Write(0x00, readbuff[1] + 1);
	CLRF        FARG_EEPROM_Write_address+0 
	MOVF        1281, 0 
	ADDLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;lcddisplay.c,189 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	CLRF        USB_Mode_page_L0+0 
L_USB_Mode69:
	MOVLW       8
	SUBWF       USB_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode70
;lcddisplay.c,190 :: 		if (is_write_broken == 1) {
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode72
;lcddisplay.c,191 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,192 :: 		break;
	GOTO        L_USB_Mode70
;lcddisplay.c,193 :: 		}
L_USB_Mode72:
;lcddisplay.c,195 :: 		if (end_of_signal == 1) {
	MOVF        USB_Mode_end_of_signal_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode73
;lcddisplay.c,196 :: 		break;
	GOTO        L_USB_Mode70
;lcddisplay.c,197 :: 		}
L_USB_Mode73:
;lcddisplay.c,199 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        USB_Mode_address_L0+0 
;lcddisplay.c,200 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        USB_Mode_entry_on_page_L0+0 
L_USB_Mode74:
	MOVLW       12
	SUBWF       USB_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode75
;lcddisplay.c,201 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,202 :: 		writebuff[0] = 0; // 0 start
	CLRF        1344 
;lcddisplay.c,203 :: 		writebuff[1] = 6; // command code
	MOVLW       6
	MOVWF       1345 
;lcddisplay.c,204 :: 		writebuff[2] = page; // page
	MOVF        USB_Mode_page_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,206 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        USB_Mode_address_count_L0+0 
L_USB_Mode77:
	MOVLW       21
	SUBWF       USB_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode78
;lcddisplay.c,207 :: 		I2C_Write_Byte_To_EEPROM(mempages_write[page], address, readbuff[address_count+2]);
	MOVLW       _mempages_write+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_mempages_write+0)
	MOVWF       FSR0H 
	MOVF        USB_Mode_page_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_Write_Byte_To_EEPROM_page_write+0 
	MOVF        USB_Mode_address_L0+0, 0 
	MOVWF       FARG_I2C_Write_Byte_To_EEPROM_address+0 
	MOVLW       2
	ADDWF       USB_Mode_address_count_L0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _readbuff+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_readbuff+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_Write_Byte_To_EEPROM_byte2write+0 
	CALL        _I2C_Write_Byte_To_EEPROM+0, 0
;lcddisplay.c,208 :: 		writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
	MOVLW       3
	ADDWF       USB_Mode_address_count_L0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _writebuff+0
	ADDWF       R0, 0 
	MOVWF       FLOC__USB_Mode+0 
	MOVLW       hi_addr(_writebuff+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__USB_Mode+1 
	MOVLW       _mempages_write+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_mempages_write+0)
	MOVWF       FSR0H 
	MOVF        USB_Mode_page_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_Read_Byte_From_EEPROM_page_write+0 
	MOVLW       _mempages_read+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_mempages_read+0)
	MOVWF       FSR0H 
	MOVF        USB_Mode_page_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_Read_Byte_From_EEPROM_page_read+0 
	MOVF        USB_Mode_address_L0+0, 0 
	MOVWF       FARG_I2C_Read_Byte_From_EEPROM_address+0 
	CALL        _I2C_Read_Byte_From_EEPROM+0, 0
	MOVFF       FLOC__USB_Mode+0, FSR1
	MOVFF       FLOC__USB_Mode+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;lcddisplay.c,209 :: 		address++;
	INCF        USB_Mode_address_L0+0, 1 
;lcddisplay.c,206 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        USB_Mode_address_count_L0+0, 1 
;lcddisplay.c,210 :: 		}
	GOTO        L_USB_Mode77
L_USB_Mode78:
;lcddisplay.c,212 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode80:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode81
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode187
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode187:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode81
L__USB_Mode146:
	GOTO        L_USB_Mode80
L_USB_Mode81:
;lcddisplay.c,213 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);		// wait for respsonse to continue
L_USB_Mode84:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode85
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode188
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode188:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode85
L__USB_Mode145:
	GOTO        L_USB_Mode84
L_USB_Mode85:
;lcddisplay.c,214 :: 		if (!(readbuff[0] == 4)) {
	MOVF        1280, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode88
;lcddisplay.c,215 :: 		is_write_broken = 1;
	MOVLW       1
	MOVWF       USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,216 :: 		LCD_1Row_Write("Write Error"); Delay_ms(1000);
	MOVLW       ?lstr14_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr14_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode89:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode89
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode89
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode89
	NOP
	NOP
;lcddisplay.c,217 :: 		break;
	GOTO        L_USB_Mode75
;lcddisplay.c,218 :: 		}
L_USB_Mode88:
;lcddisplay.c,221 :: 		if ((int)readbuff[2] == 0) {
	MOVF        1282, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode189
	MOVLW       0
	XORWF       R1, 0 
L__USB_Mode189:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode90
;lcddisplay.c,222 :: 		end_of_signal = 1;
	MOVLW       1
	MOVWF       USB_Mode_end_of_signal_L0+0 
;lcddisplay.c,223 :: 		break;
	GOTO        L_USB_Mode75
;lcddisplay.c,224 :: 		}
L_USB_Mode90:
;lcddisplay.c,200 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        USB_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,225 :: 		}
	GOTO        L_USB_Mode74
L_USB_Mode75:
;lcddisplay.c,189 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	INCF        USB_Mode_page_L0+0, 1 
;lcddisplay.c,226 :: 		}
	GOTO        L_USB_Mode69
L_USB_Mode70:
;lcddisplay.c,228 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,229 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,230 :: 		writebuff[1] = 5;
	MOVLW       5
	MOVWF       1345 
;lcddisplay.c,231 :: 		writebuff[2] = is_write_broken;
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,232 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode91:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode92
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode190
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode190:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode92
L__USB_Mode144:
	GOTO        L_USB_Mode91
L_USB_Mode92:
;lcddisplay.c,233 :: 		if (is_write_broken == 0) {
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode95
;lcddisplay.c,234 :: 		LCD_1Row_Write("Entries Written"); Delay_ms(1000);
	MOVLW       ?lstr15_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr15_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode96:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode96
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode96
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode96
	NOP
	NOP
;lcddisplay.c,235 :: 		} else {
	GOTO        L_USB_Mode97
L_USB_Mode95:
;lcddisplay.c,236 :: 		LCD_1Row_Write("Write Error"); Delay_ms(1000);
	MOVLW       ?lstr16_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr16_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode98:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode98
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode98
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode98
	NOP
	NOP
;lcddisplay.c,237 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,238 :: 		}
L_USB_Mode97:
;lcddisplay.c,240 :: 		if (end_of_signal == 1) {
	MOVF        USB_Mode_end_of_signal_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode99
;lcddisplay.c,241 :: 		LCD_1Row_Write("End of Signal"); Delay_ms(1000);
	MOVLW       ?lstr17_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr17_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode100:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode100
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode100
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode100
	NOP
	NOP
;lcddisplay.c,242 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,243 :: 		}
L_USB_Mode99:
;lcddisplay.c,244 :: 		} else {
	GOTO        L_USB_Mode101
L_USB_Mode68:
;lcddisplay.c,245 :: 		TestUSBInput(str_usbDiagnostics);
	MOVLW       USB_Mode_str_usbDiagnostics_L0+0
	MOVWF       FARG_TestUSBInput_output_string+0 
	MOVLW       hi_addr(USB_Mode_str_usbDiagnostics_L0+0)
	MOVWF       FARG_TestUSBInput_output_string+1 
	CALL        _TestUSBInput+0, 0
;lcddisplay.c,246 :: 		LCD_2Row_Write("No Operation", str_usbDiagnostics); Delay_ms(1000);
	MOVLW       ?lstr18_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr18_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       USB_Mode_str_usbDiagnostics_L0+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(USB_Mode_str_usbDiagnostics_L0+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode102:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode102
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode102
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode102
	NOP
	NOP
;lcddisplay.c,247 :: 		}
L_USB_Mode101:
L_USB_Mode67:
L_USB_Mode37:
L_USB_Mode17:
;lcddisplay.c,248 :: 		}
	GOTO        L_USB_Mode4
L_USB_Mode5:
;lcddisplay.c,250 :: 		HID_Disable();
	CALL        _HID_Disable+0, 0
;lcddisplay.c,251 :: 		LCD_1Row_Write("USB MODE EXITED");
	MOVLW       ?lstr19_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr19_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,252 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode103:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode103
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode103
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode103
	NOP
	NOP
;lcddisplay.c,253 :: 		}
L_end_USB_Mode:
	RETURN      0
; end of _USB_Mode

_USB_Buffer_Clear:

;lcddisplay.c,255 :: 		void USB_Buffer_Clear() {
;lcddisplay.c,256 :: 		int i=0;
	CLRF        USB_Buffer_Clear_i_L0+0 
	CLRF        USB_Buffer_Clear_i_L0+1 
;lcddisplay.c,257 :: 		for (i=0; i<64; i++) {
	CLRF        USB_Buffer_Clear_i_L0+0 
	CLRF        USB_Buffer_Clear_i_L0+1 
L_USB_Buffer_Clear104:
	MOVLW       128
	XORWF       USB_Buffer_Clear_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Buffer_Clear192
	MOVLW       64
	SUBWF       USB_Buffer_Clear_i_L0+0, 0 
L__USB_Buffer_Clear192:
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Buffer_Clear105
;lcddisplay.c,258 :: 		writebuff[i] = 0;
	MOVLW       _writebuff+0
	ADDWF       USB_Buffer_Clear_i_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_writebuff+0)
	ADDWFC      USB_Buffer_Clear_i_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;lcddisplay.c,257 :: 		for (i=0; i<64; i++) {
	INFSNZ      USB_Buffer_Clear_i_L0+0, 1 
	INCF        USB_Buffer_Clear_i_L0+1, 1 
;lcddisplay.c,259 :: 		}
	GOTO        L_USB_Buffer_Clear104
L_USB_Buffer_Clear105:
;lcddisplay.c,260 :: 		}
L_end_USB_Buffer_Clear:
	RETURN      0
; end of _USB_Buffer_Clear

_USB_Buffer_Time:

;lcddisplay.c,262 :: 		void USB_Buffer_Time() {
;lcddisplay.c,264 :: 		Write_Time(readbuff[7], readbuff[1], readbuff[2], readbuff[3], readbuff[4], readbuff[5], readbuff[6]);
	MOVF        1287, 0 
	MOVWF       FARG_Write_Time_sec+0 
	MOVF        1281, 0 
	MOVWF       FARG_Write_Time_min+0 
	MOVF        1282, 0 
	MOVWF       FARG_Write_Time_hours+0 
	MOVF        1283, 0 
	MOVWF       FARG_Write_Time_day+0 
	MOVF        1284, 0 
	MOVWF       FARG_Write_Time_dayofweek+0 
	MOVF        1285, 0 
	MOVWF       FARG_Write_Time_month+0 
	MOVF        1286, 0 
	MOVWF       FARG_Write_Time_year+0 
	CALL        _Write_Time+0, 0
;lcddisplay.c,266 :: 		GetTimeStruct(&t);
	MOVLW       USB_Buffer_Time_t_L0+0
	MOVWF       FARG_GetTimeStruct_time+0 
	MOVLW       hi_addr(USB_Buffer_Time_t_L0+0)
	MOVWF       FARG_GetTimeStruct_time+1 
	CALL        _GetTimeStruct+0, 0
;lcddisplay.c,267 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,268 :: 		writebuff[1] = 0;
	CLRF        1345 
;lcddisplay.c,269 :: 		writebuff[2] = t.ss;
	MOVF        USB_Buffer_Time_t_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,270 :: 		writebuff[3] = t.mn;
	MOVF        USB_Buffer_Time_t_L0+1, 0 
	MOVWF       1347 
;lcddisplay.c,271 :: 		writebuff[4] = t.hh;
	MOVF        USB_Buffer_Time_t_L0+2, 0 
	MOVWF       1348 
;lcddisplay.c,272 :: 		writebuff[5] = t.md;
	MOVF        USB_Buffer_Time_t_L0+3, 0 
	MOVWF       1349 
;lcddisplay.c,273 :: 		writebuff[6] = t.wd;
	MOVF        USB_Buffer_Time_t_L0+4, 0 
	MOVWF       1350 
;lcddisplay.c,274 :: 		writebuff[7] = t.mo;
	MOVF        USB_Buffer_Time_t_L0+5, 0 
	MOVWF       1351 
;lcddisplay.c,275 :: 		writebuff[8] = t.yy;
	MOVF        USB_Buffer_Time_t_L0+6, 0 
	MOVWF       1352 
;lcddisplay.c,276 :: 		}
L_end_USB_Buffer_Time:
	RETURN      0
; end of _USB_Buffer_Time

_TIME_Mode:

;lcddisplay.c,278 :: 		void TIME_Mode() {
;lcddisplay.c,282 :: 		unsigned char page, entry_on_page, address_count, address, number_of_entries_read = 0, entry[21];
	CLRF        TIME_Mode_number_of_entries_read_L0+0 
	CLRF        TIME_Mode_redisplay_lag_L0+0 
;lcddisplay.c,289 :: 		init_core(); // Initialize Program
	CALL        _init_core+0, 0
;lcddisplay.c,290 :: 		I2C1_Init(100000); // Initialize IC2 for both EEPROM and RTC
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,293 :: 		while (GetOpMode() == I2C_RTC_TEST) {
L_TIME_Mode107:
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__TIME_Mode195
	MOVLW       51
	XORWF       R0, 0 
L__TIME_Mode195:
	BTFSS       STATUS+0, 2 
	GOTO        L_TIME_Mode108
;lcddisplay.c,295 :: 		numberofentries = EEPROM_Read(0x00); Delay_ms(20);
	CLRF        FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _numberofentries+0 
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_TIME_Mode109:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode109
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode109
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode109
;lcddisplay.c,297 :: 		while (numberofentries > 95) {
L_TIME_Mode110:
	MOVF        _numberofentries+0, 0 
	SUBLW       95
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode111
;lcddisplay.c,298 :: 		GetTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_GetTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_GetTimeStruct_time+1 
	CALL        _GetTimeStruct+0, 0
;lcddisplay.c,299 :: 		DisplayTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_DisplayTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_DisplayTimeStruct_time+1 
	CALL        _DisplayTimeStruct+0, 0
;lcddisplay.c,300 :: 		Delay_ms(250);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_TIME_Mode112:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode112
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode112
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode112
	NOP
	NOP
;lcddisplay.c,301 :: 		}
	GOTO        L_TIME_Mode110
L_TIME_Mode111:
;lcddisplay.c,303 :: 		for ( page=0; page<EEPROM_MEMORY_BANKS; page++ ){
	CLRF        TIME_Mode_page_L0+0 
L_TIME_Mode113:
	MOVLW       8
	SUBWF       TIME_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode114
;lcddisplay.c,304 :: 		if (number_of_entries_read >= numberofentries) break;
	MOVF        _numberofentries+0, 0 
	SUBWF       TIME_Mode_number_of_entries_read_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_TIME_Mode116
	GOTO        L_TIME_Mode114
L_TIME_Mode116:
;lcddisplay.c,305 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        TIME_Mode_address_L0+0 
;lcddisplay.c,306 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        TIME_Mode_entry_on_page_L0+0 
L_TIME_Mode117:
	MOVLW       12
	SUBWF       TIME_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode118
;lcddisplay.c,307 :: 		if (number_of_entries_read >= numberofentries) break;
	MOVF        _numberofentries+0, 0 
	SUBWF       TIME_Mode_number_of_entries_read_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_TIME_Mode120
	GOTO        L_TIME_Mode118
L_TIME_Mode120:
;lcddisplay.c,310 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        TIME_Mode_address_count_L0+0 
L_TIME_Mode121:
	MOVLW       21
	SUBWF       TIME_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode122
;lcddisplay.c,311 :: 		entry[address_count] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
	MOVLW       TIME_Mode_entry_L0+0
	MOVWF       FLOC__TIME_Mode+0 
	MOVLW       hi_addr(TIME_Mode_entry_L0+0)
	MOVWF       FLOC__TIME_Mode+1 
	MOVF        TIME_Mode_address_count_L0+0, 0 
	ADDWF       FLOC__TIME_Mode+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__TIME_Mode+1, 1 
	MOVLW       _mempages_write+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_mempages_write+0)
	MOVWF       FSR0H 
	MOVF        TIME_Mode_page_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_Read_Byte_From_EEPROM_page_write+0 
	MOVLW       _mempages_read+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_mempages_read+0)
	MOVWF       FSR0H 
	MOVF        TIME_Mode_page_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_Read_Byte_From_EEPROM_page_read+0 
	MOVF        TIME_Mode_address_L0+0, 0 
	MOVWF       FARG_I2C_Read_Byte_From_EEPROM_address+0 
	CALL        _I2C_Read_Byte_From_EEPROM+0, 0
	MOVFF       FLOC__TIME_Mode+0, FSR1
	MOVFF       FLOC__TIME_Mode+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;lcddisplay.c,312 :: 		address++;
	INCF        TIME_Mode_address_L0+0, 1 
;lcddisplay.c,310 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        TIME_Mode_address_count_L0+0, 1 
;lcddisplay.c,313 :: 		}
	GOTO        L_TIME_Mode121
L_TIME_Mode122:
;lcddisplay.c,316 :: 		GetTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_GetTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_GetTimeStruct_time+1 
	CALL        _GetTimeStruct+0, 0
;lcddisplay.c,317 :: 		LATD7_bit = LATD7_bit;
;lcddisplay.c,318 :: 		if (redisplay_lag > 3) {
	MOVF        TIME_Mode_redisplay_lag_L0+0, 0 
	SUBLW       3
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode124
;lcddisplay.c,319 :: 		DisplayTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_DisplayTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_DisplayTimeStruct_time+1 
	CALL        _DisplayTimeStruct+0, 0
;lcddisplay.c,320 :: 		redisplay_lag = 0;
	CLRF        TIME_Mode_redisplay_lag_L0+0 
;lcddisplay.c,321 :: 		}
L_TIME_Mode124:
;lcddisplay.c,323 :: 		redisplay_lag++;
	INCF        TIME_Mode_redisplay_lag_L0+0, 1 
;lcddisplay.c,326 :: 		GetEntry(&entry, &ts);
	MOVLW       TIME_Mode_entry_L0+0
	MOVWF       FARG_GetEntry_entry+0 
	MOVLW       hi_addr(TIME_Mode_entry_L0+0)
	MOVWF       FARG_GetEntry_entry+1 
	MOVLW       TIME_Mode_ts_L0+0
	MOVWF       FARG_GetEntry_entry_s+0 
	MOVLW       hi_addr(TIME_Mode_ts_L0+0)
	MOVWF       FARG_GetEntry_entry_s+1 
	CALL        _GetEntry+0, 0
;lcddisplay.c,327 :: 		ActivateEntry(&ts, &t);
	MOVLW       TIME_Mode_ts_L0+0
	MOVWF       FARG_ActivateEntry_entry+0 
	MOVLW       hi_addr(TIME_Mode_ts_L0+0)
	MOVWF       FARG_ActivateEntry_entry+1 
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_ActivateEntry_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_ActivateEntry_time+1 
	CALL        _ActivateEntry+0, 0
;lcddisplay.c,329 :: 		number_of_entries_read++;
	INCF        TIME_Mode_number_of_entries_read_L0+0, 1 
;lcddisplay.c,306 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        TIME_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,330 :: 		}
	GOTO        L_TIME_Mode117
L_TIME_Mode118:
;lcddisplay.c,303 :: 		for ( page=0; page<EEPROM_MEMORY_BANKS; page++ ){
	INCF        TIME_Mode_page_L0+0, 1 
;lcddisplay.c,331 :: 		}
	GOTO        L_TIME_Mode113
L_TIME_Mode114:
;lcddisplay.c,333 :: 		number_of_entries_read = 0;
	CLRF        TIME_Mode_number_of_entries_read_L0+0 
;lcddisplay.c,334 :: 		}
	GOTO        L_TIME_Mode107
L_TIME_Mode108:
;lcddisplay.c,336 :: 		LCD_1Row_Write("TIME MODE EXITED"); Delay_ms(2000);
	MOVLW       ?lstr20_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr20_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_TIME_Mode125:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode125
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode125
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode125
	NOP
	NOP
;lcddisplay.c,337 :: 		}
L_end_TIME_Mode:
	RETURN      0
; end of _TIME_Mode

_I2C_Read_Byte_From_EEPROM:

;lcddisplay.c,339 :: 		unsigned char I2C_Read_Byte_From_EEPROM(unsigned char page_write, unsigned char page_read, unsigned char address) {
;lcddisplay.c,341 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,342 :: 		I2C1_Start();	      // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,343 :: 		I2C1_Wr(page_write);	     // send byte via I2C  (device address + W)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_page_write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,344 :: 		I2C1_Wr(address);	     // send byte (data address)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,345 :: 		I2C1_Repeated_Start();     // issue I2C signal repeated start
	CALL        _I2C1_Repeated_Start+0, 0
;lcddisplay.c,346 :: 		I2C1_Wr(page_read);	     // send byte (device address + R)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_page_read+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,347 :: 		x = I2C1_Rd(0);       // Read the data (NO acknowledge)
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       I2C_Read_Byte_From_EEPROM_x_L0+0 
;lcddisplay.c,348 :: 		I2C1_Stop();	       // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,349 :: 		return x;
	MOVF        I2C_Read_Byte_From_EEPROM_x_L0+0, 0 
	MOVWF       R0 
	GOTO        L_end_I2C_Read_Byte_From_EEPROM
;lcddisplay.c,350 :: 		Delay_ms(20);
L_I2C_Read_Byte_From_EEPROM126:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM126
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM126
	DECFSZ      R11, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM126
;lcddisplay.c,351 :: 		}
L_end_I2C_Read_Byte_From_EEPROM:
	RETURN      0
; end of _I2C_Read_Byte_From_EEPROM

_I2C_Write_Byte_To_EEPROM:

;lcddisplay.c,353 :: 		void I2C_Write_Byte_To_EEPROM(unsigned char page_write, unsigned char address, unsigned char byte2write) {
;lcddisplay.c,354 :: 		I2C1_Init(100000);	 // initialize I2C communication
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,355 :: 		I2C1_Start();	      // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,356 :: 		I2C1_Wr(page_write);	     // send byte via I2C  (device address + W)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_page_write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,357 :: 		I2C1_Wr(address);	     // send byte (address of EEPROM location)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,358 :: 		I2C1_Wr(byte2write);	     // send data (data to be written)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_byte2write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,359 :: 		I2C1_Stop();	// issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,360 :: 		Delay_ms(20);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_I2C_Write_Byte_To_EEPROM127:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM127
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM127
	DECFSZ      R11, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM127
;lcddisplay.c,361 :: 		}
L_end_I2C_Write_Byte_To_EEPROM:
	RETURN      0
; end of _I2C_Write_Byte_To_EEPROM

_GetOpMode:

;lcddisplay.c,363 :: 		short GetOpMode() {
;lcddisplay.c,364 :: 		if (RA0_bit && !RA1_bit) {
	BTFSS       RA0_bit+0, 0 
	GOTO        L_GetOpMode130
	BTFSC       RA1_bit+0, 1 
	GOTO        L_GetOpMode130
L__GetOpMode154:
;lcddisplay.c,365 :: 		opstate = USB_TEST;
	MOVLW       50
	MOVWF       _opstate+0 
;lcddisplay.c,366 :: 		} else if ( !RA0_bit && RA1_bit) {
	GOTO        L_GetOpMode131
L_GetOpMode130:
	BTFSC       RA0_bit+0, 0 
	GOTO        L_GetOpMode134
	BTFSS       RA1_bit+0, 1 
	GOTO        L_GetOpMode134
L__GetOpMode153:
;lcddisplay.c,367 :: 		opstate = I2C_RTC_TEST;
	MOVLW       51
	MOVWF       _opstate+0 
;lcddisplay.c,368 :: 		}
L_GetOpMode134:
L_GetOpMode131:
;lcddisplay.c,370 :: 		return opstate;
	MOVF        _opstate+0, 0 
	MOVWF       R0 
;lcddisplay.c,371 :: 		}
L_end_GetOpMode:
	RETURN      0
; end of _GetOpMode

_main:

;lcddisplay.c,373 :: 		void main() {
;lcddisplay.c,375 :: 		init_main();
	CALL        _init_main+0, 0
;lcddisplay.c,376 :: 		while (1) {
L_main135:
;lcddisplay.c,377 :: 		GetOpMode();
	CALL        _GetOpMode+0, 0
;lcddisplay.c,378 :: 		switch (opstate) {
	GOTO        L_main137
;lcddisplay.c,379 :: 		case USB_TEST:
L_main139:
;lcddisplay.c,380 :: 		LCD_1Row_Write("USB Mode");
	MOVLW       ?lstr21_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr21_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,381 :: 		USB_Mode();
	CALL        _USB_Mode+0, 0
;lcddisplay.c,382 :: 		break;
	GOTO        L_main138
;lcddisplay.c,383 :: 		case I2C_RTC_TEST:
L_main140:
;lcddisplay.c,384 :: 		LCD_1Row_Write("I2C RTC Mode");
	MOVLW       ?lstr22_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr22_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,385 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,386 :: 		Delay_ms(200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main141:
	DECFSZ      R13, 1, 1
	BRA         L_main141
	DECFSZ      R12, 1, 1
	BRA         L_main141
	DECFSZ      R11, 1, 1
	BRA         L_main141
	NOP
	NOP
;lcddisplay.c,387 :: 		TIME_Mode();
	CALL        _TIME_Mode+0, 0
;lcddisplay.c,388 :: 		break;
	GOTO        L_main138
;lcddisplay.c,389 :: 		default:
L_main142:
;lcddisplay.c,390 :: 		LCD_2Row_Write("Select Mode", "USB or RTC");
	MOVLW       ?lstr23_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr23_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr24_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr24_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
;lcddisplay.c,391 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main143:
	DECFSZ      R13, 1, 1
	BRA         L_main143
	DECFSZ      R12, 1, 1
	BRA         L_main143
	DECFSZ      R11, 1, 1
	BRA         L_main143
	NOP
	NOP
;lcddisplay.c,392 :: 		break;
	GOTO        L_main138
;lcddisplay.c,393 :: 		}
L_main137:
	MOVF        _opstate+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_main139
	MOVF        _opstate+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_main140
	GOTO        L_main142
L_main138:
;lcddisplay.c,394 :: 		}
	GOTO        L_main135
;lcddisplay.c,395 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_TestUSBInput:

;lcddisplay.c,397 :: 		void TestUSBInput(char *output_string) {
;lcddisplay.c,399 :: 		ShortToStr(readbuff[0], buff_diag_d);
	MOVF        1280, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_d_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_d_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,400 :: 		ShortToStr(readbuff[1], buff_diag_a);
	MOVF        1281, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_a_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_a_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,401 :: 		ShortToStr(readbuff[2], buff_diag_b);
	MOVF        1282, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_b_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_b_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,402 :: 		strcpy(output_string, "");
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr25_lcddisplay+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr25_lcddisplay+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;lcddisplay.c,403 :: 		strcat(output_string, buff_diag_d);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_d_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_d_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,404 :: 		strcat(output_string, buff_diag_a);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_a_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_a_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,405 :: 		strcat(output_string, buff_diag_b);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_b_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_b_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,406 :: 		}
L_end_TestUSBInput:
	RETURN      0
; end of _TestUSBInput
