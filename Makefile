CC=gcc
CFLAGS=-Wall -g -std=c99
MEM_CHECK=valgrind
RM=rm
RMFLAG=-rf
TARGET=test_list.out

all: run

check: compile
	$(MEM_CHECK) ./$(TARGET)
	echo $$?

run: compile
	./$(TARGET)
	echo $$?

compile: crline
	$(CC) $(CFLAGS) -o $(TARGET) test_list.c \
		test_manipulation.c test_traversal.c \
		list.c

crline:
	perl -pi -e "s{^[ \t]+$$}{}g;" *

clean:
	$(RM) $(RMFLAG) $(TARGET)