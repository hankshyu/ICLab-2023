#include "stdio.h"
#include <stdlib.h>


int rrandom(int lower, int upper){
    return (rand() % (upper - lower + 1)) + lower;
}

int main(){
    srand(17);

    //From 0x1000 ~ 0x1FFF, 4096 bytes -> 2048 shorts
    short DRAM_data [2048];

    //assign value randomly to the registers
    for(int i = 0; i < 2048; i++){
        if(i < 512){
            DRAM_data[i] = rrandom(1, 64);
        }else if(i < 1024){
            DRAM_data[i] = rrandom(1, 256);
        }else if(i < 1536){
            DRAM_data[i] = rrandom(-64, -1);
        }else if(i < 2047){
            DRAM_data[i] = rrandom(-64, -1);
        }
    }
    //some easy values

    DRAM_data[   0] = 1;        //@1000
    DRAM_data[   1] = 3;        //@1002
    DRAM_data[   2] = 5;        //@1004
    DRAM_data[   3] = 8;        //@1006
    DRAM_data[   4] = 11;       //@1008
    DRAM_data[   5] = 16;       //@100a
    DRAM_data[   6] = 4;        //@100c
    DRAM_data[   7] = 19;       //@100e
    DRAM_data[   8] = 10;       //@1010
    DRAM_data[   9] = 100;      //@1012
    DRAM_data[  10] = 124;      //@1014
    
    DRAM_data[  11] = 156;      //@1016
    DRAM_data[  12] = 173;      //@1018
    DRAM_data[  13] = 195;      //@101a

    DRAM_data[  14] = 245;      //@
    DRAM_data[  15] = 254;      //@
    DRAM_data[  16] = 255;      //@
    DRAM_data[  17] = 32000;    //@
    DRAM_data[  18] = 32765;    //@
    DRAM_data[  19] = 32767;    //@
    DRAM_data[  20] = 0;        //@


    DRAM_data[  21] = -1;       //@1800
    DRAM_data[  22] = -3;       //@1802
    DRAM_data[  23] = -5;       //@1804
    DRAM_data[  24] = -8;       //@1806
    DRAM_data[  25] = -11;      //@1808
    DRAM_data[  26] = -16;      //@180a
    DRAM_data[  27] = -4;       //@180c
    DRAM_data[  28] = -27;      //@180e
    DRAM_data[  29] = -10;      //@1810
    DRAM_data[  30] = -100;     //@1812
    
    DRAM_data[  31] = -124;     //@1812
    DRAM_data[  32] = -159;     //@1812
    DRAM_data[  33] = -177;     //@1812
    DRAM_data[  34] = -191;     //@1812


    DRAM_data[  35] = -245;     //@1ff4
    DRAM_data[  36] = -255;     //@1ff6
    DRAM_data[  37] = -256;     //@1ff8
    DRAM_data[  38] = -32750;   //@1ffa
    DRAM_data[  39] = -32767;   //@1ffc
    DRAM_data[  40] = -32768;   //@1ffe


    FILE *datfptr = fopen("DRAM_data.dat", "w");
    FILE *cshfptr = fopen("DataCS.txt","w");

    unsigned char *mon;
    
    for(int addr = 0x1000, idx = 0; addr <= 0x1FFF; addr += 0x2, idx++){
        mon = &(DRAM_data[idx]);
        fprintf(datfptr, "@%x\n",addr);
        fprintf(datfptr,"%02x %02x\n", *(mon), *(mon+1));
        
        fprintf(cshfptr,"@%x[%4d] %6d(0x%02x%02x)\n", addr, idx, DRAM_data[idx], *(mon+1), *mon);

    }

    fclose(datfptr);
    fclose(cshfptr);
}
