// ConsoleApplication2.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <iostream>

extern "C" void p1(int N, int *g);

int N = 6, NF = 7;

int _tmain(int argc, _TCHAR* argv[])
{
	p1(N, &NF);
	printf("%d! = %d \n", N, NF);

	system("pause");
	return 0;
}

