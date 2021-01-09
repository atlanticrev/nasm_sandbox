; Beginning of the string in esi
section .text
    xor ebx, ebx
    xor ecx, ecx
lp:
    mov bl, [esi+ecx]   ; current character from a string (1 byte)
    cmp bl, 0           ; end of the string?
    je lpquit
    push ebx            ; working with 32-bit words for a reason of effectivity (character in its lower byte)
    inc ecx             ; characters counter
    jmp lp              ; cointinue first loop
lpquit:
    jecxz done
    mov edi, esi        ; beginning of the string in edi
lp2:
    pop ebx
    mov [edi], bl       ; edi points to character to edit
    inc edi             ; shift edi
    loop lp2            ; loop while ecx != 0 (string length in ecx in a beginning)
done:
