.386
.model FLAT, C

PUBLIC A_u_B

.CODE
A_u_B:
	PUSH EBP
	MOV EBP, ESP
	
	MOV EAX, [EBP + 8] ; A
	MOV EBX, [EBP + 12] ; B
	MOV ECX, [EBP + 16]	; L
	MOV ESI, 0 ;счетчик
	
loopc:
	BT [EBX], ESI
	JNC next
	BTS [EAX], ESI
	
next:
	INC ESI
	LOOP loopc

EXIT:
	POP EBP
	RET
END
