#line 1 "D:/Chron/mikroc_src/CoreTestKeypad.c"
#line 1 "d:/chron/mikroc_src/coretestkeypad.h"



void KeypadTest_Begin();
unsigned char Keypad_Get_Key();
void Keypad_Decode(unsigned char *kp);
#line 3 "D:/Chron/mikroc_src/CoreTestKeypad.c"
void Keypad_Decode(unsigned char *kp) {
 switch (*kp) {
 case 1: *kp = 49; break;
 case 2: *kp = 50; break;
 case 3: *kp = 51; break;
 case 4: *kp = 47; break;
 case 5: *kp = 52; break;
 case 6: *kp = 53; break;
 case 7: *kp = 54; break;
 case 8: *kp = 42; break;
 case 9: *kp = 55; break;
 case 10: *kp = 56; break;
 case 11: *kp = 57; break;
 case 12: *kp = 65; break;
 case 13: *kp = 32; break;
 case 14: *kp = 48; break;
 case 15: *kp = 45; break;
 case 16: *kp = 66; break;
 }
}

unsigned char Keypad_Get_Key(){
 unsigned char kp = 0;
 Keypad_Init();


 do {

 kp = Keypad_Key_Click();
 } while (!kp);


 Keypad_Decode(&kp);
 return kp;
}

void KeypadTest_Begin() {
 unsigned short kp, cnt, oldstate = 0;
 char txt[6];

 cnt = 0;

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "1");
 Lcd_Out(1, 1, "Key  :");
 Lcd_Out(2, 1, "Times:");

 do {
 kp = 0;


 do {

 kp = Keypad_Key_Click();
 } while (!kp);


 Keypad_Decode(&kp);

 if (kp != oldstate) {
 cnt = 1;
 oldstate = kp;
 } else {
 cnt++;
 }

 Lcd_Chr(1, 10, kp);

 if (cnt == 255) {
 cnt = 0;
 Lcd_Out(2, 10, "   ");
 }

 WordToStr(cnt, txt);
 Lcd_Out(2, 10, txt);
 } while (1);
}
