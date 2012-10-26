#include <LibTime.h>
#include <LibChron.h>
#include <CoreTime.h>

void GetEntry(unsigned char *entry, EntryStruct *entry_s) {
	entry_s->en = entry[0]; // Enable
	entry_s->id = entry[1]; // DeviceID
	entry_s->ds = entry[2]; // DeviceState
	entry_s->mnl = entry[3]; // MinutesLower
	entry_s->mnc = entry[4]; // MinutesClassifier
	entry_s->mnu = entry[5]; // MinutesUpper
	entry_s->hhl = entry[6]; // HourLower
	entry_s->hhc = entry[7]; // HourClassifier
	entry_s->hhu = entry[8]; // HourUpper
	entry_s->mdl = entry[9]; // MonthDayLower
	entry_s->mdc = entry[10]; // MonthDayClassifier
	entry_s->mdu = entry[11]; // MonthDayUpper
	entry_s->wdl = entry[12]; // WeekdayLower
	entry_s->wdc = entry[13]; // WeekdayClassifier
	entry_s->wdu = entry[14]; // WeekdayUpper
	entry_s->mol = entry[15]; // MonthLower
	entry_s->moc = entry[16]; // MonthClassifier
	entry_s->mou = entry[17]; // MonthUpper
	entry_s->yyl = entry[18]; // YearLower
	entry_s->yyc = entry[19]; // YearClassifier
	entry_s->yyu = entry[20]; // YearUpper
}

void PrintEntry() {
	
}

unsigned char ActivateEntry(EntryStruct *entry, TimeStruct *time) {
	// only work with enabled schedules
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