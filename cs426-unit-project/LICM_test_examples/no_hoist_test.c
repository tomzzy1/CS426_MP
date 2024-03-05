#include <stdio.h>

int main(int argc, char *argv[]) {
	printf("Testing write\n");
	int i = 0;
	int j = 0;
	int x = 5;
	int y = 20;
	while(i < 10) {
		x++;
		while(j < 5) {
			y = x*3;
			j++;
		}
		i++;
	}

	return 1;
}

