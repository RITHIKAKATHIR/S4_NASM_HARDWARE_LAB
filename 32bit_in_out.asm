section .data
msg1: db 'Enter the number: ' 
l1: equ $-msg1
msg2: db 'The number entered is: '
l2: equ $-msg2
ten: db 'It is a 10!!', 10
tenl: equ $-ten
not_ten: db 'It is not a 10!!', 10
not_tenl: equ $-not_ten
newline: db '', 10

section .bss
d: resb 1
counter: resb 1
n: resd 1

section .text
    global _start:
    _start:

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, l1
    int 80h

    call read_num

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, l2
    int 80h

    call print_num

    mov eax, 1
    mov ebx, 0
    int 80h


read_num:

    pushad
    mov dword[n], 0
    ;mov byte[counter], 0
    
    read:  
        mov eax, 3
        mov ebx, 0
        mov ecx, d
        mov edx, 1
        int 80h

        cmp byte[d], 10
        je read_exit

        ;inc byte[counter]
        sub byte[d], 30h
        mov eax, dword[n]
        mov ebx, 10
        mul ebx
        mov ebx, 0
        add bl, byte[d]
        add eax, ebx
        mov dword[n], eax
        jmp read

    read_exit:        
        popad
        ret



print_num:
    
    pushad
    mov byte[counter], 0
    cmp dword[n], 0
    je zero

    extract:
        mov eax, dword[n]
        cmp eax, 0
        je print
        
        inc byte[counter]
        mov edx, 0
        mov ebx, 10
        div ebx
        push dx
        mov dword[n], eax
        jmp extract

    print:

        cmp byte[counter], 0
        je print_exit

        dec byte[counter]
        pop ax
        mov byte[d], al
        add byte[d], 30h

        mov eax, 4
        mov ebx, 1
        mov ecx, d
        mov edx, 1
        int 80h
        jmp print

    zero:
        mov byte[d], 30h
        mov eax, 4
        mov ebx, 1
        mov ecx, d
        mov edx, 1
        int 80h

    
    print_exit:
        mov eax, 4
        mov ebx, 1
        mov ecx, newline
        mov edx, 1
        int 80h

        popad
        ret
