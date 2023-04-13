#include <stdio.h>
#include <stdlib.h> 
int genRandom(int, int);

int main(){
    //This is a program generating phony data in the DRAM
    //Address: 0x1000 ~ 0x1FFF is for input matrix
    //Address: 0x2000 ~ 0x2FFF is for output matrix
    srand(1709);

    //Each data stored in DRAM is the form of 1-byte(8-bits), ranging 0 ~ 255
    int ADDR_LOW  = 0x1000;
    int ADDR_HIGH = 0x2fff;

    for(int addr = ADDR_LOW; addr <= ADDR_HIGH; addr+=0x0010){
        printf("@%x\n",addr);
    
        for(int i = 0; i < 16; i++){
            printf("%x ",genRandom(0,255));
            if(i==15)printf("\n");
        }
    }


}

int genRandom(int lower, int upper){
    return (rand() % (upper - lower + 1)) + lower;
}
