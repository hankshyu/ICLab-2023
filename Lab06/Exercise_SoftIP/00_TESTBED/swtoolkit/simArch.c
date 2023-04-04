#include <stdio.h>

int EEA(int, int, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*);
int isPrime(int);

int main(){
	printf("This is the C program testing Extended Euclidean Algo\n");

	int SEARCH_LIM = 127;
	int max_layer = 0;

	int q_min, ot_min, or_min, nt_min, nr_min;
	int q_max, ot_max, or_max, nt_max, nr_max;

	q_min = ot_min = or_min =  nt_min = nr_min = 999999;
	q_max = ot_max = or_max =  nt_max = nr_max = 0;

	int xq_min, xot_min, xor_min, xnt_min, xnr_min;
	int xq_max, xot_max, xor_max, xnt_max, xnr_max;
	xq_min = xot_min = xor_min =  xnt_min = xnr_min = 999999;
	xq_max = xot_max = xor_max =  xnt_max = xnr_max = 0;
	
	for(int i = 1; i < SEARCH_LIM+1; i++){
		if(!isPrime(i)) continue;
		for(int j = 1; j < i; j++){
			
			int ans;
			int times = EEA(j, i, &ans, &q_min, &q_max, &ot_min, &ot_max, &or_min, &or_max, &nt_min, &nt_max, &nr_min, &nr_max);
			printf("(%d, %d)After %d times, ans = %d\n",j,i,times, ans);
			if(times > max_layer) max_layer = times;
			if(q_min < xq_min) xq_min = q_min;
			if(q_max > xq_max) xq_max = q_max;
			if(ot_min < xot_min) xot_min = ot_min;
			if(ot_max > xot_max) xot_max = ot_max;
			if(or_min < xor_min) xor_min = or_min;
			if(or_max > xor_max) xor_max = or_max;
			if(nt_min < xnt_min) xnt_min = nt_min;
			if(nt_max > xnt_max) xnt_max = nt_max;
			if(nr_min < xnr_min) xnr_min = nr_min;
			if(nr_max > xnr_max) xnr_max = nr_max;

			//printf("q_min, q_max = %d, %d\t",xq_min, xq_max);
			//printf("ot_min, ot_max = %d, %d\t",xot_min, xot_max);
			//printf("or_min, or_max = %d, %d\t",xor_min, xor_max);
			//printf("nt_min, nt_max = %d, %d\t",xnt_min, xnt_max);
			//printf("nr_min, nr_max = %d, %d\n",xnr_min, xnr_max);
		}	
	}
	printf("To calculate to %d, we would need %d layers!\n",SEARCH_LIM, max_layer);
	printf("q_min, q_max = %d, %d\n",xq_min, xq_max);
	printf("ot_min, ot_max = %d, %d\n",xot_min, xot_max);
	printf("or_min, or_max = %d, %d\n",xor_min, xor_max);
	printf("nt_min, nt_max = %d, %d\n",xnt_min, xnt_max);
	printf("nr_min, nr_max = %d, %d\n",xnr_min, xnr_max);

}

int EEA(int a, int n, int *ans, int *q_min, int *q_max, int *ot_min, int *ot_max, int *or_min, int *or_max, int *nt_min, int *nt_max, int *nr_min, int *nr_max){
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
	
	int quotient_min, t_min, r_min, newt_min, newr_min;
	int quotient_max, t_max, r_max, newt_max, newr_max;
	
	quotient_min = t_min = r_min = newt_min = newr_min = 999999;
	quotient_max = t_max = r_max = newt_max = newr_max = 0;

	while(newr != 0){
		count_times++;

		quotient = r / newr;
		int tmp_newt = t - quotient * newt;
		t = newt;
		newt = tmp_newt;

		int tmp_newr = r - quotient * newr;
		r = newr;
		newr = tmp_newr;
		
		//determine the min or max intermediate variables;

		if(newr !=0){
			if(quotient_max < quotient) quotient_max = quotient;
			if(quotient_min > quotient) quotient_min = quotient;

			if(t_max < t) t_max = t;
			if(t_min > t) t_min = t;

			if(r_max < r) r_max = r;
			if(r_min > r) r_min = r;

			if(newt_max < newt) newt_max = newt;
			if(newt_min > newt) newt_min = newt;

			if(newr_max < newr) newr_max = newr;
			if(newr_min > newr) newr_min = newr;
		}

	}
	if(r > 1) *ans = -1;
	else if(t < 0) *ans = t+n;
	else *ans = t;
	
	*q_min = quotient_min;
	*q_max = quotient_max;
	
	*ot_min = t_min;
	*ot_max = t_max;

	*or_min = r_min;
	*or_max = r_max;

	*nt_min = newt_min;
	*nt_max = newt_max;

	*nr_min = newr_min;
	*nr_max = newr_max;

	return count_times;


}
int isPrime(int n){
	if(n <= 1) return 0;
	for(int i = 2; i < n; ++i){
		if(n%i == 0) return 0;
	}
	return 1;
}
