section .data
count dd 0 ; define "count" variable with init value = 0

section .text
mov [count], eax ; from eax to address in count
mov edx, [count] ; from address in count to edx
