#ifndef _CORETESTKEYPAD_H
#define _CORETESTKEYPAD_H

void KeypadTest_Begin();
unsigned char Keypad_Get_Key();
void Keypad_Decode(unsigned char *kp);

#endif