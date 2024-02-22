global _start

section .data   ; data section, initialized data entire duration of program
    
    myString db 'Hello, World!', 0xa  ; 0xa is newline character, db is define byte

section .text               ; program prints hello world
_start:
    mov rsi, myString       ; pointer to char buffer
    mov rdx, 14             ; size of buffer to read, can overflow
    mov rdi, 1              ; file descriptor for stdout=1, stdin=0
    mov rax, 1              ; syscall number for sys_write
    syscall                 ; perform the system call, write to stdout

    mov rax, 60             ;   syscall number for sys_exit
    mov rdi, 0              ;   exit status, e.g., 0 for success
    syscall                 ;   perform the system call