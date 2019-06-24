.386
.model FLAT, C

PUBLIC CopyStr



.CODE
PUSH_ALL MACRO LIST
  IRP REG,<LIST> ; for REG in LIST
    IFIDN <REG>,<F> ; if REG == F
      PUSHF
    ELSE
      PUSH REG
    ENDIF
  ENDM
ENDM

POP_ALL MACRO LIST
  IRP REG,<LIST>
    IFIDN <REG>,<F>
      POPF
    ELSE
      POP REG
    ENDIF
  ENDM
ENDM

CopyStr:
    PUSH EBP
    MOV EBP, ESP
	PUSH_ALL <ESI, EDI>
    
	MOV ECX, [EBP + 16] ; ����� L
	MOV EDI, [EBP + 12] ; �������� s2
	MOV ESI, [EBP + 8] ; �������� s1

	CLD ; df = 0, �si � �di �������� �������������

    REP MOVSB ; �� esi � edi �������� ���������� ����������� ���������� �������, ���������, ���� �cx<>0 (cx ����������� �������������)

	POP_ALL <EDI,ESI>
	POP EBP

	RET
END