section .data
  msg1 :db 'Enter the number :',10
  l1 : equ $-msg1
  msg2: db ' ',10
  l2: equ $-msg2
section .bss
  var1: resb 1
  var2: resb 1
  junk: resb 1
  counter: resw 1
 var_3: resb 1
 var_4: resb 1
  var_5: resb 1
  ans_1: resb 1
 counter_1:resw 1
 buffer: resw 1
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
               mov word[var_4],ax;
             
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
              
             mov ax,word[counter]
             mov word[counter_1],ax

              mov eax, 4
 	mov ebx, 1
	mov ecx, msg2
	mov edx, l2
	int 80h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                  
             
         sub word[counter],1
               
          cmp word[counter],0
         je single_digit
         jmp more_than_one_digit

         single_digit:
            add byte[var_4],30h
             mov eax,4
            mov ebx,1
            mov ecx,var_4
            mov edx,1
            int 80h
            jmp end
  
           more_than_one_digit:
              mov byte[var_5],10  
               mov bl,1
   
              while: 
                     mov al,byte[var_5]
                     ;mov ah,0
                     mul bl        
                     sub word[counter],1
                     mov word[buffer],ax
                     mov bl,byte[buffer]
                     cmp word[counter],0 
                     jne while  
       
            mov byte[buffer],bl
        
           add byte[buffer],30h
            mov eax,4
            mov ebx,1
            mov ecx,buffer
            mov edx,1
            int 80h
            jmp end
             
       
               

             print:mov ax,word[var_4]
                   div bl
                   mov byte[ans_1],al  
                   add byte[ans_1],30h
                   mov eax,4
                   mov ebx,1
                   mov ecx,ans_1
                   mov edx,1
                   int 80h
                   sub word[counter_1],1
                   cmp word[counter_1],0
                   jne print
                   
                    
       end:   mov eax, 1
	mov ebx, 0
	int 80h
