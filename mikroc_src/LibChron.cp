#line 1 "D:/Chron/mikroc_src/LibChron.c"
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
#line 1 "d:/chron/mikroc_src/libchron.h"
#line 1 "d:/chron/mikroc_src/libtime.h"
#line 1 "d:/chron/mikroc_src/libchron.h"
#line 1 "d:/chron/mikroc_src/coretime.h"
#line 1 "d:/chron/mikroc_src/libtime.h"
#line 10 "d:/chron/mikroc_src/coretime.h"
void Display_Time_Core(unsigned char *sec, unsigned char *min, unsigned char *hr, unsigned char *day, unsigned char *mn, unsigned char *year);
void Display_Time(unsigned char sec, unsigned char min, unsigned char hr, unsigned char week_day, unsigned char day, unsigned char mn, unsigned char year);
void Transform_Time(unsigned char *sec, unsigned char *min, unsigned char *hr, unsigned char *week_day, unsigned char *day, unsigned char *mn, unsigned char *year);
void Read_Time(unsigned char *sec, unsigned char *min, unsigned char *hr, unsigned char *week_day, unsigned char *day, unsigned char *mn, unsigned char *year);
void Write_Time(unsigned char sec, unsigned char min, unsigned char hours, unsigned char day, unsigned char dayofweek, unsigned char month, unsigned char year);

void GetTimeStruct(TimeStruct *time);
void MakeLastTwoChars(unsigned char *txt);
void DisplayTimeStruct(TimeStruct *time);
#line 8 "d:/chron/mikroc_src/libchron.h"
enum CLASSDATA {
 ASTERISK = 255,
 DASH = 254,
 SLASH = 253,
 ON = 252,
 OFF = 251,
 EMPTY = 250
};

typedef struct
{
 unsigned char en;
 unsigned char id;
 unsigned char ds;
 unsigned char mnl ;
 unsigned char mnc ;
 unsigned char mnu ;
 unsigned char hhl ;
 unsigned char hhc ;
 unsigned char hhu ;
 unsigned char mdl ;
 unsigned char mdc ;
 unsigned char mdu ;
 unsigned char wdl ;
 unsigned char wdc ;
 unsigned char wdu ;
 unsigned char mol ;
 unsigned char moc ;
 unsigned char mou ;
 unsigned char yyl ;
 unsigned char yyc ;
 unsigned char yyu ;
} EntryStruct ;

void GetEntry(unsigned char *entry, EntryStruct *entry_s);
unsigned char ActivateEntry(EntryStruct *entry, TimeStruct *time);
void GetEntriesStr(unsigned char *out);
unsigned char ActivateEntry1(EntryStruct *entry, TimeStruct *time);
unsigned char GetDeviseFinalState(unsigned char deviceCommState);
#line 1 "d:/chron/mikroc_src/coretime.h"
#line 5 "D:/Chron/mikroc_src/LibChron.c"
void GetEntry(unsigned char *entry, EntryStruct *entry_s) {
 entry_s->en = entry[0];
 entry_s->id = entry[1];
 entry_s->ds = entry[2];
 entry_s->mnl = entry[3];
 entry_s->mnc = entry[4];
 entry_s->mnu = entry[5];
 entry_s->hhl = entry[6];
 entry_s->hhc = entry[7];
 entry_s->hhu = entry[8];
 entry_s->mdl = entry[9];
 entry_s->mdc = entry[10];
 entry_s->mdu = entry[11];
 entry_s->wdl = entry[12];
 entry_s->wdc = entry[13];
 entry_s->wdu = entry[14];
 entry_s->mol = entry[15];
 entry_s->moc = entry[16];
 entry_s->mou = entry[17];
 entry_s->yyl = entry[18];
 entry_s->yyc = entry[19];
 entry_s->yyu = entry[20];
}

void PrintEntry() {

}

unsigned char ActivateEntry(EntryStruct *entry, TimeStruct *time) {

 if (entry->en == 1) {
 if (entry->mnc == DASH) {
 if (time->mn > entry->mnu && time->mn < entry->mnl) {
 return 0;
 }
 }
 if (entry->mnl != time->mn && entry->mnl != ASTERISK) {
 return 0;
 }


 if (entry->hhc == DASH) {
 if (time->hh > entry->hhu && time->hh < entry->hhl) {
 return 0;
 }
 }
 if (entry->hhl != time->hh && entry->hhl != ASTERISK) {
 return 0;
 }


 if (entry->mdc == DASH) {
 if (time->md > entry->mdu && time->md < entry->mdl) {
 return 0;
 }
 }
 if (entry->mdl != time->md && entry->mdl != ASTERISK) {
 return 0;
 }


 if (entry->wdc == DASH) {
 if (time->wd > entry->wdu && time->wd < entry->wdl) {
 return 0;
 }
 }
 if (entry->wdl != time->wd && entry->wdl != ASTERISK) {
 return 0;
 }


 if (entry->moc == DASH) {
 if (time->mo > entry->mou && time->mo < entry->mol) {
 return 0;
 }
 }
 if (entry->mol != time->mo && entry->mol != ASTERISK) {
 return 0;
 }


 if (entry->yyc == DASH) {
 if (time->yy > entry->yyu && time->yy < entry->yyl) {
 return 0;
 }
 }
 if (entry->yyl != time->yy && entry->yyl != ASTERISK) {
 return 0;
 }

 switch (entry->id) {
 case ASTERISK:
 if (GetDeviseFinalState(entry->ds)) {
 LATD = 0xFF;
 } else {
 LATD = 0x00;
 }
 break;
 case 0:
 LATD0_bit = GetDeviseFinalState(entry->ds);
 break;
 case 1:
 LATD1_bit = GetDeviseFinalState(entry->ds);
 break;
 case 2:
 LATD2_bit = GetDeviseFinalState(entry->ds);
 break;
 case 3:
 LATD3_bit = GetDeviseFinalState(entry->ds);
 break;
 case 4:
 LATD4_bit = GetDeviseFinalState(entry->ds);
 break;
 case 5:
 LATD5_bit = GetDeviseFinalState(entry->ds);
 break;
 case 6:
 LATD6_bit = GetDeviseFinalState(entry->ds);
 break;
 case 7:
 LATD7_bit = GetDeviseFinalState(entry->ds);
 break;
 default:
 break;
 }

 return 1;
 } else {
 return 0;
 }
}

void GetEntriesStr(unsigned char *out) {
 unsigned char b[4];
 int n;
 n = EEPROM_Read(0);
 strcpy(out, "Entries: ");
 WordToStr(n, b);
 strcat(out, b);
}

unsigned char GetDeviseFinalState(unsigned char deviceCommState) {
 if (deviceCommState == ON) {
 return 1;
 } else {
 return 0;
 }
}
