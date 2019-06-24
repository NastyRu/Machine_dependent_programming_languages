EXTRN NEW_LINE : NEAR
PUBLIC UNSIGNED10

DSEG SEGMENT PARA PUBLIC 'DATA'
  W DB  10,13,'UNSIGNED10', '$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG, DS:DSEG

UNSIGNED10 PROC NEAR
BEGIN:
  PUSH BP
  MOV	BP,SP
  PUSH BX
  MOV	AX,[BP+4] ;получаем в АХ число, которое надо распечатать
  MOV	BX,10 ;помещаем 10
  PUSH AX

;Цикл нахождения конца ввода
LOOP1:
  MOV	DX,0
  DIV	BX ;Деление AX=(DX:AX)/BX, остаток в DX
  MOV	CX,AX	;сохраним значение AX (целая часть)
  MOV	AH,2 ;печатаем пропуск
  MOV	DL,' '
  INT	21h
  MOV	AX,CX
  CMP	AX,0 ;проверка на окончание
  JNE	LOOP1 ;не нуль

  ;делаем один откат назад
  MOV	AH,2
  MOV DL,8 ;переназначение сегмента
  INT 21h
  POP	AX

;Цикл печати остатков с конца(с первого)
LOOP2:
  MOV	DX,0
  DIV	BX ;Деление AX=(DX:AX)/BX, остаток в DX
  MOV	CX,AX	;сохраним значение AX (целая часть)
  MOV	AH,2
  ADD	DL,'0' ;печатаем значение DX (остаток)
  INT	21h
  MOV	DL,8 ;переназначение сегмента
  INT	21h ;смещаемся на одну позицию до текущего ввода
  INT	21h ;смещаемся на одну позицию для ввода на следующем шаге
  MOV	AX, CX
  CMP	AX,0 ;проверка на окончание
  JNE	LOOP2 ;не нуль

EXIT:
  POP BX
  POP	BP
  CALL NEW_LINE
  RET
UNSIGNED10 ENDP

CSEG	ENDS
END
