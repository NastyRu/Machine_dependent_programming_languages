EXTRN NEW_LINE : NEAR
PUBLIC UNSIGNED16

DSEG SEGMENT PARA PUBLIC 'DATA'
  W DB  10,13,'UNSIGNED16', '$'
  HEXTABLE    DB  "0123456789ABCDEF"
  NUMBER DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG, DS:DSEG

UNSIGNED16 PROC NEAR
BEGIN:
  PUSH BP	;передаем параметр
  MOV	BP,SP
  PUSH BX
  MOV	CX,4
  MOV	DX,[BP+4] ;получаем в BХ число, которое надо распечатать
  MOV SI,16
  ;MOV DX,BX
  ;MOV AX,0

LOOP1:
  MOV AX,15
  AND AX,DX ;побитовое умножение, узнаем 8 бит(текущее значение 2 символа)
  DEC SI ;бегаем по массиву
  MOV BX, OFFSET HEXTABLE ;указатель таблицы засылаем в BX
  XLAT ;переводит байт, согласно таблице преобразова­ний AL=(BX)+(AL)
  MOV BX, OFFSET NUMBER
  MOV [BX+SI],AL ;записываем полученную цифру
  SHR DX,CL ;Сдвиг AL на 4 бит вправо (Двоичная тетрада)
  JNE LOOP1

LOOP2:
  MOV DX,OFFSET NUMBER ;вывод числа
  ADD DX,SI
  MOV AH,9
  INT 21h

  ;CALL NEW_LINE
;LOOP1:
  ;MOV AL,BH
  ;MOV AL,DH
  ;SHR	AL,CL ;Сдвиг AL на 4 бит вправо (Двоичная тетрада)
  ;CMP	AL,0
  ;JE ZERO
  ;MOV	DI,BX ;сохраняем BX
  ;MOV	BX,OFFSET HEXTABLE ;указатель таблицы засылаем в BX
  ;XLAT ;переводит байт, согласно таблице преобразова­ний AL=(BX)+(AL)
  ;MOV	BX,DI
  ;MOV BX,DX
  ;MOV	DI,AL ;теперь в AL находится ASCII-код
  ;MOV	AH,2 ;выводим символ
  ;INT	21h
;ZERO:
  ;SHL	BX,CL ;Сдвиг на 4 бит вправо (Двоичная тетрада)
  ;SHL DX,CL
  ;CMP DX,0
  ;CMP	BX,0
  ;JNE	LOOP1

EXIT:
  POP	BX
  POP	BP
  CALL NEW_LINE
  RET
UNSIGNED16 ENDP

CSEG	ENDS
END
