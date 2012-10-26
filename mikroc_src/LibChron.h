#ifndef _LIBCHRON_H
#define _LIBCHRON_H

#include <LibTime.h>
#include <LibChron.h>
#include <CoreTime.h>

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

#endif 