#include "GlobalConst.h"
#include "CoreUSB.h"
#include "ConfigLCD.h"
#include "CoreTest.h"
#include "CoreTime.h"
#include "CoreLCD.h"
#include "timelib.h"

enum CLASSDATA {
        ASTERISK = 255,
        DASH = 254,
        SLASH = 253,
        ON = 252,
        OFF = 251,
        EMPTY = 250
} classifierdata;

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
        
        LATD = 0xFF;
        Delay_ms(200);
        LATD = 0x00;
        Delay_ms(100);
        LATD = 0xFF;
        Delay_ms(100);
        LATD = 0x00;
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
        unsigned char end_of_signal = 0;
        unsigned char page=0, address=0, address_count=0, entry_on_page=0;
        unsigned char is_read_broken = 0, is_write_broken = 0;
        unsigned char str_usbDiagnostics[16], str_usbDiagnostics_a[16];

        init_core();
        I2C1_Init(100000);
        
        // begin usb routine
        USB_Buffer_Clear();
        
        // Begin HID Communications
        HID_Enable(&readbuff,&writebuff);

        while(GetOpMode() == USB_TEST){
                LCD_1Row_Write("USB MODE");
                while(!HID_Read() && GetOpMode() == USB_TEST);

                if ((int)readbuff[0] == 0) {
                        LCD_1Row_Write("Sending Time"); Delay_ms(500);
                        USB_Buffer_Time();
                        while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);
                        LCD_1Row_Write("Time Sent"); Delay_ms(1000);

                } else if ((int)readbuff[0] == 1) {
                        // read entire memory bank - per page
                        for (page=0; page<EEPROM_MEMORY_BANKS; page++){
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
                        EEPROM_Write(0x00, readbuff[1] + 1);
                        for (page=0; page<EEPROM_MEMORY_BANKS; page++){
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
                                                // LCD_1Row_Write("Writing Byte"); Delay_ms(1000);
                                                I2C_Write_Byte_To_EEPROM(mempages_write[page], address, readbuff[address_count+2]);
                                                writebuff[address_count+3] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
                                                address++;
                                                // LCD_1Row_Write("Finished writing Byte"); Delay_ms(500);
                                        }
                                        
                                        // if wala na mo sunod ang gisend sa computer, end na diari :D
                                        if ((int)readbuff[2] > 0) {
                                                //LCD_1Row_Write("Finished writing Entry"); Delay_ms(500);
                                                while(!HID_Write(&writebuff,64) && GetOpMode() == USB_TEST);  // send
                                                //LCD_1Row_Write("Read Sent"); Delay_ms(500);
                                                //LCD_1Row_Write("Writeing Another");
                                                while(!HID_Read() && GetOpMode() == USB_TEST);                // wait for respsonse to continue
                                                if (!(readbuff[0] == 4)) {
                                                        is_write_broken = 1;
                                                        LCD_1Row_Write("Write Error"); Delay_ms(1000);
                                                        break;
                                                }
                                        }
                                        else 
                                        {
                                                end_of_signal = 1;
                                                break;
                                        }
                                }
                                if (end_of_signal == 1) {
                                        break;
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
        Write_Time(readbuff[1], readbuff[2], readbuff[3], readbuff[4], readbuff[5], readbuff[6]);

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
        // Variable Initializations
        TimeStruct t;
        unsigned char numberofentries, page, entry_on_page, address_count, address;
        unsigned char entry[21], number_of_entries_read = 0;
        unsigned char debug[16] = "", debug_buffer[3];
        unsigned char debug2[16] = "", debug_buffer2[3];
        unsigned char entryflag, entrypointer;

        // Initialize related tech.
        init_core(); // Initialize Program
        I2C1_Init(100000); // Initialize IC2 for both EEPROM and RTC

        // Loop in reading EEPROM and Applying Schedule Entries
        while (GetOpMode() == I2C_RTC_TEST) {
                // Number of entries is recorded on the first byte of the PIC EEPROM.
                numberofentries = EEPROM_Read(0x00); Delay_ms(20);

                for ( page=0; page<EEPROM_MEMORY_BANKS; page++ ){
                        if (number_of_entries_read >= numberofentries) break;
                        address=0; // re initialize address to 0 because this is a new page.
                        for (entry_on_page=0; entry_on_page < EEPROM_ENTRY_PER_PAGE; entry_on_page++) {
                                if (number_of_entries_read >= numberofentries) break;
                                
                                // retreive the schedule entry
                                for (address_count=0; address_count < EEPROM_ENTRY_LENGTH; address_count++) {
                                        entry[address_count] = I2C_Read_Byte_From_EEPROM(mempages_write[page], mempages_read[page], address);
                                        address++;

                                        // perform comparison here
         /*strcpy(debug, "Addr: ");
                                        ByteToStr(address_count, debug_buffer);
                                        strcat(debug, debug_buffer);
                                        strcpy(debug2, "Byte: ");
                                        ByteToStr(entry[address_count], debug_buffer2);
                                        strcat(debug2, debug_buffer2);
                                        LCD_2Row_Write(debug, debug2); Delay_ms(1000);*/
                                }

                                // get the current time from RTC Memory
                                GetTimeStruct(&t);
                                DisplayTimeStruct(&t); Delay_ms(500);

                                entryflag = 0;
                                
                                if( entry[3] == t.mn || entry[3] == ASTERISK) {
                                        entryflag = 1;
                                } else {
                                        break;
                                }
                                
                                if ( entry[6] == t.hh ||  entry[6] == ASTERISK) {
                                        entryflag = 1;
                                } else {
                                        break;
                                }
                                
                                

                                if (entryflag == 1) {
                                        switch (entry[1]) {
                                                case 0:
                                                        LATD0_bit = 1;
                                                        break;
                                                case 1:
                                                        LATD1_bit = 1;
                                                        break;
                                                case 2:
                                                        LATD2_bit = 1;
                                                        break;
                                                case 3:
                                                        LATD3_bit = 1;
                                                        break;
                                                case 4:
                                                        LATD4_bit = 1;
                                                        break;
                                                case 5:
                                                        LATD5_bit = 1;
                                                        break;
                                                case 6:
                                                        LATD6_bit = 1;
                                                        break;
                                                case 7:
                                                        LATD7_bit = 1;
                                                        break;
                                                default:
                                                        break;
                                        }
                                }

                                // perform comparison here
/*strcpy(debug, "Entries: ");
                                ByteToStr(number_of_entries_read, debug_buffer);
                                strcat(debug, debug_buffer);
                                LCD_1Row_Write(debug);*/
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
        I2C1_Start();              // issue I2C start signal
        I2C1_Wr(page_write);             // send byte via I2C  (device address + W)
        I2C1_Wr(address);             // send byte (data address)
        I2C1_Repeated_Start();     // issue I2C signal repeated start
        I2C1_Wr(page_read);             // send byte (device address + R)
        x = I2C1_Rd(0);       // Read the data (NO acknowledge)
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
        I2C1_Stop();        // issue I2C stop signal
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
                                Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
                                Delay_ms(200);
                                TIME_Mode();
                                break;
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