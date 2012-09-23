#include "ConfigMultimediaCard.h"
#include "CoreMultimediaCard.h"

const MMC_LINE_LEN = 43;
char mmc_err_txt[20] = "FAT16 not found";
char file_contents[MMC_LINE_LEN] = "XX MMC/SD FAT16 library by Anton Rieckertn";
char filename[14] = "MIKRO00x.TXT";          // File names
unsigned short mmc_loop, mmc_loop_b;
unsigned long mmc_iterator, mmc_size;
char MMC_Buffer[512];

// UART1 write text and new line (carriage return + line feed)
void LCD_Write_Line(char *uart_text) {
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
  Lcd_Out(1,1,uart_text);
}

// Creates new file and writes some data to it
void M_Create_New_File() {
  filename[7] = 'A';
  Mmc_Fat_Set_File_Date(2010, 4, 19, 9, 0, 0); // Set file date & time info
  Mmc_Fat_Assign(&filename, 0xA0);          // Find existing file or create a new one
  Mmc_Fat_Rewrite();                        // To clear file and start with new data
  for(mmc_loop = 1; mmc_loop <= 99; mmc_loop++) {
    // Lcd_Chr_Cp('.');
    file_contents[0] = mmc_loop / 10 + 48;
    file_contents[1] = mmc_loop % 10 + 48;
    Mmc_Fat_Write(file_contents, MMC_LINE_LEN-1);   // write data to the assigned file
  }
}

// Creates many new files and writes data to them
void M_Create_Multiple_Files() {
  for(mmc_loop_b = 'B'; mmc_loop_b <= 'Z'; mmc_loop_b++) {
    // Lcd_Chr_Cp(mmc_loop_b);                  // signal the progress
    filename[7] = mmc_loop_b;                 // set filename
    Mmc_Fat_Set_File_Date(2010, 4, 19, 9, 0, 0); // Set file date & time info
    Mmc_Fat_Assign(&filename, 0xA0);     // find existing file or create a new one
    Mmc_Fat_Rewrite();                   // To clear file and start with new data
    for(mmc_loop = 1; mmc_loop <= 44; mmc_loop++) {
      file_contents[0] = mmc_loop / 10 + 48;
      file_contents[1] = mmc_loop % 10 + 48;
      Mmc_Fat_Write(file_contents, MMC_LINE_LEN-1);  // write data to the assigned file
    }
  }
}

// Opens an existing file and rewrites it
void M_Open_File_Rewrite() {
  filename[7] = 'C';
  Mmc_Fat_Assign(&filename, 0);
  Mmc_Fat_Rewrite();
  for(mmc_loop = 1; mmc_loop <= 55; mmc_loop++) {
    file_contents[0] = mmc_loop / 10 + 48;
    file_contents[1] = mmc_loop % 10 + 48;
    Mmc_Fat_Write(file_contents, MMC_LINE_LEN-1);    // write data to the assigned file
  }
}

// Opens an existing file and appends data to it
//               (and alters the date/time stamp)
void M_Open_File_Append() {
   filename[7] = 'B';
   Mmc_Fat_Assign(&filename, 0);
   Mmc_Fat_Set_File_Date(2010, 4, 19, 9, 20, 0);
   Mmc_Fat_Append();                                    // Prepare file for append
   Mmc_Fat_Write(" for mikroElektronika 2010n", 27);   // Write data to assigned file
}

// Opens an existing file, reads data from it and puts it to UART
void M_Open_File_Read() {
  char character;
  
  filename[7] = 'B';
  Mmc_Fat_Assign(&filename, 0);
  Mmc_Fat_Reset(&mmc_size);            // To read file, procedure returns mmc_size of file
  for (mmc_iterator = 1; mmc_iterator <= mmc_size; mmc_iterator++) {
    Mmc_Fat_Read(&character);
    // Lcd_Chr_Cp(character);        // Write data to UART
  }
}

// Deletes a file. If file doesn't exist, it will first be created
// and then deleted.
void M_Delete_File() {
  filename[7] = 'F';
  Mmc_Fat_Assign(filename, 0);
  Mmc_Fat_Delete();
}

// Tests whether file exists, and if so sends its creation date
// and file mmc_size via UART
void M_Test_File_Exist() {
  unsigned long  fsize;
  unsigned int   year;
  unsigned short month, day, hour, minute;
  unsigned char  outstr[12];

  filename[7] = 'B';       //uncomment this line to search for file that DOES exists
//  filename[7] = 'F';       //uncomment this line to search for file that DOES NOT exist
  if (Mmc_Fat_Assign(filename, 0)) {
    //--- file has been found - get its create date
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
    
    //--- file has been found - get its modified date
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
    
    //--- get file mmc_size
    fsize = Mmc_Fat_Get_File_Size();
    LongToStr((signed long)fsize, outstr);
    LCD_Write_Line(outstr);
  }
  else {
    //--- file was not found - signal it
    // Lcd_Chr_Cp(0x55);
    Delay_ms(1000);
    // Lcd_Chr_Cp(0x55);
  }
}


// Tries to create a swap file, whose mmc_size will be at least 100
// sectors (see Help for details)
void M_Create_Swap_File() {
  unsigned int mmc_iterator;

  for(mmc_iterator=0; mmc_iterator<512; mmc_iterator++)
    MMC_Buffer[mmc_iterator] = mmc_iterator;

  mmc_size = Mmc_Fat_Get_Swap_File(5000, "mikroE.txt", 0x20);   // see help on this function for details

  if (mmc_size) {
    LongToStr((signed long)mmc_size, mmc_err_txt);
    LCD_Write_Line(mmc_err_txt);

    for(mmc_iterator=0; mmc_iterator<5000; mmc_iterator++) {
      Mmc_Write_Sector(mmc_size++, MMC_Buffer);
      // Lcd_Chr_Cp('.');
    }
  }
}

void M_Test_Routine() {
	if (M_Test_Verify() == 0) {
	// reinitialize spi at higher speed
	SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
	//--- Test start
	LCD_Write_Line("Test Start.");
	//--- Test routines. Uncomment them one-by-one to test certain features
	M_Create_New_File();
	#ifdef COMPLETE_EXAMPLE
	M_Create_Multiple_Files();
	M_Open_File_Rewrite();
	M_Open_File_Append();
	M_Open_File_Read();
	M_Delete_File();
	M_Test_File_Exist();
	M_Create_Swap_File();
	#endif
	LCD_Write_Line("Test End.");
	}
}

// Main. Uncomment the function(s) to test the desired operation(s)
void M_Test_Begin() {
	// #define COMPLETE_EXAMPLE         // comment this line to make simpler/smaller example

	// Initialize UART1 module
	UART1_Init(19200);
	Delay_ms(10);

	LCD_Write_Line("PIC-Started"); // PIC present report

	// Initialize SPI1 module
	SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV64, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);

	// use fat16 quick format instead of init routine if a formatting is needed
	if (Mmc_Fat_Init() == 0) {
		LCD_Write_Line("PIC-Accepted");
		M_Test_Routine();
	}
	else {
		LCD_Write_Line(mmc_err_txt); 
		// Note: Mmc_Fat_Init tries to initialize a card more than once.
		// If card is not present, initialization may last longer (depending on clock speed)
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