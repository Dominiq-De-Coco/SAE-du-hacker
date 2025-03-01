CC=gcc
CFLAGS=-m32 -Wall
AS=as
LD=ld

all: libs_libc.so

libs_libc.so: src/s_string.o src/s_math.o src/s_stdio.o
	$(CC) -shared -o lib/libs_libc.so src/s_string.o src/s_math.o src/s_stdio.o

src/s_string.o: src/s_string.s
	$(AS) -o src/s_string.o src/s_string.s

src/s_math.o: src/s_math.s
	$(AS) -o src/s_math.o src/s_math.s

src/s_stdio.o: src/s_stdio.s
	$(AS) -o src/s_stdio.o src/s_stdio.s

test: all
	$(CC) $(CFLAGS) -o test/main test/main.c -Llib -ls_libc

clean:
	rm -f src/*.o lib/*.so test/main

