#include <stdio.h>
int main(){
    printf("This is the program simulating the calculation of 16 x 16 GLCM matrix\n");
    const int GRAY_LV = 32;
    const int MATRIX_SIZE = 16;

    int M [MATRIX_SIZE][MATRIX_SIZE];
    int GLCM [GRAY_LV][GRAY_LV];

    int row_offset, col_offset;

    //read in the Offset (offset[row], offset[col])
    printf("Row offset, Col offset: \n");
    scanf("%d %d",&row_offset, &col_offset);

    //read in the data from seperate file
    printf("Input your Matrix:\n");

    for(int i = 0; i < MATRIX_SIZE; ++i){
        for(int j = 0; j < MATRIX_SIZE; ++j){
            scanf("%d ",&M[i][j]);
        }
    }
    //Reset the GLCM array
    for(int i = 0; i < GRAY_LV; ++i){
        for(int j = 0; j < GRAY_LV; ++j){
            GLCM[i][j] = 0;
        }
    }


    //GLCM is organized in [original value][after value]   
    int crow,ccol;
    int bef_value, aft_value; 
    for(int i = 0; i < MATRIX_SIZE; ++i){
        for(int j = 0; j < MATRIX_SIZE; ++j){
            crow = i + row_offset;
            ccol = j + col_offset; 
            if(crow >= MATRIX_SIZE || ccol >= MATRIX_SIZE) continue;

            //update the GLCM matrix
            bef_value = M[i][j];
            aft_value = M[crow][ccol];
            GLCM[bef_value][aft_value]++;           
            
        }
    }

    //output the GLCM Matrix:

    for(int i = 0; i < GRAY_LV; ++i){
        for(int j = 0; j < GRAY_LV; ++j){
            printf("%d ",GLCM[i][j]);
        }
        printf("\n");
    }

    
    
       
       
}
    
