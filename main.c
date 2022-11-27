#include <string.h>
#include <stdio.h>
#include <time.h>

double f(double x) {
	return x * x * x * x + 2 * x * x * x - x - 1;
}

double solve(double a, double b, double e) {
	double c;
	while (b - a > e) {
		c = (a + b) / 2;
		if (f(b) * f(c) < 0)
			a = c;
		else
			b = c;
	}
	return (a + b) / 2;
}

int main(int argc, char* argv[]) {
	double res, a, b, eps = 0.000001;
	if (strcmp(argv[1], "-c") == 0) {
		scanf("%lf %lf", &a, &b);
		clock_t begin = clock();
		res = solve(a, b, eps);
		clock_t end = clock();
		printf("%lf\n", res);
		double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
		printf("Program execution time: %lf\n", time_spent);
	}
	else if (strcmp(argv[1], "-f") == 0) {
		FILE* input, * output;
		input = fopen(argv[2], "r");
		output = fopen(argv[3], "w");
		fscanf(input, "%lf %lf", &a, &b);
		clock_t begin = clock();
		res = solve(a, b, eps);
		clock_t end = clock();
		fprintf(output, "%lf\n", res);
		double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
		printf("Program execution time: %lf\n", time_spent);
		fclose(input);
		fclose(output);
	}
	else {
		printf("Please enter one of the following keys: -f, -c\n");
	}
	return 0;
}
