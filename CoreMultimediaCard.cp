#line 1 "D:/ACADS/EE188/time/CoreMultimediaCard.c"
#line 1 "d:/acads/ee188/time/configmultimediacard.h"




sbit Mmc_Chip_Select at LATA5_bit;
sbit Mmc_Chip_Select_Direction at TRISA5_bit;
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
#line 4 "D:/ACADS/EE188/time/CoreMultimediaCard.c"
const MMC_LINE_LEN = 43;
char mmc_err_txt[20] = "FAT16 not found";
char file_contents[MMC_LINE_LEN] = "XX MMC/SD FAT16 library by Anton Rieckertn";
char filename[14] = "MIKRO00x.TXT";
unsigned short mmc_loop, mmc_loop_b;
unsigned long mmc_iterator, mmc_size;
char MMC_Buffer[512];


void LCD_Write_Line(char *uart_text) {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
 Lcd_Out(1,1,uart_text);
}


void M_Create_New_File() {
 filename[7] = 'A';
 Mmc_Fat_Set_File_Date(2010, 4, 19, 9, 0, 0);
 Mmc_Fat_Assign(&filename, 0xA0);
 Mmc_Fat_Rewrite();
 for(mmc_loop = 1; mmc_loop <= 99; mmc_loop++) {

 file_contents[0] = mmc_loop / 10 + 48;
 file_contents[1] = mmc_loop % 10 + 48;
 Mmc_Fat_Write(file_contents, MMC_LINE_LEN-1);
 }
}


void M_Create_Multiple_Files() {
 for(mmc_loop_b = 'B'; mmc_loop_b <= 'Z'; mmc_loop_b++) {

 filename[7] = mmc_loop_b;
 Mmc_Fat_Set_File_Date(2010, 4, 19, 9, 0, 0);
 Mmc_Fat_Assign(&filename, 0xA0);
 Mmc_Fat_Rewrite();
 for(mmc_loop = 1; mmc_loop <= 44; mmc_loop++) {
 file_contents[0] = mmc_loop / 10 + 48;
 file_contents[1] = mmc_loop % 10 + 48;
 Mmc_Fat_Write(file_contents, MMC_LINE_LEN-1);
 }
 }
}


void M_Open_File_Rewrite() {
 filename[7] = 'C';
 Mmc_Fat_Assign(&filename, 0);
 Mmc_Fat_Rewrite();
 for(mmc_loop = 1; mmc_loop <= 55; mmc_loop++) {
 file_contents[0] = mmc_loop / 10 + 48;
 file_contents[1] = mmc_loop % 10 + 48;
 Mmc_Fat_Write(file_contents, MMC_LINE_LEN-1);
 }
}



void M_Open_File_Append() {
 filename[7] = 'B';
 Mmc_Fat_Assign(&filename, 0);
 Mmc_Fat_Set_File_Date(2010, 4, 19, 9, 20, 0);
 Mmc_Fat_Append();
 Mmc_Fat_Write(" for mikroElektronika 2010n", 27);
}


void M_Open_File_Read() {
 char character;

 filename[7] = 'B';
 Mmc_Fat_Assign(&filename, 0);
 Mmc_Fat_Reset(&mmc_size);
 for (mmc_iterator = 1; mmc_iterator <= mmc_size; mmc_iterator++) {
 Mmc_Fat_Read(&character);

 }
}



void M_Delete_File() {
 filename[7] = 'F';
 Mmc_Fat_Assign(filename, 0);
 Mmc_Fat_Delete();
}



void M_Test_File_Exist() {
 unsigned long fsize;
 unsigned int year;
 unsigned short month, day, hour, minute;
 unsigned char outstr[12];

 filename[7] = 'B';

 if (Mmc_Fat_Assign(filename, 0)) {

 Mmc_Fat_Get_File_Date(&year, &month, &day, &hour, &minute);
 LCD_Write_Line(" created: ");
 WordToStr(year, outstr);
 LCD_Write_Line(outstr);
 ByteToStr(month, outstr);
 LCD_Write_Line(outstr);
 WordToStr(day, outstr);
 LCD_Write_Line(outstr);
 WordToStr(hour, outstr);
 LCD_Write_Line(outstr);
 WordToStr(minute, outstr);
 LCD_Write_Line(outstr);


 Mmc_Fat_Get_File_Date_Modified(&year, &month, &day, &hour, &minute);
 LCD_Write_Line(" modified: ");
 WordToStr(year, outstr);
 LCD_Write_Line(outstr);
 ByteToStr(month, outstr);
 LCD_Write_Line(outstr);
 WordToStr(day, outstr);
 LCD_Write_Line(outstr);
 WordToStr(hour, outstr);
 LCD_Write_Line(outstr);
 WordToStr(minute, outstr);
 LCD_Write_Line(outstr);


 fsize = Mmc_Fat_Get_File_Size();
 LongToStr((signed long)fsize, outstr);
 LCD_Write_Line(outstr);
 }
 else {


 Delay_ms(1000);

 }
}




void M_Create_Swap_File() {
 unsigned int mmc_iterator;

 for(mmc_iterator=0; mmc_iterator<512; mmc_iterator++)
 MMC_Buffer[mmc_iterator] = mmc_iterator;

 mmc_size = Mmc_Fat_Get_Swap_File(5000, "mikroE.txt", 0x20);

 if (mmc_size) {
 LongToStr((signed long)mmc_size, mmc_err_txt);
 LCD_Write_Line(mmc_err_txt);

 for(mmc_iterator=0; mmc_iterator<5000; mmc_iterator++) {
 Mmc_Write_Sector(mmc_size++, MMC_Buffer);

 }
 }
}

void M_Test_Routine() {
 if (M_Test_Verify() == 0) {

 SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);

 LCD_Write_Line("Test Start.");

 M_Create_New_File();
#line 183 "D:/ACADS/EE188/time/CoreMultimediaCard.c"
 LCD_Write_Line("Test End.");
 }
}


void M_Test_Begin() {



 UART1_Init(19200);
 Delay_ms(10);

 LCD_Write_Line("PIC-Started");


 SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV64, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);


 if (Mmc_Fat_Init() == 0) {
 LCD_Write_Line("PIC-Accepted");
 M_Test_Routine();
 }
 else {
 LCD_Write_Line(mmc_err_txt);


 LCD_Write_Line("PIC-Formatting MMC Card");
 Mmc_Fat_QuickFormat("MMC CARD");
 LCD_Write_Line("PIC-Formatting MMC Card Done");
 M_Test_Routine();
 }
}

int M_Test_Verify() {
 if (Mmc_Fat_Init() == 0) {
 return 0;
 } else {
 LCD_Write_Line(mmc_err_txt);
 return -1;
 }
}
