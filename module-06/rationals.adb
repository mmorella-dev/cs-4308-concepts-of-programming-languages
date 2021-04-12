with Ada.Exceptions;
use Ada.Exceptions;

package body Rationals is

  function GCD (X, Y: in Natural) return Positive is

    Result: Positive;

    begin
      if Y = 0 then
        Result := X;
      else
        Result := GCD (X => Y, Y => X mod Y);
      end if;
      return Result;
    end GCD;

    ----------------------------------------------------------------------------------------------------

  procedure Reduce (R: in out Rational) is

    LCD: Positive := GCD (X => Abs (R.Num), Y => R.Denom);

    begin
      R.Num := R.Num / LCD;
      R.Denom := R.Denom / LCD;
    end Reduce;

    ------------------------------------------------------------------------------------------------------

  function "*" (R1, R2: in Rational) return Rational is

    R: Rational := Create_Rational (N => R1.Num * R2.Num, D => R1.Denom * R2.Denom);

    begin
      Reduce (R => R);
      return R;
    end "*";

    --------------------------------------------------------------------------------------------------------

  function "+" (R: in Rational) return Rational is

    begin
      return R;
    end "+";

  function "+" (R1, R2: in Rational) return Rational is

    R: Rational := Create_Rational (N => R1.Num * R2.Denom + R1.Denom * R2.Num,
      D => R1.Denom * R2.Denom);

    begin
      Reduce (R => R);
      return R;
    end "+";

    -----------------------------------------------------------------------------------------------------

  function "-" (R: in Rational) return Rational is

    New_R: Rational := Create_Rational (N => -R.Num, D => R.Denom);

    begin
      return New_R;
    end "-";

    ---------------------------------------------------------------------------------------------------------

  function "-" (R1, R2: in Rational) return Rational is

    begin
      return R1 + (-R2);
    end "-";

    -----------------------------------------------------------------------------------------------------------

  function "/" (R1, R2: in Rational) return Rational is

    R: Rational;

    begin
      R := Create_Rational (N => R1.Num * R2.Denom, D => R2.Num * R1.Denom);
      return R;
    end "/";

    -------------------------------------------------------------------------------------------------------------

  function "<" (R1, R2: in Rational) return Boolean is

    Common_Denom: Positive := GCD (X => R1.Denom, Y => R2.Denom);
    First_Factor: Positive := R1.Denom / Common_Denom;
    Second_Factor: Positive := R2.Denom / Common_Denom;

    begin
      return R1.Num * First_Factor < R2.Num * Second_Factor;
    end "<";

    ------------------------------------------------------------------------------------------------------------

  function "<=" (R1, R2: in Rational) return Boolean is

    begin
      return R1 < R2 or R1 = R2;
    end "<=";

    ----------------------------------------------------------------------------------------------------------------

  function ">" (R1, R2: in Rational) return Boolean is

    begin
      return not (R1 <= R2);
    end ">";

    ----------------------------------------------------------------------------------------------------------------

  function ">=" (R1, R2: in Rational) return Boolean is

    begin
      return R1 > R2 or R1 = R2;
    end ">=";

    ------------------------------------------------------------------------------------------------------------------

  function Create_Rational (N: in Integer) return Rational is

    R: Rational;

    begin
      R.Num := N;
      return R;
    end Create_Rational;

    ----------------------------------------------------------------------------------------------------------------------

  function Create_Rational (N: in Integer; D: in Positive) return Rational is

      R: Rational;
      temp: Integer;

   begin
      if D = 0 then
         raise Zero_Denominator with "zero denominator";
      end if;
      if D < 0 then
         R.Num := -1 * N;
         temp := -1 * D;
         R.Denom := Positive (temp);
      else
         R.Num := N;
         R.Denom := Positive (D);
         end if;
      Reduce (R => R);
      return R;
    end Create_Rational;

    --------------------------------------------------------------------------------------------------------------------

  function get_denominator (R: in Rational) return Positive is

    begin
      return R.Denom;
    end get_denominator;

    ---------------------------------------------------------------------------------------------------------------------

  function get_numerator (R: in Rational) return Integer is

    begin
      return R.Num;
    end get_numerator;

    ----------------------------------------------------------------------------------------------------------------------

  function Modulus (R: in Rational) return Rational is

    R1: Rational;

    begin
      R1.Num := abs (R.Num);
      R1.Denom := abs (R.Denom);
      return R1;
    end Modulus;

end Rationals;

