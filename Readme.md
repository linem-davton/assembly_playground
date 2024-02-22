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