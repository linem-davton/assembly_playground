global _start

section .data   ; data section, initialized data entire duration of program
    
    myString db 'Enter Some Text!', 0xa  ; 0xa is newline character
    
    myNum64 dq 1234567890 ; define quadword (64-bit) number
    myNum32 dd 1234567890 ; define doubleword (32-bit) number
    myNum16 dw 12345      ; define word (16-bit) number

    myArray_bytes db 10, 20 , 30 ; define array of bytes

    myArry_ints dd 10, 20, 30, 40, 50 ; define array of 5 integers (32-bit)

section .bss                ; zero out data section, not part of binary done at run time
    userInput resb 100      ; resb is reserve bytes

section .text               ; program prints hello world
_start:
    mov rsi, myString       ; pointer to char buffer
    mov rdx, 17             ; size of buffer to read, can overflow
    mov rdi, 1              ; file descriptor for stdout=1, stdin=0
    mov rax, 1              ; syscall number for sys_write
    syscall                 ; perform the system call, write to stdout

    lea rsi, [userInput]    ; read into myArray_bytes
    mov rdx, 100                ; size of buffer to read, reads till newline character
    mov rdi, 0                  ; file descriptor for stdin
    xor rax, rax                ; neat way to zero out register, for read syscall
    syscall

    mov rsi, userInput          ; pointer to char buffer
    mov rdx, rax                ; size of buffer to read, sys_read puts bytes read into rax including newline
    mov rdi, 1                  ; file descriptor for stdout=1, stdin=0
    mov rax, 1                  ; syscall number for sys_write
    syscall                     ; perform the system call, write to stdout

    mov rax, 60             ;   syscall number for sys_exit
    mov rdi, 0              ;   exit status, e.g., 0 for success
    syscall                 ;   perform the system call