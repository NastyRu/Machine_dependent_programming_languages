EXTRN OUTPUT_X: NEAR ;используется в других модулях, обращение из другого сегмента кода

SSTACK SEGMENT PARA STACK 'STACK'
	DB 100 DUP(0) ;занесения в память программ однобайтных констант
SSTACK ENDS

DSEG SEGMENT PARA PUBLIC 'DATA'
  PUBLIC X
	X DB 'R'
DSEG ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG, DS:DSEG, SS:SSTACK
  MAIN:
  	MOV AX, DSEG
  	MOV DS, AX

  	CALL OUTPUT_X

  	MOV AX, 4c00h ;пересылаем номер функции в регистр AX. Функция 4C00h - выход из программы
  	INT 21h
	CSEG ENDS
	END MAIN
