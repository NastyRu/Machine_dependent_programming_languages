.386
.model FLAT, C

PUBLIC DlinaStroki

.CODE
DlinaStroki:
	PUSH EBP
    MOV EBP, ESP
	PUSH EDI
    
	MOV EDI, [EBP + 8] ; c�����

	MOV AL, 0 ; ������ ����� ������

	CLD ; df = 0, �si � �di �������� �������������
	MOV ECX, -1 ; ����� ������

	REPNE SCASB ;  ���������, ���� cx<>0 ��� zf=0 (cx ����������� �������������), ��������� ������� �� ����������� ���������� ��������

	NEG ECX ; ��������� �����
	SUB ECX, 2 ; ��������� 2 (-1 ��������� �������� � ��������� ����)
	MOV EAX, ECX
	
	POP EDI
    POP EBP
	RET
END