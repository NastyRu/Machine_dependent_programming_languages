.386
.model Flat,C
public p1

.CODE
p1:	
	PUSH EBP
	MOV EBP, ESP
	MOV ECX, [EBP+8]
	MOV EBX, [EBP+12]

	CALL p2

	POP EBP
	RET

p2:
	CMP ECX,0
	JNE not_zero
	MOV DWORD PTR[EBX], 1
	JMP return

not_zero:
	DEC ECX
	CALL p2
	INC ECX
	MOV EAX, DWORD PTR[EBX]
	MUL ECX
	MOV DWORD PTR[EBX], EAX

return:
	RET

END