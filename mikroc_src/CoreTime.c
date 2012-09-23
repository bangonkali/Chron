#include "CoreTime.h"

#ifndef DS1307
#define DS1307 0xD0
#endif

void Display_Time_Core(char *sec, char *min, char *hr, char *day, char *mn, char *year) {
	// for some other testing
	char txtSec[5] = "";
	char txtMin[5] = "";
	char txtHour[5] = "";
	char txtDay[5] = "";
	char txtMn[5] = "";
	char txtYear[5] = "";
	char txtDisplayRow1[16] = "";
	char txtDisplayRow2[16] = "";

	WordToHex(*sec, txtSec);
	WordToHex(*min, txtMin);
	WordToHex(*hr, txtHour);
	WordToHex(*day, txtDay);
	WordToHex(*mn, txtMn);
	WordToHex(*year, txtYear);

	MakeLastTwoChars(txtSec);
	MakeLastTwoChars(txtMin);
	MakeLastTwoChars(txtHour);
	MakeLastTwoChars(txtDay);
	MakeLastTwoChars(txtMn);
	MakeLastTwoChars(txtYear);
	
	strcat(txtDisplayRow1, "DATE: ");
	strcat(txtDisplayRow1, txtMn);
	strcat(txtDisplayRow1, "/");
	strcat(txtDisplayRow1, txtDay);
	strcat(txtDisplayRow1, "/");
	strcat(txtDisplayRow1, txtYear);
	
	strcat(txtDisplayRow2, "TIME: ");
	strcat(txtDisplayRow2, txtHour);
	strcat(txtDisplayRow2, ":");
	strcat(txtDisplayRow2, txtMin);
	strcat(txtDisplayRow2, ":");
	strcat(txtDisplayRow2, txtSec);

	Lcd_Cmd(_LCD_CLEAR);
	Lcd_Out(1,1,txtDisplayRow1);
	Lcd_Out(2,1,txtDisplayRow2);
}

void Display_Time(char sec, char min, char hr, char week_day, char day, char mn, char year) {
	char *txt;
	switch(week_day){
		case 1: txt="Sun"; break;
		case 2: txt="Mon"; break;
		case 3: txt="Tue"; break;
		case 4: txt="Wed"; break;
		case 5: txt="Thu"; break;
		case 6: txt="Fri"; break;
		case 7: txt="Sat"; break;
	}

	Lcd_Init();
	Lcd_Cmd(_LCD_CLEAR);               // Clear display
	Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

	Lcd_Out(1,1,txt);
	Lcd_Chr(1, 6, (day / 10)   + 48);    // Print tens digit of day variable
	Lcd_Chr(1, 7, (day % 10)   + 48);    // Print oness digit of day variable
	Lcd_Chr(1, 9, (mn / 10) + 48);
	Lcd_Chr(1,10, (mn % 10) + 48);
	Lcd_Chr(1,12,  (year / 10)  + 48);          // Print year vaiable + 8 (start from year 2008)
	Lcd_Chr(1,13,  (year % 10)  + 48);

	Lcd_Chr(2, 6, (hr / 10)   + 48);
	Lcd_Chr(2, 7, (hr % 10)   + 48);
	Lcd_Chr(2, 9, (min / 10) + 48);
	Lcd_Chr(2,10, (min % 10) + 48);
	Lcd_Chr(2,12, (sec / 10) + 48);
	Lcd_Chr(2,13, (sec % 10) + 48);
}

void Transform_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year) {
	*sec  =  ((*sec & 0x70) >> 4)*10 + (*sec & 0x0F);
	*min  =  ((*min & 0xF0) >> 4)*10 + (*min & 0x0F);
	*hr   =  ((*hr & 0x30) >> 4)*10 + (*hr & 0x0F);
	*week_day =(*week_day & 0x07);
	*day  =  ((*day & 0xF0) >> 4)*10 + (*day & 0x0F);
	*mn   =  ((*mn & 0x10) >> 4)*10 + (*mn & 0x0F);
	*year =  ((*year & 0xF0)>>4)*10+(*year & 0x0F);
}

void Read_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year) {
	I2C1_Start();
	I2C1_Wr(0xD0);
	I2C1_Wr(0);
	I2C1_Repeated_Start();
	I2C1_Wr(0xD1);
	*sec =I2C1_Rd(1);
	*min =I2C1_Rd(1);
	*hr =I2C1_Rd(1);
	*week_day =I2C1_Rd(1);
	*day =I2C1_Rd(1);
	*mn =I2C1_Rd(1);
	*year =I2C1_Rd(0);
	I2C1_Stop();
}

void Write_Time() {
	I2C1_Start();          // issue start signal
	I2C1_Wr(0xD0);       // address DS1307 which is 0xD0
	I2C1_Wr(0);            // start from word at address (REG0)
	I2C1_Wr(0x80);         // write $80 to REG0. (pause counter + 0 sec)
	I2C1_Wr(0);            // write 0 to minutes word to (REG1)
	I2C1_Wr(0x17);         // write 17 to hours word (24-hours mode)(REG2)
	I2C1_Wr(0x02);         // write 2 - Monday (REG3)
	I2C1_Wr(0x04);         // write 4 to date word (REG4)
	I2C1_Wr(0x05);         // write 5 (May) to month word (REG5)
	I2C1_Wr(0x01);         // write 01 to year word (REG6)
	I2C1_Stop();           // issue stop signal

	I2C1_Start();          // issue start signal
	I2C1_Wr(0xD0);       // address DS1307 which is 0xD0
	I2C1_Wr(0);            // start from word at address 0
	I2C1_Wr(0);            // write 0 to REG0 (enable counting + 0 sec)
	I2C1_Stop();           // issue stop signal
}

void GetTimeStruct(TimeStruct *time) {
	unsigned char local_sec, local_min1, local_hr, local_week_day, local_day, local_mn, local_year;
	Read_Time(&local_sec,&local_min1,&local_hr,&local_week_day,&local_day,&local_mn,&local_year);
	time->ss = local_sec;
	time->mn = local_min1;
	time->hh = local_hr;
	time->md = local_day;
	time->mo = local_mn;
	time->yy = local_year;
}

void MakeLastTwoChars(char *txt){
	char txtSec[10];
	strcpy(txtSec, txt);
	txtSec[0] = txtSec[2];
	txtSec[1] = txtSec[3];
	txtSec[2] = '\0';
	strcpy(txt, txtSec);
}

void DisplayTimeStruct(TimeStruct *time) {
	Display_Time_Core(&(time->ss), &(time->mn), &(time->hh), &(time->md), &(time->mo), &(time->yy));
}