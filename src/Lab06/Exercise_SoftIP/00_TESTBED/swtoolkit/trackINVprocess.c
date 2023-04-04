#include <stdio.h>

int EEA(int, int, int*);
int isPrime(int);

int main(){
//	printf("This is the C program testing Extended Euclidean Algo\n");

	int SEARCH_LIM = 61;
	int max_layer = 0;
	// for(int i = 1; i <= SEARCH_LIM; i ++ ){
	// 	if(!isPrime(i)) continue;
	// 	for(int j = 1; j < i; j++){
	int i,j;
	printf("Prompt i and j:");
	scanf("%d %d",&i, &j);
	int ans;
	int times = EEA(i, j, &ans);
	printf("(%d, %d) =  %d\n",i, j, ans);
	// 		printf("%d %d %d\n",i, j, ans);

	// 	}	
	// }

}

int EEA(int a, int n, int *ans){
	if(a == 1){
		*ans = 1;
		return 0;
	}
	int t, r, newt, newr;
	t = 0;
	r = n;
	newt = 1;
	newr = a;
	int quotient;
	int count_times = 0;

	while(newr != 0){
		count_times++;

		quotient = r / newr;
		int tmp_newt = t - quotient * newt;
		t = newt;
		newt = tmp_newt;

		int tmp_newr = r - quotient * newr;
		r = newr;
		newr = tmp_newr;
		printf("---------------------\n");
		printf("Layer: %d\n",count_times);
		printf("---------------------\n");
		printf("quotient: %d\n",quotient);
		printf("new_t: %d\n",newt);
		printf("t: %d\n",t);
		printf("new_r: %d\n",newr);
		printf("r: %d\n",r);
		
		//determine the min or max intermediate variables;

	}
	if(r > 1) *ans = -1;
	else if(t < 0) *ans = t+n;
	else *ans = t;
	
	return count_times;


}
int isPrime(int n){
	if(n <= 1) return 0;
	for(int i = 2; i < n; ++i){
		if(n%i == 0) return 0;
	}
	return 1;
}
