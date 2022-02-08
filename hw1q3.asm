section .data
msg: db 'Enter a number: ',10
l: equ $-msg



section .bss
var1: resb 1
i: resb 1
junk: resb 1


section .text
  global _start:
  _start:
  
              mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, l
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, var1
	mov edx, 1
	int 80h
              sub byte[var1],30h
              mov al,byte[var1]

              mov eax, 3
	mov ebx, 0
	mov ecx, junk
	mov edx, 1
	int 80h
              
             mov byte[i],0
         
        for:  
             add byte[i],30h
              mov eax, 4
	mov ebx, 1
	mov ecx, i
	mov edx, 1
	int 80h
              sub byte[i],30h
              add byte[i],1
               mov al,byte[var1]
              cmp al,byte[i]
              jnb for

              mov eax, 1
	mov ebx, 0
	int 80h
              
                
