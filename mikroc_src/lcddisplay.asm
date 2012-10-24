
_interrupt:

;lcddisplay.c,19 :: 		void interrupt() {
;lcddisplay.c,20 :: 		USB_Interrupt_Proc(); // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;lcddisplay.c,21 :: 		}
L_end_interrupt:
L__interrupt138:
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
;lcddisplay.c,56 :: 		LCD_2Row_Write("Chron Scheduler", entry); Delay_ms(1500);
	MOVLW       ?lstr1_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr1_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       init_main_entry_L0+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(init_main_entry_L0+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
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
;lcddisplay.c,57 :: 		LCD_2Row_Write("Abestano", "Johannah Mae"); Delay_ms(500);
	MOVLW       ?lstr2_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr2_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr3_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr3_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_init_main1:
	DECFSZ      R13, 1, 1
	BRA         L_init_main1
	DECFSZ      R12, 1, 1
	BRA         L_init_main1
	DECFSZ      R11, 1, 1
	BRA         L_init_main1
	NOP
;lcddisplay.c,58 :: 		LCD_2Row_Write("Enanor", "Caryl Keen"); Delay_ms(500);
	MOVLW       ?lstr4_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr4_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr5_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr5_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_init_main2:
	DECFSZ      R13, 1, 1
	BRA         L_init_main2
	DECFSZ      R12, 1, 1
	BRA         L_init_main2
	DECFSZ      R11, 1, 1
	BRA         L_init_main2
	NOP
;lcddisplay.c,59 :: 		LCD_2Row_Write("Regalado", "Gil Michael"); Delay_ms(500);
	MOVLW       ?lstr6_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr6_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr7_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr7_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_init_main3:
	DECFSZ      R13, 1, 1
	BRA         L_init_main3
	DECFSZ      R12, 1, 1
	BRA         L_init_main3
	DECFSZ      R11, 1, 1
	BRA         L_init_main3
	NOP
;lcddisplay.c,61 :: 		LATD = 0xFF;
	MOVLW       255
	MOVWF       LATD+0 
;lcddisplay.c,62 :: 		Delay_ms(200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_init_main4:
	DECFSZ      R13, 1, 1
	BRA         L_init_main4
	DECFSZ      R12, 1, 1
	BRA         L_init_main4
	DECFSZ      R11, 1, 1
	BRA         L_init_main4
	NOP
	NOP
;lcddisplay.c,63 :: 		LATD = 0x00;
	CLRF        LATD+0 
;lcddisplay.c,64 :: 		Delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_init_main5:
	DECFSZ      R13, 1, 1
	BRA         L_init_main5
	DECFSZ      R12, 1, 1
	BRA         L_init_main5
	DECFSZ      R11, 1, 1
	BRA         L_init_main5
	NOP
;lcddisplay.c,65 :: 		LATD = 0xFF;
	MOVLW       255
	MOVWF       LATD+0 
;lcddisplay.c,66 :: 		Delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_init_main6:
	DECFSZ      R13, 1, 1
	BRA         L_init_main6
	DECFSZ      R12, 1, 1
	BRA         L_init_main6
	DECFSZ      R11, 1, 1
	BRA         L_init_main6
	NOP
;lcddisplay.c,67 :: 		LATD = 0x00;
	CLRF        LATD+0 
;lcddisplay.c,68 :: 		}
L_end_init_main:
	RETURN      0
; end of _init_main

_USB_Mode:

;lcddisplay.c,70 :: 		void USB_Mode() {
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
L_USB_Mode7:
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
	GOTO        L_USB_Mode8
;lcddisplay.c,96 :: 		LCD_1Row_Write("USB MODE");
	MOVLW       ?lstr8_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr8_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,97 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);
L_USB_Mode9:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode10
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
	GOTO        L_USB_Mode10
L__USB_Mode134:
	GOTO        L_USB_Mode9
L_USB_Mode10:
;lcddisplay.c,99 :: 		if ((int)readbuff[0] == 0) {
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode144
	MOVLW       0
	XORWF       R1, 0 
L__USB_Mode144:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode13
;lcddisplay.c,100 :: 		EEPROM_Write(0x00, 0);
	CLRF        FARG_EEPROM_Write_address+0 
	CLRF        FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;lcddisplay.c,101 :: 		LCD_1Row_Write("Sending Time"); Delay_ms(500);
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
L_USB_Mode14:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode14
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode14
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode14
	NOP
;lcddisplay.c,102 :: 		USB_Buffer_Time();
	CALL        _USB_Buffer_Time+0, 0
;lcddisplay.c,103 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
L_USB_Mode15:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode16
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
	GOTO        L_USB_Mode16
L__USB_Mode133:
	GOTO        L_USB_Mode15
L_USB_Mode16:
;lcddisplay.c,104 :: 		LCD_1Row_Write("Time Sent"); Delay_ms(1000);
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
L_USB_Mode19:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode19
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode19
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode19
	NOP
	NOP
;lcddisplay.c,106 :: 		} else if ((int)readbuff[0] == 1) {
	GOTO        L_USB_Mode20
L_USB_Mode13:
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode146
	MOVLW       1
	XORWF       R1, 0 
L__USB_Mode146:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode21
;lcddisplay.c,108 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	CLRF        USB_Mode_page_L0+0 
L_USB_Mode22:
	MOVLW       8
	SUBWF       USB_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode23
;lcddisplay.c,109 :: 		if (is_read_broken == 1) {
	MOVF        USB_Mode_is_read_broken_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode25
;lcddisplay.c,110 :: 		is_read_broken = 0;
	CLRF        USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,111 :: 		break;
	GOTO        L_USB_Mode23
;lcddisplay.c,112 :: 		}
L_USB_Mode25:
;lcddisplay.c,113 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        USB_Mode_address_L0+0 
;lcddisplay.c,114 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        USB_Mode_entry_on_page_L0+0 
L_USB_Mode26:
	MOVLW       12
	SUBWF       USB_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode27
;lcddisplay.c,115 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,116 :: 		writebuff[0] = 0; // 0 start
	CLRF        1344 
;lcddisplay.c,117 :: 		writebuff[1] = 2; // command code
	MOVLW       2
	MOVWF       1345 
;lcddisplay.c,118 :: 		writebuff[2] = page; // page
	MOVF        USB_Mode_page_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,119 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        USB_Mode_address_count_L0+0 
L_USB_Mode29:
	MOVLW       21
	SUBWF       USB_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode30
;lcddisplay.c,120 :: 		writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
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
;lcddisplay.c,121 :: 		address++;
	INCF        USB_Mode_address_L0+0, 1 
;lcddisplay.c,119 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        USB_Mode_address_count_L0+0, 1 
;lcddisplay.c,122 :: 		}
	GOTO        L_USB_Mode29
L_USB_Mode30:
;lcddisplay.c,123 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode32:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
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
	GOTO        L__USB_Mode147
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode147:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode33
L__USB_Mode132:
	GOTO        L_USB_Mode32
L_USB_Mode33:
;lcddisplay.c,124 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);		// wait for respsonse to continue
L_USB_Mode36:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode37
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
	GOTO        L_USB_Mode37
L__USB_Mode131:
	GOTO        L_USB_Mode36
L_USB_Mode37:
;lcddisplay.c,125 :: 		if (!(readbuff[0] == 2)) {
	MOVF        1280, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode40
;lcddisplay.c,126 :: 		is_read_broken = 1;
	MOVLW       1
	MOVWF       USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,127 :: 		LCD_1Row_Write("Read Error"); Delay_ms(1000);
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
L_USB_Mode41:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode41
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode41
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode41
	NOP
	NOP
;lcddisplay.c,128 :: 		break;
	GOTO        L_USB_Mode27
;lcddisplay.c,129 :: 		}
L_USB_Mode40:
;lcddisplay.c,114 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        USB_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,130 :: 		}
	GOTO        L_USB_Mode26
L_USB_Mode27:
;lcddisplay.c,108 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	INCF        USB_Mode_page_L0+0, 1 
;lcddisplay.c,131 :: 		}
	GOTO        L_USB_Mode22
L_USB_Mode23:
;lcddisplay.c,133 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,134 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,135 :: 		writebuff[1] = 3;
	MOVLW       3
	MOVWF       1345 
;lcddisplay.c,136 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode42:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode43
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
	GOTO        L_USB_Mode43
L__USB_Mode130:
	GOTO        L_USB_Mode42
L_USB_Mode43:
;lcddisplay.c,137 :: 		if (is_read_broken == 0) {
	MOVF        USB_Mode_is_read_broken_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode46
;lcddisplay.c,138 :: 		LCD_1Row_Write("Entries Sent"); Delay_ms(1000);
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
L_USB_Mode47:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode47
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode47
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode47
	NOP
	NOP
;lcddisplay.c,139 :: 		} else {
	GOTO        L_USB_Mode48
L_USB_Mode46:
;lcddisplay.c,140 :: 		LCD_1Row_Write("Read Error"); Delay_ms(1000);
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
L_USB_Mode49:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode49
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode49
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode49
	NOP
	NOP
;lcddisplay.c,141 :: 		is_read_broken = 0;
	CLRF        USB_Mode_is_read_broken_L0+0 
;lcddisplay.c,142 :: 		}
L_USB_Mode48:
;lcddisplay.c,143 :: 		} else if ((int)readbuff[0] == 7) {
	GOTO        L_USB_Mode50
L_USB_Mode21:
	MOVF        1280, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode150
	MOVLW       7
	XORWF       R1, 0 
L__USB_Mode150:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode51
;lcddisplay.c,144 :: 		end_of_signal = 0;
	CLRF        USB_Mode_end_of_signal_L0+0 
;lcddisplay.c,145 :: 		EEPROM_Write(0x00, readbuff[1] + 1);
	CLRF        FARG_EEPROM_Write_address+0 
	MOVF        1281, 0 
	ADDLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;lcddisplay.c,146 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	CLRF        USB_Mode_page_L0+0 
L_USB_Mode52:
	MOVLW       8
	SUBWF       USB_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode53
;lcddisplay.c,147 :: 		if (is_write_broken == 1) {
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode55
;lcddisplay.c,148 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,149 :: 		break;
	GOTO        L_USB_Mode53
;lcddisplay.c,150 :: 		}
L_USB_Mode55:
;lcddisplay.c,152 :: 		if (end_of_signal == 1) {
	MOVF        USB_Mode_end_of_signal_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode56
;lcddisplay.c,153 :: 		break;
	GOTO        L_USB_Mode53
;lcddisplay.c,154 :: 		}
L_USB_Mode56:
;lcddisplay.c,156 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        USB_Mode_address_L0+0 
;lcddisplay.c,157 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        USB_Mode_entry_on_page_L0+0 
L_USB_Mode57:
	MOVLW       12
	SUBWF       USB_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode58
;lcddisplay.c,159 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,160 :: 		writebuff[0] = 0; // 0 start
	CLRF        1344 
;lcddisplay.c,161 :: 		writebuff[1] = 6; // command code
	MOVLW       6
	MOVWF       1345 
;lcddisplay.c,162 :: 		writebuff[2] = page; // page
	MOVF        USB_Mode_page_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,164 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        USB_Mode_address_count_L0+0 
L_USB_Mode60:
	MOVLW       21
	SUBWF       USB_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode61
;lcddisplay.c,166 :: 		I2C_Write_Byte_To_EEPROM(mempages_write[page], address, readbuff[address_count+2]);
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
;lcddisplay.c,167 :: 		writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
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
;lcddisplay.c,168 :: 		address++;
	INCF        USB_Mode_address_L0+0, 1 
;lcddisplay.c,164 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        USB_Mode_address_count_L0+0, 1 
;lcddisplay.c,170 :: 		}
	GOTO        L_USB_Mode60
L_USB_Mode61:
;lcddisplay.c,172 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode63:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
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
	GOTO        L__USB_Mode151
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode151:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode64
L__USB_Mode129:
	GOTO        L_USB_Mode63
L_USB_Mode64:
;lcddisplay.c,173 :: 		while(!HID_Read() && GetOpMode() == USB_TEST);		// wait for respsonse to continue
L_USB_Mode67:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode68
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode152
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode152:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode68
L__USB_Mode128:
	GOTO        L_USB_Mode67
L_USB_Mode68:
;lcddisplay.c,174 :: 		if (!(readbuff[0] == 4)) {
	MOVF        1280, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode71
;lcddisplay.c,175 :: 		is_write_broken = 1;
	MOVLW       1
	MOVWF       USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,176 :: 		LCD_1Row_Write("Write Error"); Delay_ms(1000);
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
L_USB_Mode72:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode72
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode72
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode72
	NOP
	NOP
;lcddisplay.c,177 :: 		break;
	GOTO        L_USB_Mode58
;lcddisplay.c,178 :: 		}
L_USB_Mode71:
;lcddisplay.c,181 :: 		if ((int)readbuff[2] == 0) {
	MOVF        1282, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode153
	MOVLW       0
	XORWF       R1, 0 
L__USB_Mode153:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode73
;lcddisplay.c,182 :: 		end_of_signal = 1;
	MOVLW       1
	MOVWF       USB_Mode_end_of_signal_L0+0 
;lcddisplay.c,183 :: 		break;
	GOTO        L_USB_Mode58
;lcddisplay.c,184 :: 		}
L_USB_Mode73:
;lcddisplay.c,157 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        USB_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,185 :: 		}
	GOTO        L_USB_Mode57
L_USB_Mode58:
;lcddisplay.c,146 :: 		for (page=0; page<EEPROM_MEMORY_BANKS; page++){
	INCF        USB_Mode_page_L0+0, 1 
;lcddisplay.c,186 :: 		}
	GOTO        L_USB_Mode52
L_USB_Mode53:
;lcddisplay.c,188 :: 		USB_Buffer_Clear();
	CALL        _USB_Buffer_Clear+0, 0
;lcddisplay.c,189 :: 		writebuff[0] = 0;
	CLRF        1344 
;lcddisplay.c,190 :: 		writebuff[1] = 5;
	MOVLW       5
	MOVWF       1345 
;lcddisplay.c,191 :: 		writebuff[2] = is_write_broken;
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	MOVWF       1346 
;lcddisplay.c,192 :: 		while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
L_USB_Mode74:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode75
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode154
	MOVLW       50
	XORWF       R0, 0 
L__USB_Mode154:
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode75
L__USB_Mode127:
	GOTO        L_USB_Mode74
L_USB_Mode75:
;lcddisplay.c,193 :: 		if (is_write_broken == 0) {
	MOVF        USB_Mode_is_write_broken_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode78
;lcddisplay.c,194 :: 		LCD_1Row_Write("Entries Written"); Delay_ms(1000);
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
L_USB_Mode79:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode79
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode79
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode79
	NOP
	NOP
;lcddisplay.c,195 :: 		} else {
	GOTO        L_USB_Mode80
L_USB_Mode78:
;lcddisplay.c,196 :: 		LCD_1Row_Write("Write Error"); Delay_ms(1000);
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
L_USB_Mode81:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode81
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode81
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode81
	NOP
	NOP
;lcddisplay.c,197 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,198 :: 		}
L_USB_Mode80:
;lcddisplay.c,200 :: 		if (end_of_signal == 1) {
	MOVF        USB_Mode_end_of_signal_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode82
;lcddisplay.c,201 :: 		LCD_1Row_Write("End of Signal"); Delay_ms(1000);
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
L_USB_Mode83:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode83
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode83
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode83
	NOP
	NOP
;lcddisplay.c,202 :: 		is_write_broken = 0;
	CLRF        USB_Mode_is_write_broken_L0+0 
;lcddisplay.c,203 :: 		}
L_USB_Mode82:
;lcddisplay.c,204 :: 		} else {
	GOTO        L_USB_Mode84
L_USB_Mode51:
;lcddisplay.c,205 :: 		TestUSBInput(str_usbDiagnostics);
	MOVLW       USB_Mode_str_usbDiagnostics_L0+0
	MOVWF       FARG_TestUSBInput_output_string+0 
	MOVLW       hi_addr(USB_Mode_str_usbDiagnostics_L0+0)
	MOVWF       FARG_TestUSBInput_output_string+1 
	CALL        _TestUSBInput+0, 0
;lcddisplay.c,206 :: 		LCD_2Row_Write("No Operation", str_usbDiagnostics); Delay_ms(1000);
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
L_USB_Mode85:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode85
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode85
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode85
	NOP
	NOP
;lcddisplay.c,207 :: 		}
L_USB_Mode84:
L_USB_Mode50:
L_USB_Mode20:
;lcddisplay.c,208 :: 		}
	GOTO        L_USB_Mode7
L_USB_Mode8:
;lcddisplay.c,210 :: 		HID_Disable();
	CALL        _HID_Disable+0, 0
;lcddisplay.c,211 :: 		LCD_1Row_Write("USB MODE EXITED");
	MOVLW       ?lstr19_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr19_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,212 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_USB_Mode86:
	DECFSZ      R13, 1, 1
	BRA         L_USB_Mode86
	DECFSZ      R12, 1, 1
	BRA         L_USB_Mode86
	DECFSZ      R11, 1, 1
	BRA         L_USB_Mode86
	NOP
	NOP
;lcddisplay.c,213 :: 		}
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
L_USB_Buffer_Clear87:
	MOVLW       128
	XORWF       USB_Buffer_Clear_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Buffer_Clear156
	MOVLW       64
	SUBWF       USB_Buffer_Clear_i_L0+0, 0 
L__USB_Buffer_Clear156:
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Buffer_Clear88
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
	GOTO        L_USB_Buffer_Clear87
L_USB_Buffer_Clear88:
;lcddisplay.c,220 :: 		}
L_end_USB_Buffer_Clear:
	RETURN      0
; end of _USB_Buffer_Clear

_USB_Buffer_Time:

;lcddisplay.c,222 :: 		void USB_Buffer_Time() {
;lcddisplay.c,224 :: 		Write_Time(readbuff[7], readbuff[1], readbuff[2], readbuff[3], readbuff[4], readbuff[5], readbuff[6]);
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
;lcddisplay.c,242 :: 		unsigned char page, entry_on_page, address_count, address, number_of_entries_read = 0, entry[21];
	CLRF        TIME_Mode_number_of_entries_read_L0+0 
	CLRF        TIME_Mode_redisplay_lag_L0+0 
;lcddisplay.c,249 :: 		init_core(); // Initialize Program
	CALL        _init_core+0, 0
;lcddisplay.c,250 :: 		I2C1_Init(100000); // Initialize IC2 for both EEPROM and RTC
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,253 :: 		while (GetOpMode() == I2C_RTC_TEST) {
L_TIME_Mode90:
	CALL        _GetOpMode+0, 0
	MOVLW       0
	BTFSC       R0, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__TIME_Mode159
	MOVLW       51
	XORWF       R0, 0 
L__TIME_Mode159:
	BTFSS       STATUS+0, 2 
	GOTO        L_TIME_Mode91
;lcddisplay.c,255 :: 		numberofentries = EEPROM_Read(0x00); Delay_ms(20);
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
L_TIME_Mode92:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode92
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode92
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode92
;lcddisplay.c,257 :: 		while (numberofentries > 95) {
L_TIME_Mode93:
	MOVF        _numberofentries+0, 0 
	SUBLW       95
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode94
;lcddisplay.c,258 :: 		GetTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_GetTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_GetTimeStruct_time+1 
	CALL        _GetTimeStruct+0, 0
;lcddisplay.c,259 :: 		DisplayTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_DisplayTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_DisplayTimeStruct_time+1 
	CALL        _DisplayTimeStruct+0, 0
;lcddisplay.c,260 :: 		Delay_ms(250);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_TIME_Mode95:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode95
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode95
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode95
	NOP
	NOP
;lcddisplay.c,261 :: 		}
	GOTO        L_TIME_Mode93
L_TIME_Mode94:
;lcddisplay.c,263 :: 		for ( page=0; page<EEPROM_MEMORY_BANKS; page++ ){
	CLRF        TIME_Mode_page_L0+0 
L_TIME_Mode96:
	MOVLW       8
	SUBWF       TIME_Mode_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode97
;lcddisplay.c,264 :: 		if (number_of_entries_read >= numberofentries) break;
	MOVF        _numberofentries+0, 0 
	SUBWF       TIME_Mode_number_of_entries_read_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_TIME_Mode99
	GOTO        L_TIME_Mode97
L_TIME_Mode99:
;lcddisplay.c,265 :: 		address=0; // re initialize address to 0 because this is a new page.
	CLRF        TIME_Mode_address_L0+0 
;lcddisplay.c,266 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	CLRF        TIME_Mode_entry_on_page_L0+0 
L_TIME_Mode100:
	MOVLW       12
	SUBWF       TIME_Mode_entry_on_page_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode101
;lcddisplay.c,267 :: 		if (number_of_entries_read >= numberofentries) break;
	MOVF        _numberofentries+0, 0 
	SUBWF       TIME_Mode_number_of_entries_read_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_TIME_Mode103
	GOTO        L_TIME_Mode101
L_TIME_Mode103:
;lcddisplay.c,270 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	CLRF        TIME_Mode_address_count_L0+0 
L_TIME_Mode104:
	MOVLW       21
	SUBWF       TIME_Mode_address_count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode105
;lcddisplay.c,271 :: 		entry[address_count] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
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
;lcddisplay.c,272 :: 		address++;
	INCF        TIME_Mode_address_L0+0, 1 
;lcddisplay.c,270 :: 		for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
	INCF        TIME_Mode_address_count_L0+0, 1 
;lcddisplay.c,281 :: 		}
	GOTO        L_TIME_Mode104
L_TIME_Mode105:
;lcddisplay.c,284 :: 		GetTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_GetTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_GetTimeStruct_time+1 
	CALL        _GetTimeStruct+0, 0
;lcddisplay.c,285 :: 		LATD7_bit = LATD7_bit;
;lcddisplay.c,286 :: 		if (redisplay_lag > 3) {
	MOVF        TIME_Mode_redisplay_lag_L0+0, 0 
	SUBLW       3
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode107
;lcddisplay.c,287 :: 		DisplayTimeStruct(&t);
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_DisplayTimeStruct_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_DisplayTimeStruct_time+1 
	CALL        _DisplayTimeStruct+0, 0
;lcddisplay.c,288 :: 		redisplay_lag = 0;
	CLRF        TIME_Mode_redisplay_lag_L0+0 
;lcddisplay.c,289 :: 		}
L_TIME_Mode107:
;lcddisplay.c,291 :: 		redisplay_lag++;
	INCF        TIME_Mode_redisplay_lag_L0+0, 1 
;lcddisplay.c,294 :: 		GetEntry(&entry, &ts);
	MOVLW       TIME_Mode_entry_L0+0
	MOVWF       FARG_GetEntry_entry+0 
	MOVLW       hi_addr(TIME_Mode_entry_L0+0)
	MOVWF       FARG_GetEntry_entry+1 
	MOVLW       TIME_Mode_ts_L0+0
	MOVWF       FARG_GetEntry_entry_s+0 
	MOVLW       hi_addr(TIME_Mode_ts_L0+0)
	MOVWF       FARG_GetEntry_entry_s+1 
	CALL        _GetEntry+0, 0
;lcddisplay.c,295 :: 		ActivateEntry(&ts, &t);
	MOVLW       TIME_Mode_ts_L0+0
	MOVWF       FARG_ActivateEntry_entry+0 
	MOVLW       hi_addr(TIME_Mode_ts_L0+0)
	MOVWF       FARG_ActivateEntry_entry+1 
	MOVLW       TIME_Mode_t_L0+0
	MOVWF       FARG_ActivateEntry_time+0 
	MOVLW       hi_addr(TIME_Mode_t_L0+0)
	MOVWF       FARG_ActivateEntry_time+1 
	CALL        _ActivateEntry+0, 0
;lcddisplay.c,303 :: 		number_of_entries_read++;
	INCF        TIME_Mode_number_of_entries_read_L0+0, 1 
;lcddisplay.c,266 :: 		for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
	INCF        TIME_Mode_entry_on_page_L0+0, 1 
;lcddisplay.c,304 :: 		}
	GOTO        L_TIME_Mode100
L_TIME_Mode101:
;lcddisplay.c,263 :: 		for ( page=0; page<EEPROM_MEMORY_BANKS; page++ ){
	INCF        TIME_Mode_page_L0+0, 1 
;lcddisplay.c,305 :: 		}
	GOTO        L_TIME_Mode96
L_TIME_Mode97:
;lcddisplay.c,307 :: 		number_of_entries_read = 0;
	CLRF        TIME_Mode_number_of_entries_read_L0+0 
;lcddisplay.c,308 :: 		}
	GOTO        L_TIME_Mode90
L_TIME_Mode91:
;lcddisplay.c,310 :: 		LCD_1Row_Write("TIME MODE EXITED"); Delay_ms(2000);
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
L_TIME_Mode108:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode108
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode108
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode108
	NOP
	NOP
;lcddisplay.c,311 :: 		}
L_end_TIME_Mode:
	RETURN      0
; end of _TIME_Mode

_I2C_Read_Byte_From_EEPROM:

;lcddisplay.c,313 :: 		unsigned char I2C_Read_Byte_From_EEPROM(unsigned char page_write, unsigned char page_read, unsigned char address) {
;lcddisplay.c,315 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,316 :: 		I2C1_Start();	      // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,317 :: 		I2C1_Wr(page_write);	     // send byte via I2C  (device address + W)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_page_write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,318 :: 		I2C1_Wr(address);	     // send byte (data address)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,319 :: 		I2C1_Repeated_Start();     // issue I2C signal repeated start
	CALL        _I2C1_Repeated_Start+0, 0
;lcddisplay.c,320 :: 		I2C1_Wr(page_read);	     // send byte (device address + R)
	MOVF        FARG_I2C_Read_Byte_From_EEPROM_page_read+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,321 :: 		x = I2C1_Rd(0);       // Read the data (NO acknowledge)
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       I2C_Read_Byte_From_EEPROM_x_L0+0 
;lcddisplay.c,322 :: 		I2C1_Stop();	       // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,323 :: 		return x;
	MOVF        I2C_Read_Byte_From_EEPROM_x_L0+0, 0 
	MOVWF       R0 
	GOTO        L_end_I2C_Read_Byte_From_EEPROM
;lcddisplay.c,324 :: 		Delay_ms(20);
L_I2C_Read_Byte_From_EEPROM109:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM109
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM109
	DECFSZ      R11, 1, 1
	BRA         L_I2C_Read_Byte_From_EEPROM109
;lcddisplay.c,325 :: 		}
L_end_I2C_Read_Byte_From_EEPROM:
	RETURN      0
; end of _I2C_Read_Byte_From_EEPROM

_I2C_Write_Byte_To_EEPROM:

;lcddisplay.c,327 :: 		void I2C_Write_Byte_To_EEPROM(unsigned char page_write, unsigned char address, unsigned char byte2write) {
;lcddisplay.c,328 :: 		I2C1_Init(100000);	 // initialize I2C communication
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,329 :: 		I2C1_Start();	      // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;lcddisplay.c,330 :: 		I2C1_Wr(page_write);	     // send byte via I2C  (device address + W)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_page_write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,331 :: 		I2C1_Wr(address);	     // send byte (address of EEPROM location)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,332 :: 		I2C1_Wr(byte2write);	     // send data (data to be written)
	MOVF        FARG_I2C_Write_Byte_To_EEPROM_byte2write+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lcddisplay.c,333 :: 		I2C1_Stop();	// issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;lcddisplay.c,334 :: 		Delay_ms(20);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_I2C_Write_Byte_To_EEPROM110:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM110
	DECFSZ      R12, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM110
	DECFSZ      R11, 1, 1
	BRA         L_I2C_Write_Byte_To_EEPROM110
;lcddisplay.c,335 :: 		}
L_end_I2C_Write_Byte_To_EEPROM:
	RETURN      0
; end of _I2C_Write_Byte_To_EEPROM

_GetOpMode:

;lcddisplay.c,337 :: 		short GetOpMode() {
;lcddisplay.c,338 :: 		if (RA0_bit && !RA1_bit) {
	BTFSS       RA0_bit+0, 0 
	GOTO        L_GetOpMode113
	BTFSC       RA1_bit+0, 1 
	GOTO        L_GetOpMode113
L__GetOpMode136:
;lcddisplay.c,339 :: 		opstate = USB_TEST;
	MOVLW       50
	MOVWF       _opstate+0 
;lcddisplay.c,340 :: 		} else if ( !RA0_bit && RA1_bit) {
	GOTO        L_GetOpMode114
L_GetOpMode113:
	BTFSC       RA0_bit+0, 0 
	GOTO        L_GetOpMode117
	BTFSS       RA1_bit+0, 1 
	GOTO        L_GetOpMode117
L__GetOpMode135:
;lcddisplay.c,341 :: 		opstate = I2C_RTC_TEST;
	MOVLW       51
	MOVWF       _opstate+0 
;lcddisplay.c,342 :: 		}
L_GetOpMode117:
L_GetOpMode114:
;lcddisplay.c,344 :: 		return opstate;
	MOVF        _opstate+0, 0 
	MOVWF       R0 
;lcddisplay.c,345 :: 		}
L_end_GetOpMode:
	RETURN      0
; end of _GetOpMode

_main:

;lcddisplay.c,347 :: 		void main() {
;lcddisplay.c,349 :: 		init_main();
	CALL        _init_main+0, 0
;lcddisplay.c,350 :: 		while (1) {
L_main118:
;lcddisplay.c,351 :: 		GetOpMode();
	CALL        _GetOpMode+0, 0
;lcddisplay.c,352 :: 		switch (opstate) {
	GOTO        L_main120
;lcddisplay.c,353 :: 		case USB_TEST:
L_main122:
;lcddisplay.c,354 :: 		LCD_1Row_Write("USB Mode");
	MOVLW       ?lstr21_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr21_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,355 :: 		USB_Mode();
	CALL        _USB_Mode+0, 0
;lcddisplay.c,356 :: 		break;
	GOTO        L_main121
;lcddisplay.c,357 :: 		case I2C_RTC_TEST:
L_main123:
;lcddisplay.c,358 :: 		LCD_1Row_Write("I2C RTC Mode");
	MOVLW       ?lstr22_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr22_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,359 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,360 :: 		Delay_ms(200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main124:
	DECFSZ      R13, 1, 1
	BRA         L_main124
	DECFSZ      R12, 1, 1
	BRA         L_main124
	DECFSZ      R11, 1, 1
	BRA         L_main124
	NOP
	NOP
;lcddisplay.c,361 :: 		TIME_Mode();
	CALL        _TIME_Mode+0, 0
;lcddisplay.c,362 :: 		break;
	GOTO        L_main121
;lcddisplay.c,363 :: 		default:
L_main125:
;lcddisplay.c,364 :: 		LCD_2Row_Write("Select Mode", "USB or RTC");
	MOVLW       ?lstr23_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr23_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr24_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr24_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
;lcddisplay.c,365 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main126:
	DECFSZ      R13, 1, 1
	BRA         L_main126
	DECFSZ      R12, 1, 1
	BRA         L_main126
	DECFSZ      R11, 1, 1
	BRA         L_main126
	NOP
	NOP
;lcddisplay.c,366 :: 		break;
	GOTO        L_main121
;lcddisplay.c,367 :: 		}
L_main120:
	MOVF        _opstate+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_main122
	MOVF        _opstate+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_main123
	GOTO        L_main125
L_main121:
;lcddisplay.c,368 :: 		}
	GOTO        L_main118
;lcddisplay.c,369 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_TestUSBInput:

;lcddisplay.c,371 :: 		void TestUSBInput(char *output_string) {
;lcddisplay.c,373 :: 		ShortToStr(readbuff[0], buff_diag_d);
	MOVF        1280, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_d_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_d_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,374 :: 		ShortToStr(readbuff[1], buff_diag_a);
	MOVF        1281, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_a_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_a_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,375 :: 		ShortToStr(readbuff[2], buff_diag_b);
	MOVF        1282, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       TestUSBInput_buff_diag_b_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_b_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;lcddisplay.c,376 :: 		strcpy(output_string, "");
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr25_lcddisplay+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr25_lcddisplay+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;lcddisplay.c,377 :: 		strcat(output_string, buff_diag_d);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_d_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_d_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,378 :: 		strcat(output_string, buff_diag_a);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_a_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_a_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,379 :: 		strcat(output_string, buff_diag_b);
	MOVF        FARG_TestUSBInput_output_string+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_TestUSBInput_output_string+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       TestUSBInput_buff_diag_b_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(TestUSBInput_buff_diag_b_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;lcddisplay.c,380 :: 		}
L_end_TestUSBInput:
	RETURN      0
; end of _TestUSBInput
