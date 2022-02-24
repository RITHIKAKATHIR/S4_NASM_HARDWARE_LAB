;square : some error
section .data
msg1 : db 'Enter first digit of number :'
l1 : equ $-msg1
msg2 : db 'Enter second digit of number :'
l2 : equ $-msg2

var1: db 36


section .bss
d1 : resb 1
d2 : resb 1
d3 : resb 1
d4 : resw 1
n1 : resb 1
n2 : resb 1
ans1 : resb 1
ans2 : resb 1
ans3 : resb 1
ans4 : resw 1
junk : resb 1
junk1 : resb 1
junk2 : resb 1
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
	mov ecx, junk1
	mov edx, 1
	int 80h

	;First number calculation

	
	mov al, byte[d1]
	sub al, 30h
	mov bl, 10
	mov ah, 0
	mul bl
	mov bx, word[d2]
	sub bx, 30h
	add ax, bx
               

              mov eax, 4
	mov ebx, 1
	mov ecx, var1
	mov edx, 1
	int 80h

             ;sub ax,30h
	;mul byte[ans1]
             
              ;sub byte[ans1],30h
              

	mov eax, 1
	mov ebx, 0
	int 80h

             

	

