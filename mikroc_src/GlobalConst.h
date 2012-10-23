#ifndef _GLOBALCONST_H
#define _GLOBALCONST_H

#define EEPROM_ENTRY_PER_PAGE 12
#define EEPROM_ENTRY_LENGTH 21
#define EEPROM_MEMORY_BANKS 8

char cnt;
char keypadPort at PORTD;

char kk;

unsigned char mempages_read[] = {0xA1, 0xA3, 0xA5, 0xA7, 0xA9, 0xAB, 0xAD, 0xAF};
unsigned char mempages_write[] = {0xA0, 0xA2, 0xA4, 0xA6, 0xA8, 0xAA, 0xAC, 0xAE};
unsigned char numberofentries;

char *res;
char txt_sub[]  = "98";

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
#endif