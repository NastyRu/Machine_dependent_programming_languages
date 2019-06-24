SSTACK SEGMENT PARA STACK 'STACK'
	DB 100 DUP(0)
SSTACK ENDS

SD1 SEGMENT PARA COMMON 'DATA'
	W DW 3444h ;позволяет заносить в память программ двухбайтные числа
SD1 ENDS
END
