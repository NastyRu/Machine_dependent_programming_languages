SSTACK SEGMENT PARA STACK 'STACK'
    DB 64 DUP (?)
SSTACK ENDS

SD1 SEGMENT PARA PUBLIC 'DATA'
    S1 DB 'Y' ;байтовых переменных
    DB 65535 - 2 DUP (0) ;длины 64К-2
SD1 ENDS

SD2 SEGMENT PARA PUBLIC 'DATA'
    S2 DB 'E' ;байтовых переменных
    DB 65535 - 2 DUP (0) ;длины 64К-2
SD2 ENDS

SD3 SEGMENT PARA PUBLIC 'DATA'
    S3 DB 'S' ;байтовых переменных
    DB 65535 - 2 DUP (0) ;длины 64К-2
SD3 ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS: CSEG, DS: SD1, SS: SSTACK
    OUTPUT:
        MOV AH,2 ;вывода одиночного элемента
        INT 21h
        MOV DL,13 ;возврат каретки
        INT 21h
        MOV DL,10 ;перевод на новую строку
        INT 21h
        RET

    MAIN:
        MOV AX,SD1
        MOV DS,AX
        MOV DL,S1
        CALL OUTPUT

    ASSUME DS: SD2
        MOV AX,SD2
        MOV DS,AX
        MOV DL,S2
        CALL OUTPUT

    ASSUME DS: SD3
        MOV AX,SD3
        MOV DS,AX
        MOV DL,S3
        CALL OUTPUT

        MOV AX, 4c00h ;пересылаем номер функции в регистр AX. Функция 4C00h - выход из программы
        INT 21h
CSEG ENDS
END MAIN
