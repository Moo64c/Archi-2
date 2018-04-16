all:
	gcc -g -Wall -fno-omit-frame-pointer main.c -o main

bin/assembly.o:
	mkdir -p bin
	nasm -f elf64 assembly.s -o bin/assembly.o -l bin/assembly.lst

test: clean all
	./main < foo.txt

.PHONY: clean
clean:
	rm -rf bin main
