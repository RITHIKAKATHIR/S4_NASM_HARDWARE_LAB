# S4_NASM_HARDWARE_LAB

The code uploaded is written in assembly language.
Purpose: Lab
Author: RITHIKA KATHIRVEL
Created: Feb 9 2022


Compilation
1. Assembling the source file
nasm -f elf filename.asm
This creates an object file, filename.o in the current working directory.
2. Creating an executable file
For a 32 bit machine
ld filename.o -o output_filename
For 64 bit machine
ld -melf_i386 filename -o output_filename
This creates an executable file of the name output filename.
3. Program execution
./output_filename
For example, if the program to be run is first.asm
nasm -f elf first.asm
ld first.o -o output
./output

