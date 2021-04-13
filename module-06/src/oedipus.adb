-- FILE: oedipus.adb
-- LICENSE: MIT © 2021 Mae Morella

package body Oedipus is

   function Create_Complex (A, B : in Float) return Complex is
      C : Complex;
   begin
      C.Real      := A;
      C.Imaginary := B;
      return C;
   end Create_Complex;

   function Get_Real (C : in Complex) return Float is
   begin
      return C.Real;
   end Get_Real;

   function Get_Imaginary (C : in Complex) return Float is
   begin
      return C.Imaginary;
   end Get_Imaginary;

end Oedipus;
