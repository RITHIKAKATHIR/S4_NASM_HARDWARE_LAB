section .data
  msg1 :db 'Enter the number :',10
  l1 : equ $-msg1

section .bss
  var1: resb 1
  var2: resb 1
  junk: resb 1
  counter: resw 1
 var_3: resb 1
 
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
	mov ecx, var1
	mov edx, 1
	int 80h
            
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
	mov ecx, var2
	mov edx, 1
	int 80h
               sub byte[var2],30h

                mov al, byte[var1]  
                sub al,30h   
                mov bl,10    
                mul bl       
               add ax,word[var2]   
               mov word[var_3],ax
             
              mov dx,0
              mov word[counter],0    
             
            for: mov ax,word[var_3]
                 add word[counter],1  
                 mov bl,10  
                 mov ah,0        
                 div bl
                 mov byte[var_3],al
                 cmp al,0           
                 ja for

            add word[counter],30h
            mov eax,4
            mov ebx,1
            mov ecx,counter
            mov edx,1
            int 80h

              mov eax, 1
	mov ebx, 0
	int 80h
