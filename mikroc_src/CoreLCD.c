#include <CoreLCD.h>

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