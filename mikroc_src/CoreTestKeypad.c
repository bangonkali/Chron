#include "CoreTestKeypad.h"

void Keypad_Decode(unsigned char *kp) {
	switch (*kp) {
		case  1: *kp = 49; break; // 1        // Uncomment this block for keypad4x4
		case  2: *kp = 50; break; // 2
		case  3: *kp = 51; break; // 3
		case  4: *kp = 47; break; // /
		case  5: *kp = 52; break; // 4
		case  6: *kp = 53; break; // 5
		case  7: *kp = 54; break; // 6
		case  8: *kp = 42; break; // *        
		case  9: *kp = 55; break; // 7
		case 10: *kp = 56; break; // 8
		case 11: *kp = 57; break; // 9
		case 12: *kp = 65; break; // A
		case 13: *kp = 32; break; // SPACE
		case 14: *kp = 48; break; // 0
		case 15: *kp = 45; break; // MINUS
		case 16: *kp = 66; break; // B
	}
}

unsigned char Keypad_Get_Key(){
	unsigned char kp = 0; // Reset key code variable
	Keypad_Init();

	// Wait for key to be pressed and released
	do {
		// kp = Keypad_Key_Press();          // Store key code in kp variable
		kp = Keypad_Key_Click();             // Store key code in kp variable
	} while (!kp);
	
	// Prepare value for output, transform key to it's ASCII value
	Keypad_Decode(&kp);
	return kp;
}

void KeypadTest_Begin() {
	unsigned short kp, cnt, oldstate = 0;
	char txt[6];

	cnt = 0;                                 // Reset counter
	
	Lcd_Cmd(_LCD_CLEAR);
	Lcd_Out(1, 1, "1");
	Lcd_Out(1, 1, "Key  :");                 // Write message text on LCD
	Lcd_Out(2, 1, "Times:");

	do {
		kp = 0;                                // Reset key code variable

		// Wait for key to be pressed and released
		do {
			// kp = Keypad_Key_Press();          // Store key code in kp variable
			kp = Keypad_Key_Click();             // Store key code in kp variable
		} while (!kp);
		
		// Prepare value for output, transform key to it's ASCII value
		Keypad_Decode(&kp);

		if (kp != oldstate) {                  // Pressed key differs from previous
			cnt = 1;
			oldstate = kp;
		} else {                                 // Pressed key is same as previous
			cnt++;
		}

		Lcd_Chr(1, 10, kp);                    // Print key ASCII value on LCD

		if (cnt == 255) {                      // If counter varialble overflow
			cnt = 0;
			Lcd_Out(2, 10, "   ");
		}

		WordToStr(cnt, txt);                   // Transform counter value to string
		Lcd_Out(2, 10, txt);                   // Display counter value on LCD
	} while (1);
}
