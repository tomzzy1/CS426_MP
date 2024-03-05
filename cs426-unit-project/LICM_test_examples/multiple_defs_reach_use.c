// TODO: debug, a * b should be hoisted, but not assigned to X
int main() {
	int i;
	int N = 10;
	int X = 4;
	int Y = 5;
	int a = 2;
	int b = 3;
	do {
		X = a * b;
		if(i < 5)
			X = X * i;
		Y = X;
		i++;
	} while(i < N);

	return 0;
}
