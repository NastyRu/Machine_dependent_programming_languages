SSTACK  SEGMENT PARA STACK 'STACK'
    DB 200h DUP (0)
SSTACK  ENDS

DSEG SEGMENT PARA PUBLIC 'DATA'
    N DW 5
    MATRIX DB 1,2,3,4,5
           DB 1,2,3,4,5
           DB 1,2,3,4,5
           DB 1,2,3,4,5
           DB 1,2,3,4,5
DSEG ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG, DS:DSEG, SS:SSTACK

  BEGIN PROC FAR

  MOV AX,DSEG
  MOV DS,AX

  WRITE0:
      MOV SI,0
      MOV CX,N ;задаем начальные значения
      MOV AH,2 ;команда дос вывод символа
  W10:
      PUSH CX
      MOV CX,N ;Сохраняем размеры матрицы
  W20:
      MOV DL,MATRIX[SI] ;число
      ADD DL,30h ;код чисел начинается с 30h, то есть 30h - 0, значит 35h - 5, то есть надо добавить 30h
      INT 21h
      MOV DL,' '
      INT 21h
      INC SI
      LOOP W20
      MOV DL,0ah ;символ LF (0Ah) опускает курсор на одну позицию вниз
      INT 21h
      POP CX ;восстановить текущий символ
      LOOP W10
      MOV DL,0ah ;символ LF (0Ah) опускает курсор на одну позицию вниз
      INT 21h
      MOV AX,0

  TRANSP:
      MOV SI,OFFSET MATRIX
      MOV BX,SI ;базовые адреса начала матрицы
      MOV CX,N ;размеры матрицы
      ADD BX,N ;Переходим к второй строке матрицы
      DEC CX ;Пропускаем клетку, лежащую на главной диагонали
  T1:
      MOV SP,CX
      MOV BP,BX
  T2:
      INC SI ;Переходим к следующему столбцу
      XCHG AL,[SI] ;[]-помещение по адресу
      XCHG AL,[BX] ;Обмен значений столбцов и строк
      XCHG [SI],AL ;[]-извлечения из адреса
      ADD BX,N ;Переходим к следующей строке
      LOOP T2 ;Обмениваем часть строки выше главной диагонали с частью столбца ниже главной диагонали

      MOV CX,SP
      MOV BX,BP
      ADD BX,N
      INC BX ;Переходим к следующему столбцу, пропуская клетку, лежащую на главной диагонали
      MOV SI,BX
      SUB SI,N ;и к следующей строке(вычитание)
      LOOP T1 ;И опять производим обмен очередных пар строк и столбцов

  WRITE:
      MOV SI,0
      MOV CX,N ;задаем начальные значения
      MOV AH,2 ;команда дос вывод символа
  W1:
      PUSH CX
      MOV CX,N ;Сохраняем размеры матрицы
  W2:
      MOV DL,MATRIX[SI] ;число
      ADD DL,30h ;код чисел начинается с 30h, то есть 30h - 0, значит 35h - 5, то есть надо добавить 30h
      INT 21h
      MOV DL,' '
      INT 21h
      INC SI
      LOOP W2
      MOV DL,0ah ;символ LF (0Ah) опускает курсор на одну позицию вниз
      INT 21h
      POP CX ;восстановить текущий символ
      LOOP W1
      MOV AX,0

  MOV AX,4c00h
  INT 21h

  BEGIN ENDP
  CSEG ENDS
END BEGIN
