#include <stdio.h>
#include <stdlib.h>

#include "y.tab.h"
#include "scan.yy.h"

YYSTYPE yylval;
// declare yylval here, since we're not compiling the Yacc output

int main(int argc, char* argv[]) {
  // Check that the program has exactly one argument:
  if (argc != 2) {
    fprintf(stderr, "Usage: %s [file_name]\n", argv[0]);
    return EXIT_FAILURE;
  }
  // Open input file from args
  FILE *file = fopen(argv[1], "r");
  if (!file) {
    fprintf(stderr, "Error: could not read from %s\n", argv[1]);
  }
  // Set Lex input stream to file
  yyin = file;

  int token;  // <- token identifier. declared in "y.tab.h"
  while ((token = yylex()) != 0) {
    printf("%3d: %-20.20s ", yylineno, yytext);
    if (token < 256) {
      printf("found OPERATOR");
    } else if (token == IDENTIFIER) {
      printf("found IDENTIFIER");
    } else if (token == STRING) {
      printf("found STRING (%s)", yylval.string);
    } else if (token == SIGNICON || token == UNSIGNICON || token == HCON) {
      printf("found integer constant (%d)", yylval.number);
    } else if (token == FCON) {
      printf("found float constant (%f)", yylval.real);
    } else {
      printf("found KEYWORD (%s, #%d)", yytext, token);
    }
    printf("\n");
  }

  return EXIT_SUCCESS;
}