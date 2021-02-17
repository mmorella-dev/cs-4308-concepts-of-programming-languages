#include "y.tab.h"
#include "scan.h"

#include <stdio.h>

// int yylex(void);

// void yyerror();


int main() {
  while (1) {
    printf("Found token type: %d, %s", yyparse(), yytext);
  }
}