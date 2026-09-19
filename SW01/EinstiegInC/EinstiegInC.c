#include <stdio.h>

void printNumbersGoto(int n) 
{
	int current = 0;
start:
	printf("%i ", current);

	current++;

	if (current <= n) 
	{
		goto start;
	}
}

void printNumbersFor(int n)
{
	for (int i = 0; i <= n; i++)
	{
		printf("%i ", i);
	}
}

void printNumbersRecursive(int current, int n) 
{
	printf("%i ", current);

	if (current == n) return;

	current++;
	printNumbersRecursive(current, n);
}

void printNumbersRecursiveFunction(int n) 
{
	printNumbersRecursive(0, n);
}

void printReverseNumbersRecursiveFunction(int n)
{
	printf("%i ", n);

	if (n == 0) return;

	printReverseNumbersRecursiveFunction(n - 1);
}

int main(void)
{
	printNumbersGoto(7);
	printf("= printNumbersGoto(7)\n");
	printNumbersFor(7);
	printf("= printNumbersFor(7)\n");
	printNumbersRecursiveFunction(7);
	printf("= printNumbersRecursiveFunction(7)\n");
	printReverseNumbersRecursiveFunction(7);
	printf("= printReverseNumbersRecursiveFunction(7)\n");
}