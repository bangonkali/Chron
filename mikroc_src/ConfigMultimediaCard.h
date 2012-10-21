#ifndef _CONFIGMULTIMEDIACARD_H
#define _CONFIGMULTIMEDIACARD_H

// MMC module connections
sbit Mmc_Chip_Select           at LATA5_bit;  // for writing to output pin always use latch (PIC18 family)
sbit Mmc_Chip_Select_Direction at TRISA5_bit;
// eof MMC module connections

#endif 