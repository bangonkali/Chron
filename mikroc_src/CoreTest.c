#include "CoreTest.h"

void TestInitializeAllPins() {
  PORTA = 0x55;
  PORTC = 0xAA;
  PORTD = 0x55;
  PORTE = 0xAA;
}

// this is just for testing to see which pins were really set
// to digital... and which pins were really working as analog.
// portb is not included because it's already working as lcd,
// and for the RTC through I2C.
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

