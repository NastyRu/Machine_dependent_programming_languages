.386
.model FLAT, C

PUBLIC A_B

.CODE
A_B:
	PUSH EBP
	MOV EBP, ESP
	
	MOV EAX, [EBP + 8]	; A
	MOV EBX, [EBP + 12] ; B
	MOV ECX, [EBP + 16] ; L
	MOV ESI, 0
	
loopc:
	BT [EBX], ESI
	JNC next	
	BTR [EAX], ESI
	
next:
	INC ESI
	LOOP loopc

EXIT:
	POP EBP
	RET
END