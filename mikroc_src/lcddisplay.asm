
_interrupt:

;lcddisplay.c,27 :: 		void interrupt() {
;lcddisplay.c,28 :: 		USB_Interrupt_Proc(); // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;lcddisplay.c,29 :: 		}
L_end_interrupt:
L__interrupt154:
	RETFIE      1
; end of _interrupt

_init_core:

;lcddisplay.c,31 :: 		void init_core() {
;lcddisplay.c,32 :: 		ADCON1 = 0x0F; // page 268, disable analaog
	MOVLW       15
	MOVWF       ADCON1+0 
;lcddisplay.c,33 :: 		CMCON = 0x07; // disable comparator
	MOVLW       7
	MOVWF       CMCON+0 
;lcddisplay.c,34 :: 		INTCON2 = 0x80; // disable pull up in port b
	MOVLW       128
	MOVWF       INTCON2+0 
;lcddisplay.c,36 :: 		LATA = 0x00; // Make all output ports 0
	CLRF        LATA+0 
;lcddisplay.c,37 :: 		LATC = 0x00; // Make all output ports 0
	CLRF        LATC+0 
;lcddisplay.c,38 :: 		LATD = 0x00; // Make all output ports 0
	CLRF        LATD+0 
;lcddisplay.c,39 :: 		LATE = 0x00; // Make all output ports 0
	CLRF        LATE+0 
;lcddisplay.c,41 :: 		TRISA = 0x00; // Make all ports output
	CLRF        TRISA+0 
;lcddisplay.c,42 :: 		TRISC = 0x00; // Make all ports output
	CLRF        TRISC+0 
;lcddisplay.c,43 :: 		TRISD = 0x00; // Make all ports output
	CLRF        TRISD+0 
;lcddisplay.c,44 :: 		TRISE = 0x00; // Make all ports output
	CLRF        TRISE+0 
;lcddisplay.c,46 :: 		PORTA = 0x00; // Make all ports 0
	CLRF        PORTA+0 
;lcddisplay.c,47 :: 		PORTC = 0x00; // Make all ports 0
	CLRF        PORTC+0 
;lcddisplay.c,48 :: 		PORTD = 0x00; // Make all ports 0
	CLRF        PORTD+0 
;lcddisplay.c,49 :: 		PORTE = 0x00; // Make all ports 0
	CLRF        PORTE+0 
;lcddisplay.c,51 :: 		TRISA = 0x03;
	MOVLW       3
	MOVWF       TRISA+0 
;lcddisplay.c,52 :: 		LATA = 0x03;
	MOVLW       3
	MOVWF       LATA+0 
;lcddisplay.c,53 :: 		}
L_end_init_core:
	RETURN      0
; end of _init_core

_init_main:

;lcddisplay.c,55 :: 		void init_main() {
;lcddisplay.c,56 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,57 :: 		Lcd_Init(); // Initialize LCD
	CALL        _Lcd_Init+0, 0
;lcddisplay.c,58 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear LCD display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,59 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,60 :: 		Lcd_Out(1, 1, "Hardware Cron");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_lcddisplay+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_lcddisplay+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcddisplay.c,62 :: 		LATD = 0xFF;
	MOVLW       255
	MOVWF       LATD+0 
;lcddisplay.c,63 :: 		Delay_ms(200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
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
;lcddisplay.c,64 :: 		LATD = 0x00;
	CLRF        LATD+0 
;lcddisplay.c,65 :: 		Delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_init_main1:
	DECFSZ      R13, 1, 1
	BRA         L_init_main1
	DECFSZ      R12, 1, 1
	BRA         L_init_main1
	DECFSZ      R11, 1, 1
	BRA         L_init_main1
	NOP
;lcddisplay.c,66 :: 		LATD = 0xFF;
	MOVLW       255
	MOVWF       LATD+0 
;lcddisplay.c,67 :: 		Delay_ms(100);
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
;lcddisplay.c,68 :: 		LATD = 0x00;
	CLRF        LATD+0 
;lcddisplay.c,69 :: 		}
L_end_init_main:
	RETURN      0
; end of _init_main

_USB_Mode:

;lcddisplay.c,71 :: 		void USB_Mode() {
;lcddisplay.c,81 :: 		unsigned char end_of_signal = 0;
	CLRF        USB_Mode_end_of_signal_L0+0 
	CLRF        USB_Mode_page_L0+0 
	CLRF        USB_Mode_address_L0+0 
	CLRF        USB_Mode_address_count_L0+0 
	CLRF        USB_Mode_entry_on_page_L0+0 
	CLRF        USB_Mode_is_read_broken_L0+0 
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,86 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,87 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,90 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,93 :: 		HID_Enable(&readbuff,&writebuff);
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;lcddisplay.c,95 :: 		while(GetOpMode() == USB_TEST){
L_USB_Mode3:
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode158
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode158:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode4
;lcddisplay.c,96 :: 		LCD_1Row_Write("USB MODE");
	MOVLW       ?lstr2_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr2_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,97 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);
L_USB_Mode5:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode6
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode159
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode159:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode6
L__USB_Mode148:
	GOTO        L_USB_Mode5
L_USB_Mode6:
;lcddisplay.c,99 :: 		if ((int)readbuff[0] == 0) {
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode160
	MOVLW       0
	XORWF       R1, 0 
L__USB_Mode160:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode9
;lcddisplay.c,100 :: 		LCD_1Row_Write("Sending Time"); Delay_ms(500);
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
L_USB_Mode10:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode10
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode10
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode10
	NOP
;lcddisplay.c,101 :: 		USB_Buffer_Time();
	CALL        _USB_Buffer_Time+0, 0
;lcddisplay.c,102 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
L_USB_Mode11:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode12
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
	GOTO        L_USB_Mode12
L__USB_Mode147:
	GOTO        L_USB_Mode11
L_USB_Mode12:
;lcddisplay.c,103 :: 		LCD_1Row_Write("Time Sent"); Delay_ms(1000);
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
L_USB_Mode15:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode15
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode15
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode15
	NOP
	NOP
;lcddisplay.c,105 :: 		} else if ((int)readbuff[0] == 1) {
	GOTO        L_USB_Mode16
L_USB_Mode9:
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode162
	MOVLW       1
	XORWF       R1, 0 
L__USB_Mode162:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode17
;lcddisplay.c,107 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	CLRF        USB_Mode_page_L0+0 
L_USB_Mode18:
	MOVLW       8
	SUBWF       USB_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode19
;lcddisplay.c,108 :: 		if (is_read_broken == 1) {
	MOVF        USB_Mode_is_read_broken_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode21
;lcddisplay.c,109 :: 		is_read_broken = 0;
	CLRF        USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,110 :: 		break;
	GOTO        L_USB_Mode19
;lcddisplay.c,111 :: 		}
L_USB_Mode21:
;lcddisplay.c,112 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        USB_Mode_address_L0+0 
;lcddisplay.c,113 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        USB_Mode_entry_on_page_L0+0 
L_USB_Mode22:
	MOVLW       12
	SUBWF       USB_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode23
;lcddisplay.c,114 :: 		writebuff[0] = 0; // 0 start
	CLRF        1344 
;lcddisplay.c,115 :: 		writebuff[1] = 2; // command code
	MOVLW       2
	MOVWF       1345 
;lcddisplay.c,116 :: 		writebuff[2] = page; // page
	MOVF        USB_Mode_page_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,117 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        USB_Mode_address_count_L0+0 
L_USB_Mode25:
	MOVLW       21
	SUBWF       USB_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode26
;lcddisplay.c,118 :: 		writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
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
;lcddisplay.c,119 :: 		address++;
	INCF        USB_Mode_address_L0+0, 1 
;lcddisplay.c,117 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        USB_Mode_address_count_L0+0, 1 
;lcddisplay.c,120 :: 		}
	GOTO        L_USB_Mode25
L_USB_Mode26:
;lcddisplay.c,121 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode28:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode29
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
	GOTO        L_USB_Mode29
L__USB_Mode146:
	GOTO        L_USB_Mode28
L_USB_Mode29:
;lcddisplay.c,122 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);                // wait for respsonse to continue
L_USB_Mode32:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode33
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode164
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode164:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode33
L__USB_Mode145:
	GOTO        L_USB_Mode32
L_USB_Mode33:
;lcddisplay.c,123 :: 		if (!(readbuff[0] == 2)) {
	MOVF        1280, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode36
;lcddisplay.c,124 :: 		is_read_broken = 1;
	MOVLW       1
	MOVWF       USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,125 :: 		LCD_1Row_Write("Read Error"); Delay_ms(1000);
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
L_USB_Mode37:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode37
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode37
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode37
	NOP
	NOP
;lcddisplay.c,126 :: 		break;
	GOTO        L_USB_Mode23
;lcddisplay.c,127 :: 		}
L_USB_Mode36:
;lcddisplay.c,113 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        USB_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,128 :: 		}
	GOTO        L_USB_Mode22
L_USB_Mode23:
;lcddisplay.c,107 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	INCF        USB_Mode_page_L0+0, 1 
;lcddisplay.c,129 :: 		}
	GOTO        L_USB_Mode18
L_USB_Mode19:
;lcddisplay.c,130 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,131 :: 		writebuff[1] = 3;
	MOVLW       3
	MOVWF       1345 
;lcddisplay.c,132 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode38:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode39
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode165
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode165:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode39
L__USB_Mode144:
	GOTO        L_USB_Mode38
L_USB_Mode39:
;lcddisplay.c,133 :: 		if (is_read_broken == 0) {
	MOVF        USB_Mode_is_read_broken_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode42
;lcddisplay.c,134 :: 		LCD_1Row_Write("Entries Sent"); Delay_ms(1000);
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
L_USB_Mode43:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode43
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode43
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode43
	NOP
	NOP
;lcddisplay.c,135 :: 		} else {
	GOTO        L_USB_Mode44
L_USB_Mode42:
;lcddisplay.c,136 :: 		LCD_1Row_Write("Read Error"); Delay_ms(1000);
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
L_USB_Mode45:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode45
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode45
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode45
	NOP
	NOP
;lcddisplay.c,137 :: 		is_read_broken = 0;
	CLRF        USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,138 :: 		}
L_USB_Mode44:
;lcddisplay.c,139 :: 		} else if ((int)readbuff[0] == 7) {
	GOTO        L_USB_Mode46
L_USB_Mode17:
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode166
	MOVLW       7
	XORWF       R1, 0 
L__USB_Mode166:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode47
;lcddisplay.c,140 :: 		EEPROM_Write(0x00, readbuff[1] + 1);
	CLRF        FARG_EEPROM_Write_address+0 
	MOVF        1281, 0 
	ADDLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;lcddisplay.c,141 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	CLRF        USB_Mode_page_L0+0 
L_USB_Mode48:
	MOVLW       8
	SUBWF       USB_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode49
;lcddisplay.c,142 :: 		if (is_write_broken == 1) {
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode51
;lcddisplay.c,143 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,144 :: 		break;
	GOTO        L_USB_Mode49
;lcddisplay.c,145 :: 		}
L_USB_Mode51:
;lcddisplay.c,146 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        USB_Mode_address_L0+0 
;lcddisplay.c,147 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        USB_Mode_entry_on_page_L0+0 
L_USB_Mode52:
	MOVLW       12
	SUBWF       USB_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode53
;lcddisplay.c,149 :: 		writebuff[0] = 0; // 0 start
	CLRF        1344 
;lcddisplay.c,150 :: 		writebuff[1] = 6; // command code
	MOVLW       6
	MOVWF       1345 
;lcddisplay.c,151 :: 		writebuff[2] = page; // page
	MOVF        USB_Mode_page_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,155 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        USB_Mode_address_count_L0+0 
L_USB_Mode55:
	MOVLW       21
	SUBWF       USB_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode56
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
	GOTO        L_USB_Mode55
L_USB_Mode56:
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
	GOTO        L__USB_Mode167
	MOVF        R1, 0 
	SUBLW       0
L__USB_Mode167:
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode58
;lcddisplay.c,166 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
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
	GOTO        L__USB_Mode168
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode168:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode60
L__USB_Mode143:
	GOTO        L_USB_Mode59
L_USB_Mode60:
;lcddisplay.c,169 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);                // wait for respsonse to continue
L_USB_Mode63:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode64
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode169
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode169:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode64
L__USB_Mode142:
	GOTO        L_USB_Mode63
L_USB_Mode64:
;lcddisplay.c,170 :: 		if (!(readbuff[0] == 4)) {
	MOVF        1280, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode67
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
L_USB_Mode68:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode68
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode68
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode68
	NOP
	NOP
;lcddisplay.c,173 :: 		break;
	GOTO        L_USB_Mode53
;lcddisplay.c,174 :: 		}
L_USB_Mode67:
;lcddisplay.c,175 :: 		}
	GOTO        L_USB_Mode69
L_USB_Mode58:
;lcddisplay.c,178 :: 		end_of_signal = 1;
	MOVLW       1
	MOVWF       USB_Mode_end_of_signal_L0+0 
;lcddisplay.c,179 :: 		break;
	GOTO        L_USB_Mode53
;lcddisplay.c,180 :: 		}
L_USB_Mode69:
;lcddisplay.c,147 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        USB_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,181 :: 		}
	GOTO        L_USB_Mode52
L_USB_Mode53:
;lcddisplay.c,182 :: 		if (end_of_signal == 1) {
	MOVF        USB_Mode_end_of_signal_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode70
;lcddisplay.c,183 :: 		break;
	GOTO        L_USB_Mode49
;lcddisplay.c,184 :: 		}
L_USB_Mode70:
;lcddisplay.c,141 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	INCF        USB_Mode_page_L0+0, 1 
;lcddisplay.c,185 :: 		}
	GOTO        L_USB_Mode48
L_USB_Mode49:
;lcddisplay.c,186 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,187 :: 		writebuff[1] = 5;
	MOVLW       5
	MOVWF       1345 
;lcddisplay.c,188 :: 		writebuff[2] = is_write_broken;
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,189 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode71:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode72
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode170
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode170:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode72
L__USB_Mode141:
	GOTO        L_USB_Mode71
L_USB_Mode72:
;lcddisplay.c,190 :: 		if (is_write_broken == 0) {
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode75
;lcddisplay.c,191 :: 		LCD_1Row_Write("Entries Written"); Delay_ms(1000);
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
L_USB_Mode76:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode76
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode76
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode76
	NOP
	NOP
;lcddisplay.c,192 :: 		} else {
	GOTO        L_USB_Mode77
L_USB_Mode75:
;lcddisplay.c,193 :: 		LCD_1Row_Write("Write Error"); Delay_ms(1000);
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
L_USB_Mode78:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode78
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode78
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode78
	NOP
	NOP
;lcddisplay.c,194 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,195 :: 		}
L_USB_Mode77:
;lcddisplay.c,197 :: 		if (end_of_signal == 1) {
	MOVF        USB_Mode_end_of_signal_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode79
;lcddisplay.c,198 :: 		LCD_1Row_Write("End of Signal"); Delay_ms(1000);
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
L_USB_Mode80:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode80
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode80
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode80
	NOP
	NOP
;lcddisplay.c,199 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,200 :: 		}
L_USB_Mode79:
;lcddisplay.c,201 :: 		} else {
	GOTO        L_USB_Mode81
L_USB_Mode47:
;lcddisplay.c,202 :: 		TestUSBInput(str_usbDiagnostics);
	MOVLW       USB_Mode_str_usbDiagnostics_L0+0
	MOVWF       FARG_TestUSBInput_output_string+0 
	MOVLW       hi_addr(USB_Mode_str_usbDiagnostics_L0+0)
	MOVWF       FARG_TestUSBInput_output_string+1 
	CALL        _TestUSBInput+0, 0
;lcddisplay.c,203 :: 		LCD_2Row_Write("No Operation", str_usbDiagnostics); Delay_ms(1000);
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
L_USB_Mode82:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode82
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode82
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode82
	NOP
	NOP
;lcddisplay.c,204 :: 		}
L_USB_Mode81:
L_USB_Mode46:
L_USB_Mode16:
;lcddisplay.c,205 :: 		}
	GOTO        L_USB_Mode3
L_USB_Mode4:
;lcddisplay.c,207 :: 		HID_Disable();
	CALL        _HID_Disable+0, 0
;lcddisplay.c,208 :: 		LCD_1Row_Write("USB MODE EXITED");
	MOVLW       ?lstr13_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr13_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,209 :: 		Delay_ms(1000);
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
;lcddisplay.c,211 :: 		}
L_end_USB_Mode:
	RETURN      0
; end of _USB_Mode

_USB_Buffer_Clear:

;lcddisplay.c,215 :: 		void USB_Buffer_Clear() {
;lcddisplay.c,216 :: 		int i=0;
	CLRF        USB_Buffer_Clear_i_L0+0 
	CLRF        USB_Buffer_Clear_i_L0+1 
;lcddisplay.c,217 :: 		for (i=0; i<64; i++) {
	CLRF        USB_Buffer_Clear_i_L0+0 
	CLRF        USB_Buffer_Clear_i_L0+1 
L_USB_Buffer_Clear84:
	MOVLW       128
	XORWF       USB_Buffer_Clear_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Buffer_Clear172
	MOVLW       64
	SUBWF       USB_Buffer_Clear_i_L0+0, 0 
L__USB_Buffer_Clear172:
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Buffer_Clear85
;lcddisplay.c,218 :: 		writebuff[i] = 0;
	MOVLW       _writebuff+0
	ADDWF       USB_Buffer_Clear_i_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_writebuff+0)
	ADDWFC      USB_Buffer_Clear_i_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;lcddisplay.c,217 :: 		for (i=0; i<64; i++) {
	INFSNZ      USB_Buffer_Clear_i_L0+0, 1 
	INCF        USB_Buffer_Clear_i_L0+1, 1 
;lcddisplay.c,219 :: 		}
	GOTO        L_USB_Buffer_Clear84
L_USB_Buffer_Clear85:
;lcddisplay.c,220 :: 		}
L_end_USB_Buffer_Clear:
	RETURN      0
; end of _USB_Buffer_Clear

_USB_Buffer_Time:

;lcddisplay.c,222 :: 		void USB_Buffer_Time() {
;lcddisplay.c,224 :: 		Write_Time(readbuff[1], readbuff[2], readbuff[3], readbuff[4], readbuff[5], readbuff[6]);
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
;lcddisplay.c,226 :: 		GetTimeStruct(&t);
	MOVLW       USB_Buffer_Time_t_L0+0
	MOVWF       FARG_GetTimeStruct_time+0 
	MOVLW       hi_addr(USB_Buffer_Time_t_L0+0)
	MOVWF       FARG_GetTimeStruct_time+1 
	CALL        _GetTimeStruct+0, 0
;lcddisplay.c,227 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,228 :: 		writebuff[1] = 0;
	CLRF        1345 
;lcddisplay.c,229 :: 		writebuff[2] = t.ss;
	MOVF        USB_Buffer_Time_t_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,230 :: 		writebuff[3] = t.mn;
	MOVF        USB_Buffer_Time_t_L0+1, 0 
	MOVWF       1347 
;lcddisplay.c,231 :: 		writebuff[4] = t.hh;
	MOVF        USB_Buffer_Time_t_L0+2, 0 
	MOVWF       1348 
;lcddisplay.c,232 :: 		writebuff[5] = t.md;
	MOVF        USB_Buffer_Time_t_L0+3, 0 
	MOVWF       1349 
;lcddisplay.c,233 :: 		writebuff[6] = t.wd;
	MOVF        USB_Buffer_Time_t_L0+4, 0 
	MOVWF       1350 
;lcddisplay.c,234 :: 		writebuff[7] = t.mo;
	MOVF        USB_Buffer_Time_t_L0+5, 0 
	MOVWF       1351 
;lcddisplay.c,235 :: 		writebuff[8] = t.yy;
	MOVF        USB_Buffer_Time_t_L0+6, 0 
	MOVWF       1352 
;lcddisplay.c,236 :: 		}
L_end_USB_Buffer_Time:
	RETURN      0
; end of _USB_Buffer_Time

_TIME_Mode:

;lcddisplay.c,238 :: 		void TIME_Mode() {
;lcddisplay.c,242 :: 		unsigned char entry[21], number_of_entries_read = 0;
	CLRF        TIME_Mode_number_of_entries_read_L0+0 
;lcddisplay.c,248 :: 		init_core(); // Initialize Program
	CALL        _init_core+0, 0
;lcddisplay.c,249 :: 		I2C1_Init(100000); // Initialize IC2 for both EEPROM and RTC
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,252 :: 		while (GetOpMode() == I2C_RTC_TEST) {
L_TIME_Mode87:
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__TIME_Mode175
	MOVLW       51
	XORWF       R0, 0 
L__TIME_Mode175:
	BTFSS       STATUS+0, 2 
	GOTO        L_TIME_Mode88
;lcddisplay.c,254 :: 		numberofentries = EEPROM_Read(0x00); Delay_ms(20);
	CLRF        FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       TIME_Mode_numberofentries_L0+0 
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_TIME_Mode89:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode89
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode89
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode89
;lcddisplay.c,256 :: 		for ( page=0; page<EEPROM_MEMORY_BANKS; page++ ){
	CLRF        TIME_Mode_page_L0+0 
L_TIME_Mode90:
	MOVLW       8
	SUBWF       TIME_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode91
;lcddisplay.c,257 :: 		if (number_of_entries_read >= numberofentries) break;
	MOVF        TIME_Mode_numberofentries_L0+0, 0 
	SUBWF       TIME_Mode_number_of_entries_read_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_TIME_Mode93
	GOTO        L_TIME_Mode91
L_TIME_Mode93:
;lcddisplay.c,258 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        TIME_Mode_address_L0+0 
;lcddisplay.c,259 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        TIME_Mode_entry_on_page_L0+0 
L_TIME_Mode94:
	MOVLW       12
	SUBWF       TIME_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode95
;lcddisplay.c,260 :: 		if (number_of_entries_read >= numberofentries) break;
	MOVF        TIME_Mode_numberofentries_L0+0, 0 
	SUBWF       TIME_Mode_number_of_entries_read_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_TIME_Mode97
	GOTO        L_TIME_Mode95
L_TIME_Mode97:
;lcddisplay.c,263 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        TIME_Mode_address_count_L0+0 
L_TIME_Mode98:
	MOVLW       21
	SUBWF       TIME_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode99
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
;lcddisplay.c,275 :: 		}
	GOTO        L_TIME_Mode98
L_TIME_Mode99:
;lcddisplay.c,278 :: 		GetTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_GetTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_GetTimeStruct_time+1 
	CALL        _GetTimeStruct+0, 0
;lcddisplay.c,279 :: 		DisplayTimeStruct(&t); Delay_ms(500);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_DisplayTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_DisplayTimeStruct_time+1 
	CALL        _DisplayTimeStruct+0, 0
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_TIME_Mode101:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode101
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode101
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode101
	NOP
;lcddisplay.c,281 :: 		entryflag = 0;
	CLRF        TIME_Mode_entryflag_L0+0 
;lcddisplay.c,283 :: 		if( entry[3] == t.mn || entry[3] == ASTERISK) {
	MOVF        TIME_Mode_entry_L0+3, 0 
	XORWF       TIME_Mode_t_L0+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L__TIME_Mode150
	MOVF        TIME_Mode_entry_L0+3, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L__TIME_Mode150
	GOTO        L_TIME_Mode104
L__TIME_Mode150:
;lcddisplay.c,284 :: 		entryflag = 1;
	MOVLW       1
	MOVWF       TIME_Mode_entryflag_L0+0 
;lcddisplay.c,285 :: 		} else {
	GOTO        L_TIME_Mode105
L_TIME_Mode104:
;lcddisplay.c,286 :: 		break;
	GOTO        L_TIME_Mode95
;lcddisplay.c,287 :: 		}
L_TIME_Mode105:
;lcddisplay.c,289 :: 		if ( entry[6] == t.hh ||  entry[6] == ASTERISK) {
	MOVF        TIME_Mode_entry_L0+6, 0 
	XORWF       TIME_Mode_t_L0+2, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L__TIME_Mode149
	MOVF        TIME_Mode_entry_L0+6, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L__TIME_Mode149
	GOTO        L_TIME_Mode108
L__TIME_Mode149:
;lcddisplay.c,290 :: 		entryflag = 1;
	MOVLW       1
	MOVWF       TIME_Mode_entryflag_L0+0 
;lcddisplay.c,291 :: 		} else {
	GOTO        L_TIME_Mode109
L_TIME_Mode108:
;lcddisplay.c,292 :: 		break;
	GOTO        L_TIME_Mode95
;lcddisplay.c,293 :: 		}
L_TIME_Mode109:
;lcddisplay.c,297 :: 		if (entryflag == 1) {
	MOVF        TIME_Mode_entryflag_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_TIME_Mode110
;lcddisplay.c,298 :: 		switch (entry[1]) {
	GOTO        L_TIME_Mode111
;lcddisplay.c,299 :: 		case 0:
L_TIME_Mode113:
;lcddisplay.c,300 :: 		LATD0_bit = 1;
	BSF         LATD0_bit+0, 0 
;lcddisplay.c,301 :: 		break;
	GOTO        L_TIME_Mode112
;lcddisplay.c,302 :: 		case 1:
L_TIME_Mode114:
;lcddisplay.c,303 :: 		LATD1_bit = 1;
	BSF         LATD1_bit+0, 1 
;lcddisplay.c,304 :: 		break;
	GOTO        L_TIME_Mode112
;lcddisplay.c,305 :: 		case 2:
L_TIME_Mode115:
;lcddisplay.c,306 :: 		LATD2_bit = 1;
	BSF         LATD2_bit+0, 2 
;lcddisplay.c,307 :: 		break;
	GOTO        L_TIME_Mode112
;lcddisplay.c,308 :: 		case 3:
L_TIME_Mode116:
;lcddisplay.c,309 :: 		LATD3_bit = 1;
	BSF         LATD3_bit+0, 3 
;lcddisplay.c,310 :: 		break;
	GOTO        L_TIME_Mode112
;lcddisplay.c,311 :: 		case 4:
L_TIME_Mode117:
;lcddisplay.c,312 :: 		LATD4_bit = 1;
	BSF         LATD4_bit+0, 4 
;lcddisplay.c,313 :: 		break;
	GOTO        L_TIME_Mode112
;lcddisplay.c,314 :: 		case 5:
L_TIME_Mode118:
;lcddisplay.c,315 :: 		LATD5_bit = 1;
	BSF         LATD5_bit+0, 5 
;lcddisplay.c,316 :: 		break;
	GOTO        L_TIME_Mode112
;lcddisplay.c,317 :: 		case 6:
L_TIME_Mode119:
;lcddisplay.c,318 :: 		LATD6_bit = 1;
	BSF         LATD6_bit+0, 6 
;lcddisplay.c,319 :: 		break;
	GOTO        L_TIME_Mode112
;lcddisplay.c,320 :: 		case 7:
L_TIME_Mode120:
;lcddisplay.c,321 :: 		LATD7_bit = 1;
	BSF         LATD7_bit+0, 7 
;lcddisplay.c,322 :: 		break;
	GOTO        L_TIME_Mode112
;lcddisplay.c,323 :: 		default:
L_TIME_Mode121:
;lcddisplay.c,324 :: 		break;
	GOTO        L_TIME_Mode112
;lcddisplay.c,325 :: 		}
L_TIME_Mode111:
	MOVF        TIME_Mode_entry_L0+1, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_TIME_Mode113
	MOVF        TIME_Mode_entry_L0+1, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_TIME_Mode114
	MOVF        TIME_Mode_entry_L0+1, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_TIME_Mode115
	MOVF        TIME_Mode_entry_L0+1, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_TIME_Mode116
	MOVF        TIME_Mode_entry_L0+1, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_TIME_Mode117
	MOVF        TIME_Mode_entry_L0+1, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_TIME_Mode118
	MOVF        TIME_Mode_entry_L0+1, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_TIME_Mode119
	MOVF        TIME_Mode_entry_L0+1, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_TIME_Mode120
	GOTO        L_TIME_Mode121
L_TIME_Mode112:
;lcddisplay.c,326 :: 		}
L_TIME_Mode110:
;lcddisplay.c,333 :: 		number_of_entries_read++;
	INCF        TIME_Mode_number_of_entries_read_L0+0, 1 
;lcddisplay.c,259 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        TIME_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,334 :: 		}
	GOTO        L_TIME_Mode94
L_TIME_Mode95:
;lcddisplay.c,256 :: 		for ( page=0; page<EEPROM_MEMORY_BANKS; page++ ){
	INCF        TIME_Mode_page_L0+0, 1 
;lcddisplay.c,335 :: 		}
	GOTO        L_TIME_Mode90
L_TIME_Mode91:
;lcddisplay.c,337 :: 		number_of_entries_read = 0;
	CLRF        TIME_Mode_number_of_entries_read_L0+0 
;lcddisplay.c,338 :: 		}
	GOTO        L_TIME_Mode87
L_TIME_Mode88:
;lcddisplay.c,340 :: 		LCD_1Row_Write("TIME MODE EXITED"); Delay_ms(2000);
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
L_TIME_Mode122:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode122
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode122
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode122
	NOP
	NOP
;lcddisplay.c,341 :: 		}
L_end_TIME_Mode:
	RETURN      0
; end of _TIME_Mode

_I2C_Read_Byte_From_EEPROM:

;lcddisplay.c,343 :: 		unsigned char I2C_Read_Byte_From_EEPROM(unsigned char page_write, unsigned char page_read, unsigned char address) {
;lcddisplay.c,345 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,346 :: 		I2C1_Start();              // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,347 :: 		I2C1_Wr(page_write);             // send byte via I2C  (device address + W)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_page_write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,348 :: 		I2C1_Wr(address);             // send byte (data address)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,349 :: 		I2C1_Repeated_Start();     // issue I2C signal repeated start
	CALL        _I2C1_Repeated_Start+0, 0
;lcddisplay.c,350 :: 		I2C1_Wr(page_read);             // send byte (device address + R)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_page_read+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,351 :: 		x = I2C1_Rd(0);       // Read the data (NO acknowledge)
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       I2C_Read_Byte_From_EEPROM_x_L0+0 
;lcddisplay.c,352 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,353 :: 		return x;
	MOVF        I2C_Read_Byte_From_EEPROM_x_L0+0, 0 
	MOVWF       R0 
	GOTO        L_end_I2C_Read_Byte_From_EEPROM
;lcddisplay.c,354 :: 		Delay_ms(20);
L_I2C_Read_Byte_From_EEPROM123:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM123
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM123
	DECFSZ      R11, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM123
;lcddisplay.c,355 :: 		}
L_end_I2C_Read_Byte_From_EEPROM:
	RETURN      0
; end of _I2C_Read_Byte_From_EEPROM

_I2C_Write_Byte_To_EEPROM:

;lcddisplay.c,357 :: 		void I2C_Write_Byte_To_EEPROM(unsigned char page_write, unsigned char address, unsigned char byte2write) {
;lcddisplay.c,358 :: 		I2C1_Init(100000);         // initialize I2C communication
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,359 :: 		I2C1_Start();              // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,360 :: 		I2C1_Wr(page_write);             // send byte via I2C  (device address + W)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_page_write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,361 :: 		I2C1_Wr(address);             // send byte (address of EEPROM location)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,362 :: 		I2C1_Wr(byte2write);             // send data (data to be written)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_byte2write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,363 :: 		I2C1_Stop();        // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,364 :: 		Delay_ms(20);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_I2C_Write_Byte_To_EEPROM124:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM124
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM124
	DECFSZ      R11, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM124
;lcddisplay.c,365 :: 		}
L_end_I2C_Write_Byte_To_EEPROM:
	RETURN      0
; end of _I2C_Write_Byte_To_EEPROM

_GetOpMode:

;lcddisplay.c,367 :: 		short GetOpMode() {
;lcddisplay.c,368 :: 		if (RA0_bit && !RA1_bit) {
	BTFSS       RA0_bit+0, 0 
	GOTO        L_GetOpMode127
	BTFSC       RA1_bit+0, 1 
	GOTO        L_GetOpMode127
L__GetOpMode152:
;lcddisplay.c,369 :: 		opstate = USB_TEST;
	MOVLW       50
	MOVWF       _opstate+0 
;lcddisplay.c,370 :: 		} else if ( !RA0_bit && RA1_bit) {
	GOTO        L_GetOpMode128
L_GetOpMode127:
	BTFSC       RA0_bit+0, 0 
	GOTO        L_GetOpMode131
	BTFSS       RA1_bit+0, 1 
	GOTO        L_GetOpMode131
L__GetOpMode151:
;lcddisplay.c,371 :: 		opstate = I2C_RTC_TEST;
	MOVLW       51
	MOVWF       _opstate+0 
;lcddisplay.c,372 :: 		}
L_GetOpMode131:
L_GetOpMode128:
;lcddisplay.c,374 :: 		return opstate;
	MOVF        _opstate+0, 0 
	MOVWF       R0 
;lcddisplay.c,375 :: 		}
L_end_GetOpMode:
	RETURN      0
; end of _GetOpMode

_main:

;lcddisplay.c,377 :: 		void main() {
;lcddisplay.c,379 :: 		init_main();
	CALL        _init_main+0, 0
;lcddisplay.c,380 :: 		while (1) {
L_main132:
;lcddisplay.c,381 :: 		GetOpMode();
	CALL        _GetOpMode+0, 0
;lcddisplay.c,382 :: 		switch (opstate) {
	GOTO        L_main134
;lcddisplay.c,383 :: 		case USB_TEST:
L_main136:
;lcddisplay.c,384 :: 		LCD_1Row_Write("USB Mode");
	MOVLW       ?lstr15_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr15_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,385 :: 		USB_Mode();
	CALL        _USB_Mode+0, 0
;lcddisplay.c,386 :: 		break;
	GOTO        L_main135
;lcddisplay.c,387 :: 		case I2C_RTC_TEST:
L_main137:
;lcddisplay.c,388 :: 		LCD_1Row_Write("I2C RTC Mode");
	MOVLW       ?lstr16_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr16_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,389 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,390 :: 		Delay_ms(200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main138:
	DECFSZ      R13, 1, 1
	BRA         L_main138
	DECFSZ      R12, 1, 1
	BRA         L_main138
	DECFSZ      R11, 1, 1
	BRA         L_main138
	NOP
	NOP
;lcddisplay.c,391 :: 		TIME_Mode();
	CALL        _TIME_Mode+0, 0
;lcddisplay.c,392 :: 		break;
	GOTO        L_main135
;lcddisplay.c,393 :: 		default:
L_main139:
;lcddisplay.c,394 :: 		LCD_2Row_Write("Operation Not", "Allowed");
	MOVLW       ?lstr17_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr17_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr18_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr18_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
;lcddisplay.c,395 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main140:
	DECFSZ      R13, 1, 1
	BRA         L_main140
	DECFSZ      R12, 1, 1
	BRA         L_main140
	DECFSZ      R11, 1, 1
	BRA         L_main140
	NOP
	NOP
;lcddisplay.c,396 :: 		break;
	GOTO        L_main135
;lcddisplay.c,397 :: 		}
L_main134:
	MOVF        _opstate+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_main136
	MOVF        _opstate+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_main137
	GOTO        L_main139
L_main135:
;lcddisplay.c,398 :: 		}
	GOTO        L_main132
;lcddisplay.c,399 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_TestUSBInput:

;lcddisplay.c,401 :: 		void TestUSBInput(char *output_string) {
;lcddisplay.c,403 :: 		ShortToStr(readbuff[0], buff_diag_d);
	MOVF        1280, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_d_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_d_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,404 :: 		ShortToStr(readbuff[1], buff_diag_a);
	MOVF        1281, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_a_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_a_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,405 :: 		ShortToStr(readbuff[2], buff_diag_b);
	MOVF        1282, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_b_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_b_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,406 :: 		strcpy(output_string, "");
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr19_lcddisplay+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr19_lcddisplay+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;lcddisplay.c,407 :: 		strcat(output_string, buff_diag_d);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_d_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_d_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,408 :: 		strcat(output_string, buff_diag_a);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_a_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_a_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,409 :: 		strcat(output_string, buff_diag_b);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_b_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_b_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,410 :: 		}
L_end_TestUSBInput:
	RETURN      0
; end of _TestUSBInput
