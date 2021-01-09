; fill memory (edi=address, ecx=length, al=value)
fill_memory:
    jecxz fm_q
fm_lp:
    mov [edi], al
    inc edi
    loop fm_lp
fm_q:
    ret

section .text
    mov edi, my_array
    mov ecx, 256
    mov al, '@'
    call fill_memory
