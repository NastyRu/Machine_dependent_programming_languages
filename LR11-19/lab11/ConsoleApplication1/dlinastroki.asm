.386
.model FLAT, C

PUBLIC DlinaStroki

.CODE
DlinaStroki:
	PUSH EBP
    MOV EBP, ESP
	PUSH EDI
    
	MOV EDI, [EBP + 8] ; cтрока

	MOV AL, 0 ; символ конца строки

	CLD ; df = 0, еsi и еdi регистры увеличиваются
	MOV ECX, -1 ; длина строки

	REPNE SCASB ;  выполнять, пока cx<>0 или zf=0 (cx уменьшается автоматически), сканирует цепочку на присутствие некоторого элемента

	NEG ECX ; отрицание числа
	SUB ECX, 2 ; вычитание 2 (-1 начальное значение и конечного нуля)
	MOV EAX, ECX
	
	POP EDI
    POP EBP
	RET
END