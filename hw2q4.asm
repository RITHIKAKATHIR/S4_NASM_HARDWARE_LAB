;sum of even numbers between 0 and entered 2 digit number

msg: db "enter the first digit of the first number",10
 l: equ $-msg
  msg1: db "enter the second digit of the first number",10
 l1: equ $-msg1


section .bss

  dig1: resb 1
  dig2: resb 1
  dig3: resb 1
  dig4: resb 1
  junk: resb 1
  num:  resw 1
  num_1: resb 1
  num_2: resb 1 
  num_3: resb 1
  num_4:resb 1
ans1 : resb 1
ans2 : resb 1
ans3 : resb 1
ans4 : resw 1

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
	mov ecx, dig1
	mov edx, 1
	int 80h
              sub byte[dig1],30h
              

              mov eax, 3
	mov ebx, 0
	mov ecx, junk
	mov edx, 1
	int 80h
            
              mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, l1
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, dig2
	mov edx, 1
	int 80h
              sub byte[dig2],30h
           
             

       ;first number calculation 
          mov ah,0
          mov al,10
          mul byte[dig1]
          add ax,word[dig2]
          mov word[num],ax;


      ;pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp

  mov byte[num_1],0
  mov ax,0
   for: add ax,word[num_1]
        add byte[num_1],2
        mov bl,byte[num_1]
        cmp bl,byte[num]
        jna for

   

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

 
  
