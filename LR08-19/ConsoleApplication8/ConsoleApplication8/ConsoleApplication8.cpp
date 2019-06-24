// ConsoleApplication8.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <conio.h>
#include <iostream>
#include <tchar.h>

using namespace std;

unsigned char mas[8][8] = {
	{1,1,1,1,1},
	{2,2,2,2,2},
	{3,3,3,3,3},
	{4,4,4,4,4},
	{5,5,5,5,5}
};



int _tmain(int argc, _TCHAR* argv[])
{
	for(int i = 0; i < 5; i++) {
		for(int j = 0; j < 5; j++) {
		printf("%2d", mas[i][j]);
		}
		printf("\n");
	}
	printf("\n");

	_asm {
		mov EBX, offset mas
		mov ECX,7
OuterLoop: 
		lea ESI,[EBX+1]
		lea EDI,[EBX+8]

InnerLoop:
		XCHG AL,[ESI]
		XCHG AL,[EDI]
		XCHG AL,[ESI]

		inc ESI
		ADD EDI,8

		mov EAX,1
		ADD EAX,ECX

		ADD EAX,EBX
		cmp ESI,EAX
		jb InnerLoop
		jmp CheckOuterLoop

CheckOuterLoop:
		ADD EBX,9
		Loop OuterLoop	
	}

	for(int i = 0; i < 5; i++) {
		for(int j = 0; j < 5; j++) {
		printf("%2d", mas[i][j]);
		}
		printf("\n");
	}
	printf("\n");

	for (int i = 0; i < 4; i++) {
		for (int j = i + 1; j < 5; j++) {
			int swap = mas[i][j];
			mas[i][j] = mas[j][i];
			mas[j][i] = swap;
		}
	}

	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 5; j++) {
			printf("%2d", mas[i][j]);
		}
		printf("\n");
	}
	printf("\n");

	system ("pause");
	return 0;
}

