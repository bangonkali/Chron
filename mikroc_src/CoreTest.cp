#line 1 "D:/ACADS/EE188/Chron/mikroc_src/CoreTest.c"
#line 1 "d:/acads/ee188/chron/mikroc_src/coretest.h"



void TestInitializeAllPins();
void TestStripeAllPins();
void IntToChar(char *dest, char *src);
#line 3 "D:/ACADS/EE188/Chron/mikroc_src/CoreTest.c"
void TestInitializeAllPins() {
 PORTA = 0x55;
 PORTC = 0xAA;
 PORTD = 0x55;
 PORTE = 0xAA;
}





void TestStripeAllPins() {
 PORTA = ~PORTA;
 PORTC = ~PORTC;
 PORTD = ~PORTD;
 PORTE = ~PORTE;
}

void IntToChar(char *dest, char *src) {
 dest[0] = src[7];
 dest[1] = '\0';
}
