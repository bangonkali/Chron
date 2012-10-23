#include <CoreTime.h>

// Used for I2C communications.
#ifndef DEVICEID_DS1307
	#define DEVICEID_DS1307 0xD0 
#endif

void Display_Time_Core(unsigned char *sec, unsigned char *min, unsigned char *hr, unsigned char *day, unsigned char *mn, unsigned char *year) {
	// for some other testing
	unsigned char txtSec[5] = "";
	unsigned char txtMin[5] = "";
	unsigned char txtHour[5] = "";
	unsigned char txtDay[5] = "";
	unsigned char txtMn[5] = "";
	unsigned char txtYear[5] = "";
	unsigned char txtDisplayRow1[16] = "";
	unsigned char txtDisplayRow2[16] = "";

	ShortToStr(*sec, txtSec);
	ShortToStr(*min, txtMin);
	ShortToStr(*hr, txtHour);
	ShortToStr(*day, txtDay);
	ShortToStr(*mn, txtMn);
	ShortToStr(*year, txtYear);

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

void Read_Time(unsigned char *sec, unsigned char *min, unsigned char *hr, unsigned char *week_day, unsigned char *day, unsigned char *mn, unsigned char *year) {
	I2C1_Start();
	I2C1_Wr(DEVICEID_DS1307);
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

void Write_Time(unsigned char min, unsigned char hours, unsigned char day, unsigned char dayofweek, unsigned char month, unsigned char year) {
	I2C1_Start();          // issue start signal
	I2C1_Wr(DEVICEID_DS1307);       // address DS1307 which is 0xD0
	I2C1_Wr(0);            // start from word at address (REG0)
	I2C1_Wr(0x80);         // write $80 to REG0. (pause counter + 0 sec)
	I2C1_Wr(min);            // write 0 to minutes word to (REG1)
	I2C1_Wr(hours);         // write 17 to hours word (24-hours mode)(REG2)

	I2C1_Wr(dayofweek);         // write 5 - Tuesday (REG3)
	I2C1_Wr(day);         // write 18 to date word (REG4)
	I2C1_Wr(month);         // write 10 (Oct) to month word (REG5)
	I2C1_Wr(year);         // write 12 to year word (REG6)
	I2C1_Stop();           // issue stop signal

	I2C1_Start();          // issue start signal
	I2C1_Wr(DEVICEID_DS1307);       // address DS1307 which is 0xD0
	I2C1_Wr(0);            // start from word at address 0
	I2C1_Wr(0);            // write 0 to REG0 (enable counting + 0 sec)
	I2C1_Stop();           // issue stop signal
}

void GetTimeStruct(TimeStruct *time) {
	unsigned char local_sec, local_min1, local_hr, local_week_day, local_day, local_mn, local_year;
	unsigned char txtSec[5] = "";
	unsigned char txtMin[5] = "";
	unsigned char txtHour[5] = "";
	unsigned char txtDay[5] = "";
	unsigned char txtMn[5] = "";
	unsigned char txtYear[5] = "";
	unsigned char txtWeekDay[5] = "";

	Read_Time(&local_sec,&local_min1,&local_hr,&local_week_day,&local_day,&local_mn,&local_year);

	WordToHex(local_sec, txtSec);
	WordToHex(local_min1, txtMin);
	WordToHex(local_hr, txtHour);
	WordToHex(local_day, txtDay);
	WordToHex(local_mn, txtMn);
	WordToHex(local_year, txtYear);
	WordToHex(local_week_day, txtWeekDay);

	MakeLastTwoChars(txtSec);
	MakeLastTwoChars(txtMin);
	MakeLastTwoChars(txtHour);
	MakeLastTwoChars(txtDay);
	MakeLastTwoChars(txtMn);
	MakeLastTwoChars(txtYear);
	MakeLastTwoChars(txtWeekDay);

	local_sec = atoi(txtSec);
	local_min1 = atoi(txtMin);
	local_hr = atoi(txtHour);
	local_day = atoi(txtDay);
	local_mn = atoi(txtMn);
	local_year = atoi(txtYear);
	local_week_day = atoi(txtWeekDay);

	time->ss = local_sec;
	time->mn = local_min1;
	time->hh = local_hr;
	time->md = local_day;
	time->mo = local_mn;
	time->yy = local_year;
	time->wd = local_week_day;
}

void MakeLastTwoChars(unsigned char *txt){
	unsigned char txtSec[10];
	strcpy(txtSec, txt);
	txtSec[0] = txtSec[2];
	txtSec[1] = txtSec[3];
	txtSec[2] = '\0';

	if ( txtSec[0] == ' ' )
		txtSec[0] = '0';

	strcpy(txt, txtSec);
}

void DisplayTimeStruct(TimeStruct *time) {
	Display_Time_Core(&(time->ss), &(time->mn), &(time->hh), &(time->md), &(time->mo), &(time->yy));
}