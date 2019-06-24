EXTRN NEW_LINE : NEAR
EXTRN UNSIGNED10 : NEAR
PUBLIC SIGNED10

DSEG SEGMENT PARA PUBLIC 'DATA'
  W DB  10,13,'SIGNED10', '$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG, DS:DSEG

SIGNED10 PROC NEAR
BEGIN:
  PUSH BP ;передаем параметр
  MOV	BP,SP
  MOV	AX,[BP+4] ;получаем в АХ число, которое надо распечатать
  CMP	AX,0 ;сравниваем с 0
  JGE	PRINT10 ;больше или равно

MAKE_NEG:
  PUSH AX
  MOV	AH,2h ;знак цифры результата
  MOV	DL,'-'
  INT	21h
  POP	AX
  NEG AX ;делаем AX положительным

PRINT10:
  PUSH AX
  CALL UNSIGNED10 ;осуществляем перевод
  ADD	SP,2 ;очистка стека

EXIT:
  POP	BP
  RET
SIGNED10 ENDP

CSEG	ENDS
END
