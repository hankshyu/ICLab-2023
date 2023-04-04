#include <stdio.h>
#include <stdlib.h>

int EEA(int, int);
int isPrime(int);
int randir(int);

int main(){
	srand(137);
	printf("This is the Elliptic curve simulation program\n");
	printf("Please enter: P:(Px, Py) Q:(Qx, Qy) Prime, a\n");
	int LEN_LIM = 63;
	int px, py, qx, qy, prime, a;

	// px = qx = 5;
	// py = qy = 1;
	// prime = 17;
	// a =2;
	scanf("%d %d %d %d %d %d",&px, &py, &qx, &qy, &prime, &a);
    int peqq = (px==qx && py == qy);

	int s, s_bef;
	int s_up, s_down, eea_result;
	int rx, rx_bef;
	int ry, ry_bef;
	
	// if((px == qx) && (py == qy)){
	// 	//point doubling
	// 	s_up = 3*px*px + a;
	// 	s_down = 2*py;
	// }else{
	// 	//point addition
	// 	s_up = qy - py;
	// 	s_down = qx - px;
	// }
	// eea_result = EEA(s_down,prime);
	// s_bef = s_up * EEA(s_down,prime);
	// while(s_bef < 0) s_bef += prime;
	// s = s_bef % prime;

	// rx_bef = s*s - px - qx;
	// while(rx_bef < 0) rx_bef += prime;
	// rx = rx_bef % prime;
	

	// ry_bef = s*(px-rx) - py;
	// while(ry_bef < 0) ry_bef += prime;
	// ry = ry_bef % prime;

    printf("Cycle 1:\n");
    int c1m = px*3;
    printf("Cmult_0, Cmult_1) -> Cmult_out = (%d, %d) -> %d\n",px, 3 , c1m);
    int c1alu;
    if(peqq){
        c1alu = (py * 2) % prime;
        printf("(Cas_add0, Cas_add1, Cas_sub0, Cas_sub1) -> C_out = (%d, %d, %d, %d) -> %d\n",py*2, 0, 0, 0, c1alu);
    }else{
        c1alu = (qx + prime - px) % prime;
        printf("(Cas_add0, Cas_add1, Cas_sub0, Cas_sub1) -> C_out = (%d, %d, %d, %d) -> %d\n",qx, prime, px, 0, c1alu);
    }
    printf("Cycle 2:\n");
    int c2m = c1m*px;
    printf("Cmult_0, Cmult_1) -> Cmult_out = (%d, %d) -> %d\n",c1m, 3 , c2m);
    int c2alu;
    if(peqq){
        c2alu = (c2m + a) % prime;
        printf("(Cas_add0, Cas_add1, Cas_sub0, Cas_sub1) -> C_out = (%d, %d, %d, %d) -> %d\n",c2m, a, 0, 0, c2alu);
    }else{
        c2alu = (qy + prime - py) % prime;
        printf("(Cas_add0, Cas_add1, Cas_sub0, Cas_sub1) -> C_out = (%d, %d, %d, %d) -> %d\n",qy, prime, py, 0, c2alu);

    }
    int c2inv = EEA(c1alu,prime);
    printf("Inv -> inv_out = %d -> %d\n",c1alu, c2inv);
    
    printf("Cycle 3:\n");
    int c3m = c2alu * c2inv;
    printf("Cmult_0, Cmult_1) -> Cmult_out = (%d, %d) -> %d\n",c2alu, c2inv , c3m);
    int c3alu = c3m % prime; // this is s
    printf("This is s:\n");
    printf("(Cas_add0, Cas_add1, Cas_sub0, Cas_sub1) -> C_out = (%d, %d, %d, %d) -> %d\n",c3m, 0, 0, 0, c3alu);
    
    printf("Cycle 4:\n");
    int c4m = c3alu * c3alu;
    printf("Cmult_0, Cmult_1) -> Cmult_out = (%d, %d) -> %d\n",c3alu, c3alu , c4m);

    int c4alu = (c4m + prime - px - qx) % prime;//this is Rx
    printf("This is Rx:\n");
    printf("(Cas_add0, Cas_add1, Cas_sub0, Cas_sub1) -> C_out = (%d, %d, %d, %d) -> %d\n",c4m, prime, px, qx, c4alu);

    printf("Cycle 5:\n");
    int c5multchoise;
    if(px > c4alu) c5multchoise = px-c4alu;
    else c5multchoise = (prime + px) - c4alu;
    
    int c5m = c3alu * c5multchoise;
    printf("Cmult_0, Cmult_1) -> Cmult_out = (%d, %d) -> %d\n",c3alu, c5multchoise , c5m);

    int c5alu = (c5m + prime - py) % prime;
    printf("This is Ry:\n");
    printf("(Cas_add0, Cas_add1, Cas_sub0, Cas_sub1) -> C_out = (%d, %d, %d, %d) -> %d\n",c5m, prime, py, 0, c5alu);
    printf("end of Simulation...\n");







	// printf("s_up, s_down, eea, s_bef, s = (%d, %d, %d, %d, %d)\n",s_up, s_down, eea_result, s_bef, s);
	// printf("rx_bef, rx = (%d, %d)\n",rx_bef, rx);
	// printf("ry_bef, ry = (%d, %d)\n",ry_bef, ry);
	
}
int randir(int upper){
	//produces random number from 1 ~ upper-1
	return (rand() % (upper-1) + 1);
}

int EEA(int a, int n){
	if(a == 1){
		return 1;
	}
	int t, r, newt, newr;
	t = 0;
	r = n;
	newt = 1;
	newr = a;
	int quotient;
	// int count_times = 0;

	while(newr != 0){
		// count_times++;

		quotient = r / newr;
		int tmp_newt = t - quotient * newt;
		t = newt;
		newt = tmp_newt;

		int tmp_newr = r - quotient * newr;
		r = newr;
		newr = tmp_newr;
		
		//determine the min or max intermediate variables;

	}
	if(r > 1) return -1;
	else if(t < 0) return (t+n);
	else return t;
	
	// return count_times;


}

int isPrime(int n){
	if(n <= 1) return 0;
	for(int i = 2; i < n; ++i){
		if(n%i == 0) return 0;
	}
	return 1;
}
