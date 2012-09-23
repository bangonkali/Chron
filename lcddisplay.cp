#line 1 "D:/ACADS/EE188/time/lcddisplay.c"
#line 1 "d:/acads/ee188/time/globalconst.h"



char cnt;




char keypadPort at PORTD;

char kk;


char *res;
char txt_sub[] = "98";
#line 1 "d:/acads/ee188/time/configlcd.h"



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
#line 1 "d:/acads/ee188/time/coretest.h"



void TestInitializeAllPins();
void TestStripeAllPins();
#line 1 "d:/acads/ee188/time/coretime.h"
#line 1 "d:/acads/ee188/time/timelib.h"
#line 29 "d:/acads/ee188/time/timelib.h"
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
#line 43 "d:/acads/ee188/time/timelib.h"
extern long Time_jd1970 ;
#line 48 "d:/acads/ee188/time/timelib.h"
long Time_dateToEpoch(TimeStruct *ts) ;
void Time_epochToDate(long e, TimeStruct *ts) ;
#line 10 "d:/acads/ee188/time/coretime.h"
void Display_Time_Core(char *sec, char *min, char *hr, char *day, char *mn, char *year);
void Display_Time(char sec, char min, char hr, char week_day, char day, char mn, char year);
void Transform_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
void Read_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
void Write_Time();

void GetTimeStruct(TimeStruct *time);
void MakeLastTwoChars(char *txt);
void DisplayTimeStruct(TimeStruct *time);
#line 1 "d:/acads/ee188/time/coremultimediacard.h"



void UART1_Write_Line(char *uart_text);
void M_Create_New_File();
void M_Create_Multiple_Files();
void M_Open_File_Rewrite();
void M_Open_File_Append();
void M_Open_File_Read();
void M_Delete_File();
void M_Test_File_Exist();
void M_Create_Swap_File();
void M_Test_Begin();
void M_Test_Routine();
int M_Test_Verify();
void LCD_Write_Line(char *uart_text);
#line 1 "d:/acads/ee188/time/coretestkeypad.h"



void KeypadTest_Begin();
unsigned char Keypad_Get_Key();
void Keypad_Decode(unsigned char *kp);
#line 1 "d:/acads/ee188/time/corelcd.h"



void LCD_2Row_Write(char *textstring_a, char *textstring_b);
void LCD_1Row_Write(char *textstring_a);
void LCD_Write_Heart(char pos_row, char pos_char);
#line 1 "d:/acads/ee188/time/timelib.h"
#line 10 "D:/ACADS/EE188/time/lcddisplay.c"
enum OPSTATES {
 LCD_TEST = 49,
 USB_TEST,
 I2C_RTC_TEST,
 KEYPAD_TEST,
 MMC_TEST
} opstate;

void interrupt(){
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
}

void init_main() {
 init_core();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Hardware Cron");
 Delay_ms(1000);
}

void GetOperationMode() {
 LCD_2Row_Write("Choose mode of", "Operation:");
 opstate = Keypad_Get_Key();
}

void USB_Mode() {
 unsigned char readbuff[64] absolute 0x500;
 unsigned char writebuff[64] absolute 0x540;
 unsigned short x = 0;


 for(cnt=0;cnt<64;cnt++) {
 writebuff[cnt] = 0;
 }
 HID_Enable(&readbuff,&writebuff);

 while(x < 10){
 while(!HID_Read())
 ;

 for(cnt=0;cnt<64;cnt++) {
 writebuff[cnt]=readbuff[cnt];
 }

 res = strstr(readbuff,txt_sub);
 if (res != 0) {
 if (x==0) {
 x=1;
 PORTB =0x00;
 } else {
 x=0;
 PORTB = 0xFF;
 }
 }

 while(!HID_Write(&writebuff,64))
 ;

 x++;
 }
}

void LCD_Mode() {
 Lcd_Cmd(_LCD_CLEAR);
 LCD_2Row_Write("Johannah Mae", "I   U");
 LCD_Write_Heart(2, 3);
 Lcd_Cmd(_LCD_CURSOR_OFF);
}

void TIME_Mode() {

 unsigned short x = 0;
 unsigned char sec, min1, hr, week_day, day, mn, year;
 init_core();
 I2C1_Init(100000);

 while (x < 3) {
 TestStripeAllPins();
 Read_Time(&sec,&min1,&hr,&week_day,&day,&mn,&year);
 Transform_Time(&sec,&min1,&hr,&week_day,&day,&mn,&year);

 Lcd_Cmd(_LCD_CLEAR);
 Display_Time(sec, min1, hr, week_day, day, mn, year);
 Delay_ms(20);




 x++;
 }
}

void main() {

 init_main();
 TestInitializeAllPins();

 while (1) {
 GetOperationMode();

 switch (opstate) {
 case KEYPAD_TEST:
 LCD_1Row_Write("Keypad Mode");
 KeypadTest_Begin();
 break;
 case MMC_TEST:
 LCD_1Row_Write("SPI MMC Mode");
 M_Test_Begin();
 break;
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
 case LCD_TEST:
 LCD_Mode();
 Delay_ms(10000);
 default:
 LCD_2Row_Write("Operation Not", "Allowed");
 Delay_ms(1000);
 break;
 }
 }
}
