SD1 SEGMENT PARA COMMON 'DATA'
	C1 LABEL BYTE ;Объявление метки, память не резервируется
	ORG 1h ;указание транслятору весь ниже лежащий код помести в памяти начиная с адреса 
	C2 LABEL BYTE
SD1 ENDS

CSEG SEGMENT PARA 'CODE'
	ASSUME CS:CSEG, DS:SD1
MAIN:
	MOV AX, SD1
	MOV DS, AX
	MOV AH, 2 ;вывод ввиде символов
	MOV DL, C1
	INT 21h
	MOV DL, C2
	INT 21h
	MOV AX, 4c00h ;пересылаем номер функции в регистр AX. Функция 4C00h - выход из программы.
	INT 21h
CSEG ENDS
END MAIN
