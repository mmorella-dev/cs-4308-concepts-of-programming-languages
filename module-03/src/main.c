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
    printf("\n%3d\t%-20.20s\t", yylineno, yytext);
    if (token < 256) {
      printf("OPERATOR\t('%s', #%d)", yytext, token);
    } else if (token == IDENTIFIER) {
      printf("IDENTIFIER\t('%s')", yylval.string);
    } else if (token == STRING_LITERAL) {
      printf("STRING_LITERAL\t(%s)", yylval.string);
    } else if (token == SIGNED_INT_LITERAL) {
      printf("SIGNED_INT_LIT\t(%d)", yylval.number);
    } else if (token == UNSIGNED_INT_LITERAL) {
      printf("UNSIGNED_INT_LIT\t(%d)", yylval.number);
    } else if (token == HEX_INT_LITERAL) {
      printf("HEX_INT_LITERAL\t(%d)", yylval.number);
    } else if (token == FLOAT_LITERAL) {
      printf("FLOAT_LITERAL\t(%f)", yylval.real);
    } else {
      printf("KEYWORD\t(%s, #%d)", yytext, token);
    }
  }
  printf("\n");
  return EXIT_SUCCESS;
}