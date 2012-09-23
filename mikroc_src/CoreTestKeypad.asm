
_Keypad_Decode:

;CoreTestKeypad.c,3 :: 		void Keypad_Decode(unsigned char *kp) {
;CoreTestKeypad.c,4 :: 		switch (*kp) {
	GOTO        L_Keypad_Decode0
;CoreTestKeypad.c,5 :: 		case  1: *kp = 49; break; // 1        // Uncomment this block for keypad4x4
L_Keypad_Decode2:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       49
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,6 :: 		case  2: *kp = 50; break; // 2
L_Keypad_Decode3:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       50
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,7 :: 		case  3: *kp = 51; break; // 3
L_Keypad_Decode4:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       51
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,8 :: 		case  4: *kp = 47; break; // /
L_Keypad_Decode5:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       47
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,9 :: 		case  5: *kp = 52; break; // 4
L_Keypad_Decode6:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       52
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,10 :: 		case  6: *kp = 53; break; // 5
L_Keypad_Decode7:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       53
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,11 :: 		case  7: *kp = 54; break; // 6
L_Keypad_Decode8:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       54
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,12 :: 		case  8: *kp = 42; break; // *
L_Keypad_Decode9:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       42
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,13 :: 		case  9: *kp = 55; break; // 7
L_Keypad_Decode10:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       55
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,14 :: 		case 10: *kp = 56; break; // 8
L_Keypad_Decode11:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       56
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,15 :: 		case 11: *kp = 57; break; // 9
L_Keypad_Decode12:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       57
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,16 :: 		case 12: *kp = 65; break; // A
L_Keypad_Decode13:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       65
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,17 :: 		case 13: *kp = 32; break; // SPACE
L_Keypad_Decode14:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       32
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,18 :: 		case 14: *kp = 48; break; // 0
L_Keypad_Decode15:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       48
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,19 :: 		case 15: *kp = 45; break; // MINUS
L_Keypad_Decode16:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       45
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,20 :: 		case 16: *kp = 66; break; // B
L_Keypad_Decode17:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR1
	MOVFF       FARG_Keypad_Decode_kp+1, FSR1H
	MOVLW       66
	MOVWF       POSTINC1+0 
	GOTO        L_Keypad_Decode1
;CoreTestKeypad.c,21 :: 		}
L_Keypad_Decode0:
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode2
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode3
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode4
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode5
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode6
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode7
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode8
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode9
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode10
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode11
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode12
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode13
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode14
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode15
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode16
	MOVFF       FARG_Keypad_Decode_kp+0, FSR0
	MOVFF       FARG_Keypad_Decode_kp+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Decode17
L_Keypad_Decode1:
;CoreTestKeypad.c,22 :: 		}
L_end_Keypad_Decode:
	RETURN      0
; end of _Keypad_Decode

_Keypad_Get_Key:

;CoreTestKeypad.c,24 :: 		unsigned char Keypad_Get_Key(){
;CoreTestKeypad.c,25 :: 		unsigned char kp = 0; // Reset key code variable
	CLRF        Keypad_Get_Key_kp_L0+0 
;CoreTestKeypad.c,26 :: 		Keypad_Init();
	CALL        _Keypad_Init+0, 0
;CoreTestKeypad.c,29 :: 		do {
L_Keypad_Get_Key18:
;CoreTestKeypad.c,31 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       Keypad_Get_Key_kp_L0+0 
;CoreTestKeypad.c,32 :: 		} while (!kp);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Keypad_Get_Key18
;CoreTestKeypad.c,35 :: 		Keypad_Decode(&kp);
	MOVLW       Keypad_Get_Key_kp_L0+0
	MOVWF       FARG_Keypad_Decode_kp+0 
	MOVLW       hi_addr(Keypad_Get_Key_kp_L0+0)
	MOVWF       FARG_Keypad_Decode_kp+1 
	CALL        _Keypad_Decode+0, 0
;CoreTestKeypad.c,36 :: 		return kp;
	MOVF        Keypad_Get_Key_kp_L0+0, 0 
	MOVWF       R0 
;CoreTestKeypad.c,37 :: 		}
L_end_Keypad_Get_Key:
	RETURN      0
; end of _Keypad_Get_Key

_KeypadTest_Begin:

;CoreTestKeypad.c,39 :: 		void KeypadTest_Begin() {
;CoreTestKeypad.c,40 :: 		unsigned short kp, cnt, oldstate = 0;
	CLRF        KeypadTest_Begin_oldstate_L0+0 
;CoreTestKeypad.c,43 :: 		cnt = 0;                                 // Reset counter
	CLRF        KeypadTest_Begin_cnt_L0+0 
;CoreTestKeypad.c,45 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CoreTestKeypad.c,46 :: 		Lcd_Out(1, 1, "1");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_CoreTestKeypad+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_CoreTestKeypad+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CoreTestKeypad.c,47 :: 		Lcd_Out(1, 1, "Key  :");                 // Write message text on LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_CoreTestKeypad+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_CoreTestKeypad+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CoreTestKeypad.c,48 :: 		Lcd_Out(2, 1, "Times:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_CoreTestKeypad+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_CoreTestKeypad+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CoreTestKeypad.c,50 :: 		do {
L_KeypadTest_Begin21:
;CoreTestKeypad.c,51 :: 		kp = 0;                                // Reset key code variable
	CLRF        KeypadTest_Begin_kp_L0+0 
;CoreTestKeypad.c,54 :: 		do {
L_KeypadTest_Begin24:
;CoreTestKeypad.c,56 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       KeypadTest_Begin_kp_L0+0 
;CoreTestKeypad.c,57 :: 		} while (!kp);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_KeypadTest_Begin24
;CoreTestKeypad.c,60 :: 		Keypad_Decode(&kp);
	MOVLW       KeypadTest_Begin_kp_L0+0
	MOVWF       FARG_Keypad_Decode_kp+0 
	MOVLW       hi_addr(KeypadTest_Begin_kp_L0+0)
	MOVWF       FARG_Keypad_Decode_kp+1 
	CALL        _Keypad_Decode+0, 0
;CoreTestKeypad.c,62 :: 		if (kp != oldstate) {                  // Pressed key differs from previous
	MOVF        KeypadTest_Begin_kp_L0+0, 0 
	XORWF       KeypadTest_Begin_oldstate_L0+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_KeypadTest_Begin27
;CoreTestKeypad.c,63 :: 		cnt = 1;
	MOVLW       1
	MOVWF       KeypadTest_Begin_cnt_L0+0 
;CoreTestKeypad.c,64 :: 		oldstate = kp;
	MOVF        KeypadTest_Begin_kp_L0+0, 0 
	MOVWF       KeypadTest_Begin_oldstate_L0+0 
;CoreTestKeypad.c,65 :: 		} else {                                 // Pressed key is same as previous
	GOTO        L_KeypadTest_Begin28
L_KeypadTest_Begin27:
;CoreTestKeypad.c,66 :: 		cnt++;
	INCF        KeypadTest_Begin_cnt_L0+0, 1 
;CoreTestKeypad.c,67 :: 		}
L_KeypadTest_Begin28:
;CoreTestKeypad.c,69 :: 		Lcd_Chr(1, 10, kp);                    // Print key ASCII value on LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        KeypadTest_Begin_kp_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreTestKeypad.c,71 :: 		if (cnt == 255) {                      // If counter varialble overflow
	MOVF        KeypadTest_Begin_cnt_L0+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_KeypadTest_Begin29
;CoreTestKeypad.c,72 :: 		cnt = 0;
	CLRF        KeypadTest_Begin_cnt_L0+0 
;CoreTestKeypad.c,73 :: 		Lcd_Out(2, 10, "   ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_CoreTestKeypad+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_CoreTestKeypad+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CoreTestKeypad.c,74 :: 		}
L_KeypadTest_Begin29:
;CoreTestKeypad.c,76 :: 		WordToStr(cnt, txt);                   // Transform counter value to string
	MOVF        KeypadTest_Begin_cnt_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       KeypadTest_Begin_txt_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(KeypadTest_Begin_txt_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;CoreTestKeypad.c,77 :: 		Lcd_Out(2, 10, txt);                   // Display counter value on LCD
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       KeypadTest_Begin_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(KeypadTest_Begin_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CoreTestKeypad.c,78 :: 		} while (1);
	GOTO        L_KeypadTest_Begin21
;CoreTestKeypad.c,79 :: 		}
L_end_KeypadTest_Begin:
	RETURN      0
; end of _KeypadTest_Begin
