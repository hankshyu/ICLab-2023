#include <stdio.h>

int main(){
    
    printf("Start convolution calculation program!\n");
    int x [4];
    int h [4];
    printf("Enter x:\n");
    scanf ("%d %d %d %d",&x[0], &x[1], &x[2], &x[3]);
    printf("Enter h:\n");
    scanf (" %d %d %d %d",&h[0], &h[1], &h[2], &h[3]);
    printf("x = [%d, %d, %d, %d]\n", x[0], x[1], x[2], x[3]);
    printf("h = [%d, %d, %d, %d]\n", h[0], h[1], h[2], h[3]);
    for(int i = 0; i < 7; ++i){
        int ans = 0;
        for(int j = 0; j < 4; ++j){
            if(0 <= i-j && i-j < 4){
                    ans += x[i-j]*h[j];
                    printf("(%d, %d), ans = %d, x[%d]*h[%d] = %d\n",i,j,ans,i-j,j,x[i-j]*h[j]);
                }
        }
    }
    
}
