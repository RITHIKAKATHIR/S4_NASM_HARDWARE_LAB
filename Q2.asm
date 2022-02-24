section .data
msg1: db 'Enter the number of elements: '
l1: equ $-msg1
msg2: db 'Enter a number: '
l2: equ $-msg2
msg3: db 'Sum: '
l3: equ $-msg3
msg4: db 'Average(floored): '
l4: equ $-msg4
newline: db '', 10
point: db '.'

section .bss
d: resb 1
arr: resd 50
n: resd 1
n1: resd 1
counter: resb 1
i: resd 1
sum: resd 1

section .text
    global _start
    _start:
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, l1
    int 80h
    
    call read_num
    mov eax, dword[n1]
    mov dword[n], eax

    mov ebx, arr
    call read_arr

    mov ebx, arr
    mov eax, dword[n]
    call calc_sum

    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, l3
    int 80h

    mov eax, dword[sum]
    mov dword[n1], eax
    call print_num

    mov eax, 4
    mov ebx, 1
    mov ecx, msg4
    mov edx, l4
    int 80h

    mov edx, 0
    mov eax, dword[sum]
    mov ebx, dword[n]
    div ebx
    mov dword[n1], eax
    call print_num

    mov eax, 1
    mov ebx, 0
    int 80h


calc_sum:
    mov dword[i], eax
    loop_i:
        cmp dword[i], 0
        je loop_i_exit

        dec dword[i]
        mov eax, dword[ebx]
        add dword[sum], eax
        add ebx, 4
        jmp loop_i

    loop_i_exit:
        ret



read_arr:
    mov dword[i], eax
    
    element_read_loop:
        push ebx
        mov eax, 4
        mov ebx, 1
        mov ecx, msg2
        mov edx, l2
        int 80h
        pop ebx
    
        call read_num
        mov ecx, dword[n1]
        mov dword[ebx], ecx
    
        add ebx, 4
        dec dword[i]
        jnz element_read_loop
    
    ret



read_num:

    pushad
    mov dword[n1], 0
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
        mov eax, dword[n1]
        mov ebx, 10
        mul ebx
        mov ebx, 0
        add bl, byte[d]
        add eax, ebx
        mov dword[n1], eax
        jmp read

    read_exit:        
        popad
        ret



print_num:
    
    pushad
    mov byte[counter], 0
    cmp dword[n1], 0
    je zero

    extract:
        mov eax, dword[n1]
        cmp eax, 0
        je print
        
        inc byte[counter]
        mov edx, 0
        mov ebx, 10
        div ebx
        push dx
        mov dword[n1], eax
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
