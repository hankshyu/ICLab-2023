#include <stdio.h>
#include <stdlib.h>
int genRandom(int, int);
int main(){
    //Generates random number    

    const int GRAY_SCALE = 32;
    int array_size = 16;
    //printf("Plase enter array size:");
    //scanf("%d", &array_size);

    
    for(int i = 0; i < array_size; ++i){
        for(int j = 0; j < array_size; ++j){
            printf("%d",genRandom(0, GRAY_SCALE - 1));
            if(j != array_size-1) printf(" ");
        }
        if(i!=array_size-1)printf("\n");
    }

    
}

int genRandom(int lower, int upper){
    return (rand() % (upper - lower + 1)) + lower;
}
