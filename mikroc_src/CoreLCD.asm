
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
