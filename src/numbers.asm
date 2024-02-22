global _start
section .data   ; data section, initialized data entire duration of program
    
    myString db 'Enter Some Text!', 10  ; 10 is 0xa == newline character
    
    myNum64 dq 1234567890   ; define quadword (64-bit) number
    myNum32 dd 30           ; define doubleword (32-bit) number
    myNum16 dw 70           ; define word (16-bit) number

    myArray_bytes db 67, 70 , 90 ; define array of bytes

    myArry_ints dd 10, 20, 30, 40, 50000 ; define array of 5 integers (32-bit)


section .text               ; program prints hello world
_start:
    mov rsi, myString       ; pointer to char buffer
    mov rdx, 17             ; size of buffer to read, can overflow
    mov rdi, 1              ; file descriptor for stdout=1, stdin=0
    mov rax, 1              ; syscall number for sys_write
    syscall                 ; perform the system call, write to stdout

    mov rsi, myArray_bytes      ; pointer to 8-bit number array - ASCII values
    mov rdx, 3                  ; size of buffer to read
    mov rdi, 1                  ; file descriptor for stdout
    mov rax, 1                  ; syscall number for sys_write, this will not print ints
    syscall

    mov esi, dword [myNum32]     ; read 32-bit at address myNum32, zero extend to 64-bit
    movzx rdx, word [myNum16]     ; read 16-bit and zero extend to 64-bit
    add rsi, rdx                   ; rsi = rsi + rdx

    mov rax, 60                 ;   syscall number for sys_exit
    mov rdi, rsi              ;  rdi contains the computed sum, 
    syscall                     ;   perform the system call