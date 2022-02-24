section .data
msg: db 'Enter a number: ',10
l: equ $-msg

section .bss
var1: resb 1
var2: resb 1
junk: resb 1
sum: resb 1
var3: resb 1
ans1 : resb 1
ans2 : resb 1
ans3 : resb 1
ans4 : resb 1



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

            mov byte[sum],0
            mov ax,word[var1]
            mov word[var3],ax
            
     for:   mov ax,word[var3]
            add word[sum],ax
            add ax,1
            mov word[var3],ax
            cmp ax,word[var2]
            jne for      

    mov ax,word[sum]
     
    mov bl, 100
    div bl
    mov bh, ah
    ;add al, 30h
    movzx ax, al
    mov bl, 10
    div bl
    add al, 30h
    add ah, 30h
    mov byte[ans1], al
    mov byte[ans2], ah

    movzx ax, bh
    mov bl, 10
    div bl,
    add al, 30h
    mov byte[ans3], al
    add ah, 30h
    mov byte[ans4], ah

mov eax,4
mov ebx,1
mov ecx,ans1
mov edx,1
int 80h


mov eax,4
mov ebx,1
mov ecx,ans2
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,ans3
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,ans4
mov edx,1
int 80h


mov eax,1
mov ebx,0
int 80h

 
       
 
              
            
         
