
_interrupt:

;lcddisplay.c,18 :: 		void interrupt() {
;lcddisplay.c,19 :: 		USB_Interrupt_Proc(); // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;lcddisplay.c,20 :: 		}
L_end_interrupt:
L__interrupt126:
	RETFIE      1
; end of _interrupt

_init_core:

;lcddisplay.c,22 :: 		void init_core() {
;lcddisplay.c,23 :: 		ADCON1 = 0x0F; // page 268, disable analaog
	MOVLW       15
	MOVWF       ADCON1+0 
;lcddisplay.c,24 :: 		CMCON = 0x07; // disable comparator
	MOVLW       7
	MOVWF       CMCON+0 
;lcddisplay.c,25 :: 		INTCON2 = 0x80; // disable pull up in port b
	MOVLW       128
	MOVWF       INTCON2+0 
;lcddisplay.c,27 :: 		LATA = 0x00; // Make all output ports 0
	CLRF        LATA+0 
;lcddisplay.c,28 :: 		LATC = 0x00; // Make all output ports 0
	CLRF        LATC+0 
;lcddisplay.c,29 :: 		LATD = 0x00; // Make all output ports 0
	CLRF        LATD+0 
;lcddisplay.c,30 :: 		LATE = 0x00; // Make all output ports 0
	CLRF        LATE+0 
;lcddisplay.c,32 :: 		TRISA = 0x00; // Make all ports output
	CLRF        TRISA+0 
;lcddisplay.c,33 :: 		TRISC = 0x00; // Make all ports output
	CLRF        TRISC+0 
;lcddisplay.c,34 :: 		TRISD = 0x00; // Make all ports output
	CLRF        TRISD+0 
;lcddisplay.c,35 :: 		TRISE = 0x00; // Make all ports output
	CLRF        TRISE+0 
;lcddisplay.c,37 :: 		PORTA = 0x00; // Make all ports 0
	CLRF        PORTA+0 
;lcddisplay.c,38 :: 		PORTC = 0x00; // Make all ports 0
	CLRF        PORTC+0 
;lcddisplay.c,39 :: 		PORTD = 0x00; // Make all ports 0
	CLRF        PORTD+0 
;lcddisplay.c,40 :: 		PORTE = 0x00; // Make all ports 0
	CLRF        PORTE+0 
;lcddisplay.c,42 :: 		TRISA = 0x03;
	MOVLW       3
	MOVWF       TRISA+0 
;lcddisplay.c,43 :: 		LATA = 0x03;
	MOVLW       3
	MOVWF       LATA+0 
;lcddisplay.c,44 :: 		}
L_end_init_core:
	RETURN      0
; end of _init_core

_init_main:

;lcddisplay.c,46 :: 		void init_main() {
;lcddisplay.c,47 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,48 :: 		Lcd_Init(); // Initialize LCD
	CALL        _Lcd_Init+0, 0
;lcddisplay.c,49 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear LCD display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,50 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,51 :: 		Lcd_Out(1, 1, "Hardware Cron");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_lcddisplay+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_lcddisplay+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcddisplay.c,52 :: 		Delay_ms(1000);
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
;lcddisplay.c,53 :: 		}
L_end_init_main:
	RETURN      0
; end of _init_main

_USB_Mode:

;lcddisplay.c,55 :: 		void USB_Mode() {
;lcddisplay.c,66 :: 		unsigned char page=0, address=0, address_count=0, entry_on_page=0;
	CLRF        USB_Mode_page_L0+0 
	CLRF        USB_Mode_address_L0+0 
	CLRF        USB_Mode_address_count_L0+0 
	CLRF        USB_Mode_entry_on_page_L0+0 
	CLRF        USB_Mode_is_read_broken_L0+0 
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,70 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,71 :: 		I2C1_Init(100000); //
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,72 :: 		Write_Time(); // Write the new time
	CALL        _Write_Time+0, 0
;lcddisplay.c,75 :: 		for(cnt=0;cnt<64;cnt++) {
	CLRF        _cnt+0 
L_USB_Mode1:
	MOVLW       64
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode2
;lcddisplay.c,76 :: 		writebuff[cnt] = 0;
	MOVLW       _writebuff+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FSR1H 
	MOVF        _cnt+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	CLRF        POSTINC1+0 
;lcddisplay.c,75 :: 		for(cnt=0;cnt<64;cnt++) {
	INCF        _cnt+0, 1 
;lcddisplay.c,77 :: 		}
	GOTO        L_USB_Mode1
L_USB_Mode2:
;lcddisplay.c,80 :: 		HID_Enable(&readbuff,&writebuff);
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;lcddisplay.c,82 :: 		while(GetOpMode() == USB_TEST){
L_USB_Mode4:
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode130
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode130:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode5
;lcddisplay.c,83 :: 		LCD_1Row_Write("Waiting Command");
	MOVLW       ?lstr2_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr2_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,84 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);
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
	GOTO        L__USB_Mode131
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode131:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode7
L__USB_Mode122:
	GOTO        L_USB_Mode6
L_USB_Mode7:
;lcddisplay.c,86 :: 		if ((int)readbuff[0] == 0) {
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode132
	MOVLW       0
	XORWF       R1, 0 
L__USB_Mode132:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode10
;lcddisplay.c,87 :: 		LCD_1Row_Write("Sending Time"); Delay_ms(1000);
	MOVLW       ?lstr3_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr3_lcddisplay+0)
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
;lcddisplay.c,88 :: 		USB_Buffer_Time();
	CALL        _USB_Buffer_Time+0, 0
;lcddisplay.c,89 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
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
	GOTO        L__USB_Mode133
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode133:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode13
L__USB_Mode121:
	GOTO        L_USB_Mode12
L_USB_Mode13:
;lcddisplay.c,90 :: 		LCD_1Row_Write("Time Sent 00"); Delay_ms(1000);
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
;lcddisplay.c,92 :: 		} else if ((int)readbuff[0] == 1) {
	GOTO        L_USB_Mode17
L_USB_Mode10:
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode134
	MOVLW       1
	XORWF       R1, 0 
L__USB_Mode134:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode18
;lcddisplay.c,94 :: 		for (page=0; page<8; page++){
	CLRF        USB_Mode_page_L0+0 
L_USB_Mode19:
	MOVLW       8
	SUBWF       USB_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode20
;lcddisplay.c,95 :: 		if (is_read_broken == 1) {
	MOVF        USB_Mode_is_read_broken_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode22
;lcddisplay.c,96 :: 		is_read_broken = 0;
	CLRF        USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,97 :: 		break;
	GOTO        L_USB_Mode20
;lcddisplay.c,98 :: 		}
L_USB_Mode22:
;lcddisplay.c,99 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        USB_Mode_address_L0+0 
;lcddisplay.c,100 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        USB_Mode_entry_on_page_L0+0 
L_USB_Mode23:
	MOVLW       13
	SUBWF       USB_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode24
;lcddisplay.c,101 :: 		writebuff[0] = 0; // 0 start
	CLRF        1344 
;lcddisplay.c,102 :: 		writebuff[1] = 2; // command code
	MOVLW       2
	MOVWF       1345 
;lcddisplay.c,103 :: 		writebuff[2] = page; // page
	MOVF        USB_Mode_page_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,104 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        USB_Mode_address_count_L0+0 
L_USB_Mode26:
	MOVLW       19
	SUBWF       USB_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode27
;lcddisplay.c,105 :: 		writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
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
;lcddisplay.c,106 :: 		address++;
	INCF        USB_Mode_address_L0+0, 1 
;lcddisplay.c,104 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        USB_Mode_address_count_L0+0, 1 
;lcddisplay.c,107 :: 		}
	GOTO        L_USB_Mode26
L_USB_Mode27:
;lcddisplay.c,108 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
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
	GOTO        L__USB_Mode135
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode135:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode30
L__USB_Mode120:
	GOTO        L_USB_Mode29
L_USB_Mode30:
;lcddisplay.c,109 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);                // wait for respsonse to continue
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
	GOTO        L__USB_Mode136
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode136:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode34
L__USB_Mode119:
	GOTO        L_USB_Mode33
L_USB_Mode34:
;lcddisplay.c,110 :: 		if (!(readbuff[0] == 2)) {
	MOVF        1280, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode37
;lcddisplay.c,111 :: 		is_read_broken = 1;
	MOVLW       1
	MOVWF       USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,112 :: 		LCD_1Row_Write("Read Error"); Delay_ms(1000);
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
;lcddisplay.c,113 :: 		break;
	GOTO        L_USB_Mode24
;lcddisplay.c,114 :: 		}
L_USB_Mode37:
;lcddisplay.c,100 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        USB_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,115 :: 		}
	GOTO        L_USB_Mode23
L_USB_Mode24:
;lcddisplay.c,94 :: 		for (page=0; page<8; page++){
	INCF        USB_Mode_page_L0+0, 1 
;lcddisplay.c,116 :: 		}
	GOTO        L_USB_Mode19
L_USB_Mode20:
;lcddisplay.c,117 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,118 :: 		writebuff[1] = 3;
	MOVLW       3
	MOVWF       1345 
;lcddisplay.c,119 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
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
	GOTO        L__USB_Mode137
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode137:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode40
L__USB_Mode118:
	GOTO        L_USB_Mode39
L_USB_Mode40:
;lcddisplay.c,120 :: 		if (is_read_broken == 0) {
	MOVF        USB_Mode_is_read_broken_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode43
;lcddisplay.c,121 :: 		LCD_1Row_Write("Entries Sent"); Delay_ms(1000);
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
;lcddisplay.c,122 :: 		} else {
	GOTO        L_USB_Mode45
L_USB_Mode43:
;lcddisplay.c,123 :: 		LCD_1Row_Write("Read Error"); Delay_ms(1000);
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
;lcddisplay.c,124 :: 		is_read_broken = 0;
	CLRF        USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,125 :: 		}
L_USB_Mode45:
;lcddisplay.c,126 :: 		} else if ((int)readbuff[0] == 7) {
	GOTO        L_USB_Mode47
L_USB_Mode18:
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode138
	MOVLW       7
	XORWF       R1, 0 
L__USB_Mode138:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode48
;lcddisplay.c,128 :: 		LCD_1Row_Write("Writing..."); Delay_ms(1000);
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
L_USB_Mode49:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode49
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode49
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode49
	NOP
	NOP
;lcddisplay.c,129 :: 		for (page=0; page<8; page++){
	CLRF        USB_Mode_page_L0+0 
L_USB_Mode50:
	MOVLW       8
	SUBWF       USB_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode51
;lcddisplay.c,130 :: 		if (is_write_broken == 1) {
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode53
;lcddisplay.c,131 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,132 :: 		break;
	GOTO        L_USB_Mode51
;lcddisplay.c,133 :: 		}
L_USB_Mode53:
;lcddisplay.c,134 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        USB_Mode_address_L0+0 
;lcddisplay.c,135 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        USB_Mode_entry_on_page_L0+0 
L_USB_Mode54:
	MOVLW       13
	SUBWF       USB_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode55
;lcddisplay.c,137 :: 		writebuff[0] = 0; // 0 start
	CLRF        1344 
;lcddisplay.c,138 :: 		writebuff[1] = 6; // command code
	MOVLW       6
	MOVWF       1345 
;lcddisplay.c,139 :: 		writebuff[2] = page; // page
	MOVF        USB_Mode_page_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,140 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        USB_Mode_address_count_L0+0 
L_USB_Mode57:
	MOVLW       19
	SUBWF       USB_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode58
;lcddisplay.c,142 :: 		I2C_Write_Byte_To_EEPROM(mempages_write[page], address, address_count+3);
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
;lcddisplay.c,143 :: 		writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
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
;lcddisplay.c,144 :: 		address++;
	INCF        USB_Mode_address_L0+0, 1 
;lcddisplay.c,140 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        USB_Mode_address_count_L0+0, 1 
;lcddisplay.c,146 :: 		}
	GOTO        L_USB_Mode57
L_USB_Mode58:
;lcddisplay.c,148 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
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
	GOTO        L__USB_Mode139
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode139:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode61
L__USB_Mode117:
	GOTO        L_USB_Mode60
L_USB_Mode61:
;lcddisplay.c,151 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);                // wait for respsonse to continue
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
	GOTO        L__USB_Mode140
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode140:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode65
L__USB_Mode116:
	GOTO        L_USB_Mode64
L_USB_Mode65:
;lcddisplay.c,152 :: 		if (!(readbuff[0] == 4)) {
	MOVF        1280, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode68
;lcddisplay.c,153 :: 		is_write_broken = 1;
	MOVLW       1
	MOVWF       USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,154 :: 		LCD_1Row_Write("Write Error"); Delay_ms(1000);
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
L_USB_Mode69:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode69
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode69
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode69
	NOP
	NOP
;lcddisplay.c,155 :: 		break;
	GOTO        L_USB_Mode55
;lcddisplay.c,156 :: 		} else {
L_USB_Mode68:
;lcddisplay.c,157 :: 		LCD_1Row_Write("Write Ok"); Delay_ms(1000);
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
L_USB_Mode71:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode71
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode71
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode71
	NOP
	NOP
;lcddisplay.c,135 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        USB_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,159 :: 		}
	GOTO        L_USB_Mode54
L_USB_Mode55:
;lcddisplay.c,129 :: 		for (page=0; page<8; page++){
	INCF        USB_Mode_page_L0+0, 1 
;lcddisplay.c,160 :: 		}
	GOTO        L_USB_Mode50
L_USB_Mode51:
;lcddisplay.c,161 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,162 :: 		writebuff[1] = 5;
	MOVLW       5
	MOVWF       1345 
;lcddisplay.c,163 :: 		writebuff[2] = is_write_broken;
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,164 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
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
	GOTO        L__USB_Mode141
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode141:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode73
L__USB_Mode115:
	GOTO        L_USB_Mode72
L_USB_Mode73:
;lcddisplay.c,165 :: 		if (is_write_broken == 0) {
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode76
;lcddisplay.c,166 :: 		LCD_1Row_Write("Entries Written"); Delay_ms(1000);
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
L_USB_Mode77:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode77
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode77
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode77
	NOP
	NOP
;lcddisplay.c,167 :: 		} else {
	GOTO        L_USB_Mode78
L_USB_Mode76:
;lcddisplay.c,168 :: 		LCD_1Row_Write("Write Error"); Delay_ms(1000);
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
L_USB_Mode79:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode79
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode79
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode79
	NOP
	NOP
;lcddisplay.c,169 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,170 :: 		}
L_USB_Mode78:
;lcddisplay.c,171 :: 		} else {
	GOTO        L_USB_Mode80
L_USB_Mode48:
;lcddisplay.c,172 :: 		TestUSBInput(str_usbDiagnostics);
	MOVLW       USB_Mode_str_usbDiagnostics_L0+0
	MOVWF       FARG_TestUSBInput_output_string+0 
	MOVLW       hi_addr(USB_Mode_str_usbDiagnostics_L0+0)
	MOVWF       FARG_TestUSBInput_output_string+1 
	CALL        _TestUSBInput+0, 0
;lcddisplay.c,173 :: 		LCD_2Row_Write("No Operation", str_usbDiagnostics); Delay_ms(3000);
	MOVLW       ?lstr13_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr13_lcddisplay+0)
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
;lcddisplay.c,174 :: 		}
L_USB_Mode80:
L_USB_Mode47:
L_USB_Mode17:
;lcddisplay.c,175 :: 		}
	GOTO        L_USB_Mode4
L_USB_Mode5:
;lcddisplay.c,177 :: 		HID_Disable();
	CALL        _HID_Disable+0, 0
;lcddisplay.c,178 :: 		LCD_1Row_Write("USB MODE EXITED");
	MOVLW       ?lstr14_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr14_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,179 :: 		Delay_ms(2000);
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
;lcddisplay.c,181 :: 		}
L_end_USB_Mode:
	RETURN      0
; end of _USB_Mode

_USB_Buffer_Clear:

;lcddisplay.c,185 :: 		void USB_Buffer_Clear() {
;lcddisplay.c,186 :: 		int i=0;
	CLRF        USB_Buffer_Clear_i_L0+0 
	CLRF        USB_Buffer_Clear_i_L0+1 
;lcddisplay.c,187 :: 		for (i=0; i<64; i++) {
	CLRF        USB_Buffer_Clear_i_L0+0 
	CLRF        USB_Buffer_Clear_i_L0+1 
L_USB_Buffer_Clear83:
	MOVLW       128
	XORWF       USB_Buffer_Clear_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Buffer_Clear143
	MOVLW       64
	SUBWF       USB_Buffer_Clear_i_L0+0, 0 
L__USB_Buffer_Clear143:
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Buffer_Clear84
;lcddisplay.c,188 :: 		writebuff[i] = 0;
	MOVLW       _writebuff+0
	ADDWF       USB_Buffer_Clear_i_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_writebuff+0)
	ADDWFC      USB_Buffer_Clear_i_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;lcddisplay.c,187 :: 		for (i=0; i<64; i++) {
	INFSNZ      USB_Buffer_Clear_i_L0+0, 1 
	INCF        USB_Buffer_Clear_i_L0+1, 1 
;lcddisplay.c,189 :: 		}
	GOTO        L_USB_Buffer_Clear83
L_USB_Buffer_Clear84:
;lcddisplay.c,190 :: 		}
L_end_USB_Buffer_Clear:
	RETURN      0
; end of _USB_Buffer_Clear

_USB_Buffer_Time:

;lcddisplay.c,192 :: 		void USB_Buffer_Time() {
;lcddisplay.c,194 :: 		GetTimeStruct(&t);
	MOVLW       USB_Buffer_Time_t_L0+0
	MOVWF       FARG_GetTimeStruct_time+0 
	MOVLW       hi_addr(USB_Buffer_Time_t_L0+0)
	MOVWF       FARG_GetTimeStruct_time+1 
	CALL        _GetTimeStruct+0, 0
;lcddisplay.c,195 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,196 :: 		writebuff[1] = 0;
	CLRF        1345 
;lcddisplay.c,197 :: 		writebuff[2] = t.ss;
	MOVF        USB_Buffer_Time_t_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,198 :: 		writebuff[3] = t.mn;
	MOVF        USB_Buffer_Time_t_L0+1, 0 
	MOVWF       1347 
;lcddisplay.c,199 :: 		writebuff[4] = t.hh;
	MOVF        USB_Buffer_Time_t_L0+2, 0 
	MOVWF       1348 
;lcddisplay.c,200 :: 		writebuff[5] = t.md;
	MOVF        USB_Buffer_Time_t_L0+3, 0 
	MOVWF       1349 
;lcddisplay.c,201 :: 		writebuff[6] = t.wd;
	MOVF        USB_Buffer_Time_t_L0+4, 0 
	MOVWF       1350 
;lcddisplay.c,202 :: 		writebuff[7] = t.mo;
	MOVF        USB_Buffer_Time_t_L0+5, 0 
	MOVWF       1351 
;lcddisplay.c,203 :: 		writebuff[8] = t.yy;
	MOVF        USB_Buffer_Time_t_L0+6, 0 
	MOVWF       1352 
;lcddisplay.c,204 :: 		}
L_end_USB_Buffer_Time:
	RETURN      0
; end of _USB_Buffer_Time

_TIME_Mode:

;lcddisplay.c,206 :: 		void TIME_Mode() {
;lcddisplay.c,209 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,210 :: 		I2C1_Init(100000); //
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,211 :: 		Write_Time(); // Write the new time
	CALL        _Write_Time+0, 0
;lcddisplay.c,212 :: 		while (GetOpMode() == I2C_RTC_TEST) {
L_TIME_Mode86:
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__TIME_Mode146
	MOVLW       51
	XORWF       R0, 0 
L__TIME_Mode146:
	BTFSS       STATUS+0, 2 
	GOTO        L_TIME_Mode87
;lcddisplay.c,213 :: 		Delay_ms(500);
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
;lcddisplay.c,214 :: 		GetTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_GetTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_GetTimeStruct_time+1 
	CALL        _GetTimeStruct+0, 0
;lcddisplay.c,215 :: 		DisplayTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_DisplayTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_DisplayTimeStruct_time+1 
	CALL        _DisplayTimeStruct+0, 0
;lcddisplay.c,216 :: 		}
	GOTO        L_TIME_Mode86
L_TIME_Mode87:
;lcddisplay.c,217 :: 		LCD_1Row_Write("TIME MODE EXITED");
	MOVLW       ?lstr15_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr15_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,218 :: 		Delay_ms(2000);
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
;lcddisplay.c,219 :: 		}
L_end_TIME_Mode:
	RETURN      0
; end of _TIME_Mode

_I2C_Read_Byte_From_EEPROM:

;lcddisplay.c,221 :: 		unsigned char I2C_Read_Byte_From_EEPROM(unsigned char page_write, unsigned char page_read, unsigned char address) {
;lcddisplay.c,223 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,224 :: 		I2C1_Start();              // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,225 :: 		I2C1_Wr(page_write);             // send byte via I2C  (device address + W)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_page_write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,226 :: 		I2C1_Wr(address);             // send byte (data address)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,227 :: 		I2C1_Repeated_Start();     // issue I2C signal repeated start
	CALL        _I2C1_Repeated_Start+0, 0
;lcddisplay.c,228 :: 		I2C1_Wr(page_read);             // send byte (device address + R)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_page_read+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,229 :: 		x = I2C1_Rd(0);       // Read the data (NO acknowledge)
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       I2C_Read_Byte_From_EEPROM_x_L0+0 
;lcddisplay.c,230 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_I2C_Read_Byte_From_EEPROM90:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM90
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM90
;lcddisplay.c,231 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,232 :: 		return x;
	MOVF        I2C_Read_Byte_From_EEPROM_x_L0+0, 0 
	MOVWF       R0 
	GOTO        L_end_I2C_Read_Byte_From_EEPROM
;lcddisplay.c,233 :: 		Delay_ms(20);
L_I2C_Read_Byte_From_EEPROM91:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM91
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM91
	DECFSZ      R11, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM91
;lcddisplay.c,234 :: 		}
L_end_I2C_Read_Byte_From_EEPROM:
	RETURN      0
; end of _I2C_Read_Byte_From_EEPROM

_I2C_Write_Byte_To_EEPROM:

;lcddisplay.c,236 :: 		void I2C_Write_Byte_To_EEPROM(unsigned char page_write, unsigned char address, unsigned char byte2write) {
;lcddisplay.c,237 :: 		I2C1_Init(100000);         // initialize I2C communication
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,238 :: 		I2C1_Start();              // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,239 :: 		I2C1_Wr(page_write);             // send byte via I2C  (device address + W)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_page_write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,240 :: 		I2C1_Wr(address);             // send byte (address of EEPROM location)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,241 :: 		I2C1_Wr(byte2write);             // send data (data to be written)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_byte2write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,242 :: 		I2C1_Stop();        // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,243 :: 		Delay_ms(20);
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
;lcddisplay.c,244 :: 		}
L_end_I2C_Write_Byte_To_EEPROM:
	RETURN      0
; end of _I2C_Write_Byte_To_EEPROM

_I2C_Test_EEPROM:

;lcddisplay.c,246 :: 		void I2C_Test_EEPROM() {
;lcddisplay.c,249 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,250 :: 		I2C1_Init(100000);         // initialize I2C communication
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,251 :: 		I2C1_Start();              // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,252 :: 		I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
	MOVLW       162
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,253 :: 		I2C1_Wr(0x02);             // send byte (address of EEPROM location)
	MOVLW       2
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,254 :: 		I2C1_Wr(0x41);             // send data (data to be written)
	MOVLW       65
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,255 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,257 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;lcddisplay.c,258 :: 		LCD_1Row_Write("WRITE FINISHED");
	MOVLW       ?lstr16_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr16_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,259 :: 		Lcd_Chr(2, 3, 0x41);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcddisplay.c,261 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;lcddisplay.c,262 :: 		LCD_1Row_Write("READ STARTED");
	MOVLW       ?lstr17_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr17_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,263 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;lcddisplay.c,264 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,265 :: 		I2C1_Start();              // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,266 :: 		I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
	MOVLW       162
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,267 :: 		I2C1_Wr(0x02);             // send byte (data address)
	MOVLW       2
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,268 :: 		I2C1_Repeated_Start();     // issue I2C signal repeated start
	CALL        _I2C1_Repeated_Start+0, 0
;lcddisplay.c,269 :: 		I2C1_Wr(0xA3);             // send byte (device address + R)
	MOVLW       163
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,270 :: 		x = I2C1_Rd(0);       // Read the data (NO acknowledge)
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       I2C_Test_EEPROM_x_L0+0 
;lcddisplay.c,271 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,273 :: 		Delay_ms(300);
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
;lcddisplay.c,274 :: 		LCD_1Row_Write("READ FINISHED");
	MOVLW       ?lstr18_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr18_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,275 :: 		Lcd_Chr(2, 3, x);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        I2C_Test_EEPROM_x_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcddisplay.c,276 :: 		Delay_ms(2000);
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
;lcddisplay.c,278 :: 		while (GetOpMode() == I2C_EEPROM_TEST);
L_I2C_Test_EEPROM95:
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_Test_EEPROM150
	MOVLW       54
	XORWF       R0, 0 
L__I2C_Test_EEPROM150:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_Test_EEPROM96
	GOTO        L_I2C_Test_EEPROM95
L_I2C_Test_EEPROM96:
;lcddisplay.c,279 :: 		}
L_end_I2C_Test_EEPROM:
	RETURN      0
; end of _I2C_Test_EEPROM

_GetOpMode:

;lcddisplay.c,281 :: 		short GetOpMode() {
;lcddisplay.c,282 :: 		if (RA0_bit && !RA1_bit) {
	BTFSS       RA0_bit+0, 0 
	GOTO        L_GetOpMode99
	BTFSC       RA1_bit+0, 1 
	GOTO        L_GetOpMode99
L__GetOpMode124:
;lcddisplay.c,283 :: 		opstate = USB_TEST;
	MOVLW       50
	MOVWF       _opstate+0 
;lcddisplay.c,284 :: 		} else if ( !RA0_bit && RA1_bit) {
	GOTO        L_GetOpMode100
L_GetOpMode99:
	BTFSC       RA0_bit+0, 0 
	GOTO        L_GetOpMode103
	BTFSS       RA1_bit+0, 1 
	GOTO        L_GetOpMode103
L__GetOpMode123:
;lcddisplay.c,285 :: 		opstate = I2C_EEPROM_TEST;
	MOVLW       54
	MOVWF       _opstate+0 
;lcddisplay.c,286 :: 		} else {
	GOTO        L_GetOpMode104
L_GetOpMode103:
;lcddisplay.c,287 :: 		opstate = I2C_RTC_TEST;
	MOVLW       51
	MOVWF       _opstate+0 
;lcddisplay.c,288 :: 		}
L_GetOpMode104:
L_GetOpMode100:
;lcddisplay.c,290 :: 		return opstate;
	MOVF        _opstate+0, 0 
	MOVWF       R0 
;lcddisplay.c,291 :: 		}
L_end_GetOpMode:
	RETURN      0
; end of _GetOpMode

_main:

;lcddisplay.c,293 :: 		void main() {
;lcddisplay.c,294 :: 		init_main();
	CALL        _init_main+0, 0
;lcddisplay.c,295 :: 		while (1) {
L_main105:
;lcddisplay.c,296 :: 		GetOpMode();
	CALL        _GetOpMode+0, 0
;lcddisplay.c,297 :: 		switch (opstate) {
	GOTO        L_main107
;lcddisplay.c,298 :: 		case I2C_EEPROM_TEST:
L_main109:
;lcddisplay.c,299 :: 		LCD_1Row_Write("I2C_EEPROM_TEST");
	MOVLW       ?lstr19_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr19_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,300 :: 		I2C_Test_EEPROM();
	CALL        _I2C_Test_EEPROM+0, 0
;lcddisplay.c,301 :: 		break;
	GOTO        L_main108
;lcddisplay.c,302 :: 		case USB_TEST:
L_main110:
;lcddisplay.c,303 :: 		LCD_1Row_Write("USB Mode");
	MOVLW       ?lstr20_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr20_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,304 :: 		USB_Mode();
	CALL        _USB_Mode+0, 0
;lcddisplay.c,305 :: 		break;
	GOTO        L_main108
;lcddisplay.c,306 :: 		case I2C_RTC_TEST:
L_main111:
;lcddisplay.c,307 :: 		LCD_1Row_Write("I2C RTC Mode");
	MOVLW       ?lstr21_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr21_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,308 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,309 :: 		Delay_ms(200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main112:
	DECFSZ      R13, 1, 1
	BRA         L_main112
	DECFSZ      R12, 1, 1
	BRA         L_main112
	DECFSZ      R11, 1, 1
	BRA         L_main112
	NOP
	NOP
;lcddisplay.c,310 :: 		TIME_Mode();
	CALL        _TIME_Mode+0, 0
;lcddisplay.c,311 :: 		break;
	GOTO        L_main108
;lcddisplay.c,312 :: 		default:
L_main113:
;lcddisplay.c,313 :: 		LCD_2Row_Write("Operation Not", "Allowed");
	MOVLW       ?lstr22_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr22_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr23_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr23_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
;lcddisplay.c,314 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
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
;lcddisplay.c,315 :: 		break;
	GOTO        L_main108
;lcddisplay.c,316 :: 		}
L_main107:
	MOVF        _opstate+0, 0 
	XORLW       54
	BTFSC       STATUS+0, 2 
	GOTO        L_main109
	MOVF        _opstate+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_main110
	MOVF        _opstate+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_main111
	GOTO        L_main113
L_main108:
;lcddisplay.c,317 :: 		}
	GOTO        L_main105
;lcddisplay.c,318 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_TestUSBInput:

;lcddisplay.c,320 :: 		void TestUSBInput(char *output_string) {
;lcddisplay.c,322 :: 		ShortToStr(readbuff[0], buff_diag_d);
	MOVF        1280, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_d_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_d_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,323 :: 		ShortToStr(readbuff[1], buff_diag_a);
	MOVF        1281, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_a_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_a_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,324 :: 		ShortToStr(readbuff[2], buff_diag_b);
	MOVF        1282, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_b_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_b_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,325 :: 		strcpy(output_string, "");
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr24_lcddisplay+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr24_lcddisplay+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;lcddisplay.c,326 :: 		strcat(output_string, buff_diag_d);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_d_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_d_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,327 :: 		strcat(output_string, buff_diag_a);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_a_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_a_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,328 :: 		strcat(output_string, buff_diag_b);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_b_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_b_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,329 :: 		}
L_end_TestUSBInput:
	RETURN      0
; end of _TestUSBInput
