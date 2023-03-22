//////////////////////////////////////////////////////////////////////////////////
//  Engineer:        Tzu-Han Hsu
//  Create Date:     03/17/2023 09:17:09 PM
//  Module Name:     Lab04_emulateRNN
//  HDL(Version):    Verilog-2005
//
//  Dependencies:    stdio.h, math.h
//  Compilation:     gcc test.c -lm -o test.out
//////////////////////////////////////////////////////////////////////////////////
//  Description:     This code emulates a simple RNN Network.
//  
//////////////////////////////////////////////////////////////////////////////////
//  Revision:
//  
//
//////////////////////////////////////////////////////////////////////////////////
//  License information:
//
//  This software is released under the BSD-3-Clause Licence,
//  see https://opensource.org/licenses/BSD-3-Clause for details.
//  In the following license statements, "software" refers to the
//  "source code" of the complete hardware/software system.
//
//  Copyright 2023,
//                    Tzu-Han Hsu
//                    Deparment of Computer Science
//                    National Yang Ming Chiao Tung Uniersity
//                    Hsinchu, Taiwan.
//
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice,
//     this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//
//  3. Neither the name of the copyright holder nor the names of its contributors
//     may be used to endorse or promote products derived from this software
//     without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.
//////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <math.h>

float mxmul (float A1, float A2, float A3, float B1, float B2, float B3){
    return A1*B1 + A2*B2 + A3*B3;
}

void printmh (float arr[], int len, const char *info){
        printf("%s[",info);
        for(int i = 0; i < len; i++){
            printf("%08x",*(unsigned int*)&arr[i]);
            if(i%3==2) printf("]\n");
            else printf(", ");
        }
}

void printmf (float arr[], int len, const char *info){
        printf("%s[",info);
        for(int i = 0; i < len; i++){
            printf("%+011.6f",arr[i]);
            if(i%3==2) printf("]\n");
            else printf(", ");
        }
}

void printme (float arr[], int len, const char *info){
        printf("%s[",info);
        for(int i = 0; i < len; i++){
            printf("%+e",arr[i]);
            if(i%3==2) printf("]\n");
            else printf(", ");
        }
}

void printparamh (float arr[], int len, const char *name){
    printf("%s =\t[",name);
    for(int i = 0; i < len; ++i){
        printf("%08x",*(unsigned int*)&arr[i]);
        
        if(i != (len-1))printf(", ");
        else printf("]\n");
    }
}

void printparamf (float arr[], int len, const char *name){
    printf("%s =\t[",name);
    for(int i = 0; i < len ; ++i){
        printf("%+012.6f",arr[i]);
        if(i != (len-1)) printf(", ");
        else printf("];\n");
    }
}

int main(){
    float W[9] = { 1,-2, 2,-2,-1, 1, 3,-3,-2};
    float U[9] = { 2, 1, 3,-3, 1,-2,-1, 1, 2};
    float V[9] = {-3,-1,-1, 2,-1,-2, 1,-2, 1};

    float X[9] = {-1,-2, 3, 1, 1, 2, -1, 2, 3};
    float h0 [3] = {1,-2,-1};
    
    printf("Setup parameters:\n");

    printparamh(W, 9, "W ");
    printparamh(U, 9, "U ");
    printparamh(V, 9, "V ");
    printparamh(X, 9, "X ");
    printparamh(h0, 3, "h0");

    printf("\n");

    printparamf(W, 9, "W ");
    printparamf(U, 9, "U ");
    printparamf(V, 9, "V ");
    printparamf(X, 9, "X ");
    printparamf(h0, 3, "h0");

    printf("\n");
    printf("=========================================================================================\n");
    printf("\n");
    //First Iteration

    float Wh0[3] = {0,0,0};
    Wh0[0] = mxmul(W[0],W[1],W[2],h0[0],h0[1],h0[2]);
    Wh0[1] = mxmul(W[3],W[4],W[5],h0[0],h0[1],h0[2]);
    Wh0[2] = mxmul(W[6],W[7],W[8],h0[0],h0[1],h0[2]);


    float UX1[3] = {0,0,0};
    UX1[0] = mxmul(U[0],U[1],U[2],X[0],X[1],X[2]);
    UX1[1] = mxmul(U[3],U[4],U[5],X[0],X[1],X[2]);
    UX1[2] = mxmul(U[6],U[7],U[8],X[0],X[1],X[2]);


    float preh1[3];
    preh1[0] = Wh0[0] + UX1[0];
    preh1[1] = Wh0[1] + UX1[1];
    preh1[2] = Wh0[2] + UX1[2];

    
    float h1[3];
    h1[0] = (preh1[0] >=0)? preh1[0] : (0.1f * preh1[0]);
    h1[1] = (preh1[1] >=0)? preh1[1] : (0.1f * preh1[1]);
    h1[2] = (preh1[2] >=0)? preh1[2] : (0.1f * preh1[2]);


    float Vh1[3];
    Vh1[0] = mxmul(V[0], V[1], V[2], h1[0], h1[1], h1[2]);    
    Vh1[1] = mxmul(V[3], V[4], V[5], h1[0], h1[1], h1[2]);    
    Vh1[2] = mxmul(V[6], V[7], V[8], h1[0], h1[1], h1[2]);

    float expVh1[3];
    expVh1[0] = ((float)exp(-Vh1[0]));
    expVh1[1] = ((float)exp(-Vh1[1]));
    expVh1[2] = ((float)exp(-Vh1[2]));

    float DnomY1[3];
    DnomY1[0] = 1.0f + expVh1[0];
    DnomY1[1] = 1.0f + expVh1[1];
    DnomY1[2] = 1.0f + expVh1[2];

    float Y1[3];
    Y1[0] = 1.0f /DnomY1[0];
    Y1[1] = 1.0f /DnomY1[1];
    Y1[2] = 1.0f /DnomY1[2];

    printmh(Wh0,    3,  "W*h0:\t\t");
    printmh(UX1,    3,  "U*X1:\t\t");
    printmh(preh1,  3,  "W*h0 + U*X1:");
    printmh(h1,     3,  "h1:\t\t\t");
    printmh(Vh1,    3,  "V*h1:\t\t");
    printmh(expVh1, 3,  "e^(-Vh1):\t");
    printmh(DnomY1, 3,  "Y^-1:\t\t");
    printmh(Y1,     3,  "Y1:\t\t\t");

    printf("\n");

    printmf(Wh0,    3,  "W*h0:\t\t");
    printmf(UX1,    3,  "U*X1:\t\t");
    printmf(preh1,  3,  "W*h0 + U*X1:");
    printmf(h1,     3,  "h1:\t\t\t");
    printmf(Vh1,    3,  "V*h1:\t\t");
    printme(expVh1, 3,  "e^(-Vh1):\t");
    printme(DnomY1, 3,  "Y1^-1:\t\t");
    printme(Y1,     3,  "Y1:\t\t\t");

    printf("\n");
    printf("=========================================================================================\n");
    printf("\n");
    //Second Iteration
    float Wh1[3];
    Wh1[0] = mxmul(W[0],W[1],W[2],h1[0],h1[1],h1[2]);
    Wh1[1] = mxmul(W[3],W[4],W[5],h1[0],h1[1],h1[2]);
    Wh1[2] = mxmul(W[6],W[7],W[8],h1[0],h1[1],h1[2]);

    float UX2[3];
    UX2[0] = mxmul(U[0],U[1],U[2],X[3],X[4],X[5]);
    UX2[1] = mxmul(U[3],U[4],U[5],X[3],X[4],X[5]);
    UX2[2] = mxmul(U[6],U[7],U[8],X[3],X[4],X[5]);

    float preh2[3];
    preh2[0] = Wh1[0] + UX2[0];
    preh2[1] = Wh1[1] + UX2[1];
    preh2[2] = Wh1[2] + UX2[2];

    float h2[3];
    h2[0] = (preh2[0] >=0)? preh2[0] : (0.1f * preh2[0]);
    h2[1] = (preh2[1] >=0)? preh2[1] : (0.1f * preh2[1]);
    h2[2] = (preh2[2] >=0)? preh2[2] : (0.1f * preh2[2]);

    float Vh2[3];
    Vh2[0] = mxmul(V[0], V[1], V[2], h2[0], h2[1], h2[2]);    
    Vh2[1] = mxmul(V[3], V[4], V[5], h2[0], h2[1], h2[2]);    
    Vh2[2] = mxmul(V[6], V[7], V[8], h2[0], h2[1], h2[2]);

    float expVh2[3];
    expVh2[0] = ((float)exp(-Vh2[0]));
    expVh2[1] = ((float)exp(-Vh2[1]));
    expVh2[2] = ((float)exp(-Vh2[2]));

    float DnomY2[3];
    DnomY2[0] = 1.0f + expVh2[0];
    DnomY2[1] = 1.0f + expVh2[1];
    DnomY2[2] = 1.0f + expVh2[2];

    float Y2[3];
    Y2[0] = 1.0f /DnomY2[0];
    Y2[1] = 1.0f /DnomY2[1];     
    Y2[2] = 1.0f /DnomY2[2]; 
    
    printmh(Wh1,    3,  "W*h1:\t\t");
    printmh(UX2,    3,  "U*X2:\t\t");
    printmh(preh2,  3,  "W*h1 + U*X2:");
    printmh(h2,     3,  "h2:\t\t\t");
    printmh(Vh2,    3,  "V*h2:\t\t");
    printmh(expVh2, 3,  "e^(-Vh2):\t");
    printmh(DnomY2, 3,  "Y2^-1:\t\t");
    printmh(Y2,     3,  "Y2:\t\t\t");

    printf("\n");

    printmf(Wh1,    3,  "W*h1:\t\t");
    printmf(UX2,    3,  "U*X2:\t\t");
    printmf(preh2,  3,  "W*h1 + U*X2:");
    printmf(h2,     3,  "h2:\t\t\t");
    printmf(Vh2,    3,  "V*h2:\t\t");
    printme(expVh2, 3,  "e^(-Vh2):\t");
    printme(DnomY2, 3,  "Y2^-1:\t\t");
    printme(Y2,     3,  "Y2:\t\t\t");

    printf("\n");
    printf("=========================================================================================\n");
    printf("\n");
    
    //Third Iteration
    float Wh2[3];
    Wh2[0] = mxmul(W[0],W[1],W[2],h2[0],h2[1],h2[2]);
    Wh2[1] = mxmul(W[3],W[4],W[5],h2[0],h2[1],h2[2]);
    Wh2[2] = mxmul(W[6],W[7],W[8],h2[0],h2[1],h2[2]);

    float UX3[3];
    UX3[0] = mxmul(U[0],U[1],U[2],X[6],X[7],X[8]);
    UX3[1] = mxmul(U[3],U[4],U[5],X[6],X[7],X[8]);
    UX3[2] = mxmul(U[6],U[7],U[8],X[6],X[7],X[8]);

    float preh3[3];
    preh3[0] = Wh2[0] + UX3[0];
    preh3[1] = Wh2[1] + UX3[1];
    preh3[2] = Wh2[2] + UX3[2];
    
    float h3[3];
    h3[0] = (preh3[0] >=0)? preh3[0] : (0.1f * preh3[0]);
    h3[1] = (preh3[1] >=0)? preh3[1] : (0.1f * preh3[1]);
    h3[2] = (preh3[2] >=0)? preh3[2] : (0.1f * preh3[2]);

    float Vh3[3];
    Vh3[0] = mxmul(V[0], V[1], V[2], h3[0], h3[1], h3[2]);    
    Vh3[1] = mxmul(V[3], V[4], V[5], h3[0], h3[1], h3[2]);    
    Vh3[2] = mxmul(V[6], V[7], V[8], h3[0], h3[1], h3[2]);

    float expVh3[3];
    expVh3[0] = ((float)exp(-Vh3[0]));
    expVh3[1] = ((float)exp(-Vh3[1]));
    expVh3[2] = ((float)exp(-Vh3[2]));

    float DnomY3[3];
    DnomY3[0] = 1.0f + expVh3[0];
    DnomY3[1] = 1.0f + expVh3[1];
    DnomY3[2] = 1.0f + expVh3[2];

    float Y3[3];
    Y3[0] = 1.0f /DnomY3[0];
    Y3[1] = 1.0f /DnomY3[1];     
    Y3[2] = 1.0f /DnomY3[2]; 


    printmh(Wh2,    3,  "W*h2:\t\t");
    printmh(UX3,    3,  "U*X3:\t\t");
    printmh(preh3,  3,  "W*h2 + U*X3:");
    printmh(h3,     3,  "h3:\t\t\t");
    printmh(Vh3,    3,  "V*h3:\t\t");
    printmh(expVh3, 3,  "e^(-Vh3):\t");
    printmh(DnomY3, 3,  "Y3^-1:\t\t");
    printmh(Y3,     3,  "Y3:\t\t\t");

    printf("\n");

    printmf(Wh2,    3,  "W*h2:\t\t");
    printmf(UX3,    3,  "U*X3:\t\t");
    printmf(preh3,  3,  "W*h2 + U*X3:");
    printmf(h3,     3,  "h3:\t\t\t");
    printmf(Vh3,    3,  "V*h3:\t\t");
    printme(expVh3, 3,  "e^(-Vh3):\t");
    printme(DnomY3, 3,  "Y3^-1:\t\t");
    printme(Y3,     3,  "Y3:\t\t\t");

}


