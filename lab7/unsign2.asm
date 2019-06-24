EXTRN NEW_LINE : NEAR
PUBLIC UNSIGNED2

DSEG SEGMENT PARA PUBLIC 'DATA'
  W DB  10,13,'UNSIGNED2', '$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG, DS:DSEG

UNSIGNED2 PROC NEAR
BEGIN:
  PUSH BP ;передаем параметр
  MOV	BP,SP
  PUSH SI
  MOV	AX,[BP+4] ;получаем в АХ число, которое надо распечатать
  MOV	SI,16 ;счетчик

;Цикл избавления от незначащих нулей
CYCLE1:
  MOV DH,0 ;бегаем по битам
  SHL	AX,1 ;Сдвиг AX на 1 бит влево
  JNC	DEL ;нет переполнения, идем к следующему биту
  INC DH ;прибавление 1
  JMP PRINT ;если переполнение
DEL:
  DEC SI ;уменьшение на 1
  JNZ CYCLE1 ;не нуль

;Цикл печати
CYCLE2:
  MOV DH,0 ;бегаем по битам
  SHL	AX,1 ;Сдвиг AX на 1 бит влево
  JNC	PRINT ;нет переполнения, печатаем и идем к следующему биту
  INC DH ;прибавление 1
PRINT:
  MOV	DL,'0' ;устанавливаем сдвиг до 0 (начала отсчета вывода)
  ADD	DL,DH ;добавляем бит
  PUSH AX
  MOV	AH,2
  INT	21h ;выводим
  POP	AX
  DEC	SI ;переходим к следующему
  JNZ	CYCLE2 ;не нуль

EXIT:
  POP SI
  POP BP
  CALL NEW_LINE
  RET
UNSIGNED2 ENDP

CSEG	ENDS
END
