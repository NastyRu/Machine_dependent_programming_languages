PUBLIC CHANGE
EXTRN X: byte

SD2 SEGMENT PARA 'DATA'
    Y db 'Y'
SD2 ENDS

SC2 SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:SC2, DS:SD2
    CHANGE:
        MOV BL,X
        MOV AX,SD2
        MOV DS,AX
        MOV CL,Y
        MOV X,CL
        MOV Y,BL
        MOV AH,2 ;печать одного символа
        MOV DL,Y
        INT 21h

        MOV AX, 4c00h ;пересылаем номер функции в регистр AX. Функция 4C00h - выход из программы
        INT 21h
SC2 ENDS
END
