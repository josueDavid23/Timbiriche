all:
	nasm -f elf -g -F stabs tarea.asm -l tarea.lst
	ld -m elf_i386 -o tarea tarea.o

linker:
	ld -m elf_i386 -o tarea tarea.o
	
  # ld ~ GNU Linker
  # -m ~ emulador
  # elf_i386 ~ arquitectura (32 bits)
  # -o ~ nombrar salida

compilador:
	nasm -f elf -g -F stabs tarea.asm -l tarea.lst
	
  # nasm ~ compilador
  # -f ~ formato del archivo de salida
  # elf ~ arquitectura (64)
  # -g ~ símbolos para debugger
  # -F ~ formato de los símbolos
  # -l ~ crea un archivo .lst
  
clean:
	rm tarea tarea.lst tarea.o