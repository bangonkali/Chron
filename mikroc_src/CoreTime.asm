
_Display_Time_Core:

;CoreTime.c,8 :: 		void Display_Time_Core(unsigned char *sec, unsigned char *min, unsigned char *hr, unsigned char *day, unsigned char *mn, unsigned char *year) {
;CoreTime.c,10 :: 		unsigned char txtSec[5] = "";
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
;CoreTime.c,19 :: 		ShortToStr(*sec, txtSec);
	MOVFF       FARG_Display_Time_Core_sec+0, FSR0
	MOVFF       FARG_Display_Time_Core_sec+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       Display_Time_Core_txtSec_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(Display_Time_Core_txtSec_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;CoreTime.c,20 :: 		ShortToStr(*min, txtMin);
	MOVFF       FARG_Display_Time_Core_min+0, FSR0
	MOVFF       FARG_Display_Time_Core_min+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       Display_Time_Core_txtMin_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(Display_Time_Core_txtMin_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;CoreTime.c,21 :: 		ShortToStr(*hr, txtHour);
	MOVFF       FARG_Display_Time_Core_hr+0, FSR0
	MOVFF       FARG_Display_Time_Core_hr+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       Display_Time_Core_txtHour_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(Display_Time_Core_txtHour_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;CoreTime.c,22 :: 		ShortToStr(*day, txtDay);
	MOVFF       FARG_Display_Time_Core_day+0, FSR0
	MOVFF       FARG_Display_Time_Core_day+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       Display_Time_Core_txtDay_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(Display_Time_Core_txtDay_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;CoreTime.c,23 :: 		ShortToStr(*mn, txtMn);
	MOVFF       FARG_Display_Time_Core_mn+0, FSR0
	MOVFF       FARG_Display_Time_Core_mn+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       Display_Time_Core_txtMn_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(Display_Time_Core_txtMn_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;CoreTime.c,24 :: 		ShortToStr(*year, txtYear);
	MOVFF       FARG_Display_Time_Core_year+0, FSR0
	MOVFF       FARG_Display_Time_Core_year+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ShortToStr_input+0 
	MOVLW       Display_Time_Core_txtYear_L0+0
	MOVWF       FARG_ShortToStr_output+0 
	MOVLW       hi_addr(Display_Time_Core_txtYear_L0+0)
	MOVWF       FARG_ShortToStr_output+1 
	CALL        _ShortToStr+0, 0
;CoreTime.c,26 :: 		MakeLastTwoChars(txtSec);
	MOVLW       Display_Time_Core_txtSec_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(Display_Time_Core_txtSec_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,27 :: 		MakeLastTwoChars(txtMin);
	MOVLW       Display_Time_Core_txtMin_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(Display_Time_Core_txtMin_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,28 :: 		MakeLastTwoChars(txtHour);
	MOVLW       Display_Time_Core_txtHour_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(Display_Time_Core_txtHour_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,29 :: 		MakeLastTwoChars(txtDay);
	MOVLW       Display_Time_Core_txtDay_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(Display_Time_Core_txtDay_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,30 :: 		MakeLastTwoChars(txtMn);
	MOVLW       Display_Time_Core_txtMn_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(Display_Time_Core_txtMn_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,31 :: 		MakeLastTwoChars(txtYear);
	MOVLW       Display_Time_Core_txtYear_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(Display_Time_Core_txtYear_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,33 :: 		strcat(txtDisplayRow1, "DATE: ");
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr1_CoreTime+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr1_CoreTime+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,34 :: 		strcat(txtDisplayRow1, txtMn);
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Time_Core_txtMn_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Time_Core_txtMn_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,35 :: 		strcat(txtDisplayRow1, "/");
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr2_CoreTime+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr2_CoreTime+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,36 :: 		strcat(txtDisplayRow1, txtDay);
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Time_Core_txtDay_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Time_Core_txtDay_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,37 :: 		strcat(txtDisplayRow1, "/");
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr3_CoreTime+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr3_CoreTime+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,38 :: 		strcat(txtDisplayRow1, txtYear);
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Time_Core_txtYear_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Time_Core_txtYear_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,40 :: 		strcat(txtDisplayRow2, "TIME: ");
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr4_CoreTime+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr4_CoreTime+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,41 :: 		strcat(txtDisplayRow2, txtHour);
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Time_Core_txtHour_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Time_Core_txtHour_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,42 :: 		strcat(txtDisplayRow2, ":");
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr5_CoreTime+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr5_CoreTime+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,43 :: 		strcat(txtDisplayRow2, txtMin);
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Time_Core_txtMin_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Time_Core_txtMin_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,44 :: 		strcat(txtDisplayRow2, ":");
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr6_CoreTime+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr6_CoreTime+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,45 :: 		strcat(txtDisplayRow2, txtSec);
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Time_Core_txtSec_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Time_Core_txtSec_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CoreTime.c,47 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CoreTime.c,48 :: 		Lcd_Out(1,1,txtDisplayRow1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       Display_Time_Core_txtDisplayRow1_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow1_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CoreTime.c,49 :: 		Lcd_Out(2,1,txtDisplayRow2);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       Display_Time_Core_txtDisplayRow2_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(Display_Time_Core_txtDisplayRow2_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CoreTime.c,50 :: 		}
L_end_Display_Time_Core:
	RETURN      0
; end of _Display_Time_Core

_Read_Time:

;CoreTime.c,52 :: 		void Read_Time(unsigned char *sec, unsigned char *min, unsigned char *hr, unsigned char *week_day, unsigned char *day, unsigned char *mn, unsigned char *year) {
;CoreTime.c,53 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;CoreTime.c,54 :: 		I2C1_Wr(DEVICEID_DS1307);
	MOVLW       208
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,55 :: 		I2C1_Wr(0);
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,56 :: 		I2C1_Repeated_Start();
	CALL        _I2C1_Repeated_Start+0, 0
;CoreTime.c,57 :: 		I2C1_Wr(0xD1);
	MOVLW       209
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,58 :: 		*sec =I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_sec+0, FSR1
	MOVFF       FARG_Read_Time_sec+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,59 :: 		*min =I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_min+0, FSR1
	MOVFF       FARG_Read_Time_min+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,60 :: 		*hr =I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_hr+0, FSR1
	MOVFF       FARG_Read_Time_hr+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,61 :: 		*week_day =I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_week_day+0, FSR1
	MOVFF       FARG_Read_Time_week_day+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,62 :: 		*day =I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_day+0, FSR1
	MOVFF       FARG_Read_Time_day+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,63 :: 		*mn =I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_mn+0, FSR1
	MOVFF       FARG_Read_Time_mn+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,64 :: 		*year =I2C1_Rd(0);
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_year+0, FSR1
	MOVFF       FARG_Read_Time_year+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,65 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;CoreTime.c,66 :: 		}
L_end_Read_Time:
	RETURN      0
; end of _Read_Time

_Write_Time:

;CoreTime.c,68 :: 		void Write_Time(unsigned char min, unsigned char hours, unsigned char day, unsigned char dayofweek, unsigned char month, unsigned char year) {
;CoreTime.c,69 :: 		I2C1_Start();          // issue start signal
	CALL        _I2C1_Start+0, 0
;CoreTime.c,70 :: 		I2C1_Wr(DEVICEID_DS1307);       // address DS1307 which is 0xD0
	MOVLW       208
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,71 :: 		I2C1_Wr(0);            // start from word at address (REG0)
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,72 :: 		I2C1_Wr(0x80);         // write $80 to REG0. (pause counter + 0 sec)
	MOVLW       128
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,73 :: 		I2C1_Wr(min);            // write 0 to minutes word to (REG1)
	MOVF        FARG_Write_Time_min+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,74 :: 		I2C1_Wr(hours);         // write 17 to hours word (24-hours mode)(REG2)
	MOVF        FARG_Write_Time_hours+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,76 :: 		I2C1_Wr(dayofweek);         // write 5 - Tuesday (REG3)
	MOVF        FARG_Write_Time_dayofweek+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,77 :: 		I2C1_Wr(day);         // write 18 to date word (REG4)
	MOVF        FARG_Write_Time_day+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,78 :: 		I2C1_Wr(month);         // write 10 (Oct) to month word (REG5)
	MOVF        FARG_Write_Time_month+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,79 :: 		I2C1_Wr(year);         // write 12 to year word (REG6)
	MOVF        FARG_Write_Time_year+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,80 :: 		I2C1_Stop();           // issue stop signal
	CALL        _I2C1_Stop+0, 0
;CoreTime.c,82 :: 		I2C1_Start();          // issue start signal
	CALL        _I2C1_Start+0, 0
;CoreTime.c,83 :: 		I2C1_Wr(DEVICEID_DS1307);       // address DS1307 which is 0xD0
	MOVLW       208
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,84 :: 		I2C1_Wr(0);            // start from word at address 0
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,85 :: 		I2C1_Wr(0);            // write 0 to REG0 (enable counting + 0 sec)
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CoreTime.c,86 :: 		I2C1_Stop();           // issue stop signal
	CALL        _I2C1_Stop+0, 0
;CoreTime.c,87 :: 		}
L_end_Write_Time:
	RETURN      0
; end of _Write_Time

_GetTimeStruct:

;CoreTime.c,89 :: 		void GetTimeStruct(TimeStruct *time) {
;CoreTime.c,91 :: 		unsigned char txtSec[5] = "";
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
;CoreTime.c,99 :: 		Read_Time(&local_sec,&local_min1,&local_hr,&local_week_day,&local_day,&local_mn,&local_year);
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
;CoreTime.c,101 :: 		WordToHex(local_sec, txtSec);
	MOVF        GetTimeStruct_local_sec_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtSec_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtSec_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,102 :: 		WordToHex(local_min1, txtMin);
	MOVF        GetTimeStruct_local_min1_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtMin_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtMin_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,103 :: 		WordToHex(local_hr, txtHour);
	MOVF        GetTimeStruct_local_hr_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtHour_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtHour_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,104 :: 		WordToHex(local_day, txtDay);
	MOVF        GetTimeStruct_local_day_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtDay_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtDay_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,105 :: 		WordToHex(local_mn, txtMn);
	MOVF        GetTimeStruct_local_mn_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtMn_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtMn_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,106 :: 		WordToHex(local_year, txtYear);
	MOVF        GetTimeStruct_local_year_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtYear_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtYear_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,107 :: 		WordToHex(local_week_day, txtWeekDay);
	MOVF        GetTimeStruct_local_week_day_L0+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVLW       0
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       GetTimeStruct_txtWeekDay_L0+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(GetTimeStruct_txtWeekDay_L0+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;CoreTime.c,109 :: 		MakeLastTwoChars(txtSec);
	MOVLW       GetTimeStruct_txtSec_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtSec_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,110 :: 		MakeLastTwoChars(txtMin);
	MOVLW       GetTimeStruct_txtMin_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtMin_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,111 :: 		MakeLastTwoChars(txtHour);
	MOVLW       GetTimeStruct_txtHour_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtHour_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,112 :: 		MakeLastTwoChars(txtDay);
	MOVLW       GetTimeStruct_txtDay_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtDay_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,113 :: 		MakeLastTwoChars(txtMn);
	MOVLW       GetTimeStruct_txtMn_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtMn_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,114 :: 		MakeLastTwoChars(txtYear);
	MOVLW       GetTimeStruct_txtYear_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtYear_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,115 :: 		MakeLastTwoChars(txtWeekDay);
	MOVLW       GetTimeStruct_txtWeekDay_L0+0
	MOVWF       FARG_MakeLastTwoChars_txt+0 
	MOVLW       hi_addr(GetTimeStruct_txtWeekDay_L0+0)
	MOVWF       FARG_MakeLastTwoChars_txt+1 
	CALL        _MakeLastTwoChars+0, 0
;CoreTime.c,117 :: 		local_sec = atoi(txtSec);
	MOVLW       GetTimeStruct_txtSec_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtSec_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_sec_L0+0 
;CoreTime.c,118 :: 		local_min1 = atoi(txtMin);
	MOVLW       GetTimeStruct_txtMin_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtMin_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_min1_L0+0 
;CoreTime.c,119 :: 		local_hr = atoi(txtHour);
	MOVLW       GetTimeStruct_txtHour_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtHour_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_hr_L0+0 
;CoreTime.c,120 :: 		local_day = atoi(txtDay);
	MOVLW       GetTimeStruct_txtDay_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtDay_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_day_L0+0 
;CoreTime.c,121 :: 		local_mn = atoi(txtMn);
	MOVLW       GetTimeStruct_txtMn_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtMn_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_mn_L0+0 
;CoreTime.c,122 :: 		local_year = atoi(txtYear);
	MOVLW       GetTimeStruct_txtYear_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtYear_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_year_L0+0 
;CoreTime.c,123 :: 		local_week_day = atoi(txtWeekDay);
	MOVLW       GetTimeStruct_txtWeekDay_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(GetTimeStruct_txtWeekDay_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       GetTimeStruct_local_week_day_L0+0 
;CoreTime.c,125 :: 		time->ss = local_sec;
	MOVFF       FARG_GetTimeStruct_time+0, FSR1
	MOVFF       FARG_GetTimeStruct_time+1, FSR1H
	MOVF        GetTimeStruct_local_sec_L0+0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,126 :: 		time->mn = local_min1;
	MOVLW       1
	ADDWF       FARG_GetTimeStruct_time+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetTimeStruct_time+1, 0 
	MOVWF       FSR1H 
	MOVF        GetTimeStruct_local_min1_L0+0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,127 :: 		time->hh = local_hr;
	MOVLW       2
	ADDWF       FARG_GetTimeStruct_time+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetTimeStruct_time+1, 0 
	MOVWF       FSR1H 
	MOVF        GetTimeStruct_local_hr_L0+0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,128 :: 		time->md = local_day;
	MOVLW       3
	ADDWF       FARG_GetTimeStruct_time+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetTimeStruct_time+1, 0 
	MOVWF       FSR1H 
	MOVF        GetTimeStruct_local_day_L0+0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,129 :: 		time->mo = local_mn;
	MOVLW       5
	ADDWF       FARG_GetTimeStruct_time+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetTimeStruct_time+1, 0 
	MOVWF       FSR1H 
	MOVF        GetTimeStruct_local_mn_L0+0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,130 :: 		time->yy = local_year;
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
;CoreTime.c,131 :: 		time->wd = local_week_day;
	MOVLW       4
	ADDWF       FARG_GetTimeStruct_time+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetTimeStruct_time+1, 0 
	MOVWF       FSR1H 
	MOVF        GetTimeStruct_local_week_day_L0+0, 0 
	MOVWF       POSTINC1+0 
;CoreTime.c,132 :: 		}
L_end_GetTimeStruct:
	RETURN      0
; end of _GetTimeStruct

_MakeLastTwoChars:

;CoreTime.c,134 :: 		void MakeLastTwoChars(unsigned char *txt){
;CoreTime.c,136 :: 		strcpy(txtSec, txt);
	MOVLW       MakeLastTwoChars_txtSec_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(MakeLastTwoChars_txtSec_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVF        FARG_MakeLastTwoChars_txt+0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        FARG_MakeLastTwoChars_txt+1, 0 
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CoreTime.c,137 :: 		txtSec[0] = txtSec[2];
	MOVF        MakeLastTwoChars_txtSec_L0+2, 0 
	MOVWF       MakeLastTwoChars_txtSec_L0+0 
;CoreTime.c,138 :: 		txtSec[1] = txtSec[3];
	MOVF        MakeLastTwoChars_txtSec_L0+3, 0 
	MOVWF       MakeLastTwoChars_txtSec_L0+1 
;CoreTime.c,139 :: 		txtSec[2] = '\0';
	CLRF        MakeLastTwoChars_txtSec_L0+2 
;CoreTime.c,141 :: 		if ( txtSec[0] == ' ' )
	MOVF        MakeLastTwoChars_txtSec_L0+0, 0 
	XORLW       32
	BTFSS       STATUS+0, 2 
	GOTO        L_MakeLastTwoChars0
;CoreTime.c,142 :: 		txtSec[0] = '0';
	MOVLW       48
	MOVWF       MakeLastTwoChars_txtSec_L0+0 
L_MakeLastTwoChars0:
;CoreTime.c,144 :: 		strcpy(txt, txtSec);
	MOVF        FARG_MakeLastTwoChars_txt+0, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        FARG_MakeLastTwoChars_txt+1, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       MakeLastTwoChars_txtSec_L0+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(MakeLastTwoChars_txtSec_L0+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CoreTime.c,145 :: 		}
L_end_MakeLastTwoChars:
	RETURN      0
; end of _MakeLastTwoChars

_DisplayTimeStruct:

;CoreTime.c,147 :: 		void DisplayTimeStruct(TimeStruct *time) {
;CoreTime.c,148 :: 		Display_Time_Core(&(time->ss), &(time->mn), &(time->hh), &(time->md), &(time->mo), &(time->yy));
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
;CoreTime.c,149 :: 		}
L_end_DisplayTimeStruct:
	RETURN      0
; end of _DisplayTimeStruct
