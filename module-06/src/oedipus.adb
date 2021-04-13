package body Oedipus is

   function Create_Complex (A, B : in Long_Float) return Complex is
      C : Complex;
   begin
      C.Real      := A;
      C.Imaginary := B;
      return C;
   end Create_Complex;

   function Get_Real (C : in Complex) return Long_Float is
   begin
      return C.Real;
   end Get_Real;

   function Get_Imaginary (C : in Complex) return Long_Float is
   begin
      return C.Imaginary;
   end Get_Imaginary;

end Oedipus;
