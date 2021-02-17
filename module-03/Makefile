# Makefile example -- scanner and parser.
# Creates "main" from "scan.l", "parse.y", and "main.c"
#
LEX     = flex
YACC    = bison -y
YFLAGS  = -d
objects = scan.o parse.o main.o

main: $(objects)
scan.o: scan.l parse.c
parse.o: parse.y
main.o: main.c