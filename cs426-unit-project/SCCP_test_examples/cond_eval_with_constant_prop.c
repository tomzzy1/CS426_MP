#include <stdlib.h>

int main() {
	int I = 1;
	int J = 1;
	int K = 0;
	while(K < 10) {
		J = I;
		I = rand();
		if(J > 0) I = J;
		K++;
	}
	return 0;
}
