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

	int s, s_bef;
	int s_up, s_down, eea_result;
	int rx, rx_bef;
	int ry, ry_bef;
	
	if((px == qx) && (py == qy)){
		//point doubling
		s_up = 3*px*px + a;
		s_down = (2*py)%prime;
	}else{
		//point addition
		s_up = qy - py;
		s_down = (qx - px + prime)%prime;
	}
	eea_result = EEA(s_down,prime);
	s_bef = s_up * EEA(s_down,prime);
	while(s_bef < 0) s_bef += prime;
	s = s_bef % prime;

	rx_bef = s*s - px - qx;
	while(rx_bef < 0) rx_bef += prime;
	rx = rx_bef % prime;
	

	ry_bef = s*(px-rx) - py;
	while(ry_bef < 0) ry_bef += prime;
	ry = ry_bef % prime;

	printf("s_up, s_down, eea, s_bef, s = (%d, %d, %d, %d, %d)\n",s_up, s_down, eea_result, s_bef, s);
	printf("rx_bef, rx = (%d, %d)\n",rx_bef, rx);
	printf("ry_bef, ry = (%d, %d)\n",ry_bef, ry);
	
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
