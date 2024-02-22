global _start

section .text
_start:
    mov rax, 60     ;   syscall number for sys_exit
    mov rdi, 42     ;   exit status, e.g., 0 for success
    syscall         ;   perform the system call