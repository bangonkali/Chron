#line 1 "D:/Chron/mikroc_src/lcddisplay.c"
#line 1 "d:/chron/mikroc_src/globalconst.h"







char cnt;
char keypadPort at PORTD;

char kk;

unsigned char mempages_read[] = {0xA1, 0xA3, 0xA5, 0xA7, 0xA9, 0xAB, 0xAD, 0xAF};
unsigned char mempages_write[] = {0xA0, 0xA2, 0xA4, 0xA6, 0xA8, 0xAA, 0xAC, 0xAE};
unsigned char numberofentries;

char *res;
char txt_sub[] = "98";

void USB_Buffer_Clear();
void interrupt();
void init_core();
void init_main();
void GetOperationMode();
void USB_Mode();
void TIME_Mode();
void I2C_Test_EEPROM();
short GetOpMode();

void USB_Buffer_Time();
unsigned char I2C_Read_Byte_From_EEPROM(unsigned char page_write, unsigned char page_read, unsigned char address);
void I2C_Write_Byte_To_EEPROM(unsigned char page_write, unsigned char address, unsigned char byte2write);
void TestUSBInput(char *output_string);
#line 1 "d:/chron/mikroc_src/coreusb.h"




unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;
#line 1 "d:/chron/mikroc_src/configlcd.h"



sbit LCD_RS at RB3_bit;
sbit LCD_EN at RB2_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB3_bit;
sbit LCD_EN_Direction at TRISB2_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;
#line 1 "d:/chron/mikroc_src/coretest.h"



void TestInitializeAllPins();
void TestStripeAllPins();
void IntToChar(char *dest, char *src);
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
void Write_Time(unsigned char sec, unsigned char min, unsigned char hours, unsigned char day, unsigned char dayofweek, unsigned char month, unsigned char year);

void GetTimeStruct(TimeStruct *time);
void MakeLastTwoChars(unsigned char *txt);
void DisplayTimeStruct(TimeStruct *time);
#line 1 "d:/chron/mikroc_src/corelcd.h"



void LCD_2Row_Write(char *textstring_a, char *textstring_b);
void LCD_1Row_Write(char *textstring_a);
void LCD_Write_Heart(char pos_row, char pos_char);
#line 1 "d:/chron/mikroc_src/libtime.h"
#line 1 "d:/chron/mikroc_src/libchron.h"
#line 1 "d:/chron/mikroc_src/libtime.h"
#line 1 "d:/chron/mikroc_src/libchron.h"
#line 1 "d:/chron/mikroc_src/coretime.h"
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
#line 10 "D:/Chron/mikroc_src/lcddisplay.c"
enum OPSTATES {
 LCD_TEST = 49,
 USB_TEST,
 I2C_RTC_TEST,
 KEYPAD_TEST,
 MMC_TEST,
 I2C_EEPROM_TEST
} opstate;

void interrupt() {
 USB_Interrupt_Proc();
}

void init_core() {
 ADCON1 = 0x0F;
 CMCON = 0x07;
 INTCON2 = 0x80;

 LATA = 0x00;
 LATC = 0x00;
 LATD = 0x00;
 LATE = 0x00;

 TRISA = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;

 PORTA = 0x00;
 PORTC = 0x00;
 PORTD = 0x00;
 PORTE = 0x00;

 TRISA = 0x03;
 LATA = 0x03;
}

void init_main() {
 unsigned char entry[16];

 init_core();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 GetEntriesStr(entry);
 LCD_2Row_Write("Chron Scheduler", entry); Delay_ms(1500);
 LCD_2Row_Write("Abestano", "Johannah Mae"); Delay_ms(500);
 LCD_2Row_Write("Enanor", "Caryl Keen"); Delay_ms(500);
 LCD_2Row_Write("Regalado", "Gil Michael"); Delay_ms(500);

 LATD = 0xFF;
 Delay_ms(200);
 LATD = 0x00;
 Delay_ms(100);
 LATD = 0xFF;
 Delay_ms(100);
 LATD = 0x00;
}

void USB_Mode() {
#line 81 "D:/Chron/mikroc_src/lcddisplay.c"
 unsigned char end_of_signal = 0;
 unsigned char page=0, address=0, address_count=0, entry_on_page=0;
 unsigned char is_read_broken = 0, is_write_broken = 0;
 unsigned char str_usbDiagnostics[16], str_usbDiagnostics_a[16];

 init_core();
 I2C1_Init(100000);


 USB_Buffer_Clear();


 HID_Enable(&readbuff,&writebuff);

 while(GetOpMode() == USB_TEST){
 LCD_1Row_Write("USB MODE");
 while(!HID_Read() && GetOpMode() == USB_TEST);

 if ((int)readbuff[0] == 0) {
 EEPROM_Write(0x00, 0);
 LCD_1Row_Write("Sending Time"); Delay_ms(500);
 USB_Buffer_Time();
 while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
 LCD_1Row_Write("Time Sent"); Delay_ms(1000);

 } else if ((int)readbuff[0] == 1) {

 for (page=0; page< 8 ; page++){
 if (is_read_broken == 1) {
 is_read_broken = 0;
 break;
 }
 address=0;
 for (entry_on_page=0; entry_on_page <  12 ; entry_on_page++) {
 USB_Buffer_Clear();
 writebuff[0] = 0;
 writebuff[1] = 2;
 writebuff[2] = page;
 for (address_count=0; address_count <  21 ; address_count++) {
 writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
 address++;
 }
 while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
 while(!HID_Read() && GetOpMode() == USB_TEST);
 if (!(readbuff[0] == 2)) {
 is_read_broken = 1;
 LCD_1Row_Write("Read Error"); Delay_ms(1000);
 break;
 }
 }
 }

 USB_Buffer_Clear();
 writebuff[0] = 0;
 writebuff[1] = 3;
 while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
 if (is_read_broken == 0) {
 LCD_1Row_Write("Entries Sent"); Delay_ms(1000);
 } else {
 LCD_1Row_Write("Read Error"); Delay_ms(1000);
 is_read_broken = 0;
 }
 } else if ((int)readbuff[0] == 7) {
 end_of_signal = 0;
 EEPROM_Write(0x00, readbuff[1] + 1);
 for (page=0; page< 8 ; page++){
 if (is_write_broken == 1) {
 is_write_broken = 0;
 break;
 }

 if (end_of_signal == 1) {
 break;
 }

 address=0;
 for (entry_on_page=0; entry_on_page <  12 ; entry_on_page++) {

 USB_Buffer_Clear();
 writebuff[0] = 0;
 writebuff[1] = 6;
 writebuff[2] = page;

 for (address_count=0; address_count <  21 ; address_count++) {

 I2C_Write_Byte_To_EEPROM(mempages_write[page], address, readbuff[address_count+2]);
 writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
 address++;

 }

 while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
 while(!HID_Read() && GetOpMode() == USB_TEST);
 if (!(readbuff[0] == 4)) {
 is_write_broken = 1;
 LCD_1Row_Write("Write Error"); Delay_ms(1000);
 break;
 }


 if ((int)readbuff[2] == 0) {
 end_of_signal = 1;
 break;
 }
 }
 }

 USB_Buffer_Clear();
 writebuff[0] = 0;
 writebuff[1] = 5;
 writebuff[2] = is_write_broken;
 while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
 if (is_write_broken == 0) {
 LCD_1Row_Write("Entries Written"); Delay_ms(1000);
 } else {
 LCD_1Row_Write("Write Error"); Delay_ms(1000);
 is_write_broken = 0;
 }

 if (end_of_signal == 1) {
 LCD_1Row_Write("End of Signal"); Delay_ms(1000);
 is_write_broken = 0;
 }
 } else {
 TestUSBInput(str_usbDiagnostics);
 LCD_2Row_Write("No Operation", str_usbDiagnostics); Delay_ms(1000);
 }
 }

 HID_Disable();
 LCD_1Row_Write("USB MODE EXITED");
 Delay_ms(1000);
}

void USB_Buffer_Clear() {
 int i=0;
 for (i=0; i<64; i++) {
 writebuff[i] = 0;
 }
}

void USB_Buffer_Time() {
 TimeStruct t;
 Write_Time(readbuff[7], readbuff[1], readbuff[2], readbuff[3], readbuff[4], readbuff[5], readbuff[6]);

 GetTimeStruct(&t);
 writebuff[0] = 0;
 writebuff[1] = 0;
 writebuff[2] = t.ss;
 writebuff[3] = t.mn;
 writebuff[4] = t.hh;
 writebuff[5] = t.md;
 writebuff[6] = t.wd;
 writebuff[7] = t.mo;
 writebuff[8] = t.yy;
}

void TIME_Mode() {

 TimeStruct t;
 EntryStruct ts;
 unsigned char page, entry_on_page, address_count, address, number_of_entries_read = 0, entry[21];
 unsigned char debug[16] = "", debug_buffer[3];
 unsigned char debug2[16] = "", debug_buffer2[3];
 unsigned char entryflag, entrypointer;
 unsigned char redisplay_lag = 0;


 init_core();
 I2C1_Init(100000);


 while (GetOpMode() == I2C_RTC_TEST) {

 numberofentries = EEPROM_Read(0x00); Delay_ms(20);

 while (numberofentries > 95) {
 GetTimeStruct(&t);
 DisplayTimeStruct(&t);
 Delay_ms(250);
 }

 for ( page=0; page< 8 ; page++ ){
 if (number_of_entries_read >= numberofentries) break;
 address=0;
 for (entry_on_page=0; entry_on_page <  12 ; entry_on_page++) {
 if (number_of_entries_read >= numberofentries) break;


 for (address_count=0; address_count <  21 ; address_count++) {
 entry[address_count] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
 address++;
#line 281 "D:/Chron/mikroc_src/lcddisplay.c"
 }


 GetTimeStruct(&t);
 LATD7_bit = LATD7_bit;
 if (redisplay_lag > 3) {
 DisplayTimeStruct(&t);
 redisplay_lag = 0;
 }

 redisplay_lag++;


 GetEntry(&entry, &ts);
 ActivateEntry(&ts, &t);
#line 303 "D:/Chron/mikroc_src/lcddisplay.c"
 number_of_entries_read++;
 }
 }

 number_of_entries_read = 0;
 }

 LCD_1Row_Write("TIME MODE EXITED"); Delay_ms(2000);
}

unsigned char I2C_Read_Byte_From_EEPROM(unsigned char page_write, unsigned char page_read, unsigned char address) {
 unsigned char x;
 I2C1_Init(100000);
 I2C1_Start();
 I2C1_Wr(page_write);
 I2C1_Wr(address);
 I2C1_Repeated_Start();
 I2C1_Wr(page_read);
 x = I2C1_Rd(0);
 I2C1_Stop();
 return x;
 Delay_ms(20);
}

void I2C_Write_Byte_To_EEPROM(unsigned char page_write, unsigned char address, unsigned char byte2write) {
 I2C1_Init(100000);
 I2C1_Start();
 I2C1_Wr(page_write);
 I2C1_Wr(address);
 I2C1_Wr(byte2write);
 I2C1_Stop();
 Delay_ms(20);
}

short GetOpMode() {
 if (RA0_bit && !RA1_bit) {
 opstate = USB_TEST;
 } else if ( !RA0_bit && RA1_bit) {
 opstate = I2C_RTC_TEST;
 }

 return opstate;
}

void main() {

 init_main();
 while (1) {
 GetOpMode();
 switch (opstate) {
 case USB_TEST:
 LCD_1Row_Write("USB Mode");
 USB_Mode();
 break;
 case I2C_RTC_TEST:
 LCD_1Row_Write("I2C RTC Mode");
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Delay_ms(200);
 TIME_Mode();
 break;
 default:
 LCD_2Row_Write("Select Mode", "USB or RTC");
 Delay_ms(1000);
 break;
 }
 }
}

void TestUSBInput(char *output_string) {
 unsigned char buff_diag_a[16], buff_diag_b[16], buff_diag_c[16], buff_diag_d[16], buff_diag_e[16];
 ShortToStr(readbuff[0], buff_diag_d);
 ShortToStr(readbuff[1], buff_diag_a);
 ShortToStr(readbuff[2], buff_diag_b);
 strcpy(output_string, "");
 strcat(output_string, buff_diag_d);
 strcat(output_string, buff_diag_a);
 strcat(output_string, buff_diag_b);
}
