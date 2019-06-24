EXTRN NEW_LINE : NEAR
EXTRN UNSIGNED2 : NEAR
PUBLIC SIGNED2

DSEG SEGMENT PARA PUBLIC 'DATA'
  W DB  10,13,'SIGNED2', '$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG, DS:DSEG

SIGNED2 PROC NEAR
BEGIN:
  PUSH BP		;передаем параметр
  MOV BP,SP
  MOV	AX,[BP+4] ;получаем в АХ число, которое надо распечатать
  CMP	AX,0 ;сравниваем с 0
  JGE	PRINT2 ;больше или равно

MAKE_NEG: ;иначе берем отрицание
  PUSH AX
  MOV	AH,2h ;знак цифры результата
  MOV	DL,'-'
  INT	21h
  POP	AX
  NEG AX ;делаем AX положительным

PRINT2:
  PUSH AX
  CALL UNSIGNED2 ;осуществляем перевод
  ADD	SP,2 ;очистка стека

EXIT:
  POP	BP
  RET
SIGNED2 ENDP

CSEG	ENDS
END
