section .data
msg1: db 'Enter first digit: ', 10
l1: equ $-msg1
msg2: db 'ENter second digit: ', 10
l2: equ $-msg2

section .bss      
d1: resb 1
d2: resb 1
junk: resb 1
ans: resb 1

section .text
global _start:
       _start:
       
      mov eax, 4
      mov ebx, 1
      mov ecx, msg1
      mov edx, l1
      int 80h
      
      mov eax, 3
      mov ebx, 0
      mov ecx, d1
      mov edx, 1
       int 80h
      
      mov eax, 3
      mov ebx, 0
      mov ecx, junk
      mov edx, 1
       int 80h
      
      mov eax, 4
      mov ebx, 1
      mov ecx, msg2
      mov edx, l2
       int 80h
      
      mov eax, 3
      mov ebx, 0
      mov ecx, d2
      mov edx, 1
       int 80h
      
      mov eax, 3
      mov ebx, 0
      mov ecx, junk
      mov edx, 1
       int 80h
       
      sub byte[d1], 30h
     
       
       mov al, byte[d1]
       mov ah, 0
       mov bl, 10
       mul bl
       sub word[d2], 30h
       mov bx, word[d2]
       add ax, bx
       mov byte[ans],0
    loop:
        
       mov bl, 2
       mov ah, 0
       ;mov byte[ans],0
       div bl
       cmp ah, 0
       jne exit
       add byte[ans], 1
       jmp loop
       
       ;add byte[ans], 30h
       
  
       
    exit:
       add byte[ans], 30h
       mov eax, 4
       mov ebx, 1
       mov ecx, ans
       mov edx, 1
       int 80h
       
       mov eax, 1
       mov ebx, 0
       int 80h

 
  
