#line 1 "D:/Chron/mikroc_src/CoreTime.c"
#line 1 "d:/chron/mikroc_src/coretime.h"
#line 1 "d:/chron/mikroc_src/libtime.h"
#line 29 "d:/chron/mikroc_src/libtime.h"
typedef struct
 {
 unsigned char ss ;
 unsigned char mn ;
 unsigned char hh ;
 unsigned char md ;
 unsigned char wd ;
 unsigned char mo ;
 unsigned int yy ;
 } TimeStruct ;
#line 43 "d:/chron/mikroc_src/libtime.h"
extern long Time_jd1970 ;
#line 48 "d:/chron/mikroc_src/libtime.h"
long Time_dateToEpoch(TimeStruct *ts) ;
void Time_epochToDate(long e, TimeStruct *ts) ;
#line 10 "d:/chron/mikroc_src/coretime.h"
void Display_Time_Core(unsigned char *sec, unsigned char *min, unsigned char *hr, unsigned char *day, unsigned char *mn, unsigned char *year);
void Display_Time(unsigned char sec, unsigned char min, unsigned char hr, unsigned char week_day, unsigned char day, unsigned char mn, unsigned char year);
void Transform_Time(unsigned char *sec, unsigned char *min, unsigned char *hr, unsigned char *week_day, unsigned char *day, unsigned char *mn, unsigned char *year);
void Read_Time(unsigned char *sec, unsigned char *min, unsigned char *hr, unsigned char *week_day, unsigned char *day, unsigned char *mn, unsigned char *year);
void Write_Time(unsigned char min, unsigned char hours, unsigned char day, unsigned char dayofweek, unsigned char month, unsigned char year);

void GetTimeStruct(TimeStruct *time);
void MakeLastTwoChars(unsigned char *txt);
void DisplayTimeStruct(TimeStruct *time);
#line 8 "D:/Chron/mikroc_src/CoreTime.c"
void Display_Time_Core(unsigned char *sec, unsigned char *min, unsigned char *hr, unsigned char *day, unsigned char *mn, unsigned char *year) {

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
 I2C1_Wr( 0xD0 );
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
 I2C1_Start();
 I2C1_Wr( 0xD0 );
 I2C1_Wr(0);
 I2C1_Wr(0x80);
 I2C1_Wr(min);
 I2C1_Wr(hours);

 I2C1_Wr(dayofweek);
 I2C1_Wr(day);
 I2C1_Wr(month);
 I2C1_Wr(year);
 I2C1_Stop();

 I2C1_Start();
 I2C1_Wr( 0xD0 );
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Stop();
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
