#include <stdio.h>

int EEA(int, int, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*);
int isPrime(int);
int oldEEA(int, int, int*);
int HWEEA(int, int, int*);


int main(){
	
	const int SEARCH_LIM = 61;
	int max_layer = 0;
	
	printf("This is the C optimizaing EC Algo for layer 6.\n");


	int q_min[7], ot_min[7], or_min[7], nt_min[7], nr_min[7];
	int q_max[7], ot_max[7], or_max[7], nt_max[7], nr_max[7];

	for(int idx = 0; idx <= 7; ++idx){
		q_min[idx] = ot_min[idx] = or_min[idx] = nt_min[idx] = nr_min[idx] =  999999;
		q_max[idx] = ot_max[idx] = or_max[idx] = nt_max[idx] = nr_max[idx] = -999999;
	}
	
	for(int i = 1; i < SEARCH_LIM+1; i++){
		if(!isPrime(i)) continue;
		for(int j = 1; j < i; j++){
			// printf("This is start loop (j,i) = (%d, %d)\n",j,i);
			
			int ans = -1;
			int a = j;
			int n = i;
			if(a == 1){
				ans = 1;
				continue;
			}
			//this is part of layer 0
			int t, r, newt, newr;
			t = 0;
			r = n;
			newt = 1;
			newr = a;
			int quotient;

			for(int layer = 1; layer <= 6; ++layer){
				
				if(newr!=0){
					quotient = r / newr;
					int tmp_newt = t - quotient * newt;
					t = newt;
					newt = tmp_newt;

					int tmp_newr = r - quotient * newr;
					r = newr;
					newr = tmp_newr;

					if(quotient > q_max[layer]) q_max[layer] = quotient;
					if(quotient < q_min[layer]) q_min[layer] = quotient;
					if(t > ot_max[layer]) ot_max[layer] = t;
					if(t < ot_min[layer]) ot_min[layer] = t;
					if(r > or_max[layer]) or_max[layer] = r;
					if(r < or_min[layer]) or_min[layer] = r;
					if(newt > nt_max[layer]) nt_max[layer] = newt;
					if(newt < nt_min[layer]) nt_min[layer] = newt;
					if(newr > nr_max[layer]) nr_max[layer] = newr;
					if(newr < nr_min[layer]) nr_min[layer] = newr;
				}else{
					//this part is to hold the answer;
					if(newt > nt_max[layer]) nt_max[layer] = newt;
					if(newt < nt_min[layer]) nt_min[layer] = newt;
				}
			}
			// printf("newr = %d, t = %d, newt = %d\n",newr,t,newt);
			if(newr != 0) t = newt;// this himself represents layer7
			
			if(t > ot_max[7]) ot_max[7] = t;
			if(t < ot_min[7]) ot_min[7] = t;

			if(t < 0) ans = t+n;
			else ans = t;
			
			int oldans;
			oldEEA(j,i,&oldans);
			if(ans != oldans){
				printf("Something is wrong(%d, %d)!\n",j,i);
				printf("Your ans: %d, correct: %d\n",ans,oldans);
			}
		}	
	}

	printf("They are identical!\n");
	printf("Each layer min/max Report:\n");
	for(int ly = 1; ly <= 7 ;ly++){
		printf("Layer: %d\n",ly);
		printf("Quotient: (min, max) = (%d, %d)\n",q_min[ly],q_max[ly]);
		printf("t: (min, max) = (%d, %d)\n",ot_min[ly],ot_max[ly]);
		printf("new t: (min, max) = (%d, %d)\n",nt_min[ly],nt_max[ly]);
		printf("r: (min, max) = (%d, %d)\n",or_min[ly],or_max[ly]);
		printf("new r: (min, max) = (%d, %d)\n",nr_min[ly],nr_max[ly]);
	}

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

int oldEEA(int a, int n, int *ans){
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
	}
	if(r > 1) *ans = -1;
	else if(t < 0) *ans = t+n;
	else *ans = t;
	
	return count_times;


}

int HWEEA(int a, int n, int *ans){
	if(a == 1){
		*ans = 1;
		return 0;
	}
	//this is part of layer 0
	int t, r, newt, newr;
	t = 0;
	r = n;
	newt = 1;
	newr = a;
	int quotient;
	int count_times = 0;

	for(int layer = 1; layer <= 6; ++layer){
		count_times++;
		
		if(newr!=0){
			quotient = r / newr;
			int tmp_newt = t - quotient * newt;
			t = newt;
			newt = tmp_newt;

			int tmp_newr = r - quotient * newr;
			r = newr;
			newr = tmp_newr;
		}else{
			//this part is to hold the answer;
		}
	}
	// printf("newr = %d, t = %d, newt = %d\n",newr,t,newt);
	if(newr != 0) t = newt;// this himself represents layer7

	// if(r > 1) *ans = -1;
	if(t < 0) *ans = t+n;
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
