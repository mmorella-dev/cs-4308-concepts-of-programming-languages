# Makefile example -- scanner and parser.
# Creates "main" from "scan.l", "parse.y", and "main.c"
#
LEX     = flex
YACC    = bison -y
YFLAGS  = -d
objects = scan.yy.o main.o

TARGET  = sclanner

$(TARGET): $(objects)
		$(CC) -o $@ $(objects)

y.tab.c: parse.y
		$(YACC) $(YFLAGS) parse.y

scan.yy.c: y.tab.c scan.l
		$(LEX) -t --header-file=scan.yy.h scan.l > "$@"

main.o: scan.yy.c y.tab.c main.c

clean:
		$(RM) *.yy.* y.*.* *.o $(TARGET)