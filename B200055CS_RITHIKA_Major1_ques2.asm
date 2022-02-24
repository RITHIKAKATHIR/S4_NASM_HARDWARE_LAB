section .data
 msg: db "enter the first digit of the first number",10
 l: equ $-msg
  msg1: db "enter the second digit of the first number",10
 l1: equ $-msg1
 msg2: db "enter the first digit of the second number",10
 l2: equ $-msg2
 msg3: db "enter the second digit of the second number",10
 l3: equ $-msg3
 msg4: db "enter the first digit of the third number",10
 l4: equ $-msg4
 msg5: db "enter the second digit of the third number",10
 l5: equ $-msg5
 msg6: db "Triangle inequality not satisfied",10
 l6: equ $-msg6
 msg7: db "0",10
 l7: equ $-msg7
 msg8: db "Triangle inequality satisfied",10
 l8: equ $-msg8
 msg9: db "1",10
 l9: equ $-msg9


section .bss

  dig1: resb 1
  dig2: resb 1
  dig3: resb 1
  dig4: resb 1
  dig5: resb 1
  dig6: resb 1
  junk: resb 1
  num:  resw 1
  num1: resw 1
  num2: resw 1
  
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
	mov ecx, dig3
	mov edx, 1
	int 80h
              sub byte[dig3],30h
           
              mov eax, 3
	mov ebx, 0
	mov ecx, junk
	mov edx, 1
	int 80h


              mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, l3
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, dig4
	mov edx, 1
	int 80h
              sub byte[dig4],30h
           
              mov eax, 3
	mov ebx, 0
	mov ecx, junk
	mov edx, 1
	int 80h


              mov eax, 4
	mov ebx, 1
	mov ecx, msg4
	mov edx, l4
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, dig5
	mov edx, 1
	int 80h
              sub byte[dig5],30h
           
              mov eax, 3
	mov ebx, 0
	mov ecx, junk
	mov edx, 1
	int 80h

              mov eax, 4
	mov ebx, 1
	mov ecx, msg5
	mov edx, l5
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, dig6
	mov edx, 1
	int 80h
              sub byte[dig6],30h
           
              mov eax, 3
	mov ebx, 0
	mov ecx, junk
	mov edx, 1
	int 80h
            


       ;first number calculation 
          mov ah,0
          mov al,10
          mul byte[dig1]
          add ax,word[dig2]
          mov word[num],ax;

           ;second number calculation
          mov ah,0
          mov al,10
          mul byte[dig3]
          add ax,word[dig4];
           mov word[num1],ax;

        ;third number calculation

          mov ah,0
          mov al,10
          mul byte[dig5]
          add ax,word[dig6];
          mov word[num2],ax;

          mov al,byte[num]
              add al,byte[num1]
              cmp al,byte[num2]
              ja cont
              
           fal: 
               mov eax, 4
	 mov ebx, 1
	 mov ecx, msg6
	 mov edx, l6
	 int 80h

              mov eax, 4
	mov ebx, 1
	mov ecx, msg7
	mov edx, l7
	int 80h
              jmp exit
           
          cont: mov al,byte[num1] 
                add al,byte[num2]
                cmp al,byte[num]
                jna fal 
         
         mov al,byte[num2]
         add al,byte[num]
         cmp al,byte[num1]
         jna fal 

              mov eax, 4
	mov ebx, 1
	mov ecx, msg8
	mov edx, l8
	int 80h

              mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, l9
	int 80h       


      exit:   mov eax, 1
	mov ebx, 0
	int 80h
          
        

         


 

