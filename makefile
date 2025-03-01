CC=gcc
CFLAGS=-m32 -Wall
AS=as
LD=ld

all: libs_libc.so

libs_libc.so: src/s_string.o
	$(CC) -shared -o lib/libs_libc.so src/s_string.o

src/s_string.o: src/s_string.s
	$(AS) -o src/s_string.o src/s_string.s

test: all
	$(CC) $(CFLAGS) -o test/main test/main.c -Llib -ls_libc

clean:
	rm -f src/*.o lib/*.so test/main

