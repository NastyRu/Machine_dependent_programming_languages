SSTACK  SEGMENT PARA STACK 'STACK'
    DB 200h DUP (0)
SSTACK  ENDS

DSEG SEGMENT PARA PUBLIC 'DATA'
    ARRAY db 2,6,5,0,8,1,9,4,3,7
    N db 10
DSEG ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG, DS:DSEG, SS:SSTACK

  MAIN PROC FAR

  MOV AX,DSEG
  MOV DS,AX

  ;вывод массива
  MOV CX,0
  MOV BX,0
  MOV CL,N
  WRITE1:
      MOV AH,2
      MOV DL,ARRAY[BX]
      ADD DL,30h ;код чисел начинается с 30h, то есть 30h - 0, значит 35h - 5, то есть надо добавить 30h
      INT 21h
      MOV DL,' '
      INT 21h
      INC BX
      LOOP WRITE1
      MOV DL,0ah ;символ LF (0Ah) опускает курсор на одну позицию вниз
      INT 21h

  SORT0:
      MOV SI,0
      MOV CX,N
      DEC CX
      MOV DL,1
  SORT:
      MOV AL,ARRAY[SI]
      CMP ARRAY[SI+1],AL
      JNL EXIT ;сравнение элементов
      XCHG AL,ARRAY[SI+1]
      MOV ARRAY[SI],AL
      MOV DL,0 ;обмен был, обнуляем dl
  EXIT:
      INC SI
      LOOP SORT
      OR DL,DL ;если dl=1, элементы не менялись, на выход
      JZ SORT0 ;проверка на ноль


  ;вывод отсортированного массива
  MOV CX,0
  MOV BX,0
  MOV CL,N
  WRITE2:
      MOV AH,2
      MOV DL,ARRAY[BX]
      ADD DL,30h ;код чисел начинается с 30h, то есть 30h - 0, значит 35h - 5, то есть надо добавить 30h
      INT 21h
      MOV DL,' '
      INT 21h
      INC BX
      LOOP WRITE2
      MOV DL,0ah ;символ LF (0Ah) опускает курсор на одну позицию вниз
      INT 21h

  MOV AX,4c00h
  INT 21h
  MAIN ENDP
  CSEG ENDS
END
