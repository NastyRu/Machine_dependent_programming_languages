; копировать байт b, слово w, двойное слово 
; макроопределение с одним параметром для сохранения в стеке регистров указанных при вызове как список
; внутри макроопределения использовать для огранизации цикла

; сделать файл с типовыми директивами, котрпые могут потребоваться в певрую очередь для разработки ассмеблреного файла в с++
; .386
; .model flat, c
; extern (коммент)
; public (коммент)
; .data (пустой)
; .code (метка) ret end

.386
.model flat, c

public swap
public x1
public x2
public x3
public x4
public x5
public x6

.data
x1 db 1
x2 db 2

x3 dd 3
x4 dd 4

x5 dw 5
x6 dw 6

swapb macro x1, x2
	xchg al, x1
	xchg al, x2
	xchg al, x1
endm

swapw macro x1, x2
	xchg ax, x1
	xchg ax, x2
	xchg ax, x1
endm

swapd macro x1, x2
	xchg eax, x1
	xchg eax, x2
	xchg eax, x1
endm

.code
swap:
	swapb x1, x2
	swapd x3, x4
	swapw x5, x6
	ret
end