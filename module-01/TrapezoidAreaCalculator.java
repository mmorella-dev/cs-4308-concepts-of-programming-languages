
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
    // The area is defined as "½ x (sum of the lengths of the parallel sides) x
    // perpendicular distance between parallel sides"
    return height * (base1 + base2) / 2;
  }
  /**
   * Main program
   * Prompts the user to input side lengths,
   * and outputs the result of the area function.
   */
  public static void main(String[] args) {
    System.out.println("=== Trapezoid Area Calculator v0.1 ===");
    System.out.println("Enter a non-numeric value to exit.\n");
    try (Scanner sc = new Scanner(System.in)) {
      while (true) { // loop until an invalid input is received
        System.out.print("Length of the 1st parallel side: ");
        double b1 = sc.nextDouble();
        System.out.print("Length of the 2nd parallel side: ");
        double b2 = sc.nextDouble();
        System.out.print("Height between those two sides: ");
        double h = sc.nextDouble();
        double area = computeTrapezoidArea(b1, b2, h);
        System.out.printf("The area of this trapezoid is %,.2f.\n\n", area);
      }
    } catch (InputMismatchException e) {
      System.exit(0);
    }
  }
}