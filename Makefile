# Makefile for assembling and linking hello.asm

# Assembler
ASM = nasm

# Linker
LD = ld

# Assembly and object files
SRC = hello.asm
OBJ = hello.o
EXEC = hello

# Assembler flags
ASMFLAGS = -f

# Linker flags
LDFLAGS = -m elf_i386

# Default target
all: $(EXEC)

# Rule for linking the object file to create the executable
$(EXEC): $(OBJ)
	$(LD) $(LDFLAGS) $(OBJ) -o $(EXEC) 

# Rule for assembling the source file to create the object file
$(OBJ): $(SRC)
	$(ASM) $(ASMFLAGS) $(SRC) -o $(OBJ)

# Clean up build files
clean:
	rm -f $(OBJ) $(EXEC)

.PHONY: all clean
