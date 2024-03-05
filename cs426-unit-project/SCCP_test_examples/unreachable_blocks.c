#include <stdlib.h>
#include <math.h>

int main() {
	int A = 1;
	int B = 2;
	int C;
	int D;
	int E;
	int F;
	double G;
	if(A > B) {
		// dead code
		C = 3;
		D = A*B;
		F = C-D+A;
		G = (double)B*(double)D;
	} else {
		C = 15;
		G = (double)A*(double)C;
		D = rand();
		E = sqrt(C*G);
		F = sqrt(D);

	}
	return 0;
}
