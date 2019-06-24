.386
.model FLAT, C

PUBLIC Count

.CODE
Count:
	PUSH EBP
	MOV EBP, ESP
	
	MOV EBX, [EBP + 8] ; X
	MOV ECX, [EBP + 12]	; L
	
    MOV EAX, 0 ;количество 1
    MOV EDX, 0 ;счетчик по битам
	
loopc:
	BT [EBX], EDX ; положить в CF
	JNC zero ; единица ли это?
	INC EAX

zero:
	INC EDX
		
next_loopc:
	LOOP loopc

	POP EBP	
	RET
END
