.386
.model FLAT, C

PUBLIC DelProbel

.CODE
DelProbel:
	PUSH EBP
    MOV EBP, ESP
	PUSH EDI
	MOV EDI, [EBP + 8] ; c�����
	PUSH EDI
    
Before:
	MOV AL, ' ' ; ������ ������
	MOV ECX, -1
	CLD ; df = 0, �si � �di �������� �������������

	REPE SCASB ; ���������, ���� cx<>0 ��� zf=1, ��������� ������� �� ����������� ���������� �������a
	
	NEG ECX ; ��������� �����
	SUB ECX, 2 ; ��������� 1

	POP EDI
	PUSH EDI
	ADD ECX, EDI

Shift_left: ; �������� �����
	MOV DL, [ECX] ; ������ ����
    INC EDI
	INC ECX
    MOV [EDI], DL ; �������� ��� � ������
    OR DL, DL ; ���� �� ����� ������
    JNZ Shift_left
	POP ECX
	PUSH ECX

After:
	MOV AL, ' ' ; ������ ������
	MOV ECX, -1
	DEC EDI
	STD ; df = 1, �si � �di �������� �����������
	REPE SCASB ; ���������, ���� cx<>0 ��� zf=1, ��������� ������� �� ����������� ���������� �������a
	ADD EDI, 2 ; ���������� 2, ������� �� ������ ������ � ����� ������
	MOV BYTE PTR [EDI], 0 ; ��������� ����� ������
	CLD

	POP ECX ; ����� ����� ������
	SUB EDI, ECX
	MOV EAX, EDI

	POP EDI
	POP EBP
	RET
END