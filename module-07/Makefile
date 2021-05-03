# Makefile example -- scanner and transpiler.
# Creates "main" from "scan.l", "transpile.y", and "main.c"
#
# LEX     = flex
# YACC    = bison -y
MKDIR_P = mkdir -p
YFLAGS  = -d

OUT_DIR = ./out
SRC_DIR = ./src

TARGET = $(OUT_DIR)/screpl

objects := $(OUT_DIR)/scan.yy.o $(OUT_DIR)/main.o $(SRC_DIR)/y.tab.c

$(TARGET): $(objects)
		$(MKDIR_P) $(OUT_DIR)
		$(CC) -o $@ $(objects)

$(SRC_DIR)/y.tab.c: $(SRC_DIR)/transpile.y
		$(MKDIR_P) $(dir $@)
		$(YACC) $(YFLAGS) -o "$@" $<

$(SRC_DIR)/scan.yy.c: $(SRC_DIR)/scan.l
		$(MKDIR_P) $(dir $@)
		$(LEX) -t --header-file=$(basename $<).yy.h $< > "$@"

$(OUT_DIR)/scan.yy.o: $(SRC_DIR)/scan.yy.c $(SRC_DIR)/y.tab.c
		$(MKDIR_P) $(dir $@)
		$(CC) $(CFLAGS) -c -o $@ $<

$(OUT_DIR)/main.o: $(SRC_DIR)/main.c $(SRC_DIR)/y.tab.c
		$(MKDIR_P) $(dir $@)
		$(CC) $(CFLAGS) -c -o $@ $<

clean:
		$(RM) $(OUT_DIR)/*.o
		$(RM) src/y.*.* src/*.yy.*
