EXTRN NEW_LINE : NEAR
PUBLIC UNSIGNED16

DSEG SEGMENT PARA PUBLIC 'DATA'
  W DB  10,13,'UNSIGNED16', '$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG, DS:DSEG

UNSIGNED16 PROC NEAR
  MOV AX,6
  MOV AH,9
  MOV DX, OFFSET W
  INT 21h
  CALL NEW_LINE
  RET
UNSIGNED16 ENDP

CSEG	ENDS
END