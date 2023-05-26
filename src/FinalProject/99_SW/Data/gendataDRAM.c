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

    DRAM_data[1017] = 245;      //@17f2
    DRAM_data[1018] = 254;      //@17f4
    DRAM_data[1019] = 255;      //@17f6
    DRAM_data[1020] = 32000;    //@17f8
    DRAM_data[1021] = 32765;    //@17fa
    DRAM_data[1022] = 32767;    //@17fc
    DRAM_data[1023] = 0;        //@17fe


    DRAM_data[1024] = -1;       //@1800
    DRAM_data[1025] = -3;       //@1802
    DRAM_data[1026] = -5;       //@1804
    DRAM_data[1027] = -8;       //@1806
    DRAM_data[1028] = -11;      //@1808
    DRAM_data[1029] = -16;      //@180a
    DRAM_data[1030] = -4;       //@180c
    DRAM_data[1031] = -27;      //@180e
    DRAM_data[1032] = -10;      //@1810
    DRAM_data[1033] = -100;     //@1812

    DRAM_data[2042] = -245;     //@1ff4
    DRAM_data[2043] = -255;     //@1ff6
    DRAM_data[2044] = -256;     //@1ff8
    DRAM_data[2045] = -32750;   //@1ffa
    DRAM_data[2046] = -32767;   //@1ffc
    DRAM_data[2047] = -32768;   //@1ffe


    FILE *datfptr = fopen("DRAM_data.dat", "w");
    FILE *cshfptr = fopen("DataCS.txt","w");

    unsigned char *mon;
    
    for(int addr = 0x1000, idx = 0; addr <= 0x1FFF; addr += 0x2, idx++){
        mon = &(DRAM_data[idx]);
        fprintf(datfptr, "@%x\n",addr);
        fprintf(datfptr,"%02x %02x\n", *(mon), *(mon+1));
        
        fprintf(cshfptr,"@%x[%4d] %6d(0x%02x%02x)\n", addr, idx*2, DRAM_data[idx], *(mon+1), *mon);

    }

    fclose(datfptr);
    fclose(cshfptr);
}
