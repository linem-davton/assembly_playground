# Building ASSEMBLY

## NASM
Tool to build asm files into object files

```BASH
nasm -f elf64 input.asm output.o

```

## Executable

Using linker (ld) or gcc compiler to convert assembly into elf executable
```BASH
ld input.o -o output
```


## Makefile

```BASH
make run  # assembles, links and runs each target sequentially 
```

# ASSEMBLY
## Sections 
* **.data** - stores static duration data, zero  intialized 
    - db -- define bytes
    - dd -- double word (32bits)
    - dq -- quad word (64bits)
    - dw -- define word (16bits)

* **.bss** - zero data, not part of binary, created when loaded into memory
    - resb -- reserve bytes

* **.text** - code 
  
## Maths
16 bit numbers must be loaded with zero extension in 32bit/64 bit registers
- movzx -- Move with zero extended. 
``` ASM
movzx esi, word [myNum16] # works
movzx rdx, word [myNum16] # still works

movzx rax, dword [myNum32]  # not supported
mov rsi, dword [myNum32]    # Dont do It
mov eax, dword [myNum32]    # correct
```
32 bit cant int should be loaded to 32 bit registers like exx, and is default zero extended, i.e esi and rsi represent the same value  