
_interrupt:

;lcddisplay.c,20 :: 		void interrupt() {
;lcddisplay.c,21 :: 		USB_Interrupt_Proc(); // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;lcddisplay.c,22 :: 		}
L_end_interrupt:
L__interrupt130:
	RETFIE      1
; end of _interrupt

_init_core:

;lcddisplay.c,24 :: 		void init_core() {
;lcddisplay.c,25 :: 		ADCON1 = 0x0F; // page 268, disable analaog
	MOVLW       15
	MOVWF       ADCON1+0 
;lcddisplay.c,26 :: 		CMCON = 0x07; // disable comparator
	MOVLW       7
	MOVWF       CMCON+0 
;lcddisplay.c,27 :: 		INTCON2 = 0x80; // disable pull up in port b
	MOVLW       128
	MOVWF       INTCON2+0 
;lcddisplay.c,29 :: 		LATA = 0x00; // Make all output ports 0
	CLRF        LATA+0 
;lcddisplay.c,30 :: 		LATC = 0x00; // Make all output ports 0
	CLRF        LATC+0 
;lcddisplay.c,31 :: 		LATD = 0x00; // Make all output ports 0
	CLRF        LATD+0 
;lcddisplay.c,32 :: 		LATE = 0x00; // Make all output ports 0
	CLRF        LATE+0 
;lcddisplay.c,34 :: 		TRISA = 0x00; // Make all ports output
	CLRF        TRISA+0 
;lcddisplay.c,35 :: 		TRISC = 0x00; // Make all ports output
	CLRF        TRISC+0 
;lcddisplay.c,36 :: 		TRISD = 0x00; // Make all ports output
	CLRF        TRISD+0 
;lcddisplay.c,37 :: 		TRISE = 0x00; // Make all ports output
	CLRF        TRISE+0 
;lcddisplay.c,39 :: 		PORTA = 0x00; // Make all ports 0
	CLRF        PORTA+0 
;lcddisplay.c,40 :: 		PORTC = 0x00; // Make all ports 0
	CLRF        PORTC+0 
;lcddisplay.c,41 :: 		PORTD = 0x00; // Make all ports 0
	CLRF        PORTD+0 
;lcddisplay.c,42 :: 		PORTE = 0x00; // Make all ports 0
	CLRF        PORTE+0 
;lcddisplay.c,44 :: 		TRISA = 0x03;
	MOVLW       3
	MOVWF       TRISA+0 
;lcddisplay.c,45 :: 		LATA = 0x03;
	MOVLW       3
	MOVWF       LATA+0 
;lcddisplay.c,46 :: 		}
L_end_init_core:
	RETURN      0
; end of _init_core

_init_main:

;lcddisplay.c,48 :: 		void init_main() {
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
;lcddisplay.c,53 :: 		Lcd_Out(1, 1, "Hardware Cron");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_lcddisplay+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_lcddisplay+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcddisplay.c,54 :: 		Delay_ms(1000);
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
;lcddisplay.c,55 :: 		}
L_end_init_main:
	RETURN      0
; end of _init_main

_GetOperationMode:

;lcddisplay.c,57 :: 		void GetOperationMode() {
;lcddisplay.c,58 :: 		LCD_2Row_Write("Choose mode of", "Operation:");
	MOVLW       ?lstr2_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr2_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr3_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr3_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
;lcddisplay.c,59 :: 		opstate = Keypad_Get_Key();
	CALL        _Keypad_Get_Key+0, 0
	MOVF        R0, 0 
	MOVWF       _opstate+0 
;lcddisplay.c,60 :: 		}
L_end_GetOperationMode:
	RETURN      0
; end of _GetOperationMode

_USB_Mode:

;lcddisplay.c,62 :: 		void USB_Mode() {
;lcddisplay.c,73 :: 		unsigned char page=0, address=0, address_count=0, entry_on_page=0;
	CLRF        USB_Mode_page_L0+0 
	CLRF        USB_Mode_address_L0+0 
	CLRF        USB_Mode_address_count_L0+0 
	CLRF        USB_Mode_entry_on_page_L0+0 
	CLRF        USB_Mode_is_read_broken_L0+0 
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,77 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,78 :: 		I2C1_Init(100000); //
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,79 :: 		Write_Time(); // Write the new time
	CALL        _Write_Time+0, 0
;lcddisplay.c,82 :: 		for(cnt=0;cnt<64;cnt++) {
	CLRF        _cnt+0 
L_USB_Mode1:
	MOVLW       64
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode2
;lcddisplay.c,83 :: 		writebuff[cnt] = 0;
	MOVLW       _writebuff+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FSR1H 
	MOVF        _cnt+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	CLRF        POSTINC1+0 
;lcddisplay.c,82 :: 		for(cnt=0;cnt<64;cnt++) {
	INCF        _cnt+0, 1 
;lcddisplay.c,84 :: 		}
	GOTO        L_USB_Mode1
L_USB_Mode2:
;lcddisplay.c,87 :: 		HID_Enable(&readbuff,&writebuff);
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;lcddisplay.c,89 :: 		while(GetOpMode() == USB_TEST){
L_USB_Mode4:
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode135
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode135:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode5
;lcddisplay.c,90 :: 		LCD_1Row_Write("Waiting Command");
	MOVLW       ?lstr4_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr4_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,91 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);
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
	GOTO        L__USB_Mode136
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode136:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode7
L__USB_Mode126:
	GOTO        L_USB_Mode6
L_USB_Mode7:
;lcddisplay.c,93 :: 		if ((int)readbuff[0] == 0) {
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode137
	MOVLW       0
	XORWF       R1, 0 
L__USB_Mode137:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode10
;lcddisplay.c,94 :: 		LCD_1Row_Write("Sending Time"); Delay_ms(1000);
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
L_USB_Mode11:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode11
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode11
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode11
	NOP
	NOP
;lcddisplay.c,95 :: 		USB_Buffer_Time();
	CALL        _USB_Buffer_Time+0, 0
;lcddisplay.c,96 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
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
	GOTO        L__USB_Mode138
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode138:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode13
L__USB_Mode125:
	GOTO        L_USB_Mode12
L_USB_Mode13:
;lcddisplay.c,97 :: 		LCD_1Row_Write("Time Sent 00"); Delay_ms(1000);
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
L_USB_Mode16:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode16
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode16
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode16
	NOP
	NOP
;lcddisplay.c,99 :: 		} else if ((int)readbuff[0] == 1) {
	GOTO        L_USB_Mode17
L_USB_Mode10:
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode139
	MOVLW       1
	XORWF       R1, 0 
L__USB_Mode139:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode18
;lcddisplay.c,101 :: 		for (page=0; page<8; page++){
	CLRF        USB_Mode_page_L0+0 
L_USB_Mode19:
	MOVLW       8
	SUBWF       USB_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode20
;lcddisplay.c,102 :: 		if (is_read_broken == 1) {
	MOVF        USB_Mode_is_read_broken_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode22
;lcddisplay.c,103 :: 		is_read_broken = 0;
	CLRF        USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,104 :: 		break;
	GOTO        L_USB_Mode20
;lcddisplay.c,105 :: 		}
L_USB_Mode22:
;lcddisplay.c,106 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        USB_Mode_address_L0+0 
;lcddisplay.c,107 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        USB_Mode_entry_on_page_L0+0 
L_USB_Mode23:
	MOVLW       13
	SUBWF       USB_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode24
;lcddisplay.c,108 :: 		writebuff[0] = 0; // 0 start
	CLRF        1344 
;lcddisplay.c,109 :: 		writebuff[1] = 2; // command code
	MOVLW       2
	MOVWF       1345 
;lcddisplay.c,110 :: 		writebuff[2] = page; // page
	MOVF        USB_Mode_page_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,111 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        USB_Mode_address_count_L0+0 
L_USB_Mode26:
	MOVLW       19
	SUBWF       USB_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode27
;lcddisplay.c,112 :: 		writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
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
;lcddisplay.c,113 :: 		address++;
	INCF        USB_Mode_address_L0+0, 1 
;lcddisplay.c,111 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        USB_Mode_address_count_L0+0, 1 
;lcddisplay.c,114 :: 		}
	GOTO        L_USB_Mode26
L_USB_Mode27:
;lcddisplay.c,115 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
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
	GOTO        L__USB_Mode140
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode140:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode30
L__USB_Mode124:
	GOTO        L_USB_Mode29
L_USB_Mode30:
;lcddisplay.c,116 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);                // wait for respsonse to continue
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
	GOTO        L__USB_Mode141
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode141:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode34
L__USB_Mode123:
	GOTO        L_USB_Mode33
L_USB_Mode34:
;lcddisplay.c,117 :: 		if (!(readbuff[0] == 2)) {
	MOVF        1280, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode37
;lcddisplay.c,118 :: 		is_read_broken = 1;
	MOVLW       1
	MOVWF       USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,119 :: 		LCD_1Row_Write("Read Error"); Delay_ms(1000);
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
L_USB_Mode38:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode38
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode38
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode38
	NOP
	NOP
;lcddisplay.c,120 :: 		break;
	GOTO        L_USB_Mode24
;lcddisplay.c,121 :: 		}
L_USB_Mode37:
;lcddisplay.c,107 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        USB_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,122 :: 		}
	GOTO        L_USB_Mode23
L_USB_Mode24:
;lcddisplay.c,101 :: 		for (page=0; page<8; page++){
	INCF        USB_Mode_page_L0+0, 1 
;lcddisplay.c,123 :: 		}
	GOTO        L_USB_Mode19
L_USB_Mode20:
;lcddisplay.c,124 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,125 :: 		writebuff[1] = 3;
	MOVLW       3
	MOVWF       1345 
;lcddisplay.c,126 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
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
	GOTO        L__USB_Mode142
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode142:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode40
L__USB_Mode122:
	GOTO        L_USB_Mode39
L_USB_Mode40:
;lcddisplay.c,127 :: 		if (is_read_broken == 0) {
	MOVF        USB_Mode_is_read_broken_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode43
;lcddisplay.c,128 :: 		LCD_1Row_Write("Entries Sent"); Delay_ms(1000);
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
L_USB_Mode44:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode44
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode44
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode44
	NOP
	NOP
;lcddisplay.c,129 :: 		} else {
	GOTO        L_USB_Mode45
L_USB_Mode43:
;lcddisplay.c,130 :: 		LCD_1Row_Write("Read Error"); Delay_ms(1000);
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
L_USB_Mode46:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode46
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode46
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode46
	NOP
	NOP
;lcddisplay.c,131 :: 		is_read_broken = 0;
	CLRF        USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,132 :: 		}
L_USB_Mode45:
;lcddisplay.c,133 :: 		} else if ((int)readbuff[0] == 7) {
	GOTO        L_USB_Mode47
L_USB_Mode18:
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode143
	MOVLW       7
	XORWF       R1, 0 
L__USB_Mode143:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode48
;lcddisplay.c,135 :: 		LCD_1Row_Write("Writing..."); Delay_ms(1000);
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
L_USB_Mode49:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode49
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode49
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode49
	NOP
	NOP
;lcddisplay.c,136 :: 		for (page=0; page<8; page++){
	CLRF        USB_Mode_page_L0+0 
L_USB_Mode50:
	MOVLW       8
	SUBWF       USB_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode51
;lcddisplay.c,137 :: 		if (is_write_broken == 1) {
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode53
;lcddisplay.c,138 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,139 :: 		break;
	GOTO        L_USB_Mode51
;lcddisplay.c,140 :: 		}
L_USB_Mode53:
;lcddisplay.c,141 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        USB_Mode_address_L0+0 
;lcddisplay.c,142 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        USB_Mode_entry_on_page_L0+0 
L_USB_Mode54:
	MOVLW       13
	SUBWF       USB_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode55
;lcddisplay.c,144 :: 		writebuff[0] = 0; // 0 start
	CLRF        1344 
;lcddisplay.c,145 :: 		writebuff[1] = 6; // command code
	MOVLW       6
	MOVWF       1345 
;lcddisplay.c,146 :: 		writebuff[2] = page; // page
	MOVF        USB_Mode_page_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,147 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        USB_Mode_address_count_L0+0 
L_USB_Mode57:
	MOVLW       19
	SUBWF       USB_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode58
;lcddisplay.c,149 :: 		I2C_Write_Byte_To_EEPROM(mempages_write[page], address, address_count+3);
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
	MOVLW       3
	ADDWF       USB_Mode_address_count_L0+0, 0 
	MOVWF       FARG_I2C_Write_Byte_To_EEPROM_byte2write+0 
	CALL        _I2C_Write_Byte_To_EEPROM+0, 0
;lcddisplay.c,150 :: 		writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
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
;lcddisplay.c,151 :: 		address++;
	INCF        USB_Mode_address_L0+0, 1 
;lcddisplay.c,147 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        USB_Mode_address_count_L0+0, 1 
;lcddisplay.c,153 :: 		}
	GOTO        L_USB_Mode57
L_USB_Mode58:
;lcddisplay.c,155 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
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
	GOTO        L__USB_Mode144
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode144:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode61
L__USB_Mode121:
	GOTO        L_USB_Mode60
L_USB_Mode61:
;lcddisplay.c,158 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);                // wait for respsonse to continue
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
	GOTO        L__USB_Mode145
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode145:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode65
L__USB_Mode120:
	GOTO        L_USB_Mode64
L_USB_Mode65:
;lcddisplay.c,159 :: 		if (!(readbuff[0] == 4)) {
	MOVF        1280, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode68
;lcddisplay.c,160 :: 		is_write_broken = 1;
	MOVLW       1
	MOVWF       USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,161 :: 		LCD_1Row_Write("Write Error"); Delay_ms(1000);
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
L_USB_Mode69:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode69
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode69
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode69
	NOP
	NOP
;lcddisplay.c,162 :: 		break;
	GOTO        L_USB_Mode55
;lcddisplay.c,163 :: 		} else {
L_USB_Mode68:
;lcddisplay.c,164 :: 		LCD_1Row_Write("Write Ok"); Delay_ms(1000);
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
L_USB_Mode71:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode71
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode71
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode71
	NOP
	NOP
;lcddisplay.c,142 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        USB_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,166 :: 		}
	GOTO        L_USB_Mode54
L_USB_Mode55:
;lcddisplay.c,136 :: 		for (page=0; page<8; page++){
	INCF        USB_Mode_page_L0+0, 1 
;lcddisplay.c,167 :: 		}
	GOTO        L_USB_Mode50
L_USB_Mode51:
;lcddisplay.c,168 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,169 :: 		writebuff[1] = 5;
	MOVLW       5
	MOVWF       1345 
;lcddisplay.c,170 :: 		writebuff[2] = is_write_broken;
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,171 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
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
	GOTO        L__USB_Mode146
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode146:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode73
L__USB_Mode119:
	GOTO        L_USB_Mode72
L_USB_Mode73:
;lcddisplay.c,172 :: 		if (is_write_broken == 0) {
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode76
;lcddisplay.c,173 :: 		LCD_1Row_Write("Entries Written"); Delay_ms(1000);
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
L_USB_Mode77:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode77
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode77
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode77
	NOP
	NOP
;lcddisplay.c,174 :: 		} else {
	GOTO        L_USB_Mode78
L_USB_Mode76:
;lcddisplay.c,175 :: 		LCD_1Row_Write("Write Error"); Delay_ms(1000);
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
L_USB_Mode79:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode79
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode79
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode79
	NOP
	NOP
;lcddisplay.c,176 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,177 :: 		}
L_USB_Mode78:
;lcddisplay.c,178 :: 		} else {
	GOTO        L_USB_Mode80
L_USB_Mode48:
;lcddisplay.c,179 :: 		TestUSBInput(str_usbDiagnostics);
	MOVLW       USB_Mode_str_usbDiagnostics_L0+0
	MOVWF       FARG_TestUSBInput_output_string+0 
	MOVLW       hi_addr(USB_Mode_str_usbDiagnostics_L0+0)
	MOVWF       FARG_TestUSBInput_output_string+1 
	CALL        _TestUSBInput+0, 0
;lcddisplay.c,180 :: 		LCD_2Row_Write("No Operation", str_usbDiagnostics); Delay_ms(3000);
	MOVLW       ?lstr15_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr15_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       USB_Mode_str_usbDiagnostics_L0+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(USB_Mode_str_usbDiagnostics_L0+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
	MOVLW       183
	MOVWF       R11, 0
	MOVLW       161
	MOVWF       R12, 0
	MOVLW       195
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
;lcddisplay.c,181 :: 		}
L_USB_Mode80:
L_USB_Mode47:
L_USB_Mode17:
;lcddisplay.c,182 :: 		}
	GOTO        L_USB_Mode4
L_USB_Mode5:
;lcddisplay.c,184 :: 		HID_Disable();
	CALL        _HID_Disable+0, 0
;lcddisplay.c,185 :: 		LCD_1Row_Write("USB MODE EXITED");
	MOVLW       ?lstr16_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr16_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,186 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_USB_Mode82:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode82
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode82
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode82
	NOP
	NOP
;lcddisplay.c,188 :: 		}
L_end_USB_Mode:
	RETURN      0
; end of _USB_Mode

_USB_Buffer_Clear:

;lcddisplay.c,192 :: 		void USB_Buffer_Clear() {
;lcddisplay.c,193 :: 		int i=0;
	CLRF        USB_Buffer_Clear_i_L0+0 
	CLRF        USB_Buffer_Clear_i_L0+1 
;lcddisplay.c,194 :: 		for (i=0; i<64; i++) {
	CLRF        USB_Buffer_Clear_i_L0+0 
	CLRF        USB_Buffer_Clear_i_L0+1 
L_USB_Buffer_Clear83:
	MOVLW       128
	XORWF       USB_Buffer_Clear_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Buffer_Clear148
	MOVLW       64
	SUBWF       USB_Buffer_Clear_i_L0+0, 0 
L__USB_Buffer_Clear148:
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Buffer_Clear84
;lcddisplay.c,195 :: 		writebuff[i] = 0;
	MOVLW       _writebuff+0
	ADDWF       USB_Buffer_Clear_i_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_writebuff+0)
	ADDWFC      USB_Buffer_Clear_i_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;lcddisplay.c,194 :: 		for (i=0; i<64; i++) {
	INFSNZ      USB_Buffer_Clear_i_L0+0, 1 
	INCF        USB_Buffer_Clear_i_L0+1, 1 
;lcddisplay.c,196 :: 		}
	GOTO        L_USB_Buffer_Clear83
L_USB_Buffer_Clear84:
;lcddisplay.c,197 :: 		}
L_end_USB_Buffer_Clear:
	RETURN      0
; end of _USB_Buffer_Clear

_USB_Buffer_Time:

;lcddisplay.c,199 :: 		void USB_Buffer_Time() {
;lcddisplay.c,201 :: 		GetTimeStruct(&t);
	MOVLW       USB_Buffer_Time_t_L0+0
	MOVWF       FARG_GetTimeStruct_time+0 
	MOVLW       hi_addr(USB_Buffer_Time_t_L0+0)
	MOVWF       FARG_GetTimeStruct_time+1 
	CALL        _GetTimeStruct+0, 0
;lcddisplay.c,202 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,203 :: 		writebuff[1] = 0;
	CLRF        1345 
;lcddisplay.c,204 :: 		writebuff[2] = t.ss;
	MOVF        USB_Buffer_Time_t_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,205 :: 		writebuff[3] = t.mn;
	MOVF        USB_Buffer_Time_t_L0+1, 0 
	MOVWF       1347 
;lcddisplay.c,206 :: 		writebuff[4] = t.hh;
	MOVF        USB_Buffer_Time_t_L0+2, 0 
	MOVWF       1348 
;lcddisplay.c,207 :: 		writebuff[5] = t.md;
	MOVF        USB_Buffer_Time_t_L0+3, 0 
	MOVWF       1349 
;lcddisplay.c,208 :: 		writebuff[6] = t.wd;
	MOVF        USB_Buffer_Time_t_L0+4, 0 
	MOVWF       1350 
;lcddisplay.c,209 :: 		writebuff[7] = t.mo;
	MOVF        USB_Buffer_Time_t_L0+5, 0 
	MOVWF       1351 
;lcddisplay.c,210 :: 		writebuff[8] = t.yy;
	MOVF        USB_Buffer_Time_t_L0+6, 0 
	MOVWF       1352 
;lcddisplay.c,211 :: 		}
L_end_USB_Buffer_Time:
	RETURN      0
; end of _USB_Buffer_Time

_LCD_Mode:

;lcddisplay.c,213 :: 		void LCD_Mode() {
;lcddisplay.c,214 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear LCD display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,215 :: 		LCD_2Row_Write("Johannah Mae", "I   U");
	MOVLW       ?lstr17_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr17_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr18_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr18_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
;lcddisplay.c,216 :: 		LCD_Write_Heart(2, 3);
	MOVLW       2
	MOVWF       FARG_LCD_Write_Heart_pos_row+0 
	MOVLW       3
	MOVWF       FARG_LCD_Write_Heart_pos_char+0 
	CALL        _LCD_Write_Heart+0, 0
;lcddisplay.c,217 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,218 :: 		}
L_end_LCD_Mode:
	RETURN      0
; end of _LCD_Mode

_TIME_Mode:

;lcddisplay.c,220 :: 		void TIME_Mode() {
;lcddisplay.c,223 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,224 :: 		I2C1_Init(100000); //
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,225 :: 		Write_Time(); // Write the new time
	CALL        _Write_Time+0, 0
;lcddisplay.c,226 :: 		while (GetOpMode() == I2C_RTC_TEST) {
L_TIME_Mode86:
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__TIME_Mode152
	MOVLW       51
	XORWF       R0, 0 
L__TIME_Mode152:
	BTFSS       STATUS+0, 2 
	GOTO        L_TIME_Mode87
;lcddisplay.c,227 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_TIME_Mode88:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode88
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode88
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode88
	NOP
;lcddisplay.c,228 :: 		GetTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_GetTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_GetTimeStruct_time+1 
	CALL        _GetTimeStruct+0, 0
;lcddisplay.c,229 :: 		DisplayTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_DisplayTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_DisplayTimeStruct_time+1 
	CALL        _DisplayTimeStruct+0, 0
;lcddisplay.c,230 :: 		}
	GOTO        L_TIME_Mode86
L_TIME_Mode87:
;lcddisplay.c,231 :: 		LCD_1Row_Write("TIME MODE EXITED");
	MOVLW       ?lstr19_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr19_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,232 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_TIME_Mode89:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode89
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode89
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode89
	NOP
	NOP
;lcddisplay.c,233 :: 		}
L_end_TIME_Mode:
	RETURN      0
; end of _TIME_Mode

_I2C_Read_Byte_From_EEPROM:

;lcddisplay.c,235 :: 		unsigned char I2C_Read_Byte_From_EEPROM(unsigned char page_write, unsigned char page_read, unsigned char address) {
;lcddisplay.c,237 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,238 :: 		I2C1_Start();              // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,239 :: 		I2C1_Wr(page_write);             // send byte via I2C  (device address + W)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_page_write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,240 :: 		I2C1_Wr(address);             // send byte (data address)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,241 :: 		I2C1_Repeated_Start();     // issue I2C signal repeated start
	CALL        _I2C1_Repeated_Start+0, 0
;lcddisplay.c,242 :: 		I2C1_Wr(page_read);             // send byte (device address + R)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_page_read+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,243 :: 		x = I2C1_Rd(0);       // Read the data (NO acknowledge)
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       I2C_Read_Byte_From_EEPROM_x_L0+0 
;lcddisplay.c,244 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_I2C_Read_Byte_From_EEPROM90:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM90
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM90
;lcddisplay.c,245 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,246 :: 		return x;
	MOVF        I2C_Read_Byte_From_EEPROM_x_L0+0, 0 
	MOVWF       R0 
	GOTO        L_end_I2C_Read_Byte_From_EEPROM
;lcddisplay.c,247 :: 		Delay_ms(20);
L_I2C_Read_Byte_From_EEPROM91:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM91
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM91
	DECFSZ      R11, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM91
;lcddisplay.c,248 :: 		}
L_end_I2C_Read_Byte_From_EEPROM:
	RETURN      0
; end of _I2C_Read_Byte_From_EEPROM

_I2C_Write_Byte_To_EEPROM:

;lcddisplay.c,250 :: 		void I2C_Write_Byte_To_EEPROM(unsigned char page_write, unsigned char address, unsigned char byte2write) {
;lcddisplay.c,251 :: 		I2C1_Init(100000);         // initialize I2C communication
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,252 :: 		I2C1_Start();              // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,253 :: 		I2C1_Wr(page_write);             // send byte via I2C  (device address + W)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_page_write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,254 :: 		I2C1_Wr(address);             // send byte (address of EEPROM location)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,255 :: 		I2C1_Wr(byte2write);             // send data (data to be written)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_byte2write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,256 :: 		I2C1_Stop();	// issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,257 :: 		Delay_ms(20);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_I2C_Write_Byte_To_EEPROM92:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM92
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM92
	DECFSZ      R11, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM92
;lcddisplay.c,258 :: 		}
L_end_I2C_Write_Byte_To_EEPROM:
	RETURN      0
; end of _I2C_Write_Byte_To_EEPROM

_I2C_Test_EEPROM:

;lcddisplay.c,260 :: 		void I2C_Test_EEPROM() {
;lcddisplay.c,263 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,264 :: 		I2C1_Init(100000);         // initialize I2C communication
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,265 :: 		I2C1_Start();              // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,266 :: 		I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
	MOVLW       162
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,267 :: 		I2C1_Wr(0x02);             // send byte (address of EEPROM location)
	MOVLW       2
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,268 :: 		I2C1_Wr(0x41);             // send data (data to be written)
	MOVLW       65
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,269 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,271 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;lcddisplay.c,272 :: 		LCD_1Row_Write("WRITE FINISHED");
	MOVLW       ?lstr20_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr20_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,273 :: 		Lcd_Chr(2, 3, 0x41);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcddisplay.c,275 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;lcddisplay.c,276 :: 		LCD_1Row_Write("READ STARTED");
	MOVLW       ?lstr21_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr21_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,277 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;lcddisplay.c,278 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,279 :: 		I2C1_Start();              // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,280 :: 		I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
	MOVLW       162
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,281 :: 		I2C1_Wr(0x02);             // send byte (data address)
	MOVLW       2
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,282 :: 		I2C1_Repeated_Start();     // issue I2C signal repeated start
	CALL        _I2C1_Repeated_Start+0, 0
;lcddisplay.c,283 :: 		I2C1_Wr(0xA3);             // send byte (device address + R)
	MOVLW       163
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,284 :: 		x = I2C1_Rd(0);       // Read the data (NO acknowledge)
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       I2C_Test_EEPROM_x_L0+0 
;lcddisplay.c,285 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,287 :: 		Delay_ms(300);
	MOVLW       19
	MOVWF       R11, 0
	MOVLW       68
	MOVWF       R12, 0
	MOVLW       68
	MOVWF       R13, 0
L_I2C_Test_EEPROM93:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Test_EEPROM93
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Test_EEPROM93
	DECFSZ      R11, 1, 1
	BRA         L_I2C_Test_EEPROM93
	NOP
;lcddisplay.c,288 :: 		LCD_1Row_Write("READ FINISHED");
	MOVLW       ?lstr22_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr22_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,289 :: 		Lcd_Chr(2, 3, x);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        I2C_Test_EEPROM_x_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcddisplay.c,290 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_I2C_Test_EEPROM94:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Test_EEPROM94
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Test_EEPROM94
	DECFSZ      R11, 1, 1
	BRA         L_I2C_Test_EEPROM94
	NOP
	NOP
;lcddisplay.c,292 :: 		while (GetOpMode() == I2C_EEPROM_TEST);
L_I2C_Test_EEPROM95:
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_Test_EEPROM156
	MOVLW       54
	XORWF       R0, 0 
L__I2C_Test_EEPROM156:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_Test_EEPROM96
	GOTO        L_I2C_Test_EEPROM95
L_I2C_Test_EEPROM96:
;lcddisplay.c,293 :: 		}
L_end_I2C_Test_EEPROM:
	RETURN      0
; end of _I2C_Test_EEPROM

_GetOpMode:

;lcddisplay.c,295 :: 		short GetOpMode() {
;lcddisplay.c,296 :: 		if (RA0_bit && !RA1_bit) {
	BTFSS       RA0_bit+0, 0 
	GOTO        L_GetOpMode99
	BTFSC       RA1_bit+0, 1 
	GOTO        L_GetOpMode99
L__GetOpMode128:
;lcddisplay.c,297 :: 		opstate = USB_TEST;
	MOVLW       50
	MOVWF       _opstate+0 
;lcddisplay.c,298 :: 		} else if ( !RA0_bit && RA1_bit) {
	GOTO        L_GetOpMode100
L_GetOpMode99:
	BTFSC       RA0_bit+0, 0 
	GOTO        L_GetOpMode103
	BTFSS       RA1_bit+0, 1 
	GOTO        L_GetOpMode103
L__GetOpMode127:
;lcddisplay.c,299 :: 		opstate = I2C_EEPROM_TEST;
	MOVLW       54
	MOVWF       _opstate+0 
;lcddisplay.c,300 :: 		} else {
	GOTO        L_GetOpMode104
L_GetOpMode103:
;lcddisplay.c,301 :: 		opstate = I2C_RTC_TEST;
	MOVLW       51
	MOVWF       _opstate+0 
;lcddisplay.c,302 :: 		}
L_GetOpMode104:
L_GetOpMode100:
;lcddisplay.c,304 :: 		return opstate;
	MOVF        _opstate+0, 0 
	MOVWF       R0 
;lcddisplay.c,305 :: 		}
L_end_GetOpMode:
	RETURN      0
; end of _GetOpMode

_main:

;lcddisplay.c,307 :: 		void main() {
;lcddisplay.c,309 :: 		init_main();
	CALL        _init_main+0, 0
;lcddisplay.c,310 :: 		TestInitializeAllPins();
	CALL        _TestInitializeAllPins+0, 0
;lcddisplay.c,312 :: 		while (1) {
L_main105:
;lcddisplay.c,314 :: 		GetOpMode();
	CALL        _GetOpMode+0, 0
;lcddisplay.c,316 :: 		switch (opstate) {
	GOTO        L_main107
;lcddisplay.c,317 :: 		case I2C_EEPROM_TEST:
L_main109:
;lcddisplay.c,318 :: 		LCD_1Row_Write("I2C_EEPROM_TEST");
	MOVLW       ?lstr23_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr23_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,319 :: 		I2C_Test_EEPROM();
	CALL        _I2C_Test_EEPROM+0, 0
;lcddisplay.c,320 :: 		break;
	GOTO        L_main108
;lcddisplay.c,321 :: 		case KEYPAD_TEST:
L_main110:
;lcddisplay.c,322 :: 		LCD_1Row_Write("Keypad Mode");
	MOVLW       ?lstr24_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr24_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,323 :: 		KeypadTest_Begin();
	CALL        _KeypadTest_Begin+0, 0
;lcddisplay.c,324 :: 		break;
	GOTO        L_main108
;lcddisplay.c,325 :: 		case MMC_TEST:
L_main111:
;lcddisplay.c,326 :: 		LCD_1Row_Write("SPI MMC Mode");
	MOVLW       ?lstr25_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr25_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,327 :: 		M_Test_Begin();
	CALL        _M_Test_Begin+0, 0
;lcddisplay.c,328 :: 		break;
	GOTO        L_main108
;lcddisplay.c,329 :: 		case USB_TEST:
L_main112:
;lcddisplay.c,330 :: 		LCD_1Row_Write("USB Mode");
	MOVLW       ?lstr26_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr26_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,331 :: 		USB_Mode();
	CALL        _USB_Mode+0, 0
;lcddisplay.c,332 :: 		break;
	GOTO        L_main108
;lcddisplay.c,333 :: 		case I2C_RTC_TEST:
L_main113:
;lcddisplay.c,334 :: 		LCD_1Row_Write("I2C RTC Mode");
	MOVLW       ?lstr27_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr27_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,335 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,336 :: 		Delay_ms(200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main114:
	DECFSZ      R13, 1, 1
	BRA         L_main114
	DECFSZ      R12, 1, 1
	BRA         L_main114
	DECFSZ      R11, 1, 1
	BRA         L_main114
	NOP
	NOP
;lcddisplay.c,337 :: 		TIME_Mode();
	CALL        _TIME_Mode+0, 0
;lcddisplay.c,338 :: 		break;
	GOTO        L_main108
;lcddisplay.c,339 :: 		case LCD_TEST:
L_main115:
;lcddisplay.c,340 :: 		LCD_Mode();
	CALL        _LCD_Mode+0, 0
;lcddisplay.c,341 :: 		Delay_ms(10000);
	MOVLW       3
	MOVWF       R10, 0
	MOVLW       97
	MOVWF       R11, 0
	MOVLW       195
	MOVWF       R12, 0
	MOVLW       142
	MOVWF       R13, 0
L_main116:
	DECFSZ      R13, 1, 1
	BRA         L_main116
	DECFSZ      R12, 1, 1
	BRA         L_main116
	DECFSZ      R11, 1, 1
	BRA         L_main116
	DECFSZ      R10, 1, 1
	BRA         L_main116
	NOP
;lcddisplay.c,342 :: 		default:
L_main117:
;lcddisplay.c,343 :: 		LCD_2Row_Write("Operation Not", "Allowed");
	MOVLW       ?lstr28_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr28_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr29_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr29_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
;lcddisplay.c,344 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main118:
	DECFSZ      R13, 1, 1
	BRA         L_main118
	DECFSZ      R12, 1, 1
	BRA         L_main118
	DECFSZ      R11, 1, 1
	BRA         L_main118
	NOP
	NOP
;lcddisplay.c,345 :: 		break;
	GOTO        L_main108
;lcddisplay.c,346 :: 		}
L_main107:
	MOVF        _opstate+0, 0 
	XORLW       54
	BTFSC       STATUS+0, 2 
	GOTO        L_main109
	MOVF        _opstate+0, 0 
	XORLW       52
	BTFSC       STATUS+0, 2 
	GOTO        L_main110
	MOVF        _opstate+0, 0 
	XORLW       53
	BTFSC       STATUS+0, 2 
	GOTO        L_main111
	MOVF        _opstate+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_main112
	MOVF        _opstate+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_main113
	MOVF        _opstate+0, 0 
	XORLW       49
	BTFSC       STATUS+0, 2 
	GOTO        L_main115
	GOTO        L_main117
L_main108:
;lcddisplay.c,347 :: 		}
	GOTO        L_main105
;lcddisplay.c,348 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_TestUSBInput:

;lcddisplay.c,350 :: 		void TestUSBInput(char *output_string) {
;lcddisplay.c,352 :: 		ShortToStr(readbuff[0], buff_diag_d);
	MOVF        1280, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_d_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_d_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,353 :: 		ShortToStr(readbuff[1], buff_diag_a);
	MOVF        1281, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_a_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_a_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,354 :: 		ShortToStr(readbuff[2], buff_diag_b);
	MOVF        1282, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_b_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_b_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,355 :: 		strcpy(output_string, "");
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr30_lcddisplay+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr30_lcddisplay+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;lcddisplay.c,356 :: 		strcat(output_string, buff_diag_d);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_d_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_d_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,357 :: 		strcat(output_string, buff_diag_a);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_a_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_a_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,358 :: 		strcat(output_string, buff_diag_b);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_b_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_b_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,359 :: 		}
L_end_TestUSBInput:
	RETURN      0
; end of _TestUSBInput
