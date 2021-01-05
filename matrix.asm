%include "includes/stud_io.inc"

global _start

section .bss
matrix  resd 2 * 2
    
section .text
_start: mov al, '#'
        mov edi, matrix
        mov ebx, 1 * 2 * 4 ; second string (index 1), 2 elements of 4 bytes in row
        mov [matrix + ebx + 1 * 4], al ; second element (index 1)
        mov eax, [matrix + ebx + 1 * 4]
        PRINT eax