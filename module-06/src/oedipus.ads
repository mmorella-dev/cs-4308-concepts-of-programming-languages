-- FILE: oedipus.ads
-- LICENSE: MIT © 2021 Mae Morella

with Ada.Exceptions; use Ada.Exceptions;

package Oedipus is
   -- defines the Complex type, which represents a complex number A + Bi

   type Complex is private;

   function Create_Complex (A, B : in Float) return Complex;
   -- PRECOND: none
   -- POSTCOND: Complex number with real and imaginary components

   function Get_Real (C : in Complex) return Float;
   -- PRECOND: none
   -- POSTCOND: real component of C is returned

   function Get_Imaginary (C : in Complex) return Float;
   -- PRECOND: none
   -- POSTCOND: imaginary component of C is returned

private
   type Complex is record
      Real      : Float := 0.0;
      Imaginary : Float := 0.0;
   end record;

end Oedipus;
