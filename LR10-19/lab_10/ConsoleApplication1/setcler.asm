.386
.model FLAT, C

PUBLIC SetCler

.CODE
SetCler:
	PUSH EBP
	MOV EBP, ESP

	MOV ECX, [EBP + 16] ; P
	MOV EAX, [EBP + 12] ; N
	MOV EBX, [EBP + 8] ; X

	CMP ECX, 0
	JE m0
	JMP m1

m1: ;установка 1
	BTS [EBX], EAX ; положить в CF + установить бит в 1
	JMP exit

m0: ;установка 0
	BTR [EBX], EAX ; положить в CF + сбросить бит в 0
	JMP exit

exit:
	POP EBP
	RET
END
