
_GetEntry:

;LibChron.c,5 :: 		void GetEntry(unsigned char *entry, EntryStruct *entry_s) {
;LibChron.c,6 :: 		entry_s->en = entry[0]; // Enable
	MOVFF       FARG_GetEntry_entry+0, FSR0
	MOVFF       FARG_GetEntry_entry+1, FSR0H
	MOVFF       FARG_GetEntry_entry_s+0, FSR1
	MOVFF       FARG_GetEntry_entry_s+1, FSR1H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,7 :: 		entry_s->id = entry[1]; // DeviceID
	MOVLW       1
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       1
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,8 :: 		entry_s->ds = entry[2]; // DeviceState
	MOVLW       2
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       2
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,9 :: 		entry_s->mnl = entry[3]; // MinutesLower
	MOVLW       3
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       3
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,10 :: 		entry_s->mnc = entry[4]; // MinutesClassifier
	MOVLW       4
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       4
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,11 :: 		entry_s->mnu = entry[5]; // MinutesUpper
	MOVLW       5
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       5
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,12 :: 		entry_s->hhl = entry[6]; // HourLower
	MOVLW       6
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       6
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,13 :: 		entry_s->hhc = entry[7]; // HourClassifier
	MOVLW       7
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       7
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,14 :: 		entry_s->hhu = entry[8]; // HourUpper
	MOVLW       8
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       8
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,15 :: 		entry_s->mdl = entry[9]; // MonthDayLower
	MOVLW       9
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       9
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,16 :: 		entry_s->mdc = entry[10]; // MonthDayClassifier
	MOVLW       10
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       10
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,17 :: 		entry_s->mdu = entry[11]; // MonthDayUpper
	MOVLW       11
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       11
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,18 :: 		entry_s->wdl = entry[12]; // WeekdayLower
	MOVLW       12
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       12
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,19 :: 		entry_s->wdc = entry[13]; // WeekdayClassifier
	MOVLW       13
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       13
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,20 :: 		entry_s->wdu = entry[14]; // WeekdayUpper
	MOVLW       14
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       14
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,21 :: 		entry_s->mol = entry[15]; // MonthLower
	MOVLW       15
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       15
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,22 :: 		entry_s->moc = entry[16]; // MonthClassifier
	MOVLW       16
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       16
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,23 :: 		entry_s->mou = entry[17]; // MonthUpper
	MOVLW       17
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       17
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,24 :: 		entry_s->yyl = entry[18]; // YearLower
	MOVLW       18
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       18
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,25 :: 		entry_s->yyc = entry[19]; // YearClassifier
	MOVLW       19
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       19
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,26 :: 		entry_s->yyu = entry[20]; // YearUpper
	MOVLW       20
	ADDWF       FARG_GetEntry_entry_s+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry_s+1, 0 
	MOVWF       FSR1H 
	MOVLW       20
	ADDWF       FARG_GetEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_GetEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;LibChron.c,27 :: 		}
L_end_GetEntry:
	RETURN      0
; end of _GetEntry

_PrintEntry:

;LibChron.c,29 :: 		void PrintEntry() {
;LibChron.c,31 :: 		}
L_end_PrintEntry:
	RETURN      0
; end of _PrintEntry

_ActivateEntry:

;LibChron.c,33 :: 		unsigned char ActivateEntry(EntryStruct *entry, TimeStruct *time) {
;LibChron.c,35 :: 		if (entry->en == 1) {
	MOVFF       FARG_ActivateEntry_entry+0, FSR0
	MOVFF       FARG_ActivateEntry_entry+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_ActivateEntry0
;LibChron.c,36 :: 		if (entry->mnc == DASH) {
	MOVLW       4
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       254
	BTFSS       STATUS+0, 2 
	GOTO        L_ActivateEntry1
;LibChron.c,37 :: 		if (time->mn > entry->mnu && time->mn < entry->mnl) {
	MOVLW       1
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       FSR0H 
	MOVLW       5
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	SUBWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ActivateEntry4
	MOVLW       1
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       R2 
	MOVLW       3
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR2H 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC2+0, 0 
	SUBWF       POSTINC0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ActivateEntry4
L__ActivateEntry71:
;LibChron.c,38 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_ActivateEntry
;LibChron.c,39 :: 		}
L_ActivateEntry4:
;LibChron.c,40 :: 		}
L_ActivateEntry1:
;LibChron.c,41 :: 		if (entry->mnl != time->mn && entry->mnl != ASTERISK) {
	MOVLW       3
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVLW       1
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry7
	MOVLW       3
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry7
L__ActivateEntry70:
;LibChron.c,42 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_ActivateEntry
;LibChron.c,43 :: 		}
L_ActivateEntry7:
;LibChron.c,46 :: 		if (entry->hhc == DASH) {
	MOVLW       7
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       254
	BTFSS       STATUS+0, 2 
	GOTO        L_ActivateEntry8
;LibChron.c,47 :: 		if (time->hh > entry->hhu && time->hh < entry->hhl) {
	MOVLW       2
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       FSR0H 
	MOVLW       8
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	SUBWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ActivateEntry11
	MOVLW       2
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       R2 
	MOVLW       6
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR2H 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC2+0, 0 
	SUBWF       POSTINC0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ActivateEntry11
L__ActivateEntry69:
;LibChron.c,48 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_ActivateEntry
;LibChron.c,49 :: 		}
L_ActivateEntry11:
;LibChron.c,50 :: 		}
L_ActivateEntry8:
;LibChron.c,51 :: 		if (entry->hhl != time->hh && entry->hhl != ASTERISK) {
	MOVLW       6
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVLW       2
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry14
	MOVLW       6
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry14
L__ActivateEntry68:
;LibChron.c,52 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_ActivateEntry
;LibChron.c,53 :: 		}
L_ActivateEntry14:
;LibChron.c,56 :: 		if (entry->mdc == DASH) {
	MOVLW       10
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       254
	BTFSS       STATUS+0, 2 
	GOTO        L_ActivateEntry15
;LibChron.c,57 :: 		if (time->md > entry->mdu && time->md < entry->mdl) {
	MOVLW       3
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       FSR0H 
	MOVLW       11
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	SUBWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ActivateEntry18
	MOVLW       3
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       R2 
	MOVLW       9
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR2H 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC2+0, 0 
	SUBWF       POSTINC0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ActivateEntry18
L__ActivateEntry67:
;LibChron.c,58 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_ActivateEntry
;LibChron.c,59 :: 		}
L_ActivateEntry18:
;LibChron.c,60 :: 		}
L_ActivateEntry15:
;LibChron.c,61 :: 		if (entry->mdl != time->md && entry->mdl != ASTERISK) {
	MOVLW       9
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVLW       3
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry21
	MOVLW       9
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry21
L__ActivateEntry66:
;LibChron.c,62 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_ActivateEntry
;LibChron.c,63 :: 		}
L_ActivateEntry21:
;LibChron.c,66 :: 		if (entry->wdc == DASH) {
	MOVLW       13
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       254
	BTFSS       STATUS+0, 2 
	GOTO        L_ActivateEntry22
;LibChron.c,67 :: 		if (time->wd > entry->wdu && time->wd < entry->wdl) {
	MOVLW       4
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       FSR0H 
	MOVLW       14
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	SUBWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ActivateEntry25
	MOVLW       4
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       R2 
	MOVLW       12
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR2H 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC2+0, 0 
	SUBWF       POSTINC0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ActivateEntry25
L__ActivateEntry65:
;LibChron.c,68 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_ActivateEntry
;LibChron.c,69 :: 		}
L_ActivateEntry25:
;LibChron.c,70 :: 		}
L_ActivateEntry22:
;LibChron.c,71 :: 		if (entry->wdl != time->wd && entry->wdl != ASTERISK) {
	MOVLW       12
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVLW       4
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry28
	MOVLW       12
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry28
L__ActivateEntry64:
;LibChron.c,72 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_ActivateEntry
;LibChron.c,73 :: 		}
L_ActivateEntry28:
;LibChron.c,76 :: 		if (entry->moc == DASH) {
	MOVLW       16
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       254
	BTFSS       STATUS+0, 2 
	GOTO        L_ActivateEntry29
;LibChron.c,77 :: 		if (time->mo > entry->mou && time->mo < entry->mol) {
	MOVLW       5
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       FSR0H 
	MOVLW       17
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	SUBWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ActivateEntry32
	MOVLW       5
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       R2 
	MOVLW       15
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR2H 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC2+0, 0 
	SUBWF       POSTINC0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ActivateEntry32
L__ActivateEntry63:
;LibChron.c,78 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_ActivateEntry
;LibChron.c,79 :: 		}
L_ActivateEntry32:
;LibChron.c,80 :: 		}
L_ActivateEntry29:
;LibChron.c,81 :: 		if (entry->mol != time->mo && entry->mol != ASTERISK) {
	MOVLW       15
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVLW       5
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry35
	MOVLW       15
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry35
L__ActivateEntry62:
;LibChron.c,82 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_ActivateEntry
;LibChron.c,83 :: 		}
L_ActivateEntry35:
;LibChron.c,86 :: 		if (entry->yyc == DASH) {
	MOVLW       19
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       254
	BTFSS       STATUS+0, 2 
	GOTO        L_ActivateEntry36
;LibChron.c,87 :: 		if (time->yy > entry->yyu && time->yy < entry->yyl) {
	MOVLW       6
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       20
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R0 
	MOVF        R3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ActivateEntry75
	MOVF        R2, 0 
	SUBWF       R1, 0 
L__ActivateEntry75:
	BTFSC       STATUS+0, 0 
	GOTO        L_ActivateEntry39
	MOVLW       6
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       R1 
	MOVLW       18
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R4 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ActivateEntry76
	MOVF        R4, 0 
	SUBWF       R2, 0 
L__ActivateEntry76:
	BTFSC       STATUS+0, 0 
	GOTO        L_ActivateEntry39
L__ActivateEntry61:
;LibChron.c,88 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_ActivateEntry
;LibChron.c,89 :: 		}
L_ActivateEntry39:
;LibChron.c,90 :: 		}
L_ActivateEntry36:
;LibChron.c,91 :: 		if (entry->yyl != time->yy && entry->yyl != ASTERISK) {
	MOVLW       18
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       6
	ADDWF       FARG_ActivateEntry_time+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_time+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ActivateEntry77
	MOVF        R1, 0 
	XORWF       R3, 0 
L__ActivateEntry77:
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry42
	MOVLW       18
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry42
L__ActivateEntry60:
;LibChron.c,92 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_ActivateEntry
;LibChron.c,93 :: 		}
L_ActivateEntry42:
;LibChron.c,95 :: 		switch (entry->id) {
	MOVLW       1
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FLOC__ActivateEntry+0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FLOC__ActivateEntry+1 
	GOTO        L_ActivateEntry43
;LibChron.c,96 :: 		case ASTERISK:
L_ActivateEntry45:
;LibChron.c,97 :: 		if (GetDeviseFinalState(entry->ds)) {
	MOVLW       2
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_GetDeviseFinalState_deviceCommState+0 
	CALL        _GetDeviseFinalState+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry46
;LibChron.c,98 :: 		LATD = 0xFF;
	MOVLW       255
	MOVWF       LATD+0 
;LibChron.c,99 :: 		} else {
	GOTO        L_ActivateEntry47
L_ActivateEntry46:
;LibChron.c,100 :: 		LATD = 0x00;
	CLRF        LATD+0 
;LibChron.c,101 :: 		}
L_ActivateEntry47:
;LibChron.c,102 :: 		break;
	GOTO        L_ActivateEntry44
;LibChron.c,103 :: 		case 0:
L_ActivateEntry48:
;LibChron.c,104 :: 		LATD0_bit = GetDeviseFinalState(entry->ds);
	MOVLW       2
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_GetDeviseFinalState_deviceCommState+0 
	CALL        _GetDeviseFinalState+0, 0
	BTFSC       R0, 0 
	GOTO        L__ActivateEntry78
	BCF         LATD0_bit+0, 0 
	GOTO        L__ActivateEntry79
L__ActivateEntry78:
	BSF         LATD0_bit+0, 0 
L__ActivateEntry79:
;LibChron.c,105 :: 		break;
	GOTO        L_ActivateEntry44
;LibChron.c,106 :: 		case 1:
L_ActivateEntry49:
;LibChron.c,107 :: 		LATD1_bit = GetDeviseFinalState(entry->ds);
	MOVLW       2
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_GetDeviseFinalState_deviceCommState+0 
	CALL        _GetDeviseFinalState+0, 0
	BTFSC       R0, 0 
	GOTO        L__ActivateEntry80
	BCF         LATD1_bit+0, 1 
	GOTO        L__ActivateEntry81
L__ActivateEntry80:
	BSF         LATD1_bit+0, 1 
L__ActivateEntry81:
;LibChron.c,108 :: 		break;
	GOTO        L_ActivateEntry44
;LibChron.c,109 :: 		case 2:
L_ActivateEntry50:
;LibChron.c,110 :: 		LATD2_bit = GetDeviseFinalState(entry->ds);
	MOVLW       2
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_GetDeviseFinalState_deviceCommState+0 
	CALL        _GetDeviseFinalState+0, 0
	BTFSC       R0, 0 
	GOTO        L__ActivateEntry82
	BCF         LATD2_bit+0, 2 
	GOTO        L__ActivateEntry83
L__ActivateEntry82:
	BSF         LATD2_bit+0, 2 
L__ActivateEntry83:
;LibChron.c,111 :: 		break;
	GOTO        L_ActivateEntry44
;LibChron.c,112 :: 		case 3:
L_ActivateEntry51:
;LibChron.c,113 :: 		LATD3_bit = GetDeviseFinalState(entry->ds);
	MOVLW       2
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_GetDeviseFinalState_deviceCommState+0 
	CALL        _GetDeviseFinalState+0, 0
	BTFSC       R0, 0 
	GOTO        L__ActivateEntry84
	BCF         LATD3_bit+0, 3 
	GOTO        L__ActivateEntry85
L__ActivateEntry84:
	BSF         LATD3_bit+0, 3 
L__ActivateEntry85:
;LibChron.c,114 :: 		break;
	GOTO        L_ActivateEntry44
;LibChron.c,115 :: 		case 4:
L_ActivateEntry52:
;LibChron.c,116 :: 		LATD4_bit = GetDeviseFinalState(entry->ds);
	MOVLW       2
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_GetDeviseFinalState_deviceCommState+0 
	CALL        _GetDeviseFinalState+0, 0
	BTFSC       R0, 0 
	GOTO        L__ActivateEntry86
	BCF         LATD4_bit+0, 4 
	GOTO        L__ActivateEntry87
L__ActivateEntry86:
	BSF         LATD4_bit+0, 4 
L__ActivateEntry87:
;LibChron.c,117 :: 		break;
	GOTO        L_ActivateEntry44
;LibChron.c,118 :: 		case 5:
L_ActivateEntry53:
;LibChron.c,119 :: 		LATD5_bit = GetDeviseFinalState(entry->ds);
	MOVLW       2
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_GetDeviseFinalState_deviceCommState+0 
	CALL        _GetDeviseFinalState+0, 0
	BTFSC       R0, 0 
	GOTO        L__ActivateEntry88
	BCF         LATD5_bit+0, 5 
	GOTO        L__ActivateEntry89
L__ActivateEntry88:
	BSF         LATD5_bit+0, 5 
L__ActivateEntry89:
;LibChron.c,120 :: 		break;
	GOTO        L_ActivateEntry44
;LibChron.c,121 :: 		case 6:
L_ActivateEntry54:
;LibChron.c,122 :: 		LATD6_bit = GetDeviseFinalState(entry->ds);
	MOVLW       2
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_GetDeviseFinalState_deviceCommState+0 
	CALL        _GetDeviseFinalState+0, 0
	BTFSC       R0, 0 
	GOTO        L__ActivateEntry90
	BCF         LATD6_bit+0, 6 
	GOTO        L__ActivateEntry91
L__ActivateEntry90:
	BSF         LATD6_bit+0, 6 
L__ActivateEntry91:
;LibChron.c,123 :: 		break;
	GOTO        L_ActivateEntry44
;LibChron.c,124 :: 		case 7:
L_ActivateEntry55:
;LibChron.c,125 :: 		LATD7_bit = GetDeviseFinalState(entry->ds);
	MOVLW       2
	ADDWF       FARG_ActivateEntry_entry+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ActivateEntry_entry+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_GetDeviseFinalState_deviceCommState+0 
	CALL        _GetDeviseFinalState+0, 0
	BTFSC       R0, 0 
	GOTO        L__ActivateEntry92
	BCF         LATD7_bit+0, 7 
	GOTO        L__ActivateEntry93
L__ActivateEntry92:
	BSF         LATD7_bit+0, 7 
L__ActivateEntry93:
;LibChron.c,126 :: 		break;
	GOTO        L_ActivateEntry44
;LibChron.c,127 :: 		default:
L_ActivateEntry56:
;LibChron.c,128 :: 		break;
	GOTO        L_ActivateEntry44
;LibChron.c,129 :: 		}
L_ActivateEntry43:
	MOVFF       FLOC__ActivateEntry+0, FSR0
	MOVFF       FLOC__ActivateEntry+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry45
	MOVFF       FLOC__ActivateEntry+0, FSR0
	MOVFF       FLOC__ActivateEntry+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry48
	MOVFF       FLOC__ActivateEntry+0, FSR0
	MOVFF       FLOC__ActivateEntry+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry49
	MOVFF       FLOC__ActivateEntry+0, FSR0
	MOVFF       FLOC__ActivateEntry+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry50
	MOVFF       FLOC__ActivateEntry+0, FSR0
	MOVFF       FLOC__ActivateEntry+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry51
	MOVFF       FLOC__ActivateEntry+0, FSR0
	MOVFF       FLOC__ActivateEntry+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry52
	MOVFF       FLOC__ActivateEntry+0, FSR0
	MOVFF       FLOC__ActivateEntry+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry53
	MOVFF       FLOC__ActivateEntry+0, FSR0
	MOVFF       FLOC__ActivateEntry+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry54
	MOVFF       FLOC__ActivateEntry+0, FSR0
	MOVFF       FLOC__ActivateEntry+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_ActivateEntry55
	GOTO        L_ActivateEntry56
L_ActivateEntry44:
;LibChron.c,131 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_ActivateEntry
;LibChron.c,132 :: 		} else {
L_ActivateEntry0:
;LibChron.c,133 :: 		return 0;
	CLRF        R0 
;LibChron.c,135 :: 		}
L_end_ActivateEntry:
	RETURN      0
; end of _ActivateEntry

_GetEntriesStr:

;LibChron.c,137 :: 		void GetEntriesStr(unsigned char *out) {
;LibChron.c,140 :: 		n = EEPROM_Read(0);
	CLRF        FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GetEntriesStr_n_L0+0 
	MOVLW       0
	MOVWF       GetEntriesStr_n_L0+1 
;LibChron.c,141 :: 		strcpy(out, "Entries: ");
	MOVF        FARG_GetEntriesStr_out+0, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        FARG_GetEntriesStr_out+1, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr1_LibChron+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr1_LibChron+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;LibChron.c,142 :: 		WordToStr(n, b);
	MOVF        GetEntriesStr_n_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        GetEntriesStr_n_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       GetEntriesStr_b_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(GetEntriesStr_b_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;LibChron.c,143 :: 		strcat(out, b);
	MOVF        FARG_GetEntriesStr_out+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_GetEntriesStr_out+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       GetEntriesStr_b_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(GetEntriesStr_b_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;LibChron.c,144 :: 		}
L_end_GetEntriesStr:
	RETURN      0
; end of _GetEntriesStr

_GetDeviseFinalState:

;LibChron.c,146 :: 		unsigned char GetDeviseFinalState(unsigned char deviceCommState) {
;LibChron.c,147 :: 		if (deviceCommState == ON) {
	MOVF        FARG_GetDeviseFinalState_deviceCommState+0, 0 
	XORLW       252
	BTFSS       STATUS+0, 2 
	GOTO        L_GetDeviseFinalState58
;LibChron.c,148 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_GetDeviseFinalState
;LibChron.c,149 :: 		} else {
L_GetDeviseFinalState58:
;LibChron.c,150 :: 		return 0;
	CLRF        R0 
;LibChron.c,152 :: 		}
L_end_GetDeviseFinalState:
	RETURN      0
; end of _GetDeviseFinalState
