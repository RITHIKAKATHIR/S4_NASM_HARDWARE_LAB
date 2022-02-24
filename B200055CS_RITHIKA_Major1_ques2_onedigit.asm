section .data
msg: db 'Enter a number: ',10
l: equ $-msg
msg6: db "Triangle inequality not satisfied",10
 l6: equ $-msg6
 msg7: db "0",10
 l7: equ $-msg7
 msg8: db "Triangle inequality satisfied",10
 l8: equ $-msg8
 msg9: db "1",10
 l9: equ $-msg9



section .bss
var1: resb 1
var2: resb 1
var3: resb 1
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
         

              mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, l
	int 80h

              mov eax, 3
	mov ebx, 0
	mov ecx, var3
	mov edx, 1
	int 80h
              sub byte[var3],30h
             
              


              mov al,byte[var1]
              add al,byte[var2]
              cmp al,byte[var3]
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
           
          cont: mov al,byte[var2] 
                add al,byte[var3]
                cmp al,byte[var1]
                jna fal 
         
         mov al,byte[var3]
         add al,byte[var1]
         cmp al,byte[var2]
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
          
        

