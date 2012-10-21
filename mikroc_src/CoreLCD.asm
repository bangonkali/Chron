
_LCD_2Row_Write:

;CoreLCD.c,3 :: 		void LCD_2Row_Write(char *textstring_a, char *textstring_b) {
;CoreLCD.c,4 :: 		LCD_1Row_Write(textstring_a);
	MOVF        FARG_LCD_2Row_Write_textstring_a+0, 0 
	MOVWF       FARG_LCD_1Row_Write_textstring_a+0 
	MOVF        FARG_LCD_2Row_Write_textstring_a+1, 0 
	MOVWF       FARG_LCD_1Row_Write_textstring_a+1 
	CALL        _LCD_1Row_Write+0, 0
;CoreLCD.c,5 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CoreLCD.c,6 :: 		Lcd_Out_CP(textstring_b);
	MOVF        FARG_LCD_2Row_Write_textstring_b+0, 0 
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVF        FARG_LCD_2Row_Write_textstring_b+1, 0 
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;CoreLCD.c,7 :: 		}
L_end_LCD_2Row_Write:
	RETURN      0
; end of _LCD_2Row_Write

_LCD_1Row_Write:

;CoreLCD.c,9 :: 		void LCD_1Row_Write(char *textstring_a) {
;CoreLCD.c,10 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CoreLCD.c,11 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW       15
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CoreLCD.c,12 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CoreLCD.c,13 :: 		Lcd_Out_CP(textstring_a);
	MOVF        FARG_LCD_1Row_Write_textstring_a+0, 0 
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVF        FARG_LCD_1Row_Write_textstring_a+1, 0 
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;CoreLCD.c,14 :: 		}
L_end_LCD_1Row_Write:
	RETURN      0
; end of _LCD_1Row_Write

_LCD_Write_Heart:

;CoreLCD.c,16 :: 		void LCD_Write_Heart(char pos_row, char pos_char) {
;CoreLCD.c,19 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CoreLCD.c,20 :: 		for (i = 0; i<=7; i++)
	CLRF        LCD_Write_Heart_i_L0+0 
L_LCD_Write_Heart0:
	MOVF        LCD_Write_Heart_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_LCD_Write_Heart1
;CoreLCD.c,21 :: 		Lcd_Chr_CP(character_heart[i]);
	MOVLW       LCD_Write_Heart_character_heart_L0+0
	ADDWF       LCD_Write_Heart_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(LCD_Write_Heart_character_heart_L0+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(LCD_Write_Heart_character_heart_L0+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
;CoreLCD.c,20 :: 		for (i = 0; i<=7; i++)
	INCF        LCD_Write_Heart_i_L0+0, 1 
;CoreLCD.c,21 :: 		Lcd_Chr_CP(character_heart[i]);
	GOTO        L_LCD_Write_Heart0
L_LCD_Write_Heart1:
;CoreLCD.c,22 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CoreLCD.c,23 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF        FARG_LCD_Write_Heart_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_LCD_Write_Heart_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreLCD.c,24 :: 		}
L_end_LCD_Write_Heart:
	RETURN      0
; end of _LCD_Write_Heart
