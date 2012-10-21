#ifndef _COREMULTIMEDIACARD_H
#define _COREMULTIMEDIACARD_H

void UART1_Write_Line(char *uart_text);
void M_Create_New_File();
void M_Create_Multiple_Files();
void M_Open_File_Rewrite();
void M_Open_File_Append();
void M_Open_File_Read();
void M_Delete_File();
void M_Test_File_Exist();
void M_Create_Swap_File();
void M_Test_Begin();
void M_Test_Routine();
int M_Test_Verify();
void LCD_Write_Line(char *uart_text);
#endif