#include "GlobalConst.h"
#include "CoreUSB.h"
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
	MMC_TEST,
	I2C_EEPROM_TEST
} opstate;

void interrupt() {
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

	TRISA = 0x03;
	LATA = 0x03;
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
	/*      unsigned char   ss ;    // seconds
	unsigned char   mn ;    // minutes
	unsigned char   hh ;    // hours
	unsigned char   md ;    // day in month, from 1 to 31
	unsigned char   wd ;    // day in week, monday=0, tuesday=1, .... sunday=6
	unsigned char   mo ;    // month number, from 1 to 12 (and not from 0 to 11 as with unix C time !)
	unsigned int    yy ;    // year Y2K compliant, from 1892 to 2038*/

	//unsigned short x = 0;

	unsigned char page=0, address=0, address_count=0, entry_on_page=0;
	unsigned char is_read_broken = 0, is_write_broken = 0;
	unsigned char str_usbDiagnostics[16];

	init_core();
	I2C1_Init(100000); //
	Write_Time(); // Write the new time
	
	// begin usb routine
	for(cnt=0;cnt<64;cnt++) {
		writebuff[cnt] = 0;
	}
	
	// Begin HID Communications
	HID_Enable(&readbuff,&writebuff);

	while(GetOpMode() == USB_TEST){
		LCD_1Row_Write("Waiting Command");
		while(!HID_Read() && GetOpMode() == USB_TEST);

		if ((int)readbuff[0] == 0) {
			LCD_1Row_Write("Sending Time"); Delay_ms(1000);
			USB_Buffer_Time();
			while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
			LCD_1Row_Write("Time Sent 00"); Delay_ms(1000);

		} else if ((int)readbuff[0] == 1) {
			// read entire memory bank - per page
			for (page=0; page<8; page++){
				if (is_read_broken == 1) {
					is_read_broken = 0;
					break;
				}
				address=0; // re initialize address to 0 because this is a new page.
				for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
					writebuff[0] = 0; // 0 start
					writebuff[1] = 2; // command code
					writebuff[2] = page; // page
					for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
						writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
						address++;
					}
					while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
					while(!HID_Read() && GetOpMode() == USB_TEST);                // wait for respsonse to continue
					if (!(readbuff[0] == 2)) {
						is_read_broken = 1;
						LCD_1Row_Write("Read Error"); Delay_ms(1000);
						break;
					}
				}
			}
			writebuff[0] = 0;
			writebuff[1] = 3;
			while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
			if (is_read_broken == 0) {
				LCD_1Row_Write("Entries Sent"); Delay_ms(1000);
			} else {
				LCD_1Row_Write("Read Error"); Delay_ms(1000);
				is_read_broken = 0;
			}
		} else if ((int)readbuff[0] == 7) {
			// write entire memory bank with test content
			LCD_1Row_Write("Writing..."); Delay_ms(1000);
			for (page=0; page<8; page++){
				if (is_write_broken == 1) {
					is_write_broken = 0;
					break;
				}
				address=0; // re initialize address to 0 because this is a new page.
				for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
					//LCD_1Row_Write("Writing Page"); Delay_ms(1000);
					writebuff[0] = 0; // 0 start
					writebuff[1] = 6; // command code
					writebuff[2] = page; // page
					for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
						//LCD_1Row_Write("Writing Byte"); Delay_ms(1000);
						I2C_Write_Byte_To_EEPROM(mempages_write[page], address, address_count+3);
						writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
						address++;
						//LCD_1Row_Write("Finished writing Byte"); Delay_ms(500);
					}
					//LCD_1Row_Write("Finished writing Entry"); Delay_ms(500);
					while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
					//LCD_1Row_Write("Read Sent"); Delay_ms(500);
					//LCD_1Row_Write("Writeing Another");
					while(!HID_Read() && GetOpMode() == USB_TEST);                // wait for respsonse to continue
					if (!(readbuff[0] == 4)) {
						is_write_broken = 1;
						LCD_1Row_Write("Write Error"); Delay_ms(1000);
						break;
					} else {
						LCD_1Row_Write("Write Ok"); Delay_ms(1000);
					}
				}
			}
			writebuff[0] = 0;
			writebuff[1] = 5;	
			writebuff[2] = is_write_broken;
			while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
			if (is_write_broken == 0) {
				LCD_1Row_Write("Entries Written"); Delay_ms(1000);
			} else {
				LCD_1Row_Write("Write Error"); Delay_ms(1000);
				is_write_broken = 0;
			}
		} else {
			TestUSBInput(str_usbDiagnostics);
			LCD_2Row_Write("No Operation", str_usbDiagnostics); Delay_ms(3000);
		}
	}

	HID_Disable();
	LCD_1Row_Write("USB MODE EXITED");
	Delay_ms(2000);

}



void USB_Buffer_Clear() {
	int i=0;
	for (i=0; i<64; i++) {
		writebuff[i] = 0;
	}
}

void USB_Buffer_Time() {
	TimeStruct t;
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

void LCD_Mode() {
	Lcd_Cmd(_LCD_CLEAR); // Clear LCD display
	LCD_2Row_Write("Johannah Mae", "I   U");
	LCD_Write_Heart(2, 3);
	Lcd_Cmd(_LCD_CURSOR_OFF);
}

void TIME_Mode() {
	TimeStruct t;
	//init_main();
	init_core();
	I2C1_Init(100000); //
	Write_Time(); // Write the new time
	while (GetOpMode() == I2C_RTC_TEST) {
		Delay_ms(500);
		GetTimeStruct(&t);
		DisplayTimeStruct(&t);
	}
	LCD_1Row_Write("TIME MODE EXITED");
	Delay_ms(2000);
}

unsigned char I2C_Read_Byte_From_EEPROM(unsigned char page_write, unsigned char page_read, unsigned char address) {
	unsigned char x;
	I2C1_Init(100000);
	I2C1_Start();              // issue I2C start signal
	I2C1_Wr(page_write);             // send byte via I2C  (device address + W)
	I2C1_Wr(address);             // send byte (data address)
	I2C1_Repeated_Start();     // issue I2C signal repeated start
	I2C1_Wr(page_read);             // send byte (device address + R)
	x = I2C1_Rd(0);       // Read the data (NO acknowledge)
	Delay_ms(10);
	I2C1_Stop();               // issue I2C stop signal
	return x;
	Delay_ms(20);
}

void I2C_Write_Byte_To_EEPROM(unsigned char page_write, unsigned char address, unsigned char byte2write) {
	I2C1_Init(100000);         // initialize I2C communication
	I2C1_Start();              // issue I2C start signal
	I2C1_Wr(page_write);             // send byte via I2C  (device address + W)
	I2C1_Wr(address);             // send byte (address of EEPROM location)
	I2C1_Wr(byte2write);             // send data (data to be written)
	I2C1_Stop();	// issue I2C stop signal
	Delay_ms(20);
}

void I2C_Test_EEPROM() {
	unsigned char x;

	init_core();
	I2C1_Init(100000);         // initialize I2C communication
	I2C1_Start();              // issue I2C start signal
	I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
	I2C1_Wr(0x02);             // send byte (address of EEPROM location)
	I2C1_Wr(0x41);             // send data (data to be written)
	I2C1_Stop();               // issue I2C stop signal

	Delay_100ms();
	LCD_1Row_Write("WRITE FINISHED");
	Lcd_Chr(2, 3, 0x41);

	Delay_100ms();
	LCD_1Row_Write("READ STARTED");
	Delay_100ms();
	I2C1_Init(100000);
	I2C1_Start();              // issue I2C start signal
	I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
	I2C1_Wr(0x02);             // send byte (data address)
	I2C1_Repeated_Start();     // issue I2C signal repeated start
	I2C1_Wr(0xA3);             // send byte (device address + R)
	x = I2C1_Rd(0);       // Read the data (NO acknowledge)
	I2C1_Stop();               // issue I2C stop signal

	Delay_ms(300);
	LCD_1Row_Write("READ FINISHED");
	Lcd_Chr(2, 3, x);
	Delay_ms(2000);

	while (GetOpMode() == I2C_EEPROM_TEST);
}

short GetOpMode() {
	if (RA0_bit && !RA1_bit) {
		opstate = USB_TEST;
	} else if ( !RA0_bit && RA1_bit) {
		opstate = I2C_EEPROM_TEST;
	} else {
		opstate = I2C_RTC_TEST;
	}

	return opstate;
}

void main() {
	// opstate = I2C_RTC_TEST;        
	init_main();
	TestInitializeAllPins();

	while (1) {
		//GetOperationMode();
		GetOpMode();
		//opstate = I2C_EEPROM_TEST;
		switch (opstate) {
			case I2C_EEPROM_TEST:
				LCD_1Row_Write("I2C_EEPROM_TEST");
				I2C_Test_EEPROM();
				break;
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

void TestUSBInput(char *output_string) {
	unsigned char buff_diag_a[16], buff_diag_b[16], buff_diag_c[16],  buff_diag_d[16],  buff_diag_e[16];
	ShortToStr(readbuff[0], buff_diag_d);
	ShortToStr(readbuff[1], buff_diag_a);
	ShortToStr(readbuff[2], buff_diag_b);
	strcpy(output_string, "");
	strcat(output_string, buff_diag_d);
	strcat(output_string, buff_diag_a);
	strcat(output_string, buff_diag_b);
}