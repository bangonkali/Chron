
_LCD_Write_Line:

;CoreMultimediaCard.c,13 :: 		void LCD_Write_Line(char *uart_text) {
;CoreMultimediaCard.c,14 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CoreMultimediaCard.c,15 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW       15
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CoreMultimediaCard.c,16 :: 		Lcd_Out(1,1,uart_text);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_LCD_Write_Line_uart_text+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_LCD_Write_Line_uart_text+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CoreMultimediaCard.c,17 :: 		}
L_end_LCD_Write_Line:
	RETURN      0
; end of _LCD_Write_Line

_M_Create_New_File:

;CoreMultimediaCard.c,20 :: 		void M_Create_New_File() {
;CoreMultimediaCard.c,21 :: 		filename[7] = 'A';
	MOVLW       65
	MOVWF       _filename+7 
;CoreMultimediaCard.c,22 :: 		Mmc_Fat_Set_File_Date(2010, 4, 19, 9, 0, 0); // Set file date & time info
	MOVLW       218
	MOVWF       FARG_Mmc_Fat_Set_File_Date_year+0 
	MOVLW       7
	MOVWF       FARG_Mmc_Fat_Set_File_Date_year+1 
	MOVLW       4
	MOVWF       FARG_Mmc_Fat_Set_File_Date_month+0 
	MOVLW       19
	MOVWF       FARG_Mmc_Fat_Set_File_Date_day+0 
	MOVLW       9
	MOVWF       FARG_Mmc_Fat_Set_File_Date_hours+0 
	CLRF        FARG_Mmc_Fat_Set_File_Date_mins+0 
	CLRF        FARG_Mmc_Fat_Set_File_Date_seconds+0 
	CALL        _Mmc_Fat_Set_File_Date+0, 0
;CoreMultimediaCard.c,23 :: 		Mmc_Fat_Assign(&filename, 0xA0);          // Find existing file or create a new one
	MOVLW       _filename+0
	MOVWF       FARG_Mmc_Fat_Assign_name+0 
	MOVLW       hi_addr(_filename+0)
	MOVWF       FARG_Mmc_Fat_Assign_name+1 
	MOVLW       160
	MOVWF       FARG_Mmc_Fat_Assign_attrib+0 
	CALL        _Mmc_Fat_Assign+0, 0
;CoreMultimediaCard.c,24 :: 		Mmc_Fat_Rewrite();                        // To clear file and start with new data
	CALL        _Mmc_Fat_Rewrite+0, 0
;CoreMultimediaCard.c,25 :: 		for(mmc_loop = 1; mmc_loop <= 99; mmc_loop++) {
	MOVLW       1
	MOVWF       _mmc_loop+0 
L_M_Create_New_File0:
	MOVF        _mmc_loop+0, 0 
	SUBLW       99
	BTFSS       STATUS+0, 0 
	GOTO        L_M_Create_New_File1
;CoreMultimediaCard.c,27 :: 		file_contents[0] = mmc_loop / 10 + 48;
	MOVLW       10
	MOVWF       R4 
	MOVF        _mmc_loop+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       _file_contents+0 
;CoreMultimediaCard.c,28 :: 		file_contents[1] = mmc_loop % 10 + 48;
	MOVLW       10
	MOVWF       R4 
	MOVF        _mmc_loop+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       _file_contents+1 
;CoreMultimediaCard.c,29 :: 		Mmc_Fat_Write(file_contents, MMC_LINE_LEN-1);   // write data to the assigned file
	MOVLW       _file_contents+0
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVLW       hi_addr(_file_contents+0)
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	MOVLW       42
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVLW       0
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	CALL        _Mmc_Fat_Write+0, 0
;CoreMultimediaCard.c,25 :: 		for(mmc_loop = 1; mmc_loop <= 99; mmc_loop++) {
	INCF        _mmc_loop+0, 1 
;CoreMultimediaCard.c,30 :: 		}
	GOTO        L_M_Create_New_File0
L_M_Create_New_File1:
;CoreMultimediaCard.c,31 :: 		}
L_end_M_Create_New_File:
	RETURN      0
; end of _M_Create_New_File

_M_Create_Multiple_Files:

;CoreMultimediaCard.c,34 :: 		void M_Create_Multiple_Files() {
;CoreMultimediaCard.c,35 :: 		for(mmc_loop_b = 'B'; mmc_loop_b <= 'Z'; mmc_loop_b++) {
	MOVLW       66
	MOVWF       _mmc_loop_b+0 
L_M_Create_Multiple_Files3:
	MOVF        _mmc_loop_b+0, 0 
	SUBLW       90
	BTFSS       STATUS+0, 0 
	GOTO        L_M_Create_Multiple_Files4
;CoreMultimediaCard.c,37 :: 		filename[7] = mmc_loop_b;                 // set filename
	MOVF        _mmc_loop_b+0, 0 
	MOVWF       _filename+7 
;CoreMultimediaCard.c,38 :: 		Mmc_Fat_Set_File_Date(2010, 4, 19, 9, 0, 0); // Set file date & time info
	MOVLW       218
	MOVWF       FARG_Mmc_Fat_Set_File_Date_year+0 
	MOVLW       7
	MOVWF       FARG_Mmc_Fat_Set_File_Date_year+1 
	MOVLW       4
	MOVWF       FARG_Mmc_Fat_Set_File_Date_month+0 
	MOVLW       19
	MOVWF       FARG_Mmc_Fat_Set_File_Date_day+0 
	MOVLW       9
	MOVWF       FARG_Mmc_Fat_Set_File_Date_hours+0 
	CLRF        FARG_Mmc_Fat_Set_File_Date_mins+0 
	CLRF        FARG_Mmc_Fat_Set_File_Date_seconds+0 
	CALL        _Mmc_Fat_Set_File_Date+0, 0
;CoreMultimediaCard.c,39 :: 		Mmc_Fat_Assign(&filename, 0xA0);     // find existing file or create a new one
	MOVLW       _filename+0
	MOVWF       FARG_Mmc_Fat_Assign_name+0 
	MOVLW       hi_addr(_filename+0)
	MOVWF       FARG_Mmc_Fat_Assign_name+1 
	MOVLW       160
	MOVWF       FARG_Mmc_Fat_Assign_attrib+0 
	CALL        _Mmc_Fat_Assign+0, 0
;CoreMultimediaCard.c,40 :: 		Mmc_Fat_Rewrite();                   // To clear file and start with new data
	CALL        _Mmc_Fat_Rewrite+0, 0
;CoreMultimediaCard.c,41 :: 		for(mmc_loop = 1; mmc_loop <= 44; mmc_loop++) {
	MOVLW       1
	MOVWF       _mmc_loop+0 
L_M_Create_Multiple_Files6:
	MOVF        _mmc_loop+0, 0 
	SUBLW       44
	BTFSS       STATUS+0, 0 
	GOTO        L_M_Create_Multiple_Files7
;CoreMultimediaCard.c,42 :: 		file_contents[0] = mmc_loop / 10 + 48;
	MOVLW       10
	MOVWF       R4 
	MOVF        _mmc_loop+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       _file_contents+0 
;CoreMultimediaCard.c,43 :: 		file_contents[1] = mmc_loop % 10 + 48;
	MOVLW       10
	MOVWF       R4 
	MOVF        _mmc_loop+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       _file_contents+1 
;CoreMultimediaCard.c,44 :: 		Mmc_Fat_Write(file_contents, MMC_LINE_LEN-1);  // write data to the assigned file
	MOVLW       _file_contents+0
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVLW       hi_addr(_file_contents+0)
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	MOVLW       42
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVLW       0
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	CALL        _Mmc_Fat_Write+0, 0
;CoreMultimediaCard.c,41 :: 		for(mmc_loop = 1; mmc_loop <= 44; mmc_loop++) {
	INCF        _mmc_loop+0, 1 
;CoreMultimediaCard.c,45 :: 		}
	GOTO        L_M_Create_Multiple_Files6
L_M_Create_Multiple_Files7:
;CoreMultimediaCard.c,35 :: 		for(mmc_loop_b = 'B'; mmc_loop_b <= 'Z'; mmc_loop_b++) {
	INCF        _mmc_loop_b+0, 1 
;CoreMultimediaCard.c,46 :: 		}
	GOTO        L_M_Create_Multiple_Files3
L_M_Create_Multiple_Files4:
;CoreMultimediaCard.c,47 :: 		}
L_end_M_Create_Multiple_Files:
	RETURN      0
; end of _M_Create_Multiple_Files

_M_Open_File_Rewrite:

;CoreMultimediaCard.c,50 :: 		void M_Open_File_Rewrite() {
;CoreMultimediaCard.c,51 :: 		filename[7] = 'C';
	MOVLW       67
	MOVWF       _filename+7 
;CoreMultimediaCard.c,52 :: 		Mmc_Fat_Assign(&filename, 0);
	MOVLW       _filename+0
	MOVWF       FARG_Mmc_Fat_Assign_name+0 
	MOVLW       hi_addr(_filename+0)
	MOVWF       FARG_Mmc_Fat_Assign_name+1 
	CLRF        FARG_Mmc_Fat_Assign_attrib+0 
	CALL        _Mmc_Fat_Assign+0, 0
;CoreMultimediaCard.c,53 :: 		Mmc_Fat_Rewrite();
	CALL        _Mmc_Fat_Rewrite+0, 0
;CoreMultimediaCard.c,54 :: 		for(mmc_loop = 1; mmc_loop <= 55; mmc_loop++) {
	MOVLW       1
	MOVWF       _mmc_loop+0 
L_M_Open_File_Rewrite9:
	MOVF        _mmc_loop+0, 0 
	SUBLW       55
	BTFSS       STATUS+0, 0 
	GOTO        L_M_Open_File_Rewrite10
;CoreMultimediaCard.c,55 :: 		file_contents[0] = mmc_loop / 10 + 48;
	MOVLW       10
	MOVWF       R4 
	MOVF        _mmc_loop+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       _file_contents+0 
;CoreMultimediaCard.c,56 :: 		file_contents[1] = mmc_loop % 10 + 48;
	MOVLW       10
	MOVWF       R4 
	MOVF        _mmc_loop+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       _file_contents+1 
;CoreMultimediaCard.c,57 :: 		Mmc_Fat_Write(file_contents, MMC_LINE_LEN-1);    // write data to the assigned file
	MOVLW       _file_contents+0
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVLW       hi_addr(_file_contents+0)
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	MOVLW       42
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVLW       0
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	CALL        _Mmc_Fat_Write+0, 0
;CoreMultimediaCard.c,54 :: 		for(mmc_loop = 1; mmc_loop <= 55; mmc_loop++) {
	INCF        _mmc_loop+0, 1 
;CoreMultimediaCard.c,58 :: 		}
	GOTO        L_M_Open_File_Rewrite9
L_M_Open_File_Rewrite10:
;CoreMultimediaCard.c,59 :: 		}
L_end_M_Open_File_Rewrite:
	RETURN      0
; end of _M_Open_File_Rewrite

_M_Open_File_Append:

;CoreMultimediaCard.c,63 :: 		void M_Open_File_Append() {
;CoreMultimediaCard.c,64 :: 		filename[7] = 'B';
	MOVLW       66
	MOVWF       _filename+7 
;CoreMultimediaCard.c,65 :: 		Mmc_Fat_Assign(&filename, 0);
	MOVLW       _filename+0
	MOVWF       FARG_Mmc_Fat_Assign_name+0 
	MOVLW       hi_addr(_filename+0)
	MOVWF       FARG_Mmc_Fat_Assign_name+1 
	CLRF        FARG_Mmc_Fat_Assign_attrib+0 
	CALL        _Mmc_Fat_Assign+0, 0
;CoreMultimediaCard.c,66 :: 		Mmc_Fat_Set_File_Date(2010, 4, 19, 9, 20, 0);
	MOVLW       218
	MOVWF       FARG_Mmc_Fat_Set_File_Date_year+0 
	MOVLW       7
	MOVWF       FARG_Mmc_Fat_Set_File_Date_year+1 
	MOVLW       4
	MOVWF       FARG_Mmc_Fat_Set_File_Date_month+0 
	MOVLW       19
	MOVWF       FARG_Mmc_Fat_Set_File_Date_day+0 
	MOVLW       9
	MOVWF       FARG_Mmc_Fat_Set_File_Date_hours+0 
	MOVLW       20
	MOVWF       FARG_Mmc_Fat_Set_File_Date_mins+0 
	CLRF        FARG_Mmc_Fat_Set_File_Date_seconds+0 
	CALL        _Mmc_Fat_Set_File_Date+0, 0
;CoreMultimediaCard.c,67 :: 		Mmc_Fat_Append();                                    // Prepare file for append
	CALL        _Mmc_Fat_Append+0, 0
;CoreMultimediaCard.c,68 :: 		Mmc_Fat_Write(" for mikroElektronika 2010n", 27);   // Write data to assigned file
	MOVLW       ?lstr1_CoreMultimediaCard+0
	MOVWF       FARG_Mmc_Fat_Write_fdata+0 
	MOVLW       hi_addr(?lstr1_CoreMultimediaCard+0)
	MOVWF       FARG_Mmc_Fat_Write_fdata+1 
	MOVLW       27
	MOVWF       FARG_Mmc_Fat_Write_len+0 
	MOVLW       0
	MOVWF       FARG_Mmc_Fat_Write_len+1 
	CALL        _Mmc_Fat_Write+0, 0
;CoreMultimediaCard.c,69 :: 		}
L_end_M_Open_File_Append:
	RETURN      0
; end of _M_Open_File_Append

_M_Open_File_Read:

;CoreMultimediaCard.c,72 :: 		void M_Open_File_Read() {
;CoreMultimediaCard.c,75 :: 		filename[7] = 'B';
	MOVLW       66
	MOVWF       _filename+7 
;CoreMultimediaCard.c,76 :: 		Mmc_Fat_Assign(&filename, 0);
	MOVLW       _filename+0
	MOVWF       FARG_Mmc_Fat_Assign_name+0 
	MOVLW       hi_addr(_filename+0)
	MOVWF       FARG_Mmc_Fat_Assign_name+1 
	CLRF        FARG_Mmc_Fat_Assign_attrib+0 
	CALL        _Mmc_Fat_Assign+0, 0
;CoreMultimediaCard.c,77 :: 		Mmc_Fat_Reset(&mmc_size);            // To read file, procedure returns mmc_size of file
	MOVLW       _mmc_size+0
	MOVWF       FARG_Mmc_Fat_Reset_size+0 
	MOVLW       hi_addr(_mmc_size+0)
	MOVWF       FARG_Mmc_Fat_Reset_size+1 
	CALL        _Mmc_Fat_Reset+0, 0
;CoreMultimediaCard.c,78 :: 		for (mmc_iterator = 1; mmc_iterator <= mmc_size; mmc_iterator++) {
	MOVLW       1
	MOVWF       _mmc_iterator+0 
	MOVLW       0
	MOVWF       _mmc_iterator+1 
	MOVWF       _mmc_iterator+2 
	MOVWF       _mmc_iterator+3 
L_M_Open_File_Read12:
	MOVF        _mmc_iterator+3, 0 
	SUBWF       _mmc_size+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__M_Open_File_Read37
	MOVF        _mmc_iterator+2, 0 
	SUBWF       _mmc_size+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__M_Open_File_Read37
	MOVF        _mmc_iterator+1, 0 
	SUBWF       _mmc_size+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__M_Open_File_Read37
	MOVF        _mmc_iterator+0, 0 
	SUBWF       _mmc_size+0, 0 
L__M_Open_File_Read37:
	BTFSS       STATUS+0, 0 
	GOTO        L_M_Open_File_Read13
;CoreMultimediaCard.c,79 :: 		Mmc_Fat_Read(&character);
	MOVLW       M_Open_File_Read_character_L0+0
	MOVWF       FARG_Mmc_Fat_Read_fdata+0 
	MOVLW       hi_addr(M_Open_File_Read_character_L0+0)
	MOVWF       FARG_Mmc_Fat_Read_fdata+1 
	CALL        _Mmc_Fat_Read+0, 0
;CoreMultimediaCard.c,78 :: 		for (mmc_iterator = 1; mmc_iterator <= mmc_size; mmc_iterator++) {
	MOVLW       1
	ADDWF       _mmc_iterator+0, 1 
	MOVLW       0
	ADDWFC      _mmc_iterator+1, 1 
	ADDWFC      _mmc_iterator+2, 1 
	ADDWFC      _mmc_iterator+3, 1 
;CoreMultimediaCard.c,81 :: 		}
	GOTO        L_M_Open_File_Read12
L_M_Open_File_Read13:
;CoreMultimediaCard.c,82 :: 		}
L_end_M_Open_File_Read:
	RETURN      0
; end of _M_Open_File_Read

_M_Delete_File:

;CoreMultimediaCard.c,86 :: 		void M_Delete_File() {
;CoreMultimediaCard.c,87 :: 		filename[7] = 'F';
	MOVLW       70
	MOVWF       _filename+7 
;CoreMultimediaCard.c,88 :: 		Mmc_Fat_Assign(filename, 0);
	MOVLW       _filename+0
	MOVWF       FARG_Mmc_Fat_Assign_name+0 
	MOVLW       hi_addr(_filename+0)
	MOVWF       FARG_Mmc_Fat_Assign_name+1 
	CLRF        FARG_Mmc_Fat_Assign_attrib+0 
	CALL        _Mmc_Fat_Assign+0, 0
;CoreMultimediaCard.c,89 :: 		Mmc_Fat_Delete();
	CALL        _Mmc_Fat_Delete+0, 0
;CoreMultimediaCard.c,90 :: 		}
L_end_M_Delete_File:
	RETURN      0
; end of _M_Delete_File

_M_Test_File_Exist:

;CoreMultimediaCard.c,94 :: 		void M_Test_File_Exist() {
;CoreMultimediaCard.c,100 :: 		filename[7] = 'B';       //uncomment this line to search for file that DOES exists
	MOVLW       66
	MOVWF       _filename+7 
;CoreMultimediaCard.c,102 :: 		if (Mmc_Fat_Assign(filename, 0)) {
	MOVLW       _filename+0
	MOVWF       FARG_Mmc_Fat_Assign_name+0 
	MOVLW       hi_addr(_filename+0)
	MOVWF       FARG_Mmc_Fat_Assign_name+1 
	CLRF        FARG_Mmc_Fat_Assign_attrib+0 
	CALL        _Mmc_Fat_Assign+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_M_Test_File_Exist15
;CoreMultimediaCard.c,104 :: 		Mmc_Fat_Get_File_Date(&year, &month, &day, &hour, &minute);
	MOVLW       M_Test_File_Exist_year_L0+0
	MOVWF       FARG_Mmc_Fat_Get_File_Date_year+0 
	MOVLW       hi_addr(M_Test_File_Exist_year_L0+0)
	MOVWF       FARG_Mmc_Fat_Get_File_Date_year+1 
	MOVLW       M_Test_File_Exist_month_L0+0
	MOVWF       FARG_Mmc_Fat_Get_File_Date_month+0 
	MOVLW       hi_addr(M_Test_File_Exist_month_L0+0)
	MOVWF       FARG_Mmc_Fat_Get_File_Date_month+1 
	MOVLW       M_Test_File_Exist_day_L0+0
	MOVWF       FARG_Mmc_Fat_Get_File_Date_day+0 
	MOVLW       hi_addr(M_Test_File_Exist_day_L0+0)
	MOVWF       FARG_Mmc_Fat_Get_File_Date_day+1 
	MOVLW       M_Test_File_Exist_hour_L0+0
	MOVWF       FARG_Mmc_Fat_Get_File_Date_hours+0 
	MOVLW       hi_addr(M_Test_File_Exist_hour_L0+0)
	MOVWF       FARG_Mmc_Fat_Get_File_Date_hours+1 
	MOVLW       M_Test_File_Exist_minute_L0+0
	MOVWF       FARG_Mmc_Fat_Get_File_Date_mins+0 
	MOVLW       hi_addr(M_Test_File_Exist_minute_L0+0)
	MOVWF       FARG_Mmc_Fat_Get_File_Date_mins+1 
	CALL        _Mmc_Fat_Get_File_Date+0, 0
;CoreMultimediaCard.c,105 :: 		LCD_Write_Line(" created: ");
	MOVLW       ?lstr2_CoreMultimediaCard+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(?lstr2_CoreMultimediaCard+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,106 :: 		WordToStr(year, outstr);
	MOVF        M_Test_File_Exist_year_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        M_Test_File_Exist_year_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;CoreMultimediaCard.c,107 :: 		LCD_Write_Line(outstr);
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,108 :: 		ByteToStr(month, outstr);
	MOVF        M_Test_File_Exist_month_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;CoreMultimediaCard.c,109 :: 		LCD_Write_Line(outstr);
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,110 :: 		WordToStr(day, outstr);
	MOVF        M_Test_File_Exist_day_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;CoreMultimediaCard.c,111 :: 		LCD_Write_Line(outstr);
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,112 :: 		WordToStr(hour, outstr);
	MOVF        M_Test_File_Exist_hour_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;CoreMultimediaCard.c,113 :: 		LCD_Write_Line(outstr);
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,114 :: 		WordToStr(minute, outstr);
	MOVF        M_Test_File_Exist_minute_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;CoreMultimediaCard.c,115 :: 		LCD_Write_Line(outstr);
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,118 :: 		Mmc_Fat_Get_File_Date_Modified(&year, &month, &day, &hour, &minute);
	MOVLW       M_Test_File_Exist_year_L0+0
	MOVWF       FARG_Mmc_Fat_Get_File_Date_Modified_year+0 
	MOVLW       hi_addr(M_Test_File_Exist_year_L0+0)
	MOVWF       FARG_Mmc_Fat_Get_File_Date_Modified_year+1 
	MOVLW       M_Test_File_Exist_month_L0+0
	MOVWF       FARG_Mmc_Fat_Get_File_Date_Modified_month+0 
	MOVLW       hi_addr(M_Test_File_Exist_month_L0+0)
	MOVWF       FARG_Mmc_Fat_Get_File_Date_Modified_month+1 
	MOVLW       M_Test_File_Exist_day_L0+0
	MOVWF       FARG_Mmc_Fat_Get_File_Date_Modified_day+0 
	MOVLW       hi_addr(M_Test_File_Exist_day_L0+0)
	MOVWF       FARG_Mmc_Fat_Get_File_Date_Modified_day+1 
	MOVLW       M_Test_File_Exist_hour_L0+0
	MOVWF       FARG_Mmc_Fat_Get_File_Date_Modified_hours+0 
	MOVLW       hi_addr(M_Test_File_Exist_hour_L0+0)
	MOVWF       FARG_Mmc_Fat_Get_File_Date_Modified_hours+1 
	MOVLW       M_Test_File_Exist_minute_L0+0
	MOVWF       FARG_Mmc_Fat_Get_File_Date_Modified_mins+0 
	MOVLW       hi_addr(M_Test_File_Exist_minute_L0+0)
	MOVWF       FARG_Mmc_Fat_Get_File_Date_Modified_mins+1 
	CALL        _Mmc_Fat_Get_File_Date_Modified+0, 0
;CoreMultimediaCard.c,119 :: 		LCD_Write_Line(" modified: ");
	MOVLW       ?lstr3_CoreMultimediaCard+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(?lstr3_CoreMultimediaCard+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,120 :: 		WordToStr(year, outstr);
	MOVF        M_Test_File_Exist_year_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        M_Test_File_Exist_year_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;CoreMultimediaCard.c,121 :: 		LCD_Write_Line(outstr);
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,122 :: 		ByteToStr(month, outstr);
	MOVF        M_Test_File_Exist_month_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;CoreMultimediaCard.c,123 :: 		LCD_Write_Line(outstr);
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,124 :: 		WordToStr(day, outstr);
	MOVF        M_Test_File_Exist_day_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;CoreMultimediaCard.c,125 :: 		LCD_Write_Line(outstr);
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,126 :: 		WordToStr(hour, outstr);
	MOVF        M_Test_File_Exist_hour_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;CoreMultimediaCard.c,127 :: 		LCD_Write_Line(outstr);
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,128 :: 		WordToStr(minute, outstr);
	MOVF        M_Test_File_Exist_minute_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;CoreMultimediaCard.c,129 :: 		LCD_Write_Line(outstr);
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,132 :: 		fsize = Mmc_Fat_Get_File_Size();
	CALL        _Mmc_Fat_Get_File_Size+0, 0
;CoreMultimediaCard.c,133 :: 		LongToStr((signed long)fsize, outstr);
	MOVF        R0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVF        R2, 0 
	MOVWF       FARG_LongToStr_input+2 
	MOVF        R3, 0 
	MOVWF       FARG_LongToStr_input+3 
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;CoreMultimediaCard.c,134 :: 		LCD_Write_Line(outstr);
	MOVLW       M_Test_File_Exist_outstr_L0+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(M_Test_File_Exist_outstr_L0+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,135 :: 		}
	GOTO        L_M_Test_File_Exist16
L_M_Test_File_Exist15:
;CoreMultimediaCard.c,139 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_M_Test_File_Exist17:
	DECFSZ      R13, 1, 1
	BRA         L_M_Test_File_Exist17
	DECFSZ      R12, 1, 1
	BRA         L_M_Test_File_Exist17
	DECFSZ      R11, 1, 1
	BRA         L_M_Test_File_Exist17
	NOP
	NOP
;CoreMultimediaCard.c,141 :: 		}
L_M_Test_File_Exist16:
;CoreMultimediaCard.c,142 :: 		}
L_end_M_Test_File_Exist:
	RETURN      0
; end of _M_Test_File_Exist

_M_Create_Swap_File:

;CoreMultimediaCard.c,147 :: 		void M_Create_Swap_File() {
;CoreMultimediaCard.c,150 :: 		for(mmc_iterator=0; mmc_iterator<512; mmc_iterator++)
	CLRF        M_Create_Swap_File_mmc_iterator_L0+0 
	CLRF        M_Create_Swap_File_mmc_iterator_L0+1 
L_M_Create_Swap_File18:
	MOVLW       2
	SUBWF       M_Create_Swap_File_mmc_iterator_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__M_Create_Swap_File41
	MOVLW       0
	SUBWF       M_Create_Swap_File_mmc_iterator_L0+0, 0 
L__M_Create_Swap_File41:
	BTFSC       STATUS+0, 0 
	GOTO        L_M_Create_Swap_File19
;CoreMultimediaCard.c,151 :: 		MMC_Buffer[mmc_iterator] = mmc_iterator;
	MOVLW       _MMC_Buffer+0
	ADDWF       M_Create_Swap_File_mmc_iterator_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_MMC_Buffer+0)
	ADDWFC      M_Create_Swap_File_mmc_iterator_L0+1, 0 
	MOVWF       FSR1H 
	MOVF        M_Create_Swap_File_mmc_iterator_L0+0, 0 
	MOVWF       POSTINC1+0 
;CoreMultimediaCard.c,150 :: 		for(mmc_iterator=0; mmc_iterator<512; mmc_iterator++)
	INFSNZ      M_Create_Swap_File_mmc_iterator_L0+0, 1 
	INCF        M_Create_Swap_File_mmc_iterator_L0+1, 1 
;CoreMultimediaCard.c,151 :: 		MMC_Buffer[mmc_iterator] = mmc_iterator;
	GOTO        L_M_Create_Swap_File18
L_M_Create_Swap_File19:
;CoreMultimediaCard.c,153 :: 		mmc_size = Mmc_Fat_Get_Swap_File(5000, "mikroE.txt", 0x20);   // see help on this function for details
	MOVLW       136
	MOVWF       FARG_Mmc_Fat_Get_Swap_File_nSect+0 
	MOVLW       19
	MOVWF       FARG_Mmc_Fat_Get_Swap_File_nSect+1 
	MOVLW       0
	MOVWF       FARG_Mmc_Fat_Get_Swap_File_nSect+2 
	MOVWF       FARG_Mmc_Fat_Get_Swap_File_nSect+3 
	MOVLW       ?lstr4_CoreMultimediaCard+0
	MOVWF       FARG_Mmc_Fat_Get_Swap_File_name+0 
	MOVLW       hi_addr(?lstr4_CoreMultimediaCard+0)
	MOVWF       FARG_Mmc_Fat_Get_Swap_File_name+1 
	MOVLW       32
	MOVWF       FARG_Mmc_Fat_Get_Swap_File_file_attr+0 
	CALL        _Mmc_Fat_Get_Swap_File+0, 0
	MOVF        R0, 0 
	MOVWF       _mmc_size+0 
	MOVF        R1, 0 
	MOVWF       _mmc_size+1 
	MOVF        R2, 0 
	MOVWF       _mmc_size+2 
	MOVF        R3, 0 
	MOVWF       _mmc_size+3 
;CoreMultimediaCard.c,155 :: 		if (mmc_size) {
	MOVF        R0, 0 
	IORWF       R1, 0 
	IORWF       R2, 0 
	IORWF       R3, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_M_Create_Swap_File21
;CoreMultimediaCard.c,156 :: 		LongToStr((signed long)mmc_size, mmc_err_txt);
	MOVF        _mmc_size+0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        _mmc_size+1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVF        _mmc_size+2, 0 
	MOVWF       FARG_LongToStr_input+2 
	MOVF        _mmc_size+3, 0 
	MOVWF       FARG_LongToStr_input+3 
	MOVLW       _mmc_err_txt+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(_mmc_err_txt+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;CoreMultimediaCard.c,157 :: 		LCD_Write_Line(mmc_err_txt);
	MOVLW       _mmc_err_txt+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(_mmc_err_txt+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,159 :: 		for(mmc_iterator=0; mmc_iterator<5000; mmc_iterator++) {
	CLRF        M_Create_Swap_File_mmc_iterator_L0+0 
	CLRF        M_Create_Swap_File_mmc_iterator_L0+1 
L_M_Create_Swap_File22:
	MOVLW       19
	SUBWF       M_Create_Swap_File_mmc_iterator_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__M_Create_Swap_File42
	MOVLW       136
	SUBWF       M_Create_Swap_File_mmc_iterator_L0+0, 0 
L__M_Create_Swap_File42:
	BTFSC       STATUS+0, 0 
	GOTO        L_M_Create_Swap_File23
;CoreMultimediaCard.c,160 :: 		Mmc_Write_Sector(mmc_size++, MMC_Buffer);
	MOVF        _mmc_size+0, 0 
	MOVWF       FARG_Mmc_Write_Sector_sector+0 
	MOVF        _mmc_size+1, 0 
	MOVWF       FARG_Mmc_Write_Sector_sector+1 
	MOVF        _mmc_size+2, 0 
	MOVWF       FARG_Mmc_Write_Sector_sector+2 
	MOVF        _mmc_size+3, 0 
	MOVWF       FARG_Mmc_Write_Sector_sector+3 
	MOVLW       _MMC_Buffer+0
	MOVWF       FARG_Mmc_Write_Sector_dbuff+0 
	MOVLW       hi_addr(_MMC_Buffer+0)
	MOVWF       FARG_Mmc_Write_Sector_dbuff+1 
	CALL        _Mmc_Write_Sector+0, 0
	MOVLW       1
	ADDWF       _mmc_size+0, 1 
	MOVLW       0
	ADDWFC      _mmc_size+1, 1 
	ADDWFC      _mmc_size+2, 1 
	ADDWFC      _mmc_size+3, 1 
;CoreMultimediaCard.c,159 :: 		for(mmc_iterator=0; mmc_iterator<5000; mmc_iterator++) {
	INFSNZ      M_Create_Swap_File_mmc_iterator_L0+0, 1 
	INCF        M_Create_Swap_File_mmc_iterator_L0+1, 1 
;CoreMultimediaCard.c,162 :: 		}
	GOTO        L_M_Create_Swap_File22
L_M_Create_Swap_File23:
;CoreMultimediaCard.c,163 :: 		}
L_M_Create_Swap_File21:
;CoreMultimediaCard.c,164 :: 		}
L_end_M_Create_Swap_File:
	RETURN      0
; end of _M_Create_Swap_File

_M_Test_Routine:

;CoreMultimediaCard.c,166 :: 		void M_Test_Routine() {
;CoreMultimediaCard.c,167 :: 		if (M_Test_Verify() == 0) {
	CALL        _M_Test_Verify+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__M_Test_Routine44
	MOVLW       0
	XORWF       R0, 0 
L__M_Test_Routine44:
	BTFSS       STATUS+0, 2 
	GOTO        L_M_Test_Routine25
;CoreMultimediaCard.c,169 :: 		SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
	CLRF        FARG_SPI1_Init_Advanced_master+0 
	CLRF        FARG_SPI1_Init_Advanced_data_sample+0 
	CLRF        FARG_SPI1_Init_Advanced_clock_idle+0 
	MOVLW       1
	MOVWF       FARG_SPI1_Init_Advanced_transmit_edge+0 
	CALL        _SPI1_Init_Advanced+0, 0
;CoreMultimediaCard.c,171 :: 		LCD_Write_Line("Test Start.");
	MOVLW       ?lstr5_CoreMultimediaCard+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(?lstr5_CoreMultimediaCard+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,173 :: 		M_Create_New_File();
	CALL        _M_Create_New_File+0, 0
;CoreMultimediaCard.c,183 :: 		LCD_Write_Line("Test End.");
	MOVLW       ?lstr6_CoreMultimediaCard+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(?lstr6_CoreMultimediaCard+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,184 :: 		}
L_M_Test_Routine25:
;CoreMultimediaCard.c,185 :: 		}
L_end_M_Test_Routine:
	RETURN      0
; end of _M_Test_Routine

_M_Test_Begin:

;CoreMultimediaCard.c,188 :: 		void M_Test_Begin() {
;CoreMultimediaCard.c,192 :: 		UART1_Init(19200);
	BSF         BAUDCON+0, 3, 0
	MOVLW       2
	MOVWF       SPBRGH+0 
	MOVLW       112
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;CoreMultimediaCard.c,193 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_M_Test_Begin26:
	DECFSZ      R13, 1, 1
	BRA         L_M_Test_Begin26
	DECFSZ      R12, 1, 1
	BRA         L_M_Test_Begin26
;CoreMultimediaCard.c,195 :: 		LCD_Write_Line("PIC-Started"); // PIC present report
	MOVLW       ?lstr7_CoreMultimediaCard+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(?lstr7_CoreMultimediaCard+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,198 :: 		SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV64, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
	MOVLW       2
	MOVWF       FARG_SPI1_Init_Advanced_master+0 
	CLRF        FARG_SPI1_Init_Advanced_data_sample+0 
	CLRF        FARG_SPI1_Init_Advanced_clock_idle+0 
	MOVLW       1
	MOVWF       FARG_SPI1_Init_Advanced_transmit_edge+0 
	CALL        _SPI1_Init_Advanced+0, 0
;CoreMultimediaCard.c,201 :: 		if (Mmc_Fat_Init() == 0) {
	CALL        _Mmc_Fat_Init+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_M_Test_Begin27
;CoreMultimediaCard.c,202 :: 		LCD_Write_Line("PIC-Accepted");
	MOVLW       ?lstr8_CoreMultimediaCard+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(?lstr8_CoreMultimediaCard+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,203 :: 		M_Test_Routine();
	CALL        _M_Test_Routine+0, 0
;CoreMultimediaCard.c,204 :: 		}
	GOTO        L_M_Test_Begin28
L_M_Test_Begin27:
;CoreMultimediaCard.c,206 :: 		LCD_Write_Line(mmc_err_txt);
	MOVLW       _mmc_err_txt+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(_mmc_err_txt+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,209 :: 		LCD_Write_Line("PIC-Formatting MMC Card");
	MOVLW       ?lstr9_CoreMultimediaCard+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(?lstr9_CoreMultimediaCard+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,210 :: 		Mmc_Fat_QuickFormat("MMC CARD");
	MOVLW       ?lstr10_CoreMultimediaCard+0
	MOVWF       FARG_Mmc_Fat_QuickFormat_fat_label+0 
	MOVLW       hi_addr(?lstr10_CoreMultimediaCard+0)
	MOVWF       FARG_Mmc_Fat_QuickFormat_fat_label+1 
	CALL        _Mmc_Fat_QuickFormat+0, 0
;CoreMultimediaCard.c,211 :: 		LCD_Write_Line("PIC-Formatting MMC Card Done");
	MOVLW       ?lstr11_CoreMultimediaCard+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(?lstr11_CoreMultimediaCard+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,212 :: 		M_Test_Routine();
	CALL        _M_Test_Routine+0, 0
;CoreMultimediaCard.c,213 :: 		}
L_M_Test_Begin28:
;CoreMultimediaCard.c,214 :: 		}
L_end_M_Test_Begin:
	RETURN      0
; end of _M_Test_Begin

_M_Test_Verify:

;CoreMultimediaCard.c,216 :: 		int M_Test_Verify() {
;CoreMultimediaCard.c,217 :: 		if (Mmc_Fat_Init() == 0) {
	CALL        _Mmc_Fat_Init+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_M_Test_Verify29
;CoreMultimediaCard.c,218 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
	GOTO        L_end_M_Test_Verify
;CoreMultimediaCard.c,219 :: 		} else {
L_M_Test_Verify29:
;CoreMultimediaCard.c,220 :: 		LCD_Write_Line(mmc_err_txt);
	MOVLW       _mmc_err_txt+0
	MOVWF       FARG_LCD_Write_Line_uart_text+0 
	MOVLW       hi_addr(_mmc_err_txt+0)
	MOVWF       FARG_LCD_Write_Line_uart_text+1 
	CALL        _LCD_Write_Line+0, 0
;CoreMultimediaCard.c,221 :: 		return -1;
	MOVLW       255
	MOVWF       R0 
	MOVLW       255
	MOVWF       R1 
;CoreMultimediaCard.c,223 :: 		}
L_end_M_Test_Verify:
	RETURN      0
; end of _M_Test_Verify
