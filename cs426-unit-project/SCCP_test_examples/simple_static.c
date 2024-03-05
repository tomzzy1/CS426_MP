#include <stdlib.h>
#include <math.h>

int main() {
	int A = 1;
	int B = 2;
	int C = 3;
	int D = 4;
	int E = 5;
	int F = E*A + D - C;
	int G = F << B;
	int H = A * B * F;
	int I = H * rand();
	int J = I*B;
	int K = rand();
	int L = J*K;
	if(C > E) {
		B = 5;
	} else {
		B = 10;
	}
	int N = sqrt(B);
	if(B > D) {
		L = B;
	}
	int M = sqrt(L);
	return 0;
}
