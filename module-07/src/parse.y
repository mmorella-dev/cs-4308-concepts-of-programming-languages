// FILE: parse.y
// AUTHOR: Mae Morella
// ===================
//
// This file is input for Yacc/Bison, to generate a parser program.
// It is currently used only to define y.tab.h, which #defines
// values for all of the following tokens.
// It contains a BNF grammar for the SCL language as well, but this grammar
// has several issues and is not yet ready for use in parsing source files.

%{
#include <stdio.h>
void yyerror(char* msg);

int yylex();

int yylineno;

#define YYERROR_VERBOSE

%}

/* Keywords */
%token AND ADD ADDRESS ALTERS ARRAY CALL CASE CHAR CONSTANTS CONSUMES COUNT DECLARATIONS DECREMENT DEFAULT DEFINE DEREF DEFINETYPE DESCRIPTION DISPLAY DISPLAYN DO DOUBLE DOWNTO ELSE ELSEIF ENDFOR ENDFUN ENDIF ENDREPEAT ENDWHILE ENUM EQUAL FLOAT FOR FORWARD FROM FUNCTION GLOBAL GREATERT IF IMPLEMENTATIONS IMPORT INCREMENT INPUT INTEGER INTERFACE IS LENGTH LONG LESST MAIN MBREAK MCLOSE MENDCASE MEXIT MEXTERN MFALSE MFILE MOPEN MTRUE MVOID MWHEN NEGATE NOT OF OR OUTPUT PARAMETERS PBEGIN PERSISTENT POINTER POSTCONDITION PRECONDITION PRESERVES PRODUCES READ REAL REPEAT RETURN SET SHARED SHORT SPECIFICATIONS STATIC STRUCT STRUCTURES STRUCTYPE SUBTRACT SYMBOL TBOOL TBYTE THEN TO TSTRING TUNSIGNED TYPE UNTIL USE USING VALUE VARIABLES WHILE WRITE

%token-table

// Token value object
%union {
  int number;
  double real;
  char string[256];
}

/* Constants and identifiers */
%token <string> STRING_LITERAL
%token <number> UNSIGNED_INT_LITERAL SIGNED_INT_LITERAL HEX_INT_LITERAL
%token <real> FLOAT_LITERAL
%token <string> IDENTIFIER LETTER_LITERAL
%type <string> fname

%%
// A subset of the SCL grammar

start   : imports symbols forward_refs specifications globals implementations
        | pactions
      ;
imports :
        | imports import_file
        ;
import_file : IMPORT header_file_name   { printf("%3d: Import: %s\n", yylineno, yylval.string ); }
            | USE header_file_name      { printf("%3d Use: %s\n", yylineno, yylval.string ); }
            ;
header_file_name: '<' fname '>'
                 /* | QUOTES fname QUOTES; */
                 | STRING_LITERAL;

fname : IDENTIFIER
      | fname slash IDENTIFIER
      ;
slash : '/'
       | '\\'
       ;
symbols :
        | symbols symbol_def
        ;
symbol_def : SYMBOL IDENTIFIER symbol_value
           ;

symbol_value : IDENTIFIER
             | STRING_LITERAL
             | UNSIGNED_INT_LITERAL
             | SIGNED_INT_LITERAL
             | HEX_INT_LITERAL
             | FLOAT_LITERAL
             ;
forward_refs :
             | FORWARD DECLARATIONS forward_list
             ;
forward_list : forwards
             | forward_list forwards
             ;
forwards : INTERFACE IDENTIFIER
         | STRUCT IDENTIFIER
         | STRUCTYPE IDENTIFIER
         | check_ext func_main parameters
         | DEFINETYPE struct_enum IDENTIFIER IDENTIFIER
         ;
check_ext :
          | MEXTERN
          ;
func_main : FUNCTION IDENTIFIER oper_type
          | MAIN
          ;
oper_type : RETURN chk_ptr chk_array ret_type
          ;
chk_ptr :
        | POINTER OF
        ;
chk_array :
          | ARRAY array_dim_list
          ;
array_dim_list : '[' ']'
               | '[' array_index ']'
               | array_dim_list '[' array_index ']'
               ;
array_index : IDENTIFIER
            | UNSIGNED_INT_LITERAL
            ;

ret_type  : TYPE type_name
          | STRUCT IDENTIFIER
          | STRUCTYPE IDENTIFIER
          ;
type_name       : MVOID
                | COUNT
                | INTEGER
                | SHORT
                | REAL
                | FLOAT
                | DOUBLE
                | TBOOL
                | CHAR
                | TSTRING OF LENGTH SIGNED_INT_LITERAL
                | TBYTE
                ;
struct_enum : STRUCT
            | ENUM
            ;
specifications  :
                | SPECIFICATIONS spec_list
                ;
spec_list : spec_def
          | spec_list spec_def
          ;
spec_def : ENUM
         | STRUCT
         | DESCRIPTION
         ;
globals :
        | GLOBAL  DECLARATIONS const_dec var_dec struct_dec
        ;
const_var_struct : const_dec var_dec struct_dec
                 ;
const_dec :
          | CONSTANTS data_declarations
          ;
var_dec : VARIABLES data_declarations
        ;
struct_dec :
           | STRUCTURES data_declarations
           ;
data_declarations       : comp_declare
                        | data_declarations comp_declare
		        ;
comp_declare : DEFINE data_file
             ;
data_file       : sel_file
                | sel_dmode data_declaration
                ;
sel_dmode       :
                | PERSISTENT
                | SHARED
                | STATIC
                | MEXTERN
                ;
sel_file        :
                | MFILE
                ;
data_declaration : IDENTIFIER opt_pointer parray_dec OF TYPE data_type
                { printf("%3d: Declare: %s\n", yylineno, yylval.string ); }
                 ;
opt_pointer     :
                | POINTER
                ;
data_type       : TUNSIGNED
                | CHAR
                | INTEGER
                | MVOID
                | DOUBLE
                | LONG
                | SHORT
                | FLOAT
                | REAL
                | TSTRING
                | TBOOL
                | TBYTE
                ;
parray_dec      :
                | '='
                | ARRAY plist_const popt_array_val
                | '[' ']'
                | VALUE
                ;
plist_const : '[' iconst_ident ']'
            | plist_const '[' iconst_ident ']'
            ;
iconst_ident : SIGNED_INT_LITERAL
             | UNSIGNED_INT_LITERAL
             | IDENTIFIER
             ;
popt_array_val :
               | value_eq array_val
               ;
value_eq : VALUE
         | '='
         ;

array_val : simp_arr_val
          ;
simp_arr_val : '[' arg_list ']'
             ;
arg_list : arg_list ',' expr | expr
	 ;

implementations : IMPLEMENTATIONS funct_list
          ;

desc    :
        | DESCRIPTION;
funct_list : funct_body
           | funct_list funct_body
           ;
funct_body: FUNCTION phead_fun pother_oper_def
          ;
phead_fun :
          | PERSISTENT
                | STATIC
	      ;
pother_oper_def : pother_oper IS const_var_struct precond
                      PBEGIN pactions ENDFUN IDENTIFIER { printf("%3d: End function %s:\n", yylineno, yylval.string ); }
                | pother_oper IS const_var_struct precond
                      PBEGIN pactions ENDFUN MAIN { printf("%3d: End function main.\n", yylineno ); }
                ;

pother_oper : IDENTIFIER desc oper_type parameters   { printf("%3d: Function %s:\n", yylineno, yylval.string ); }
            | MAIN desc   { printf("%3d: Function main:\n", yylineno ); }
            ;

precond :
        | PRECONDITION pcondition
		;
pcondition : pcond1 OR pcond1
           | pcond1 AND pcond1
		   | pcond1
		   ;
pcond1 : NOT pcond2
       | pcond2
       ;
pcond2  : '(' pcondition ')'
        /* | expr RELOP expr */
        | expr '=' '=' expr
        | expr eq_v expr
        | expr opt_not true_false
        | element;

true_false : MTRUE
           | MFALSE;

eq_v : EQUAL
     | GREATERT
     | LESST
     | GREATERT OR EQUAL
     | LESST OR EQUAL;

opt_not :
        | NOT
        ;

parameters :
           | PARAMETERS  param_list
           ;

param_list : param_def
           | param_list ',' param_def
           ;
param_def : param_mode data_declaration
          ;
param_mode :
           | ALTERS
           | PRESERVES
           | PRODUCES
           | CONSUMES
           ;



expr    : term '+' term
        | term '-' term
        | term '&' term
        | term '|' term
        | term '^' '^' term
        | term
	;
term    : punary '*' punary
        | punary '/' punary
        | punary '%' punary
        | punary '<' '<' punary
	| punary '>' '>' punary
        | punary
	;
punary  : element
        | ADDRESS element
        | DEREF element
        | NEGATE element
        ;
element         : IDENTIFIER popt_ref
	        | STRING_LITERAL
		| LETTER_LITERAL
		| SIGNED_INT_LITERAL
		| UNSIGNED_INT_LITERAL
		| HEX_INT_LITERAL
		| FLOAT_LITERAL
		| MTRUE
		| MFALSE
		| '(' expr ')'
		;
pactions        : pactions action_def
                | action_def
                ;
action_def      : ADD name_ref TO name_ref
                | SUBTRACT name_ref FROM name_ref
                | SET name_ref { printf("%3d: Set %s", yylineno, yylval.string ); } '=' expr { printf(" equal to %f\n", yylval.real ); }
                | READ pvar_value_list
                | INPUT name_ref
                | DISPLAY pvar_value_list
                { printf("%3d: Display: %s\n", yylineno, yylval.string ); }
                | DISPLAYN pvar_value_list
                | MCLOSE IDENTIFIER
                | MOPEN in_out
                | MFILE read_write
                | INCREMENT name_ref
                | DECREMENT name_ref
                | RETURN expr
                | CALL name_ref pusing_ref
                | IF pcondition THEN pactions ptest_elsif
                        opt_else ENDIF
                | FOR name_ref '=' expr downto expr
                        DO pactions ENDFOR
                | REPEAT pactions UNTIL pcondition ENDREPEAT
                | WHILE pcondition DO pactions ENDWHILE
                | CASE name_ref pcase_val pcase_def MENDCASE
                | MBREAK
                | MEXIT  { printf("%3d: Exit\n", yylineno ); }
                | ENDFUN name_ref
                | POSTCONDITION pcondition
                ;
ptest_elsif :
            | proc_elseif
	    ;
proc_elseif : ELSEIF pcondition THEN pactions
            | proc_elseif ELSEIF pcondition THEN pactions
            ;
downto : TO
       | DOWNTO
       ;
pusing_ref :
           | USING arg_list
           | parguments
		   ;
parguments : '(' arg_list ')'
           ;


pcase_val : MWHEN expr ':' pactions
          | pcase_val MWHEN expr ':' pactions
          ;
pcase_def :
          | DEFAULT ':' pactions
          ;
pvar_value_list :  expr | pvar_value_list ',' expr;

opt_else :
         | ELSE pactions
         ;


in_out : INPUT MFILE IDENTIFIER
       | OUTPUT MFILE IDENTIFIER
	   ;
read_write : READ pvar_value_list FROM IDENTIFIER
           | WRITE pvar_value_list TO IDENTIFIER
		   ;
name_ref : IDENTIFIER opt_ref pmember_opt  popt_dot
         ;
pmember_opt :
            | pmember_of
            ;
pmember_of : OF IDENTIFIER opt_ref
	   | pmember_of OF IDENTIFIER opt_ref
           ;

opt_ref :
        | '[' UNSIGNED_INT_LITERAL ']'
        ;
popt_ref :
         | array_val
	 | parguments
         ;
popt_dot :
         | proc_dot
	 ;
proc_dot : '.' IDENTIFIER opt_ref
         | proc_dot '.' IDENTIFIER opt_ref
         ;
// Operator definitions
%%
