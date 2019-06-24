.386
.model FLAT, C

PUBLIC DelProbel

.CODE
DelProbel:
	PUSH EBP
    MOV EBP, ESP
	PUSH EDI
	MOV EDI, [EBP + 8] ; cтрока
	PUSH EDI
    
Before:
	MOV AL, ' ' ; символ пробел
	MOV ECX, -1
	CLD ; df = 0, еsi и еdi регистры увеличиваются

	REPE SCASB ; выполнять, пока cx<>0 или zf=1, сканирует цепочку на присутствие некоторого элементa
	
	NEG ECX ; отрицание числа
	SUB ECX, 2 ; вычитание 1

	POP EDI
	PUSH EDI
	ADD ECX, EDI

Shift_left: ; смещение влево
	MOV DL, [ECX] ; читаем байт
    INC EDI
	INC ECX
    MOV [EDI], DL ; копируем его в начало
    OR DL, DL ; пока не конец строки
    JNZ Shift_left
	POP ECX
	PUSH ECX

After:
	MOV AL, ' ' ; символ пробел
	MOV ECX, -1
	DEC EDI
	STD ; df = 1, еsi и еdi регистры уменьшаются
	REPE SCASB ; выполнять, пока cx<>0 или zf=1, сканирует цепочку на присутствие некоторого элементa
	ADD EDI, 2 ; прибавляем 2, переход за лишний символ и конец строки
	MOV BYTE PTR [EDI], 0 ; установка конца строки
	CLD

	POP ECX ; длина новой строки
	SUB EDI, ECX
	MOV EAX, EDI

	POP EDI
	POP EBP
	RET
END