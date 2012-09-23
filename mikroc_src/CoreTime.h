#ifndef _CORETIME_H
#define _CORETIME_H

#ifndef DS1307
#define DS1307 0xD0
#endif

#include <timelib.h>

void Display_Time_Core(char *sec, char *min, char *hr, char *day, char *mn, char *year);
void Display_Time(char sec, char min, char hr, char week_day, char day, char mn, char year);
void Transform_Time(char  *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
void Read_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
void Write_Time();

void GetTimeStruct(TimeStruct *time);
void MakeLastTwoChars(char *txt);
void DisplayTimeStruct(TimeStruct *time);

#endif  



