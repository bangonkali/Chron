#line 1 "D:/ACADS/EE188/time/CoreTest.c"
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
