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