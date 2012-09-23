#include "CoreLCD.h"

void LCD_2Row_Write(char *textstring_a, char *textstring_b) {
	LCD_1Row_Write(textstring_a);
	Lcd_Cmd(_LCD_SECOND_ROW);
	Lcd_Out_CP(textstring_b);
}

void LCD_1Row_Write(char *textstring_a) {
	Lcd_Cmd(_LCD_CLEAR);
	Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	Lcd_Cmd(_LCD_FIRST_ROW);
	Lcd_Out_CP(textstring_a);
}

void LCD_Write_Heart(char pos_row, char pos_char) {
	const char character_heart[] = {27,21,17,17,27,14,4,0};
	char i;
	Lcd_Cmd(64);
	for (i = 0; i<=7; i++) 
		Lcd_Chr_CP(character_heart[i]);
	Lcd_Cmd(_LCD_RETURN_HOME);
	Lcd_Chr(pos_row, pos_char, 0);
}