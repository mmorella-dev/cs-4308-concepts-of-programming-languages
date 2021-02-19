# SCLanner

A stupid simple lexical analyzer for the SCL programming language.

## Usage

```sh
$ sclanner my_scl_file.scl
#  1: import               found KEYWORD (import, #294)
#  1: "scl.h"              found STRING (scl.h)
#  2: implementations      found KEYWORD (implementations, #293)
#  3: function             found KEYWORD (function, #290)
#  3: main                 found IDENTIFIER
#  3: is                   found KEYWORD (is, #299)
#  4: variables            found KEYWORD (variables, #348)
#  5: define               found KEYWORD (define, #270)
#  5: x                    found IDENTIFIER
#  5: of                   found KEYWORD (of, #314)
#  5: type                 found KEYWORD (type, #343)
#  5: double               found KEYWORD (double, #276)
#  6: begin                found KEYWORD (begin, #317)
#  7: display              found KEYWORD (display, #273)
#  7: "Welcome to the worl found STRING (Welcome to the world of SCL)
#  8: set                  found KEYWORD (set, #328)
#  8: x                    found IDENTIFIER
#  8: =                    found OPERATOR
#  8: 45.9                 found float constant (45.900000)
#  8: 5                    found integer constant (5)
#  9: display              found KEYWORD (display, #273)
#  9: "Value of x: "       found STRING (Value of x: )
#  9: x                    found IDENTIFIER
# 10: exit                 found IDENTIFIER
# 11: endfun               found KEYWORD (endfun, #281)
# 11: main                 found IDENTIFIER
```

## Build

Requires that you have [Make](https://en.wikipedia.org/wiki/Make_(software)) installed, [Flex](https://en.wikipedia.org/wiki/Flex_(lexical_analyser_generator)), and [Bison](https://en.wikipedia.org/wiki/Yacc)

Clone this repository, and execute `make`. This should generate the `sclanner` binary.

## License

MIT © 2021 Mae Morella