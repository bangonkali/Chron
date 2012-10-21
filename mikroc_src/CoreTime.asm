
_Display_Time_Core:

;CoreTime.c,7 :: 		void Display_Time_Core(char *sec, char *min, char *hr, char *day, char *mn, char *year) {
;CoreTime.c,9 :: 		char txtSec[5] = "";
	MOVLW       ?ICSDisplay_Time_Core_txtSec_L0+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICSDisplay_Time_Core_txtSec_L0+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICSDisplay_Time_Core_txtSec_L0+0)
	MOVWF       TBLPTRU 
	MOVLW       Display_Time_Core_txtSec_L0+0
	MOVWF       FSR1 
	MOVLW       hi_addr(Display_Time_Core_txtSec_L0+0)
	MOVWF       FSR1H 
	MOVLW       62
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
;CoreTime.c,18 :: 		ShortToStr(*sec, txtSec);
	MOVFF       FARG_Display_Time_Core_sec+0, FSR0
	MOVFF       FARG_Display_Time_Core_sec+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       Display_Time_Core_txtSec_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(Display_Time_Core_txtSec_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;CoreTime.c,19 :: 		ShortToStr(*min, txtMin);
	MOVFF       FARG_Display_Time_Core_min+0, FSR0
	MOVFF       FARG_Display_Time_Core_min+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       Display_Time_Core_txtMin_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(Display_Time_Core_txtMin_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;CoreTime.c,20 :: 		ShortToStr(*hr, txtHour);
	MOVFF       FARG_Display_Time_Core_hr+0, FSR0
	MOVFF       FARG_Display_Time_Core_hr+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       Display_Time_Core_txtHour_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(Display_Time_Core_txtHour_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;CoreTime.c,21 :: 		ShortToStr(*day, txtDay);
	MOVFF       FARG_Display_Time_Core_day+0, FSR0
	MOVFF       FARG_Display_Time_Core_day+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       Display_Time_Core_txtDay_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(Display_Time_Core_txtDay_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;CoreTime.c,22 :: 		ShortToStr(*mn, txtMn);
	MOVFF       FARG_Display_Time_Core_mn+0, FSR0
	MOVFF       FARG_Display_Time_Core_mn+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       Display_Time_Core_txtMn_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(Display_Time_Core_txtMn_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;CoreTime.c,23 :: 		ShortToStr(*year, txtYear);
	MOVFF       FARG_Display_Time_Core_year+0, FSR0
	MOVFF       FARG_Display_Time_Core_year+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       Display_Time_Core_txtYear_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(Display_Time_Core_txtYear_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;CoreTime.c,25 :: 		MakeLastTwoChars(txtSec);
	MOVLW       Display_Time_Core_txtSec_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(Display_Time_Core_txtSec_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,26 :: 		MakeLastTwoChars(txtMin);
	MOVLW       Display_Time_Core_txtMin_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(Display_Time_Core_txtMin_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,27 :: 		MakeLastTwoChars(txtHour);
	MOVLW       Display_Time_Core_txtHour_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(Display_Time_Core_txtHour_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,28 :: 		MakeLastTwoChars(txtDay);
	MOVLW       Display_Time_Core_txtDay_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(Display_Time_Core_txtDay_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,29 :: 		MakeLastTwoChars(txtMn);
	MOVLW       Display_Time_Core_txtMn_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(Display_Time_Core_txtMn_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,30 :: 		MakeLastTwoChars(txtYear);
	MOVLW       Display_Time_Core_txtYear_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(Display_Time_Core_txtYear_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,32 :: 		strcat(txtDisplayRow1, "DATE: ");
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr1_CoreTime+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr1_CoreTime+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,33 :: 		strcat(txtDisplayRow1, txtMn);
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Time_Core_txtMn_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Time_Core_txtMn_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,34 :: 		strcat(txtDisplayRow1, "/");
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr2_CoreTime+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr2_CoreTime+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,35 :: 		strcat(txtDisplayRow1, txtDay);
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Time_Core_txtDay_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Time_Core_txtDay_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,36 :: 		strcat(txtDisplayRow1, "/");
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr3_CoreTime+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr3_CoreTime+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,37 :: 		strcat(txtDisplayRow1, txtYear);
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Time_Core_txtYear_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Time_Core_txtYear_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,39 :: 		strcat(txtDisplayRow2, "TIME: ");
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr4_CoreTime+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr4_CoreTime+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,40 :: 		strcat(txtDisplayRow2, txtHour);
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Time_Core_txtHour_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Time_Core_txtHour_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,41 :: 		strcat(txtDisplayRow2, ":");
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr5_CoreTime+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr5_CoreTime+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,42 :: 		strcat(txtDisplayRow2, txtMin);
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Time_Core_txtMin_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Time_Core_txtMin_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,43 :: 		strcat(txtDisplayRow2, ":");
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr6_CoreTime+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr6_CoreTime+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,44 :: 		strcat(txtDisplayRow2, txtSec);
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Time_Core_txtSec_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Time_Core_txtSec_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,46 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CoreTime.c,47 :: 		Lcd_Out(1,1,txtDisplayRow1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CoreTime.c,48 :: 		Lcd_Out(2,1,txtDisplayRow2);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CoreTime.c,49 :: 		}
L_end_Display_Time_Core:
	RETURN      0
; end of _Display_Time_Core

_Display_Time:

;CoreTime.c,51 :: 		void Display_Time(char sec, char min, char hr, char week_day, char day, char mn, char year) {
;CoreTime.c,53 :: 		switch(week_day){
	GOTO        L_Display_Time0
;CoreTime.c,54 :: 		case 1: txt="Sun"; break;
L_Display_Time2:
	MOVLW       ?lstr7_CoreTime+0
	MOVWF       Display_Time_txt_L0+0 
	MOVLW       hi_addr(?lstr7_CoreTime+0)
	MOVWF       Display_Time_txt_L0+1 
	GOTO        L_Display_Time1
;CoreTime.c,55 :: 		case 2: txt="Mon"; break;
L_Display_Time3:
	MOVLW       ?lstr8_CoreTime+0
	MOVWF       Display_Time_txt_L0+0 
	MOVLW       hi_addr(?lstr8_CoreTime+0)
	MOVWF       Display_Time_txt_L0+1 
	GOTO        L_Display_Time1
;CoreTime.c,56 :: 		case 3: txt="Tue"; break;
L_Display_Time4:
	MOVLW       ?lstr9_CoreTime+0
	MOVWF       Display_Time_txt_L0+0 
	MOVLW       hi_addr(?lstr9_CoreTime+0)
	MOVWF       Display_Time_txt_L0+1 
	GOTO        L_Display_Time1
;CoreTime.c,57 :: 		case 4: txt="Wed"; break;
L_Display_Time5:
	MOVLW       ?lstr10_CoreTime+0
	MOVWF       Display_Time_txt_L0+0 
	MOVLW       hi_addr(?lstr10_CoreTime+0)
	MOVWF       Display_Time_txt_L0+1 
	GOTO        L_Display_Time1
;CoreTime.c,58 :: 		case 5: txt="Thu"; break;
L_Display_Time6:
	MOVLW       ?lstr11_CoreTime+0
	MOVWF       Display_Time_txt_L0+0 
	MOVLW       hi_addr(?lstr11_CoreTime+0)
	MOVWF       Display_Time_txt_L0+1 
	GOTO        L_Display_Time1
;CoreTime.c,59 :: 		case 6: txt="Fri"; break;
L_Display_Time7:
	MOVLW       ?lstr12_CoreTime+0
	MOVWF       Display_Time_txt_L0+0 
	MOVLW       hi_addr(?lstr12_CoreTime+0)
	MOVWF       Display_Time_txt_L0+1 
	GOTO        L_Display_Time1
;CoreTime.c,60 :: 		case 7: txt="Sat"; break;
L_Display_Time8:
	MOVLW       ?lstr13_CoreTime+0
	MOVWF       Display_Time_txt_L0+0 
	MOVLW       hi_addr(?lstr13_CoreTime+0)
	MOVWF       Display_Time_txt_L0+1 
	GOTO        L_Display_Time1
;CoreTime.c,61 :: 		}
L_Display_Time0:
	MOVF        FARG_Display_Time_week_day+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Display_Time2
	MOVF        FARG_Display_Time_week_day+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Display_Time3
	MOVF        FARG_Display_Time_week_day+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_Display_Time4
	MOVF        FARG_Display_Time_week_day+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_Display_Time5
	MOVF        FARG_Display_Time_week_day+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_Display_Time6
	MOVF        FARG_Display_Time_week_day+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_Display_Time7
	MOVF        FARG_Display_Time_week_day+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_Display_Time8
L_Display_Time1:
;CoreTime.c,63 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;CoreTime.c,64 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CoreTime.c,65 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CoreTime.c,67 :: 		Lcd_Out(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        Display_Time_txt_L0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        Display_Time_txt_L0+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CoreTime.c,68 :: 		Lcd_Chr(1, 6, (day / 10)   + 48);    // Print tens digit of day variable
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Display_Time_day+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreTime.c,69 :: 		Lcd_Chr(1, 7, (day % 10)   + 48);    // Print oness digit of day variable
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Display_Time_day+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreTime.c,70 :: 		Lcd_Chr(1, 9, (mn / 10) + 48);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Display_Time_mn+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreTime.c,71 :: 		Lcd_Chr(1,10, (mn % 10) + 48);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Display_Time_mn+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreTime.c,72 :: 		Lcd_Chr(1,12,  (year / 10)  + 48);          // Print year vaiable + 8 (start from year 2008)
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Display_Time_year+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreTime.c,73 :: 		Lcd_Chr(1,13,  (year % 10)  + 48);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Display_Time_year+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreTime.c,75 :: 		Lcd_Chr(2, 6, (hr / 10)   + 48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Display_Time_hr+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreTime.c,76 :: 		Lcd_Chr(2, 7, (hr % 10)   + 48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Display_Time_hr+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreTime.c,77 :: 		Lcd_Chr(2, 9, (min / 10) + 48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Display_Time_min+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreTime.c,78 :: 		Lcd_Chr(2,10, (min % 10) + 48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Display_Time_min+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreTime.c,79 :: 		Lcd_Chr(2,12, (sec / 10) + 48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Display_Time_sec+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreTime.c,80 :: 		Lcd_Chr(2,13, (sec % 10) + 48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Display_Time_sec+0, 0 
	MOVWF       R0 
	CALL        _Div_8x8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CoreTime.c,81 :: 		}
L_end_Display_Time:
	RETURN      0
; end of _Display_Time

_Transform_Time:

;CoreTime.c,83 :: 		void Transform_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year) {
;CoreTime.c,84 :: 		*sec  =  ((*sec & 0x70) >> 4)*10 + (*sec & 0x0F);
	MOVFF       FARG_Transform_Time_sec+0, FSR0
	MOVFF       FARG_Transform_Time_sec+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       112
	ANDWF       R3, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R1 
	MOVLW       15
	ANDWF       R3, 0 
	MOVWF       R0 
	MOVFF       FARG_Transform_Time_sec+0, FSR1
	MOVFF       FARG_Transform_Time_sec+1, FSR1H
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,85 :: 		*min  =  ((*min & 0xF0) >> 4)*10 + (*min & 0x0F);
	MOVFF       FARG_Transform_Time_min+0, FSR0
	MOVFF       FARG_Transform_Time_min+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       240
	ANDWF       R3, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R1 
	MOVLW       15
	ANDWF       R3, 0 
	MOVWF       R0 
	MOVFF       FARG_Transform_Time_min+0, FSR1
	MOVFF       FARG_Transform_Time_min+1, FSR1H
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,86 :: 		*hr   =  ((*hr & 0x30) >> 4)*10 + (*hr & 0x0F);
	MOVFF       FARG_Transform_Time_hr+0, FSR0
	MOVFF       FARG_Transform_Time_hr+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       48
	ANDWF       R3, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R1 
	MOVLW       15
	ANDWF       R3, 0 
	MOVWF       R0 
	MOVFF       FARG_Transform_Time_hr+0, FSR1
	MOVFF       FARG_Transform_Time_hr+1, FSR1H
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,87 :: 		*week_day =(*week_day & 0x07);
	MOVFF       FARG_Transform_Time_week_day+0, FSR0
	MOVFF       FARG_Transform_Time_week_day+1, FSR0H
	MOVFF       FARG_Transform_Time_week_day+0, FSR1
	MOVFF       FARG_Transform_Time_week_day+1, FSR1H
	MOVLW       7
	ANDWF       POSTINC0+0, 1 
;CoreTime.c,88 :: 		*day  =  ((*day & 0xF0) >> 4)*10 + (*day & 0x0F);
	MOVFF       FARG_Transform_Time_day+0, FSR0
	MOVFF       FARG_Transform_Time_day+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       240
	ANDWF       R3, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R1 
	MOVLW       15
	ANDWF       R3, 0 
	MOVWF       R0 
	MOVFF       FARG_Transform_Time_day+0, FSR1
	MOVFF       FARG_Transform_Time_day+1, FSR1H
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,89 :: 		*mn   =  ((*mn & 0x10) >> 4)*10 + (*mn & 0x0F);
	MOVFF       FARG_Transform_Time_mn+0, FSR0
	MOVFF       FARG_Transform_Time_mn+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       16
	ANDWF       R3, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R1 
	MOVLW       15
	ANDWF       R3, 0 
	MOVWF       R0 
	MOVFF       FARG_Transform_Time_mn+0, FSR1
	MOVFF       FARG_Transform_Time_mn+1, FSR1H
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,90 :: 		*year =  ((*year & 0xF0)>>4)*10+(*year & 0x0F);
	MOVFF       FARG_Transform_Time_year+0, FSR0
	MOVFF       FARG_Transform_Time_year+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       240
	ANDWF       R3, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R1 
	MOVLW       15
	ANDWF       R3, 0 
	MOVWF       R0 
	MOVFF       FARG_Transform_Time_year+0, FSR1
	MOVFF       FARG_Transform_Time_year+1, FSR1H
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,91 :: 		}
L_end_Transform_Time:
	RETURN      0
; end of _Transform_Time

_Read_Time:

;CoreTime.c,93 :: 		void Read_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year) {
;CoreTime.c,94 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;CoreTime.c,95 :: 		I2C1_Wr(0xD0);
	MOVLW       208
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,96 :: 		I2C1_Wr(0);
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,97 :: 		I2C1_Repeated_Start();
	CALL        _I2C1_Repeated_Start+0, 0
;CoreTime.c,98 :: 		I2C1_Wr(0xD1);
	MOVLW       209
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,99 :: 		*sec =I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_sec+0, FSR1
	MOVFF       FARG_Read_Time_sec+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,100 :: 		*min =I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_min+0, FSR1
	MOVFF       FARG_Read_Time_min+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,101 :: 		*hr =I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_hr+0, FSR1
	MOVFF       FARG_Read_Time_hr+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,102 :: 		*week_day =I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_week_day+0, FSR1
	MOVFF       FARG_Read_Time_week_day+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,103 :: 		*day =I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_day+0, FSR1
	MOVFF       FARG_Read_Time_day+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,104 :: 		*mn =I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_mn+0, FSR1
	MOVFF       FARG_Read_Time_mn+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,105 :: 		*year =I2C1_Rd(0);
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_year+0, FSR1
	MOVFF       FARG_Read_Time_year+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,106 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;CoreTime.c,107 :: 		}
L_end_Read_Time:
	RETURN      0
; end of _Read_Time

_Write_Time:

;CoreTime.c,109 :: 		void Write_Time() {
;CoreTime.c,110 :: 		I2C1_Start();          // issue start signal
	CALL        _I2C1_Start+0, 0
;CoreTime.c,111 :: 		I2C1_Wr(0xD0);       // address DS1307 which is 0xD0
	MOVLW       208
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,112 :: 		I2C1_Wr(0);            // start from word at address (REG0)
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,113 :: 		I2C1_Wr(0x80);         // write $80 to REG0. (pause counter + 0 sec)
	MOVLW       128
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,114 :: 		I2C1_Wr(0x06);            // write 0 to minutes word to (REG1)
	MOVLW       6
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,115 :: 		I2C1_Wr(0x04);         // write 17 to hours word (24-hours mode)(REG2)
	MOVLW       4
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,117 :: 		I2C1_Wr(0x05);         // write 5 - Tuesday (REG3)
	MOVLW       5
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,118 :: 		I2C1_Wr(0x18);         // write 18 to date word (REG4)
	MOVLW       24
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,119 :: 		I2C1_Wr(0x10);         // write 10 (Oct) to month word (REG5)
	MOVLW       16
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,120 :: 		I2C1_Wr(0x12);         // write 12 to year word (REG6)
	MOVLW       18
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,121 :: 		I2C1_Stop();           // issue stop signal
	CALL        _I2C1_Stop+0, 0
;CoreTime.c,123 :: 		I2C1_Start();          // issue start signal
	CALL        _I2C1_Start+0, 0
;CoreTime.c,124 :: 		I2C1_Wr(0xD0);       // address DS1307 which is 0xD0
	MOVLW       208
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,125 :: 		I2C1_Wr(0);            // start from word at address 0
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,126 :: 		I2C1_Wr(0);            // write 0 to REG0 (enable counting + 0 sec)
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,127 :: 		I2C1_Stop();           // issue stop signal
	CALL        _I2C1_Stop+0, 0
;CoreTime.c,128 :: 		}
L_end_Write_Time:
	RETURN      0
; end of _Write_Time

_GetTimeStruct:

;CoreTime.c,130 :: 		void GetTimeStruct(TimeStruct *time) {
;CoreTime.c,132 :: 		char txtSec[5] = "";
	CLRF        GetTimeStruct_txtSec_L0+0 
	CLRF        GetTimeStruct_txtSec_L0+1 
	CLRF        GetTimeStruct_txtSec_L0+2 
	CLRF        GetTimeStruct_txtSec_L0+3 
	CLRF        GetTimeStruct_txtSec_L0+4 
	CLRF        GetTimeStruct_txtMin_L0+0 
	CLRF        GetTimeStruct_txtMin_L0+1 
	CLRF        GetTimeStruct_txtMin_L0+2 
	CLRF        GetTimeStruct_txtMin_L0+3 
	CLRF        GetTimeStruct_txtMin_L0+4 
	CLRF        GetTimeStruct_txtHour_L0+0 
	CLRF        GetTimeStruct_txtHour_L0+1 
	CLRF        GetTimeStruct_txtHour_L0+2 
	CLRF        GetTimeStruct_txtHour_L0+3 
	CLRF        GetTimeStruct_txtHour_L0+4 
	CLRF        GetTimeStruct_txtDay_L0+0 
	CLRF        GetTimeStruct_txtDay_L0+1 
	CLRF        GetTimeStruct_txtDay_L0+2 
	CLRF        GetTimeStruct_txtDay_L0+3 
	CLRF        GetTimeStruct_txtDay_L0+4 
	CLRF        GetTimeStruct_txtMn_L0+0 
	CLRF        GetTimeStruct_txtMn_L0+1 
	CLRF        GetTimeStruct_txtMn_L0+2 
	CLRF        GetTimeStruct_txtMn_L0+3 
	CLRF        GetTimeStruct_txtMn_L0+4 
	CLRF        GetTimeStruct_txtYear_L0+0 
	CLRF        GetTimeStruct_txtYear_L0+1 
	CLRF        GetTimeStruct_txtYear_L0+2 
	CLRF        GetTimeStruct_txtYear_L0+3 
	CLRF        GetTimeStruct_txtYear_L0+4 
	CLRF        GetTimeStruct_txtWeekDay_L0+0 
	CLRF        GetTimeStruct_txtWeekDay_L0+1 
	CLRF        GetTimeStruct_txtWeekDay_L0+2 
	CLRF        GetTimeStruct_txtWeekDay_L0+3 
	CLRF        GetTimeStruct_txtWeekDay_L0+4 
;CoreTime.c,140 :: 		Read_Time(&local_sec,&local_min1,&local_hr,&local_week_day,&local_day,&local_mn,&local_year);
	MOVLW       GetTimeStruct_local_sec_L0+0
	MOVWF       FARG_Read_Time_sec+0 
	MOVLW       hi_addr(GetTimeStruct_local_sec_L0+0)
	MOVWF       FARG_Read_Time_sec+1 
	MOVLW       GetTimeStruct_local_min1_L0+0
	MOVWF       FARG_Read_Time_min+0 
	MOVLW       hi_addr(GetTimeStruct_local_min1_L0+0)
	MOVWF       FARG_Read_Time_min+1 
	MOVLW       GetTimeStruct_local_hr_L0+0
	MOVWF       FARG_Read_Time_hr+0 
	MOVLW       hi_addr(GetTimeStruct_local_hr_L0+0)
	MOVWF       FARG_Read_Time_hr+1 
	MOVLW       GetTimeStruct_local_week_day_L0+0
	MOVWF       FARG_Read_Time_week_day+0 
	MOVLW       hi_addr(GetTimeStruct_local_week_day_L0+0)
	MOVWF       FARG_Read_Time_week_day+1 
	MOVLW       GetTimeStruct_local_day_L0+0
	MOVWF       FARG_Read_Time_day+0 
	MOVLW       hi_addr(GetTimeStruct_local_day_L0+0)
	MOVWF       FARG_Read_Time_day+1 
	MOVLW       GetTimeStruct_local_mn_L0+0
	MOVWF       FARG_Read_Time_mn+0 
	MOVLW       hi_addr(GetTimeStruct_local_mn_L0+0)
	MOVWF       FARG_Read_Time_mn+1 
	MOVLW       GetTimeStruct_local_year_L0+0
	MOVWF       FARG_Read_Time_year+0 
	MOVLW       hi_addr(GetTimeStruct_local_year_L0+0)
	MOVWF       FARG_Read_Time_year+1 
	CALL        _Read_Time+0, 0
;CoreTime.c,142 :: 		WordToHex(local_sec, txtSec);
	MOVF        GetTimeStruct_local_sec_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtSec_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtSec_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,143 :: 		WordToHex(local_min1, txtMin);
	MOVF        GetTimeStruct_local_min1_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtMin_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtMin_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,144 :: 		WordToHex(local_hr, txtHour);
	MOVF        GetTimeStruct_local_hr_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtHour_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtHour_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,145 :: 		WordToHex(local_day, txtDay);
	MOVF        GetTimeStruct_local_day_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtDay_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtDay_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,146 :: 		WordToHex(local_mn, txtMn);
	MOVF        GetTimeStruct_local_mn_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtMn_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtMn_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,147 :: 		WordToHex(local_year, txtYear);
	MOVF        GetTimeStruct_local_year_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtYear_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtYear_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,148 :: 		WordToHex(local_week_day, txtWeekDay);
	MOVF        GetTimeStruct_local_week_day_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtWeekDay_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtWeekDay_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,150 :: 		MakeLastTwoChars(txtSec);
	MOVLW       GetTimeStruct_txtSec_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtSec_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,151 :: 		MakeLastTwoChars(txtMin);
	MOVLW       GetTimeStruct_txtMin_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtMin_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,152 :: 		MakeLastTwoChars(txtHour);
	MOVLW       GetTimeStruct_txtHour_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtHour_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,153 :: 		MakeLastTwoChars(txtDay);
	MOVLW       GetTimeStruct_txtDay_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtDay_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,154 :: 		MakeLastTwoChars(txtMn);
	MOVLW       GetTimeStruct_txtMn_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtMn_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,155 :: 		MakeLastTwoChars(txtYear);
	MOVLW       GetTimeStruct_txtYear_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtYear_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,156 :: 		MakeLastTwoChars(txtWeekDay);
	MOVLW       GetTimeStruct_txtWeekDay_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtWeekDay_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,158 :: 		local_sec = atoi(txtSec);
	MOVLW       GetTimeStruct_txtSec_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtSec_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_sec_L0+0 
;CoreTime.c,159 :: 		local_min1 = atoi(txtMin);
	MOVLW       GetTimeStruct_txtMin_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtMin_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_min1_L0+0 
;CoreTime.c,160 :: 		local_hr = atoi(txtHour);
	MOVLW       GetTimeStruct_txtHour_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtHour_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_hr_L0+0 
;CoreTime.c,161 :: 		local_day = atoi(txtDay);
	MOVLW       GetTimeStruct_txtDay_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtDay_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_day_L0+0 
;CoreTime.c,162 :: 		local_mn = atoi(txtMn);
	MOVLW       GetTimeStruct_txtMn_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtMn_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_mn_L0+0 
;CoreTime.c,163 :: 		local_year = atoi(txtYear);
	MOVLW       GetTimeStruct_txtYear_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtYear_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_year_L0+0 
;CoreTime.c,164 :: 		local_week_day = atoi(txtWeekDay);
	MOVLW       GetTimeStruct_txtWeekDay_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtWeekDay_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_week_day_L0+0 
;CoreTime.c,166 :: 		time->ss = local_sec;
	MOVFF       FARG_GetTimeStruct_time+0, FSR1
	MOVFF       FARG_GetTimeStruct_time+1, FSR1H
	MOVF        GetTimeStruct_local_sec_L0+0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,167 :: 		time->mn = local_min1;
	MOVLW       1
	ADDWF       FARG_GetTimeStruct_time+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetTimeStruct_time+1, 0 
	MOVWF       FSR1H 
	MOVF        GetTimeStruct_local_min1_L0+0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,168 :: 		time->hh = local_hr;
	MOVLW       2
	ADDWF       FARG_GetTimeStruct_time+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetTimeStruct_time+1, 0 
	MOVWF       FSR1H 
	MOVF        GetTimeStruct_local_hr_L0+0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,169 :: 		time->md = local_day;
	MOVLW       3
	ADDWF       FARG_GetTimeStruct_time+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetTimeStruct_time+1, 0 
	MOVWF       FSR1H 
	MOVF        GetTimeStruct_local_day_L0+0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,170 :: 		time->mo = local_mn;
	MOVLW       5
	ADDWF       FARG_GetTimeStruct_time+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetTimeStruct_time+1, 0 
	MOVWF       FSR1H 
	MOVF        GetTimeStruct_local_mn_L0+0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,171 :: 		time->yy = local_year;
	MOVLW       6
	ADDWF       FARG_GetTimeStruct_time+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetTimeStruct_time+1, 0 
	MOVWF       FSR1H 
	MOVF        GetTimeStruct_local_year_L0+0, 0 
	MOVWF       POSTINC1+0 
	MOVLW       0
	MOVWF       POSTINC1+0 
;CoreTime.c,172 :: 		time->wd = local_week_day;
	MOVLW       4
	ADDWF       FARG_GetTimeStruct_time+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetTimeStruct_time+1, 0 
	MOVWF       FSR1H 
	MOVF        GetTimeStruct_local_week_day_L0+0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,173 :: 		}
L_end_GetTimeStruct:
	RETURN      0
; end of _GetTimeStruct

_MakeLastTwoChars:

;CoreTime.c,175 :: 		void MakeLastTwoChars(char *txt){
;CoreTime.c,177 :: 		strcpy(txtSec, txt);
	MOVLW       MakeLastTwoChars_txtSec_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(MakeLastTwoChars_txtSec_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVF        FARG_MakeLastTwoChars_txt+0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        FARG_MakeLastTwoChars_txt+1, 0 
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CoreTime.c,178 :: 		txtSec[0] = txtSec[2];
	MOVF        MakeLastTwoChars_txtSec_L0+2, 0 
	MOVWF       MakeLastTwoChars_txtSec_L0+0 
;CoreTime.c,179 :: 		txtSec[1] = txtSec[3];
	MOVF        MakeLastTwoChars_txtSec_L0+3, 0 
	MOVWF       MakeLastTwoChars_txtSec_L0+1 
;CoreTime.c,180 :: 		txtSec[2] = '\0';
	CLRF        MakeLastTwoChars_txtSec_L0+2 
;CoreTime.c,181 :: 		strcpy(txt, txtSec);
	MOVF        FARG_MakeLastTwoChars_txt+0, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        FARG_MakeLastTwoChars_txt+1, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       MakeLastTwoChars_txtSec_L0+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(MakeLastTwoChars_txtSec_L0+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CoreTime.c,182 :: 		}
L_end_MakeLastTwoChars:
	RETURN      0
; end of _MakeLastTwoChars

_DisplayTimeStruct:

;CoreTime.c,184 :: 		void DisplayTimeStruct(TimeStruct *time) {
;CoreTime.c,185 :: 		Display_Time_Core(&(time->ss), &(time->mn), &(time->hh), &(time->md), &(time->mo), &(time->yy));
	MOVF        FARG_DisplayTimeStruct_time+0, 0 
	MOVWF       FARG_Display_Time_Core_sec+0 
	MOVF        FARG_DisplayTimeStruct_time+1, 0 
	MOVWF       FARG_Display_Time_Core_sec+1 
	MOVLW       1
	ADDWF       FARG_DisplayTimeStruct_time+0, 0 
	MOVWF       FARG_Display_Time_Core_min+0 
	MOVLW       0
	ADDWFC      FARG_DisplayTimeStruct_time+1, 0 
	MOVWF       FARG_Display_Time_Core_min+1 
	MOVLW       2
	ADDWF       FARG_DisplayTimeStruct_time+0, 0 
	MOVWF       FARG_Display_Time_Core_hr+0 
	MOVLW       0
	ADDWFC      FARG_DisplayTimeStruct_time+1, 0 
	MOVWF       FARG_Display_Time_Core_hr+1 
	MOVLW       3
	ADDWF       FARG_DisplayTimeStruct_time+0, 0 
	MOVWF       FARG_Display_Time_Core_day+0 
	MOVLW       0
	ADDWFC      FARG_DisplayTimeStruct_time+1, 0 
	MOVWF       FARG_Display_Time_Core_day+1 
	MOVLW       5
	ADDWF       FARG_DisplayTimeStruct_time+0, 0 
	MOVWF       FARG_Display_Time_Core_mn+0 
	MOVLW       0
	ADDWFC      FARG_DisplayTimeStruct_time+1, 0 
	MOVWF       FARG_Display_Time_Core_mn+1 
	MOVLW       6
	ADDWF       FARG_DisplayTimeStruct_time+0, 0 
	MOVWF       FARG_Display_Time_Core_year+0 
	MOVLW       0
	ADDWFC      FARG_DisplayTimeStruct_time+1, 0 
	MOVWF       FARG_Display_Time_Core_year+1 
	CALL        _Display_Time_Core+0, 0
;CoreTime.c,186 :: 		}
L_end_DisplayTimeStruct:
	RETURN      0
; end of _DisplayTimeStruct
