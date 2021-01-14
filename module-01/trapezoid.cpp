#include <iostream>

// Calculates the area of a given trapezoid.
// @param base1 The length of the first parallel side
// @param base2 The length of the other parallel side
// @param height The perpendicular distance between these two sides
double computeTrapezoidArea(double base1, double base2, double height) {
  // This implementation shares syntax with the Java version
  return height * (base1 + base2) / 2;
}

// Reads and returns a double value from std::cin
// If the read fails (i.e. the input is not valid),
// @throws an integer exception 20.
double nextDouble() {
  double n;
  std::cin >> n;
  if (!std::cin) {
    throw 20; // if the failbit is set, throw an exception
  }
  return n;
}

int main() {
  std::cout << "=== Trapezoid Area Calculator v0.1 ===\n";
  std::cout << "Enter a non-numeric value to exit.\n\n";
  while (true) {
    try {
      std::cout << "Length of the 1st parallel side: ";
      double b1 = nextDouble();
      std::cout << "Length of the 2nd parallel side: ";
      double b2 = nextDouble();
      std::cout << "Height between those two sides: ";
      double h = nextDouble();
      double area = computeTrapezoidArea(b1, b2, h);
      std::printf("The area of this trapezoid is %.2f.\n\n", area);
    } catch (int e) {
      // assume that the user intentionally typed a non-numeric value, and exit
      break;
    }
  }
  return EXIT_SUCCESS;
}