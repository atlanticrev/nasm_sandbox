section .bss
    array resb 256  ; 256 cells of 1 byte

section .text
    mov ecx, 256    ; counter
    mov edi, array  ; first array element
    mov al, '@'     ; symbol for filling
again:
    mov [edi], al   ; set symbol
    inc edi
    dec ecx
    jnz again       ; loop
