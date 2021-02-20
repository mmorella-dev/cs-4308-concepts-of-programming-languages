# Sclanner

A stupid simple lexical analyzer for the SCL programming language. Created as part of a project for CS 4308 Concepts of Programming Languages.

## Build

Requires that you have [Make](https://en.wikipedia.org/wiki/Make_(software)) installed, [Flex](https://en.wikipedia.org/wiki/Flex_(lexical_analyser_generator)), and [Bison](https://en.wikipedia.org/wiki/Yacc)

Clone this repository, and execute `make`. This should generate the binary at `out/sclanner`.

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
#  ...
```

## License

MIT © 2021 Mae Morella
