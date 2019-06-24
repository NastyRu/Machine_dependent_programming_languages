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
    
	MOV ECX, [EBP + 16] ; длина L
	MOV EDI, [EBP + 12] ; приемник s2
	MOV ESI, [EBP + 8] ; источник s1

	CLD ; df = 0, еsi и еdi регистры увеличиваются

    REP MOVSB ; из esi в edi префиксы повторения зацикливают выполнение команды, выполнять, пока еcx<>0 (cx уменьшается автоматически)

	POP_ALL <EDI,ESI>
	POP EBP

	RET
END