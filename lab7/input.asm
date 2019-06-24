EXTRN NEW_LINE : NEAR
PUBLIC INPUT

DSEG SEGMENT PARA PUBLIC 'DATA'
  W DB 'Input number ', '$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG, DS:DSEG

INPUT PROC NEAR
  BEGIN:
    PUSH BX
    PUSH DX
    PUSH SI
    MOV AX,0
    MOV BX,0
    MOV AH, 9
    MOV DX, OFFSET W
    INT 21h
    MOV DX, 0
  INPUT_SYM:
    MOV AH,1
    INT 21h     ;получаем в AL символ
    CMP AL,13 ;выход по ентер
    JE END_STR
    CMP AL,2Dh ;проверяем на наличие минуса
    JNE NO_NEG ;если неотрицательное
    MOV SI,1 ;метка отрицательного
    JMP INPUT_SYM
  NO_NEG:
  GET_NUM:
    PUSH AX
    MOV AX,BX ;записываем в ах считанную цифру
    MOV BX,10
    MUL BX ;умножаем на 10 в ах
    POP BX
    SUB BL,'0' ;вычитание кодировки
    MOV BH,0
    ADD BX,AX ;добавляем к уже имеющейся
    JMP INPUT_SYM
  END_STR:
    MOV AX, BX ;записываем число в ах
    CMP SI, 1
    JNE EXIT
    NEG AX ;меняем знак числа
  EXIT:
    POP SI
    POP DX
    POP BX
    RET
INPUT ENDP

CSEG	ENDS
END
