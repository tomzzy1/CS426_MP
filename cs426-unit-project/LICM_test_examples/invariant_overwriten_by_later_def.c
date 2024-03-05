// TODO: debug, a * b should be hoisted, but not assigned to X
int main() {
	int i;
	int N = 10;
	int X = 0;
	int Y = 5;
	int a = 2;
	int b = 3;
	do {
		X = a * b;
		Y = X * i;
		X = Y + 1;
		i++;
	} while(i < N);

	return 0;
}
