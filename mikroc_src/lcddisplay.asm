
_interrupt:

;lcddisplay.c,19 :: 		void interrupt() {
;lcddisplay.c,20 :: 		USB_Interrupt_Proc(); // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;lcddisplay.c,21 :: 		}
L_end_interrupt:
L__interrupt133:
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
;lcddisplay.c,33 :: 		TRISA = 0x00; // Make all ports output
	CLRF        TRISA+0 
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
;lcddisplay.c,43 :: 		TRISA = 0x03;
	MOVLW       3
	MOVWF       TRISA+0 
;lcddisplay.c,44 :: 		LATA = 0x03;
	MOVLW       3
	MOVWF       LATA+0 
;lcddisplay.c,45 :: 		}
L_end_init_core:
	RETURN      0
; end of _init_core

_init_main:

;lcddisplay.c,47 :: 		void init_main() {
;lcddisplay.c,50 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,51 :: 		Lcd_Init(); // Initialize LCD
	CALL        _Lcd_Init+0, 0
;lcddisplay.c,52 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear LCD display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,53 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,55 :: 		GetEntriesStr(entry);
	MOVLW       init_main_entry_L0+0
	MOVWF       FARG_GetEntriesStr_out+0 
	MOVLW       hi_addr(init_main_entry_L0+0)
	MOVWF       FARG_GetEntriesStr_out+1 
	CALL        _GetEntriesStr+0, 0
;lcddisplay.c,56 :: 		LCD_2Row_Write("CHRON", entry);
	MOVLW       ?lstr1_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr1_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       init_main_entry_L0+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(init_main_entry_L0+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
;lcddisplay.c,57 :: 		Delay_ms(1500);
	MOVLW       92
	MOVWF       R11, 0
	MOVLW       81
	MOVWF       R12, 0
	MOVLW       96
	MOVWF       R13, 0
L_init_main0:
	DECFSZ      R13, 1, 1
	BRA         L_init_main0
	DECFSZ      R12, 1, 1
	BRA         L_init_main0
	DECFSZ      R11, 1, 1
	BRA         L_init_main0
	NOP
;lcddisplay.c,59 :: 		LATD = 0xFF;
	MOVLW       255
	MOVWF       LATD+0 
;lcddisplay.c,60 :: 		Delay_ms(200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
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
;lcddisplay.c,61 :: 		LATD = 0x00;
	CLRF        LATD+0 
;lcddisplay.c,62 :: 		Delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_init_main2:
	DECFSZ      R13, 1, 1
	BRA         L_init_main2
	DECFSZ      R12, 1, 1
	BRA         L_init_main2
	DECFSZ      R11, 1, 1
	BRA         L_init_main2
	NOP
;lcddisplay.c,63 :: 		LATD = 0xFF;
	MOVLW       255
	MOVWF       LATD+0 
;lcddisplay.c,64 :: 		Delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_init_main3:
	DECFSZ      R13, 1, 1
	BRA         L_init_main3
	DECFSZ      R12, 1, 1
	BRA         L_init_main3
	DECFSZ      R11, 1, 1
	BRA         L_init_main3
	NOP
;lcddisplay.c,65 :: 		LATD = 0x00;
	CLRF        LATD+0 
;lcddisplay.c,66 :: 		}
L_end_init_main:
	RETURN      0
; end of _init_main

_USB_Mode:

;lcddisplay.c,68 :: 		void USB_Mode() {
;lcddisplay.c,79 :: 		unsigned char end_of_signal = 0;
	CLRF        USB_Mode_end_of_signal_L0+0 
	CLRF        USB_Mode_page_L0+0 
	CLRF        USB_Mode_address_L0+0 
	CLRF        USB_Mode_address_count_L0+0 
	CLRF        USB_Mode_entry_on_page_L0+0 
	CLRF        USB_Mode_is_read_broken_L0+0 
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,84 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,85 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,88 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,91 :: 		HID_Enable(&readbuff,&writebuff);
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;lcddisplay.c,93 :: 		while(GetOpMode() == USB_TEST){
L_USB_Mode4:
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode137
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode137:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode5
;lcddisplay.c,94 :: 		LCD_1Row_Write("USB MODE");
	MOVLW       ?lstr2_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr2_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,95 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);
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
	GOTO        L__USB_Mode138
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode138:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode7
L__USB_Mode129:
	GOTO        L_USB_Mode6
L_USB_Mode7:
;lcddisplay.c,97 :: 		if ((int)readbuff[0] == 0) {
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode139
	MOVLW       0
	XORWF       R1, 0 
L__USB_Mode139:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode10
;lcddisplay.c,98 :: 		LCD_1Row_Write("Sending Time"); Delay_ms(500);
	MOVLW       ?lstr3_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr3_lcddisplay+0)
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
;lcddisplay.c,99 :: 		USB_Buffer_Time();
	CALL        _USB_Buffer_Time+0, 0
;lcddisplay.c,100 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
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
	GOTO        L__USB_Mode140
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode140:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode13
L__USB_Mode128:
	GOTO        L_USB_Mode12
L_USB_Mode13:
;lcddisplay.c,101 :: 		LCD_1Row_Write("Time Sent"); Delay_ms(1000);
	MOVLW       ?lstr4_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr4_lcddisplay+0)
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
;lcddisplay.c,103 :: 		} else if ((int)readbuff[0] == 1) {
	GOTO        L_USB_Mode17
L_USB_Mode10:
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode141
	MOVLW       1
	XORWF       R1, 0 
L__USB_Mode141:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode18
;lcddisplay.c,105 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	CLRF        USB_Mode_page_L0+0 
L_USB_Mode19:
	MOVLW       8
	SUBWF       USB_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode20
;lcddisplay.c,106 :: 		if (is_read_broken == 1) {
	MOVF        USB_Mode_is_read_broken_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode22
;lcddisplay.c,107 :: 		is_read_broken = 0;
	CLRF        USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,108 :: 		break;
	GOTO        L_USB_Mode20
;lcddisplay.c,109 :: 		}
L_USB_Mode22:
;lcddisplay.c,110 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        USB_Mode_address_L0+0 
;lcddisplay.c,111 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        USB_Mode_entry_on_page_L0+0 
L_USB_Mode23:
	MOVLW       12
	SUBWF       USB_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode24
;lcddisplay.c,112 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,113 :: 		writebuff[0] = 0; // 0 start
	CLRF        1344 
;lcddisplay.c,114 :: 		writebuff[1] = 2; // command code
	MOVLW       2
	MOVWF       1345 
;lcddisplay.c,115 :: 		writebuff[2] = page; // page
	MOVF        USB_Mode_page_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,116 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        USB_Mode_address_count_L0+0 
L_USB_Mode26:
	MOVLW       21
	SUBWF       USB_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode27
;lcddisplay.c,117 :: 		writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
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
;lcddisplay.c,118 :: 		address++;
	INCF        USB_Mode_address_L0+0, 1 
;lcddisplay.c,116 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        USB_Mode_address_count_L0+0, 1 
;lcddisplay.c,119 :: 		}
	GOTO        L_USB_Mode26
L_USB_Mode27:
;lcddisplay.c,120 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode29:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode30
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode142
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode142:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode30
L__USB_Mode127:
	GOTO        L_USB_Mode29
L_USB_Mode30:
;lcddisplay.c,121 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);		// wait for respsonse to continue
L_USB_Mode33:
	CALL        _HID_Read+0, 0
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
	GOTO        L__USB_Mode143
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode143:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode34
L__USB_Mode126:
	GOTO        L_USB_Mode33
L_USB_Mode34:
;lcddisplay.c,122 :: 		if (!(readbuff[0] == 2)) {
	MOVF        1280, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode37
;lcddisplay.c,123 :: 		is_read_broken = 1;
	MOVLW       1
	MOVWF       USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,124 :: 		LCD_1Row_Write("Read Error"); Delay_ms(1000);
	MOVLW       ?lstr5_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr5_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode38:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode38
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode38
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode38
	NOP
	NOP
;lcddisplay.c,125 :: 		break;
	GOTO        L_USB_Mode24
;lcddisplay.c,126 :: 		}
L_USB_Mode37:
;lcddisplay.c,111 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        USB_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,127 :: 		}
	GOTO        L_USB_Mode23
L_USB_Mode24:
;lcddisplay.c,105 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	INCF        USB_Mode_page_L0+0, 1 
;lcddisplay.c,128 :: 		}
	GOTO        L_USB_Mode19
L_USB_Mode20:
;lcddisplay.c,130 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,131 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,132 :: 		writebuff[1] = 3;
	MOVLW       3
	MOVWF       1345 
;lcddisplay.c,133 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode39:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode40
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode144
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode144:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode40
L__USB_Mode125:
	GOTO        L_USB_Mode39
L_USB_Mode40:
;lcddisplay.c,134 :: 		if (is_read_broken == 0) {
	MOVF        USB_Mode_is_read_broken_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode43
;lcddisplay.c,135 :: 		LCD_1Row_Write("Entries Sent"); Delay_ms(1000);
	MOVLW       ?lstr6_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr6_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode44:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode44
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode44
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode44
	NOP
	NOP
;lcddisplay.c,136 :: 		} else {
	GOTO        L_USB_Mode45
L_USB_Mode43:
;lcddisplay.c,137 :: 		LCD_1Row_Write("Read Error"); Delay_ms(1000);
	MOVLW       ?lstr7_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr7_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode46:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode46
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode46
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode46
	NOP
	NOP
;lcddisplay.c,138 :: 		is_read_broken = 0;
	CLRF        USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,139 :: 		}
L_USB_Mode45:
;lcddisplay.c,140 :: 		} else if ((int)readbuff[0] == 7) {
	GOTO        L_USB_Mode47
L_USB_Mode18:
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode145
	MOVLW       7
	XORWF       R1, 0 
L__USB_Mode145:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode48
;lcddisplay.c,141 :: 		EEPROM_Write(0x00, readbuff[1] + 1);
	CLRF        FARG_EEPROM_Write_address+0 
	MOVF        1281, 0 
	ADDLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;lcddisplay.c,142 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	CLRF        USB_Mode_page_L0+0 
L_USB_Mode49:
	MOVLW       8
	SUBWF       USB_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode50
;lcddisplay.c,143 :: 		if (is_write_broken == 1) {
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode52
;lcddisplay.c,144 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,145 :: 		break;
	GOTO        L_USB_Mode50
;lcddisplay.c,146 :: 		}
L_USB_Mode52:
;lcddisplay.c,147 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        USB_Mode_address_L0+0 
;lcddisplay.c,148 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        USB_Mode_entry_on_page_L0+0 
L_USB_Mode53:
	MOVLW       12
	SUBWF       USB_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode54
;lcddisplay.c,150 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,151 :: 		writebuff[0] = 0; // 0 start
	CLRF        1344 
;lcddisplay.c,152 :: 		writebuff[1] = 6; // command code
	MOVLW       6
	MOVWF       1345 
;lcddisplay.c,153 :: 		writebuff[2] = page; // page
	MOVF        USB_Mode_page_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,155 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        USB_Mode_address_count_L0+0 
L_USB_Mode56:
	MOVLW       21
	SUBWF       USB_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode57
;lcddisplay.c,157 :: 		I2C_Write_Byte_To_EEPROM(mempages_write[page], address, readbuff[address_count+2]);
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
;lcddisplay.c,158 :: 		writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
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
;lcddisplay.c,159 :: 		address++;
	INCF        USB_Mode_address_L0+0, 1 
;lcddisplay.c,155 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        USB_Mode_address_count_L0+0, 1 
;lcddisplay.c,161 :: 		}
	GOTO        L_USB_Mode56
L_USB_Mode57:
;lcddisplay.c,164 :: 		if ((int)readbuff[2] > 0) {
	MOVF        1282, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode146
	MOVF        R1, 0 
	SUBLW       0
L__USB_Mode146:
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode59
;lcddisplay.c,166 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode60:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode61
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode147
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode147:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode61
L__USB_Mode124:
	GOTO        L_USB_Mode60
L_USB_Mode61:
;lcddisplay.c,169 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);		// wait for respsonse to continue
L_USB_Mode64:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode65
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode148
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode148:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode65
L__USB_Mode123:
	GOTO        L_USB_Mode64
L_USB_Mode65:
;lcddisplay.c,170 :: 		if (!(readbuff[0] == 4)) {
	MOVF        1280, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode68
;lcddisplay.c,171 :: 		is_write_broken = 1;
	MOVLW       1
	MOVWF       USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,172 :: 		LCD_1Row_Write("Write Error"); Delay_ms(1000);
	MOVLW       ?lstr8_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr8_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode69:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode69
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode69
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode69
	NOP
	NOP
;lcddisplay.c,173 :: 		break;
	GOTO        L_USB_Mode54
;lcddisplay.c,174 :: 		}
L_USB_Mode68:
;lcddisplay.c,175 :: 		}
	GOTO        L_USB_Mode70
L_USB_Mode59:
;lcddisplay.c,178 :: 		end_of_signal = 1;
	MOVLW       1
	MOVWF       USB_Mode_end_of_signal_L0+0 
;lcddisplay.c,179 :: 		break;
	GOTO        L_USB_Mode54
;lcddisplay.c,180 :: 		}
L_USB_Mode70:
;lcddisplay.c,148 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        USB_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,181 :: 		}
	GOTO        L_USB_Mode53
L_USB_Mode54:
;lcddisplay.c,182 :: 		if (end_of_signal == 1) {
	MOVF        USB_Mode_end_of_signal_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode71
;lcddisplay.c,183 :: 		break;
	GOTO        L_USB_Mode50
;lcddisplay.c,184 :: 		}
L_USB_Mode71:
;lcddisplay.c,142 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	INCF        USB_Mode_page_L0+0, 1 
;lcddisplay.c,185 :: 		}
	GOTO        L_USB_Mode49
L_USB_Mode50:
;lcddisplay.c,187 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,188 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,189 :: 		writebuff[1] = 5;
	MOVLW       5
	MOVWF       1345 
;lcddisplay.c,190 :: 		writebuff[2] = is_write_broken;
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,191 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode72:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode73
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode149
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode149:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode73
L__USB_Mode122:
	GOTO        L_USB_Mode72
L_USB_Mode73:
;lcddisplay.c,192 :: 		if (is_write_broken == 0) {
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode76
;lcddisplay.c,193 :: 		LCD_1Row_Write("Entries Written"); Delay_ms(1000);
	MOVLW       ?lstr9_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr9_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode77:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode77
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode77
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode77
	NOP
	NOP
;lcddisplay.c,194 :: 		} else {
	GOTO        L_USB_Mode78
L_USB_Mode76:
;lcddisplay.c,195 :: 		LCD_1Row_Write("Write Error"); Delay_ms(1000);
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
L_USB_Mode79:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode79
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode79
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode79
	NOP
	NOP
;lcddisplay.c,196 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,197 :: 		}
L_USB_Mode78:
;lcddisplay.c,199 :: 		if (end_of_signal == 1) {
	MOVF        USB_Mode_end_of_signal_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode80
;lcddisplay.c,200 :: 		LCD_1Row_Write("End of Signal"); Delay_ms(1000);
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
L_USB_Mode81:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode81
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode81
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode81
	NOP
	NOP
;lcddisplay.c,201 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,202 :: 		}
L_USB_Mode80:
;lcddisplay.c,203 :: 		} else {
	GOTO        L_USB_Mode82
L_USB_Mode48:
;lcddisplay.c,204 :: 		TestUSBInput(str_usbDiagnostics);
	MOVLW       USB_Mode_str_usbDiagnostics_L0+0
	MOVWF       FARG_TestUSBInput_output_string+0 
	MOVLW       hi_addr(USB_Mode_str_usbDiagnostics_L0+0)
	MOVWF       FARG_TestUSBInput_output_string+1 
	CALL        _TestUSBInput+0, 0
;lcddisplay.c,205 :: 		LCD_2Row_Write("No Operation", str_usbDiagnostics); Delay_ms(1000);
	MOVLW       ?lstr12_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr12_lcddisplay+0)
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
L_USB_Mode83:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode83
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode83
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode83
	NOP
	NOP
;lcddisplay.c,206 :: 		}
L_USB_Mode82:
L_USB_Mode47:
L_USB_Mode17:
;lcddisplay.c,207 :: 		}
	GOTO        L_USB_Mode4
L_USB_Mode5:
;lcddisplay.c,209 :: 		HID_Disable();
	CALL        _HID_Disable+0, 0
;lcddisplay.c,210 :: 		LCD_1Row_Write("USB MODE EXITED");
	MOVLW       ?lstr13_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr13_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,211 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode84:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode84
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode84
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode84
	NOP
	NOP
;lcddisplay.c,212 :: 		}
L_end_USB_Mode:
	RETURN      0
; end of _USB_Mode

_USB_Buffer_Clear:

;lcddisplay.c,214 :: 		void USB_Buffer_Clear() {
;lcddisplay.c,215 :: 		int i=0;
	CLRF        USB_Buffer_Clear_i_L0+0 
	CLRF        USB_Buffer_Clear_i_L0+1 
;lcddisplay.c,216 :: 		for (i=0; i<64; i++) {
	CLRF        USB_Buffer_Clear_i_L0+0 
	CLRF        USB_Buffer_Clear_i_L0+1 
L_USB_Buffer_Clear85:
	MOVLW       128
	XORWF       USB_Buffer_Clear_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Buffer_Clear151
	MOVLW       64
	SUBWF       USB_Buffer_Clear_i_L0+0, 0 
L__USB_Buffer_Clear151:
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Buffer_Clear86
;lcddisplay.c,217 :: 		writebuff[i] = 0;
	MOVLW       _writebuff+0
	ADDWF       USB_Buffer_Clear_i_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_writebuff+0)
	ADDWFC      USB_Buffer_Clear_i_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;lcddisplay.c,216 :: 		for (i=0; i<64; i++) {
	INFSNZ      USB_Buffer_Clear_i_L0+0, 1 
	INCF        USB_Buffer_Clear_i_L0+1, 1 
;lcddisplay.c,218 :: 		}
	GOTO        L_USB_Buffer_Clear85
L_USB_Buffer_Clear86:
;lcddisplay.c,219 :: 		}
L_end_USB_Buffer_Clear:
	RETURN      0
; end of _USB_Buffer_Clear

_USB_Buffer_Time:

;lcddisplay.c,221 :: 		void USB_Buffer_Time() {
;lcddisplay.c,223 :: 		Write_Time(readbuff[1], readbuff[2], readbuff[3], readbuff[4], readbuff[5], readbuff[6]);
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
;lcddisplay.c,225 :: 		GetTimeStruct(&t);
	MOVLW       USB_Buffer_Time_t_L0+0
	MOVWF       FARG_GetTimeStruct_time+0 
	MOVLW       hi_addr(USB_Buffer_Time_t_L0+0)
	MOVWF       FARG_GetTimeStruct_time+1 
	CALL        _GetTimeStruct+0, 0
;lcddisplay.c,226 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,227 :: 		writebuff[1] = 0;
	CLRF        1345 
;lcddisplay.c,228 :: 		writebuff[2] = t.ss;
	MOVF        USB_Buffer_Time_t_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,229 :: 		writebuff[3] = t.mn;
	MOVF        USB_Buffer_Time_t_L0+1, 0 
	MOVWF       1347 
;lcddisplay.c,230 :: 		writebuff[4] = t.hh;
	MOVF        USB_Buffer_Time_t_L0+2, 0 
	MOVWF       1348 
;lcddisplay.c,231 :: 		writebuff[5] = t.md;
	MOVF        USB_Buffer_Time_t_L0+3, 0 
	MOVWF       1349 
;lcddisplay.c,232 :: 		writebuff[6] = t.wd;
	MOVF        USB_Buffer_Time_t_L0+4, 0 
	MOVWF       1350 
;lcddisplay.c,233 :: 		writebuff[7] = t.mo;
	MOVF        USB_Buffer_Time_t_L0+5, 0 
	MOVWF       1351 
;lcddisplay.c,234 :: 		writebuff[8] = t.yy;
	MOVF        USB_Buffer_Time_t_L0+6, 0 
	MOVWF       1352 
;lcddisplay.c,235 :: 		}
L_end_USB_Buffer_Time:
	RETURN      0
; end of _USB_Buffer_Time

_TIME_Mode:

;lcddisplay.c,237 :: 		void TIME_Mode() {
;lcddisplay.c,241 :: 		unsigned char page, entry_on_page, address_count, address, number_of_entries_read = 0, entry[21];
	CLRF        TIME_Mode_number_of_entries_read_L0+0 
	CLRF        TIME_Mode_redisplay_lag_L0+0 
;lcddisplay.c,248 :: 		init_core(); // Initialize Program
	CALL        _init_core+0, 0
;lcddisplay.c,249 :: 		I2C1_Init(100000); // Initialize IC2 for both EEPROM and RTC
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,252 :: 		while (GetOpMode() == I2C_RTC_TEST) {
L_TIME_Mode88:
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__TIME_Mode154
	MOVLW       51
	XORWF       R0, 0 
L__TIME_Mode154:
	BTFSS       STATUS+0, 2 
	GOTO        L_TIME_Mode89
;lcddisplay.c,254 :: 		numberofentries = EEPROM_Read(0x00); Delay_ms(20);
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
L_TIME_Mode90:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode90
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode90
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode90
;lcddisplay.c,256 :: 		for ( page=0; page<EEPROM_MEMORY_BANKS; page++ ){
	CLRF        TIME_Mode_page_L0+0 
L_TIME_Mode91:
	MOVLW       8
	SUBWF       TIME_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode92
;lcddisplay.c,257 :: 		if (number_of_entries_read >= numberofentries) break;
	MOVF        _numberofentries+0, 0 
	SUBWF       TIME_Mode_number_of_entries_read_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_TIME_Mode94
	GOTO        L_TIME_Mode92
L_TIME_Mode94:
;lcddisplay.c,258 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        TIME_Mode_address_L0+0 
;lcddisplay.c,259 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        TIME_Mode_entry_on_page_L0+0 
L_TIME_Mode95:
	MOVLW       12
	SUBWF       TIME_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode96
;lcddisplay.c,260 :: 		if (number_of_entries_read >= numberofentries) break;
	MOVF        _numberofentries+0, 0 
	SUBWF       TIME_Mode_number_of_entries_read_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_TIME_Mode98
	GOTO        L_TIME_Mode96
L_TIME_Mode98:
;lcddisplay.c,263 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        TIME_Mode_address_count_L0+0 
L_TIME_Mode99:
	MOVLW       21
	SUBWF       TIME_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode100
;lcddisplay.c,264 :: 		entry[address_count] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
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
;lcddisplay.c,265 :: 		address++;
	INCF        TIME_Mode_address_L0+0, 1 
;lcddisplay.c,263 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        TIME_Mode_address_count_L0+0, 1 
;lcddisplay.c,274 :: 		}
	GOTO        L_TIME_Mode99
L_TIME_Mode100:
;lcddisplay.c,277 :: 		GetTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_GetTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_GetTimeStruct_time+1 
	CALL        _GetTimeStruct+0, 0
;lcddisplay.c,278 :: 		LATD7_bit = LATD7_bit;
;lcddisplay.c,279 :: 		if (redisplay_lag > 3) {
	MOVF        TIME_Mode_redisplay_lag_L0+0, 0 
	SUBLW       3
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode102
;lcddisplay.c,280 :: 		DisplayTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_DisplayTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_DisplayTimeStruct_time+1 
	CALL        _DisplayTimeStruct+0, 0
;lcddisplay.c,281 :: 		redisplay_lag = 0;
	CLRF        TIME_Mode_redisplay_lag_L0+0 
;lcddisplay.c,282 :: 		}
L_TIME_Mode102:
;lcddisplay.c,284 :: 		redisplay_lag++;
	INCF        TIME_Mode_redisplay_lag_L0+0, 1 
;lcddisplay.c,287 :: 		GetEntry(&entry, &ts);
	MOVLW       TIME_Mode_entry_L0+0
	MOVWF       FARG_GetEntry_entry+0 
	MOVLW       hi_addr(TIME_Mode_entry_L0+0)
	MOVWF       FARG_GetEntry_entry+1 
	MOVLW       TIME_Mode_ts_L0+0
	MOVWF       FARG_GetEntry_entry_s+0 
	MOVLW       hi_addr(TIME_Mode_ts_L0+0)
	MOVWF       FARG_GetEntry_entry_s+1 
	CALL        _GetEntry+0, 0
;lcddisplay.c,288 :: 		ActivateEntry(&ts, &t);
	MOVLW       TIME_Mode_ts_L0+0
	MOVWF       FARG_ActivateEntry_entry+0 
	MOVLW       hi_addr(TIME_Mode_ts_L0+0)
	MOVWF       FARG_ActivateEntry_entry+1 
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_ActivateEntry_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_ActivateEntry_time+1 
	CALL        _ActivateEntry+0, 0
;lcddisplay.c,296 :: 		number_of_entries_read++;
	INCF        TIME_Mode_number_of_entries_read_L0+0, 1 
;lcddisplay.c,259 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        TIME_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,297 :: 		}
	GOTO        L_TIME_Mode95
L_TIME_Mode96:
;lcddisplay.c,256 :: 		for ( page=0; page<EEPROM_MEMORY_BANKS; page++ ){
	INCF        TIME_Mode_page_L0+0, 1 
;lcddisplay.c,298 :: 		}
	GOTO        L_TIME_Mode91
L_TIME_Mode92:
;lcddisplay.c,300 :: 		number_of_entries_read = 0;
	CLRF        TIME_Mode_number_of_entries_read_L0+0 
;lcddisplay.c,301 :: 		}
	GOTO        L_TIME_Mode88
L_TIME_Mode89:
;lcddisplay.c,303 :: 		LCD_1Row_Write("TIME MODE EXITED"); Delay_ms(2000);
	MOVLW       ?lstr14_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr14_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_TIME_Mode103:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode103
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode103
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode103
	NOP
	NOP
;lcddisplay.c,304 :: 		}
L_end_TIME_Mode:
	RETURN      0
; end of _TIME_Mode

_I2C_Read_Byte_From_EEPROM:

;lcddisplay.c,306 :: 		unsigned char I2C_Read_Byte_From_EEPROM(unsigned char page_write, unsigned char page_read, unsigned char address) {
;lcddisplay.c,308 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,309 :: 		I2C1_Start();	      // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,310 :: 		I2C1_Wr(page_write);	     // send byte via I2C  (device address + W)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_page_write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,311 :: 		I2C1_Wr(address);	     // send byte (data address)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,312 :: 		I2C1_Repeated_Start();     // issue I2C signal repeated start
	CALL        _I2C1_Repeated_Start+0, 0
;lcddisplay.c,313 :: 		I2C1_Wr(page_read);	     // send byte (device address + R)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_page_read+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,314 :: 		x = I2C1_Rd(0);       // Read the data (NO acknowledge)
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       I2C_Read_Byte_From_EEPROM_x_L0+0 
;lcddisplay.c,315 :: 		I2C1_Stop();	       // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,316 :: 		return x;
	MOVF        I2C_Read_Byte_From_EEPROM_x_L0+0, 0 
	MOVWF       R0 
	GOTO        L_end_I2C_Read_Byte_From_EEPROM
;lcddisplay.c,317 :: 		Delay_ms(20);
L_I2C_Read_Byte_From_EEPROM104:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM104
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM104
	DECFSZ      R11, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM104
;lcddisplay.c,318 :: 		}
L_end_I2C_Read_Byte_From_EEPROM:
	RETURN      0
; end of _I2C_Read_Byte_From_EEPROM

_I2C_Write_Byte_To_EEPROM:

;lcddisplay.c,320 :: 		void I2C_Write_Byte_To_EEPROM(unsigned char page_write, unsigned char address, unsigned char byte2write) {
;lcddisplay.c,321 :: 		I2C1_Init(100000);	 // initialize I2C communication
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,322 :: 		I2C1_Start();	      // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,323 :: 		I2C1_Wr(page_write);	     // send byte via I2C  (device address + W)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_page_write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,324 :: 		I2C1_Wr(address);	     // send byte (address of EEPROM location)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,325 :: 		I2C1_Wr(byte2write);	     // send data (data to be written)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_byte2write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,326 :: 		I2C1_Stop();	// issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,327 :: 		Delay_ms(20);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_I2C_Write_Byte_To_EEPROM105:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM105
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM105
	DECFSZ      R11, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM105
;lcddisplay.c,328 :: 		}
L_end_I2C_Write_Byte_To_EEPROM:
	RETURN      0
; end of _I2C_Write_Byte_To_EEPROM

_GetOpMode:

;lcddisplay.c,330 :: 		short GetOpMode() {
;lcddisplay.c,331 :: 		if (RA0_bit && !RA1_bit) {
	BTFSS       RA0_bit+0, 0 
	GOTO        L_GetOpMode108
	BTFSC       RA1_bit+0, 1 
	GOTO        L_GetOpMode108
L__GetOpMode131:
;lcddisplay.c,332 :: 		opstate = USB_TEST;
	MOVLW       50
	MOVWF       _opstate+0 
;lcddisplay.c,333 :: 		} else if ( !RA0_bit && RA1_bit) {
	GOTO        L_GetOpMode109
L_GetOpMode108:
	BTFSC       RA0_bit+0, 0 
	GOTO        L_GetOpMode112
	BTFSS       RA1_bit+0, 1 
	GOTO        L_GetOpMode112
L__GetOpMode130:
;lcddisplay.c,334 :: 		opstate = I2C_RTC_TEST;
	MOVLW       51
	MOVWF       _opstate+0 
;lcddisplay.c,335 :: 		}
L_GetOpMode112:
L_GetOpMode109:
;lcddisplay.c,337 :: 		return opstate;
	MOVF        _opstate+0, 0 
	MOVWF       R0 
;lcddisplay.c,338 :: 		}
L_end_GetOpMode:
	RETURN      0
; end of _GetOpMode

_main:

;lcddisplay.c,340 :: 		void main() {
;lcddisplay.c,342 :: 		init_main();
	CALL        _init_main+0, 0
;lcddisplay.c,343 :: 		while (1) {
L_main113:
;lcddisplay.c,344 :: 		GetOpMode();
	CALL        _GetOpMode+0, 0
;lcddisplay.c,345 :: 		switch (opstate) {
	GOTO        L_main115
;lcddisplay.c,346 :: 		case USB_TEST:
L_main117:
;lcddisplay.c,347 :: 		LCD_1Row_Write("USB Mode");
	MOVLW       ?lstr15_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr15_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,348 :: 		USB_Mode();
	CALL        _USB_Mode+0, 0
;lcddisplay.c,349 :: 		break;
	GOTO        L_main116
;lcddisplay.c,350 :: 		case I2C_RTC_TEST:
L_main118:
;lcddisplay.c,351 :: 		LCD_1Row_Write("I2C RTC Mode");
	MOVLW       ?lstr16_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr16_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,352 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,353 :: 		Delay_ms(200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main119:
	DECFSZ      R13, 1, 1
	BRA         L_main119
	DECFSZ      R12, 1, 1
	BRA         L_main119
	DECFSZ      R11, 1, 1
	BRA         L_main119
	NOP
	NOP
;lcddisplay.c,354 :: 		TIME_Mode();
	CALL        _TIME_Mode+0, 0
;lcddisplay.c,355 :: 		break;
	GOTO        L_main116
;lcddisplay.c,356 :: 		default:
L_main120:
;lcddisplay.c,357 :: 		LCD_2Row_Write("Operation Not", "Allowed");
	MOVLW       ?lstr17_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr17_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr18_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr18_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
;lcddisplay.c,358 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main121:
	DECFSZ      R13, 1, 1
	BRA         L_main121
	DECFSZ      R12, 1, 1
	BRA         L_main121
	DECFSZ      R11, 1, 1
	BRA         L_main121
	NOP
	NOP
;lcddisplay.c,359 :: 		break;
	GOTO        L_main116
;lcddisplay.c,360 :: 		}
L_main115:
	MOVF        _opstate+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_main117
	MOVF        _opstate+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_main118
	GOTO        L_main120
L_main116:
;lcddisplay.c,361 :: 		}
	GOTO        L_main113
;lcddisplay.c,362 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_TestUSBInput:

;lcddisplay.c,364 :: 		void TestUSBInput(char *output_string) {
;lcddisplay.c,366 :: 		ShortToStr(readbuff[0], buff_diag_d);
	MOVF        1280, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_d_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_d_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,367 :: 		ShortToStr(readbuff[1], buff_diag_a);
	MOVF        1281, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_a_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_a_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,368 :: 		ShortToStr(readbuff[2], buff_diag_b);
	MOVF        1282, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_b_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_b_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,369 :: 		strcpy(output_string, "");
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr19_lcddisplay+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr19_lcddisplay+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;lcddisplay.c,370 :: 		strcat(output_string, buff_diag_d);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_d_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_d_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,371 :: 		strcat(output_string, buff_diag_a);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_a_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_a_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,372 :: 		strcat(output_string, buff_diag_b);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_b_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_b_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,373 :: 		}
L_end_TestUSBInput:
	RETURN      0
; end of _TestUSBInput
