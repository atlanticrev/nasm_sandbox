section .bss
    set512 resd 16           ; original set

section .text
; Clear set
    xor eax, eax
    mov ecx, 15
    mov esi, set512          ; first element of array
lp:
    mov [esi+4*ecx], eax     ; 0 -> set512[i]
    loop lp                  ; loop while ecx != 0

; Add element (number in ebx)
    mov cl, bl               ; take lower byte from ebx
    and cl, 11111b           ; get number of bit in cl (mod 32)
    mov eax, 1               ; creating mask
    shl eax, cl              ;
    mov edx, ebx             ; get number of element in edx
    shr edx, 5               ; (div 32)
    or [set512+4*edx]        ; apply mask

; Delete element
    mov cl, bl               ; take lower byte from ebx
    and cl, 11111b           ; get number of bit in cl (mod 32)
    mov eax, 1               ; creating mask
    shl eax, cl              ;
    not eax                  ;
    mov edx, ebx             ; get number of element in edx
    shr edx, 5               ; (div 32)
    and [set512+4*edx]       ; apply mask

; Has element
    mov cl, bl               ; take lower byte from ebx
    and cl, 11111b           ; get number of bit in cl (mod 32)
    mov eax, 1               ; creating mask
    shl eax, cl              ; 
    mov edx, ebx             ; get number of element in edx
    shr edx, 5               ; (div 32)
    test [set512+4*edx], eax ; ZF = 1 - has not, ZF = 0 - has

; Element's count
    xor ebx, ebx
    mov ecx, 15              ; from the end
lp:
    mov eax, [set512+4*ecx]  ; current element
lp2:
    test eax, 1              ; 1 in lower bit?
    jz notone                ; jump if not
    inc ebx                  ; if yes, count it
notone:
    shr eax, 1               ; shift eax
    test eax, eax            ; 0 in eax?
    jnz lp2                  ; continue inner loop if not
    jecxz quit               ; ecx == 0 ? go to "quit"
    dec ecx
    jmp lp                   ; continue outer loop
quit: