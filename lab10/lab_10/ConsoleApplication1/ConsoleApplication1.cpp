// ConsoleApplication1.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <iostream>

extern "C" void P0();
extern "C" int S1;
extern "C" int S3;
extern "C" int S;

int _tmain(int argc, _TCHAR* argv[])
{
	P0();
	std::cout << S << std::endl;
	std::cout << S1 << std::endl;
	std::cout << S3 << std::endl;
	system("pause");
	return 0;
}

