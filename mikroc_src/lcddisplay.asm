
_interrupt:

;lcddisplay.c,18 :: 		void interrupt(){
;lcddisplay.c,19 :: 		USB_Interrupt_Proc(); // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;lcddisplay.c,20 :: 		}
L_end_interrupt:
L__interrupt33:
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
;lcddisplay.c,41 :: 		}
L_end_init_core:
	RETURN      0
; end of _init_core

_init_main:

;lcddisplay.c,43 :: 		void init_main() {
;lcddisplay.c,44 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,45 :: 		Lcd_Init(); // Initialize LCD
	CALL        _Lcd_Init+0, 0
;lcddisplay.c,46 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear LCD display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,47 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,48 :: 		Lcd_Out(1, 1, "Hardware Cron");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_lcddisplay+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_lcddisplay+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcddisplay.c,49 :: 		Delay_ms(1000);
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
;lcddisplay.c,50 :: 		}
L_end_init_main:
	RETURN      0
; end of _init_main

_GetOperationMode:

;lcddisplay.c,52 :: 		void GetOperationMode() {
;lcddisplay.c,53 :: 		LCD_2Row_Write("Choose mode of", "Operation:");
	MOVLW       ?lstr2_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr2_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr3_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr3_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
;lcddisplay.c,54 :: 		opstate = Keypad_Get_Key();
	CALL        _Keypad_Get_Key+0, 0
	MOVF        R0, 0 
	MOVWF       _opstate+0 
;lcddisplay.c,55 :: 		}
L_end_GetOperationMode:
	RETURN      0
; end of _GetOperationMode

_USB_Mode:

;lcddisplay.c,57 :: 		void USB_Mode() {
;lcddisplay.c,60 :: 		unsigned short x = 0;
	CLRF        USB_Mode_x_L0+0 
;lcddisplay.c,63 :: 		for(cnt=0;cnt<64;cnt++) {
	CLRF        _cnt+0 
L_USB_Mode1:
	MOVLW       64
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode2
;lcddisplay.c,64 :: 		writebuff[cnt] = 0;
	MOVLW       USB_Mode_writebuff_L0+0
	MOVWF       FSR1 
	MOVLW       hi_addr(USB_Mode_writebuff_L0+0)
	MOVWF       FSR1H 
	MOVF        _cnt+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	CLRF        POSTINC1+0 
;lcddisplay.c,63 :: 		for(cnt=0;cnt<64;cnt++) {
	INCF        _cnt+0, 1 
;lcddisplay.c,65 :: 		}
	GOTO        L_USB_Mode1
L_USB_Mode2:
;lcddisplay.c,66 :: 		HID_Enable(&readbuff,&writebuff);
	MOVLW       USB_Mode_readbuff_L0+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(USB_Mode_readbuff_L0+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       USB_Mode_writebuff_L0+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(USB_Mode_writebuff_L0+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;lcddisplay.c,68 :: 		while(x < 10){
L_USB_Mode4:
	MOVLW       10
	SUBWF       USB_Mode_x_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode5
;lcddisplay.c,69 :: 		while(!HID_Read())
L_USB_Mode6:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode7
;lcddisplay.c,70 :: 		;
	GOTO        L_USB_Mode6
L_USB_Mode7:
;lcddisplay.c,72 :: 		for(cnt=0;cnt<64;cnt++) {
	CLRF        _cnt+0 
L_USB_Mode8:
	MOVLW       64
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_USB_Mode9
;lcddisplay.c,73 :: 		writebuff[cnt]=readbuff[cnt];
	MOVLW       USB_Mode_writebuff_L0+0
	MOVWF       FSR1 
	MOVLW       hi_addr(USB_Mode_writebuff_L0+0)
	MOVWF       FSR1H 
	MOVF        _cnt+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       USB_Mode_readbuff_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(USB_Mode_readbuff_L0+0)
	MOVWF       FSR0H 
	MOVF        _cnt+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;lcddisplay.c,72 :: 		for(cnt=0;cnt<64;cnt++) {
	INCF        _cnt+0, 1 
;lcddisplay.c,74 :: 		}
	GOTO        L_USB_Mode8
L_USB_Mode9:
;lcddisplay.c,76 :: 		res = strstr(readbuff,txt_sub);
	MOVLW       USB_Mode_readbuff_L0+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(USB_Mode_readbuff_L0+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       _txt_sub+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(_txt_sub+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res+0 
	MOVF        R1, 0 
	MOVWF       _res+1 
;lcddisplay.c,77 :: 		if (res != 0) {
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__USB_Mode38
	MOVLW       0
	XORWF       R0, 0 
L__USB_Mode38:
	BTFSC       STATUS+0, 2 
	GOTO        L_USB_Mode11
;lcddisplay.c,78 :: 		if (x==0) {
	MOVF        USB_Mode_x_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode12
;lcddisplay.c,79 :: 		x=1;
	MOVLW       1
	MOVWF       USB_Mode_x_L0+0 
;lcddisplay.c,80 :: 		PORTB =0x00;
	CLRF        PORTB+0 
;lcddisplay.c,81 :: 		} else {
	GOTO        L_USB_Mode13
L_USB_Mode12:
;lcddisplay.c,82 :: 		x=0;
	CLRF        USB_Mode_x_L0+0 
;lcddisplay.c,83 :: 		PORTB =  0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;lcddisplay.c,84 :: 		}
L_USB_Mode13:
;lcddisplay.c,85 :: 		}
L_USB_Mode11:
;lcddisplay.c,87 :: 		while(!HID_Write(&writebuff,64))
L_USB_Mode14:
	MOVLW       USB_Mode_writebuff_L0+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(USB_Mode_writebuff_L0+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_USB_Mode15
;lcddisplay.c,88 :: 		;
	GOTO        L_USB_Mode14
L_USB_Mode15:
;lcddisplay.c,90 :: 		x++;
	INCF        USB_Mode_x_L0+0, 1 
;lcddisplay.c,91 :: 		}
	GOTO        L_USB_Mode4
L_USB_Mode5:
;lcddisplay.c,92 :: 		}
L_end_USB_Mode:
	RETURN      0
; end of _USB_Mode

_LCD_Mode:

;lcddisplay.c,94 :: 		void LCD_Mode() {
;lcddisplay.c,95 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear LCD display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,96 :: 		LCD_2Row_Write("Johannah Mae", "I   U");
	MOVLW       ?lstr4_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr4_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr5_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr5_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
;lcddisplay.c,97 :: 		LCD_Write_Heart(2, 3);
	MOVLW       2
	MOVWF       FARG_LCD_Write_Heart_pos_row+0 
	MOVLW       3
	MOVWF       FARG_LCD_Write_Heart_pos_char+0 
	CALL        _LCD_Write_Heart+0, 0
;lcddisplay.c,98 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,99 :: 		}
L_end_LCD_Mode:
	RETURN      0
; end of _LCD_Mode

_TIME_Mode:

;lcddisplay.c,101 :: 		void TIME_Mode() {
;lcddisplay.c,103 :: 		unsigned short x = 0;
	CLRF        TIME_Mode_x_L0+0 
;lcddisplay.c,105 :: 		init_core();
	CALL        _init_core+0, 0
;lcddisplay.c,106 :: 		I2C1_Init(100000); //
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;lcddisplay.c,108 :: 		while (x < 3) {
L_TIME_Mode16:
	MOVLW       3
	SUBWF       TIME_Mode_x_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_TIME_Mode17
;lcddisplay.c,109 :: 		TestStripeAllPins();
	CALL        _TestStripeAllPins+0, 0
;lcddisplay.c,110 :: 		Read_Time(&sec,&min1,&hr,&week_day,&day,&mn,&year);
	MOVLW       TIME_Mode_sec_L0+0
	MOVWF       FARG_Read_Time_sec+0 
	MOVLW       hi_addr(TIME_Mode_sec_L0+0)
	MOVWF       FARG_Read_Time_sec+1 
	MOVLW       TIME_Mode_min1_L0+0
	MOVWF       FARG_Read_Time_min+0 
	MOVLW       hi_addr(TIME_Mode_min1_L0+0)
	MOVWF       FARG_Read_Time_min+1 
	MOVLW       TIME_Mode_hr_L0+0
	MOVWF       FARG_Read_Time_hr+0 
	MOVLW       hi_addr(TIME_Mode_hr_L0+0)
	MOVWF       FARG_Read_Time_hr+1 
	MOVLW       TIME_Mode_week_day_L0+0
	MOVWF       FARG_Read_Time_week_day+0 
	MOVLW       hi_addr(TIME_Mode_week_day_L0+0)
	MOVWF       FARG_Read_Time_week_day+1 
	MOVLW       TIME_Mode_day_L0+0
	MOVWF       FARG_Read_Time_day+0 
	MOVLW       hi_addr(TIME_Mode_day_L0+0)
	MOVWF       FARG_Read_Time_day+1 
	MOVLW       TIME_Mode_mn_L0+0
	MOVWF       FARG_Read_Time_mn+0 
	MOVLW       hi_addr(TIME_Mode_mn_L0+0)
	MOVWF       FARG_Read_Time_mn+1 
	MOVLW       TIME_Mode_year_L0+0
	MOVWF       FARG_Read_Time_year+0 
	MOVLW       hi_addr(TIME_Mode_year_L0+0)
	MOVWF       FARG_Read_Time_year+1 
	CALL        _Read_Time+0, 0
;lcddisplay.c,111 :: 		Transform_Time(&sec,&min1,&hr,&week_day,&day,&mn,&year);
	MOVLW       TIME_Mode_sec_L0+0
	MOVWF       FARG_Transform_Time_sec+0 
	MOVLW       hi_addr(TIME_Mode_sec_L0+0)
	MOVWF       FARG_Transform_Time_sec+1 
	MOVLW       TIME_Mode_min1_L0+0
	MOVWF       FARG_Transform_Time_min+0 
	MOVLW       hi_addr(TIME_Mode_min1_L0+0)
	MOVWF       FARG_Transform_Time_min+1 
	MOVLW       TIME_Mode_hr_L0+0
	MOVWF       FARG_Transform_Time_hr+0 
	MOVLW       hi_addr(TIME_Mode_hr_L0+0)
	MOVWF       FARG_Transform_Time_hr+1 
	MOVLW       TIME_Mode_week_day_L0+0
	MOVWF       FARG_Transform_Time_week_day+0 
	MOVLW       hi_addr(TIME_Mode_week_day_L0+0)
	MOVWF       FARG_Transform_Time_week_day+1 
	MOVLW       TIME_Mode_day_L0+0
	MOVWF       FARG_Transform_Time_day+0 
	MOVLW       hi_addr(TIME_Mode_day_L0+0)
	MOVWF       FARG_Transform_Time_day+1 
	MOVLW       TIME_Mode_mn_L0+0
	MOVWF       FARG_Transform_Time_mn+0 
	MOVLW       hi_addr(TIME_Mode_mn_L0+0)
	MOVWF       FARG_Transform_Time_mn+1 
	MOVLW       TIME_Mode_year_L0+0
	MOVWF       FARG_Transform_Time_year+0 
	MOVLW       hi_addr(TIME_Mode_year_L0+0)
	MOVWF       FARG_Transform_Time_year+1 
	CALL        _Transform_Time+0, 0
;lcddisplay.c,113 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,114 :: 		Display_Time(sec, min1, hr, week_day, day, mn, year);
	MOVF        TIME_Mode_sec_L0+0, 0 
	MOVWF       FARG_Display_Time_sec+0 
	MOVF        TIME_Mode_min1_L0+0, 0 
	MOVWF       FARG_Display_Time_min+0 
	MOVF        TIME_Mode_hr_L0+0, 0 
	MOVWF       FARG_Display_Time_hr+0 
	MOVF        TIME_Mode_week_day_L0+0, 0 
	MOVWF       FARG_Display_Time_week_day+0 
	MOVF        TIME_Mode_day_L0+0, 0 
	MOVWF       FARG_Display_Time_day+0 
	MOVF        TIME_Mode_mn_L0+0, 0 
	MOVWF       FARG_Display_Time_mn+0 
	MOVF        TIME_Mode_year_L0+0, 0 
	MOVWF       FARG_Display_Time_year+0 
	CALL        _Display_Time+0, 0
;lcddisplay.c,115 :: 		Delay_ms(20);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_TIME_Mode18:
	DECFSZ      R13, 1, 1
	BRA         L_TIME_Mode18
	DECFSZ      R12, 1, 1
	BRA         L_TIME_Mode18
	DECFSZ      R11, 1, 1
	BRA         L_TIME_Mode18
;lcddisplay.c,120 :: 		x++;
	INCF        TIME_Mode_x_L0+0, 1 
;lcddisplay.c,121 :: 		}
	GOTO        L_TIME_Mode16
L_TIME_Mode17:
;lcddisplay.c,122 :: 		}
L_end_TIME_Mode:
	RETURN      0
; end of _TIME_Mode

_main:

;lcddisplay.c,124 :: 		void main() {
;lcddisplay.c,126 :: 		init_main();
	CALL        _init_main+0, 0
;lcddisplay.c,127 :: 		TestInitializeAllPins();
	CALL        _TestInitializeAllPins+0, 0
;lcddisplay.c,129 :: 		while (1) {
L_main19:
;lcddisplay.c,130 :: 		GetOperationMode();
	CALL        _GetOperationMode+0, 0
;lcddisplay.c,132 :: 		switch (opstate) {
	GOTO        L_main21
;lcddisplay.c,133 :: 		case KEYPAD_TEST:
L_main23:
;lcddisplay.c,134 :: 		LCD_1Row_Write("Keypad Mode");
	MOVLW       ?lstr6_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr6_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,135 :: 		KeypadTest_Begin();
	CALL        _KeypadTest_Begin+0, 0
;lcddisplay.c,136 :: 		break;
	GOTO        L_main22
;lcddisplay.c,137 :: 		case MMC_TEST:
L_main24:
;lcddisplay.c,138 :: 		LCD_1Row_Write("SPI MMC Mode");
	MOVLW       ?lstr7_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr7_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,139 :: 		M_Test_Begin();
	CALL        _M_Test_Begin+0, 0
;lcddisplay.c,140 :: 		break;
	GOTO        L_main22
;lcddisplay.c,141 :: 		case USB_TEST:
L_main25:
;lcddisplay.c,142 :: 		LCD_1Row_Write("USB Mode");
	MOVLW       ?lstr8_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr8_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,143 :: 		USB_Mode();
	CALL        _USB_Mode+0, 0
;lcddisplay.c,144 :: 		break;
	GOTO        L_main22
;lcddisplay.c,145 :: 		case I2C_RTC_TEST:
L_main26:
;lcddisplay.c,146 :: 		LCD_1Row_Write("I2C RTC Mode");
	MOVLW       ?lstr9_lcddisplay+0
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr9_lcddisplay+0)
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;lcddisplay.c,147 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcddisplay.c,148 :: 		Delay_ms(200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	DECFSZ      R11, 1, 1
	BRA         L_main27
	NOP
	NOP
;lcddisplay.c,149 :: 		TIME_Mode();
	CALL        _TIME_Mode+0, 0
;lcddisplay.c,150 :: 		break;
	GOTO        L_main22
;lcddisplay.c,151 :: 		case LCD_TEST:
L_main28:
;lcddisplay.c,152 :: 		LCD_Mode();
	CALL        _LCD_Mode+0, 0
;lcddisplay.c,153 :: 		Delay_ms(10000);
	MOVLW       3
	MOVWF       R10, 0
	MOVLW       97
	MOVWF       R11, 0
	MOVLW       195
	MOVWF       R12, 0
	MOVLW       142
	MOVWF       R13, 0
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	DECFSZ      R11, 1, 1
	BRA         L_main29
	DECFSZ      R10, 1, 1
	BRA         L_main29
	NOP
;lcddisplay.c,154 :: 		default:
L_main30:
;lcddisplay.c,155 :: 		LCD_2Row_Write("Operation Not", "Allowed");
	MOVLW       ?lstr10_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_a+0 
	MOVLW       hi_addr(?lstr10_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_a+1 
	MOVLW       ?lstr11_lcddisplay+0
	MOVWF       FARG_LCD_2Row_Write_textstring_b+0 
	MOVLW       hi_addr(?lstr11_lcddisplay+0)
	MOVWF       FARG_LCD_2Row_Write_textstring_b+1 
	CALL        _LCD_2Row_Write+0, 0
;lcddisplay.c,156 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	DECFSZ      R11, 1, 1
	BRA         L_main31
	NOP
	NOP
;lcddisplay.c,157 :: 		break;
	GOTO        L_main22
;lcddisplay.c,158 :: 		}
L_main21:
	MOVF        _opstate+0, 0 
	XORLW       52
	BTFSC       STATUS+0, 2 
	GOTO        L_main23
	MOVF        _opstate+0, 0 
	XORLW       53
	BTFSC       STATUS+0, 2 
	GOTO        L_main24
	MOVF        _opstate+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_main25
	MOVF        _opstate+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_main26
	MOVF        _opstate+0, 0 
	XORLW       49
	BTFSC       STATUS+0, 2 
	GOTO        L_main28
	GOTO        L_main30
L_main22:
;lcddisplay.c,159 :: 		}
	GOTO        L_main19
;lcddisplay.c,160 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
