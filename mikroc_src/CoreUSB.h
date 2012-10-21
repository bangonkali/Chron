#ifndef _COREUSB_H
#define _COREUSB_H

// USB Variables
unsigned char readbuff[64] absolute 0x500;   // Buffers should be in USB RAM, please consult datasheet
unsigned char writebuff[64] absolute 0x540;

#endif