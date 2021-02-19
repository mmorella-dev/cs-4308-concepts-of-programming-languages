# Makefile example -- scanner and parser.
# Creates "main" from "scan.l", "parse.y", and "main.c"
#
# LEX     = flex
# YACC    = bison -y
MKDIR_P = mkdir -p
YFLAGS  = -d

OUT_DIR = ./out
SRC_DIR = ./src

TARGET = $(OUT_DIR)/sclanner

objects := $(OUT_DIR)/scan.yy.o $(OUT_DIR)/main.o

$(TARGET): $(objects)
		$(MKDIR_P )
		$(CC) -o $@ $(objects)

$(SRC_DIR)/y.tab.c: $(SRC_DIR)/parse.y
		$(MKDIR_P) $(dir $@)
		$(YACC) $(YFLAGS) -o "$@" $<

$(SRC_DIR)/scan.yy.c: $(SRC_DIR)/scan.l
		$(MKDIR_P) $(dir $@)
		$(LEX) -t --header-file=$(basename $<).yy.h $< > "$@"

$(OUT_DIR)/scan.yy.o: $(SRC_DIR)/scan.yy.c $(SRC_DIR)/y.tab.c
		$(CC) $(CFLAGS) -c -o $@ $<

$(OUT_DIR)/main.o: $(SRC_DIR)/main.c $(SRC_DIR)/y.tab.c
		$(CC) $(CFLAGS) -c -o $@ $<

clean:
		$(RM) $(OUT_DIR)/*.o
		$(RM) src/y.*.* src/*.yy.*
