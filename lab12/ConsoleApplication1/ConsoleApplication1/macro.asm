.386
.model FLAT,C

public F

.Data
a dd 1
b dd 2

swapb macro x1, x2
	xchg eax, x1
	xchg eax, x2
	xchg eax, x1
endm

PUSH_ALL MACRO LIST
  IRP REG, <LIST> ;; for REG in LIST
    IFIDN <REG>, <F> ;; if REG == F
      PUSHF
    ELSE
      PUSH REG
    ENDIF
  ENDM
ENDM

POP_ALL MACRO LIST
LOCAL count
	count = 0
	FOR param, <LIST> ;; создаем переменные varXX
        count = count + 1
		@CatStr(var, %count) TEXTEQU <param>
	ENDM
	REPT count
		pop @CatStr(var, %count)
		count = count - 1
	ENDM
ENDM

FUNC MACRO TYPE, FUNC_NAME, PARS, REGS
LOCAL count
FUNC_NAME:
	count = 0
	PUSH EBP
	MOV EBP, ESP
	PUSH_ALL <REGS>
	
	FOR param, <PARS> ;; создаем переменные varXX
        count = count + 1
		@CatStr(var, %count) EQU <param>
		%param EQU (EBP + @CatStr(var, %count))
	ENDM
ENDM

FUNC_END MACRO FUNC_NAME, REGS
@CatStr(FUNC_NAME, _end):
	POP_ALL <REGS>
	POP EBP
	RET
ENDM

.CODE
FUNC void, abc, <x1, x2>, <EAX, ESI>

FUNC_END abc, <EAX, ESI>

FUNC "int", F, , <EAX>
	push dword ptr b
	push dword ptr a
	call abc
	pop dword ptr a
	pop dword ptr b

FUNC_END F, <EAX>
END
