#include <stdlib.h>

int main() {
	int I = 1;
	int J = 1;
	while(J < 10) {
		J = I;
		I = rand();
		I = J;
	}
	return 0;
}
