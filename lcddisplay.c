#include "GlobalConst.h"
#include "ConfigLCD.h"
#include "CoreTest.h"
#include "CoreTime.h"
#include "CoreMultimediaCard.h" 
#include "CoreTestKeypad.h"
#include "CoreLCD.h"
#include "timelib.h"

enum OPSTATES {
	LCD_TEST = 49,
	USB_TEST,
	I2C_RTC_TEST,
	KEYPAD_TEST,
	MMC_TEST
} opstate;

void interrupt(){
   USB_Interrupt_Proc(); // USB servicing is done inside the interrupt
}

void init_core() {
	ADCON1 = 0x0F; // page 268, disable analaog
	CMCON = 0x07; // disable comparator
	INTCON2 = 0x80; // disable pull up in port b

	LATA = 0x00; // Make all output ports 0
	LATC = 0x00; // Make all output ports 0
	LATD = 0x00; // Make all output ports 0
	LATE = 0x00; // Make all output ports 0
	
	TRISA = 0x00; // Make all ports output
	TRISC = 0x00; // Make all ports output
	TRISD = 0x00; // Make all ports output
	TRISE = 0x00; // Make all ports output

	PORTA = 0x00; // Make all ports 0
	PORTC = 0x00; // Make all ports 0
	PORTD = 0x00; // Make all ports 0
	PORTE = 0x00; // Make all ports 0
}

void init_main() {
	init_core();
	Lcd_Init(); // Initialize LCD
	Lcd_Cmd(_LCD_CLEAR); // Clear LCD display
	Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	Lcd_Out(1, 1, "Hardware Cron");
	Delay_ms(1000);
}

void GetOperationMode() {
	LCD_2Row_Write("Choose mode of", "Operation:");
	opstate = Keypad_Get_Key();
}

void USB_Mode() {
	unsigned char readbuff[64] absolute 0x500;   // Buffers should be in USB RAM, please consult datasheet
	unsigned char writebuff[64] absolute 0x540;
	unsigned short x = 0;
	
	// begin usb routine
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
				PORTB =  0xFF;
			}
		}

		while(!HID_Write(&writebuff,64))
		;
		
		x++;
	}
}

void LCD_Mode() {
	Lcd_Cmd(_LCD_CLEAR); // Clear LCD display
	LCD_2Row_Write("Johannah Mae", "I   U");
	LCD_Write_Heart(2, 3);
	Lcd_Cmd(_LCD_CURSOR_OFF);
}

void TIME_Mode() {
	// TimeStruct t;
	unsigned short x = 0;
	unsigned char sec, min1, hr, week_day, day, mn, year;
	init_core();
	I2C1_Init(100000); // 
	//Write_Time(); // Write the new time
	while (x < 3) {
		TestStripeAllPins();
		Read_Time(&sec,&min1,&hr,&week_day,&day,&mn,&year);
		Transform_Time(&sec,&min1,&hr,&week_day,&day,&mn,&year);
		
		Lcd_Cmd(_LCD_CLEAR);
		Display_Time(sec, min1, hr, week_day, day, mn, year);
		Delay_ms(20);
		
		// GetTimeStruct(&t);
		// DisplayTimeStruct(&t);
		
		x++;
	}
}

void main() {
	// opstate = I2C_RTC_TEST;	
	init_main();
	TestInitializeAllPins();
	
	while (1) {
		GetOperationMode();
		// opstate = I2C_RTC_TEST;	
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
				Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
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