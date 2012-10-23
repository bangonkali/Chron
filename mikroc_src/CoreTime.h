#ifndef _CORETIME_H
#define _CORETIME_H

#ifndef DS1307
#define DS1307 0xD0
#endif

#include <LibTime.h>

void Display_Time_Core(unsigned char *sec, unsigned char *min, unsigned char *hr, unsigned char *day, unsigned char *mn, unsigned char *year);
void Display_Time(unsigned char sec, unsigned char min, unsigned char hr, unsigned char week_day, unsigned char day, unsigned char mn, unsigned char year);
void Transform_Time(unsigned char  *sec, unsigned char *min, unsigned char *hr, unsigned char *week_day, unsigned char *day, unsigned char *mn, unsigned char *year);
void Read_Time(unsigned char *sec, unsigned char *min, unsigned char *hr, unsigned char *week_day, unsigned char *day, unsigned char *mn, unsigned char *year);
void Write_Time(unsigned char min, unsigned char hours, unsigned char day, unsigned char dayofweek, unsigned char month, unsigned char year);

void GetTimeStruct(TimeStruct *time);
void MakeLastTwoChars(unsigned char *txt);
void DisplayTimeStruct(TimeStruct *time);

#endif  