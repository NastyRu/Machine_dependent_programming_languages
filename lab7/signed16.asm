EXTRN NEW_LINE : NEAR
EXTRN UNSIGNED16 : NEAR
PUBLIC SIGNED16

DSEG SEGMENT PARA PUBLIC 'DATA'
  W DB  10,13,'SIGNED16', '$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG, DS:DSEG

SIGNED16 PROC NEAR
BEGIN:
  PUSH BP ;передаем параметр
  MOV	BP,SP
  MOV	AX,[BP+4] ;получаем в АХ число, которое надо распечатать
  CMP	AX,0 ;сравниваем с 0
  JGE	PRINT16 ;больше или равно

MAKE_NEG:
  PUSH AX
  MOV	AH,2h ;знак цифры результата
  MOV	DL,'-'
  INT	21h
  POP	AX
  NEG AX ;делаем AX положительным

PRINT16:
  PUSH AX
  CALL UNSIGNED16 ;осуществляем перевод
  ADD	SP,2 ;очистка стека

EXIT:
  POP	BP
  RET
SIGNED16 ENDP

CSEG	ENDS
END
