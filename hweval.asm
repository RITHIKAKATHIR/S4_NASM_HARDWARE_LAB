; Adding numbers between Two one digit numbers and dividing it my last digit og my roll number b200055cs

section .data
msg1 : db 'Enter first digit :'
l1 : equ $-msg1
msg2 : db 'Enter second digit :'
l2 : equ $-msg2

msg3: db 'Sum: '
l3: equ $-msg3

msgline: db ' ',10
ls: equ $-msgline

msg4: db 'Result: '
l4: equ $-msg4

section .bss
d1 : resb 1
d2 : resb 1
sum: resb 1
ans1 : resb 1
ans2 : resb 1
junk : resb 1
result: resb 1

section .text

	global _start:
	_start:
	

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

	

	mov eax, 3
	mov ebx, 0
	mov ecx, d2
	mov edx, 1
	int 80h

	sub byte[d1], 30h
              add byte[d1],1
	sub byte[d2], 30h
              mov byte[sum],0
	mov ax,0
            
	

     for:   add ax,word[d1]
            add byte[d1],1
            mov bl,byte[d1]
            cmp bl,byte[d2]
            jb for  

        
            add word[sum],ax
 
           

              mov bl, 10
	mov ah, 0
	div bl

	mov byte[ans1], al
	mov byte[ans2], ah
	add byte[ans1], 30h
	add byte[ans2], 30h

             mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, l3
	int 80h


	mov eax, 4
	mov ebx, 1
	mov ecx, ans1
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, ans2
	mov edx, 1
	int 80h


               mov ax,word[sum]
                mov ah,0
                mov bl,5
                div bl
       
            mov byte[result],al
            add byte[result],30h

              mov eax, 4
	mov ebx, 1
	mov ecx, msgline
	mov edx, ls
	int 80h

              mov eax, 4
	mov ebx, 1
	mov ecx, msg4
	mov edx, l4
	int 80h

              mov eax, 4
	mov ebx, 1
	mov ecx, result
	mov edx, 1
	int 80h
                

	mov eax, 1
	mov ebx, 0
	int 80h
