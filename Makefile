all: clean bin/assembly.o
	gcc -o main -g -Wall -fno-omit-frame-pointer main.c bin/assembly.o -lm

bin/assembly.o:
	mkdir -p bin
	nasm -f elf64 assembly.s -o bin/assembly.o -l bin/assembly.lst

diss: clean bin/assembly.o
	gcc -g -Wall -fno-omit-frame-pointer main.c bin/assembly.o -lm -S -o diss.s

test: clean all
	./main < foo.txt

.PHONY: clean
clean:
	rm -rf bin main
