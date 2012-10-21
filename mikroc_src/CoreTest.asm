
_TestInitializeAllPins:

;CoreTest.c,3 :: 		void TestInitializeAllPins() {
;CoreTest.c,4 :: 		PORTA = 0x55;
	MOVLW       85
	MOVWF       PORTA+0 
;CoreTest.c,5 :: 		PORTC = 0xAA;
	MOVLW       170
	MOVWF       PORTC+0 
;CoreTest.c,6 :: 		PORTD = 0x55;
	MOVLW       85
	MOVWF       PORTD+0 
;CoreTest.c,7 :: 		PORTE = 0xAA;
	MOVLW       170
	MOVWF       PORTE+0 
;CoreTest.c,8 :: 		}
L_end_TestInitializeAllPins:
	RETURN      0
; end of _TestInitializeAllPins

_TestStripeAllPins:

;CoreTest.c,14 :: 		void TestStripeAllPins() {
;CoreTest.c,15 :: 		PORTA = ~PORTA;
	COMF        PORTA+0, 1 
;CoreTest.c,16 :: 		PORTC = ~PORTC;
	COMF        PORTC+0, 1 
;CoreTest.c,17 :: 		PORTD = ~PORTD;
	COMF        PORTD+0, 1 
;CoreTest.c,18 :: 		PORTE = ~PORTE;
	COMF        PORTE+0, 1 
;CoreTest.c,19 :: 		}
L_end_TestStripeAllPins:
	RETURN      0
; end of _TestStripeAllPins

_IntToChar:

;CoreTest.c,21 :: 		void IntToChar(char *dest, char *src) {
;CoreTest.c,22 :: 		dest[0] = src[7];
	MOVLW       7
	ADDWF       FARG_IntToChar_src+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_IntToChar_src+1, 0 
	MOVWF       FSR0H 
	MOVFF       FARG_IntToChar_dest+0, FSR1
	MOVFF       FARG_IntToChar_dest+1, FSR1H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;CoreTest.c,23 :: 		dest[1] = '\0';
	MOVLW       1
	ADDWF       FARG_IntToChar_dest+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_IntToChar_dest+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;CoreTest.c,24 :: 		}
L_end_IntToChar:
	RETURN      0
; end of _IntToChar
