PUBLIC OUTPUT_X
EXTRN X: BYTE

DS2 SEGMENT AT 0b800h
	CA LABEL BYTE ;объявление переменной, представляющую ячейку указанного типа в текущей позиции сегмента
	ORG 80 * 2 * 2 + 2 * 2 ; (строка * 80 (ширина экрана) + столбец) * 2
	Z LABEL WORD
DS2 ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG, ES:DS2
OUTPUT_X PROC NEAR
  	MOV AX, DS2
  	MOV ES, AX
  	MOV AH, 10
  	MOV AL, X
  	MOV Z, AX
  	RET
  OUTPUT_X ENDP
CSEG ENDS
END
