# Assignment 1 Report

Kennesaw State University<br>
College of Computing and Software Engineering<br>
Department of Computer Science<br>
CS 4308 - Concepts of Programming Languages W01

Mae Morella ([mmorella@students.kennesaw.edu](mailto:mmorella@students.kennesaw.edu))<br>
January 12, 2021

## 1. Java and C++ Programs

> Write a program in Java and an equivalent program in C++, that computes the area of a trapezoid. Describe the input and output of the program.

### Solution

The two programs outlined below.

**Input:** Take terminal input via `std::cin` in C++, and `System.in()` in Java. These inputs are parsed as double-precision floating point numbers ([IEEE 754-1985](https://en.wikipedia.org/wiki/IEEE_754-1985)). If an error is encountered in this parsing (i.e. the user has typed something other than a number), the program exits silently.

**Output:** The program prints messages to the terminal's stdout, prompting the user for input, and outputing the area of that trapezoid.

#### Screenshots of Execution

![Screenshot of trapezoid.cpp compiling and executing](screen-cpp.png)

![Screenshot of TrapezoidAreaCalculator.java executing](screen-java.png)

#### C++ source (excerpt from `trapezoid.cpp`)

```cpp
#include <iostream>

// Calculates the area of a given trapezoid.
// @param base1 The length of the first parallel side
// @param base2 The length of the other parallel side
// @param height The perpendicular distance between these two sides
double computeTrapezoidArea(double base1, double base2, double height) {
  return height * (base1 + base2) / 2;
}

// Reads and returns a double value from std::cin.
// If the read fails (i.e. the input is not valid),
// throws an integer exception 20.
double nextDouble() {/* ... */}

// Main program
int main() {/* ... */}
```

#### Java source: (excerpt from `TrapezoidAreaCalculator.java`)

```java

/**
 * Provides methods for calculating the area of a trapezoid
 * (i.e. a quadrilateral with at least two parallel sides).
 * Also includes a test program which prints the area of a user-defined triangle.
 */
import java.util.*;

public class TrapezoidAreaCalculator {
  /**
   * Calculates the area of a given trapezoid.
   * @param base1 The length of the first parallel side
   * @param base2 The length of the other parallel side
   * @param height The perpendicular distance between these two sides
   */
  public static double computeTrapezoidArea(double base1, double base2, double height) {
  return height * (base1 + base2) / 2;
}
  /**
   * Main program
   * Prompts the user to input side lengths,
   * and outputs the result of the area function.
   */
  public static void main(String[] args) {/* ... */}
}
```

#### Notable differences between implementations

* OO programming
   a. Java requires all methods to be implemented as part of a class.
   a. C++ allows declaring functions in the global namespace.
* Reading numbers from user input.
   a. Java and C++ both provide simple interfaces (`System.in`, `std::cin`) representing user input streams.
   a. The Java implementation retrieves numbers using `Scanner#nextDouble()`
   a. The C++ implementation uses the overloaded `>>` operator to extract formatted inputs (i.e. `double d; std::cin >> d;`)
* Exception handling
   a. In Java, the method `Scanner#nextDouble()` throws an
InputMismatchException if the input cannot be parsed.
   b. In C++, `std::cin` merely sets the "fail bit" when this occurs. My implementation compensates by checking whether the fail bit is set, and throwing an arbitrary integer exception which is used to abort the program.

Aside from these differences, C++ and Java are extremely similar in syntax. The body of the function `double computeTrapezoidArea` is completely identical between the two languages.

## 2. Investigate the general principles and goals of a system programming language. Provide two or three examples of system programming languages

* ALGOL
* Pascal
* C

## 3. Problem #3 from p. 181

> Rewrite the BNF of Example 3.4 to give `+` precedence over `*` and force `+` to be right associative.

Rewritten BNF:

```text
<assign> → <id> = <expr>
<id> → A | B | C
<expr> → <expr> * <term> | <term>
<term> → <factor> * <term> | <factor>
<factor> → (<expr>) | <id>
```

### 4. Problem #7d from p. 182

> ```text
> <assign> → <id> = <expr>
> <id>     → A | B | C
> <expr>   → <expr> + <term>
>          | <term>
> <term>   → <term> * <factor>
>          | <factor>
> <factor> → (<expr>)
>          | <id>
> ```
>
> Using the grammar in Example 3.4, show a parse tree and a leftmost derivation for each of the following statements:
>
> d. `A = B * (C * (A + B))`

#### Leftmost derivation of `A = B * (C * (A + B))`

```text
<assign> → <id> = <expr>
=> A = <expr>
=> A = <term>
=> A = <term> * <factor>
=> A = <factor> * <factor>
=> A = <id> * <factor>
=> A = B * <factor>
=> A = B * (<expr>)
=> A = B * (<term>)
=> A = B * (<term> * <factor>)
=> A = B * (<factor> * <factor>)
=> A = B * (<id> * <factor>)
=> A = B * (C * <factor>)
=> A = B * (C * (<expr>))
=> A = B * (C * (<expr> + <term>))
=> A = B * (C * (<term> + <term>))
=> A = B * (C * (<factor> + <term>))
=> A = B * (C * (<id> + <term>))
=> A = B * (C * (A + <term>))
=> A = B * (C * (A + <factor>))
=> A = B * (C * (A + <id>))
=> A = B * (C * (A + B))
```

#### Parse tree of `A = B * (C * (A + B))`

Created using [asciiflow.com](http://asciiflow.com/)

```text
      <assign>
     /   |    \
  <id>  '='  <expr>
   |           |
  'A'        <term>
            /  |   \
      <term>  '*'   <factor>
        |          /   |    \
      factor>   '('  <expr>  ')'
        |              |
       <id>          <term>
        |           /  |   \
       'B'     <term> '*'   <factor>
                 |         /   |    \
              <factor>  '('  <expr>  ')'
                 |          /  |   \
                <id>  <expr>  '+'   <term>
                 |      |             |
                'C'   <term>       <factor>
                        |             |
                     <factor>        <id>
                        |             |
                       <id>          'B'
                        |
                       'A'
```
