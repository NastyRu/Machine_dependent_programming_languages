EXTRN NEW_LINE : NEAR
PUBLIC MENU

DSEG SEGMENT PARA PUBLIC 'DATA'
    sm   DB  10,13,'MENU', '$'
    sm0  DB  '0. Print menu', '$'
    sm1  DB  '1. Input number', '$'
    sm2  DB  '2. Number as unsigned bin', '$'
    sm3  DB  '3. Number as signed bin', '$'
    sm4  DB  '4. Number as unsigned dec', '$'
    sm5  DB  '5. Number as signed dec', '$'
    sm6  DB  '6. Number as unsigned hex', '$'
    sm7  DB  '7. Number as signed hex','$'
    sm8  DB  '8. Exit', '$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG, DS:DSEG

MENU PROC NEAR
  MOV AH,9
  MOV DX, OFFSET sm
  INT 21h
  CALL NEW_LINE
  MOV DX, OFFSET sm0
  INT 21h
  CALL NEW_LINE
  LEA DX,sM1
  INT 21h
  CALL NEW_LINE
  MOV DX, OFFSET sm2
  INT 21h
  CALL NEW_LINE
  MOV DX, OFFSET sm3
  INT 21h
  CALL NEW_LINE
  MOV DX, OFFSET sm4
  INT 21h
  CALL NEW_LINE
  MOV DX, OFFSET sm5
  INT 21h
  CALL NEW_LINE
  MOV DX, OFFSET sm6
  INT 21h
  CALL NEW_LINE
  MOV DX, OFFSET sm7
  INT 21h
  CALL NEW_LINE
  MOV DX, OFFSET sm8
  INT 21h
  CALL NEW_LINE
  RET
MENU ENDP

CSEG	ENDS
END
