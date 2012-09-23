
_TestInitializeAllPins:

;CoreTest.c,1 :: 		void TestInitializeAllPins() {
;CoreTest.c,2 :: 		PORTA = 0x55;
	MOVLW       85
	MOVWF       PORTA+0 
;CoreTest.c,3 :: 		PORTC = 0xAA;
	MOVLW       170
	MOVWF       PORTC+0 
;CoreTest.c,4 :: 		PORTD = 0x55;
	MOVLW       85
	MOVWF       PORTD+0 
;CoreTest.c,5 :: 		PORTE = 0xAA;
	MOVLW       170
	MOVWF       PORTE+0 
;CoreTest.c,6 :: 		}
L_end_TestInitializeAllPins:
	RETURN      0
; end of _TestInitializeAllPins

_TestStripeAllPins:

;CoreTest.c,12 :: 		void TestStripeAllPins() {
;CoreTest.c,13 :: 		PORTA = ~PORTA;
	COMF        PORTA+0, 1 
;CoreTest.c,14 :: 		PORTC = ~PORTC;
	COMF        PORTC+0, 1 
;CoreTest.c,15 :: 		PORTD = ~PORTD;
	COMF        PORTD+0, 1 
;CoreTest.c,16 :: 		PORTE = ~PORTE;
	COMF        PORTE+0, 1 
;CoreTest.c,17 :: 		}
L_end_TestStripeAllPins:
	RETURN      0
; end of _TestStripeAllPins
