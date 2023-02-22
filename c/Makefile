CC = gcc
CFLAGS = -Wall -O3

all: c dumbed-down

c:
	$(CC) $(CFLAGS) c.c -o c

dumbed-down:
	$(CC) $(CFLAGS) dumbed-down.c -o dumbed-down

clean:
	-rm c
	-rm dumbed-down

.PHONY: c dumbed-down clean all
