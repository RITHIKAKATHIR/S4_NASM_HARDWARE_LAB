section .data
msg: db 'Enter a number: ',10
l: equ $-msg



section .bss
var1: resb 1
var2: resb 1
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
             

              mov eax, 3
	mov ebx, 0
	mov ecx, junk
	mov edx, 1
	int 80h
                
              mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, l
	int 80h

              mov eax, 3
	mov ebx, 0
	mov ecx, var2
	mov edx, 1
	int 80h
              sub byte[var2],30h
              
              mov eax, 3
	mov ebx, 0
	mov ecx, junk
	mov edx, 1
	int 80h

   for:   mov ax,word[var1]
          mov bl, byte[var2]
          div bl
          cmp ah,0
          je if
          mov byte[var1],bl
          mov byte[var2],ah
          jmp for
          


   if:        add byte[var2],30h
              mov eax, 4
	mov ebx, 1
	mov ecx, var2
	mov edx, 1
	int 80h
              

 end: mov eax,1
      mov ebx,0
      int 80h
          
         
