with Oedipus; use Oedipus;

package body Oedipus.Elementary_Operations is

   function "+" (C1, C2 : in Complex) return Complex is
      Sum : Complex :=
        Create_Complex
          (Get_Real (C1) + Get_Real (C2),
           Get_Imaginary (C1) + Get_Imaginary (C2));
   begin
      return Sum;
   end "+";

   function "-" (C : in Complex) return Complex is
      Neg : Complex := Create_Complex (-Get_Real (C), -Get_Imaginary (C));
   begin
      return Neg;
   end "-";

   function "+" (C : in Complex) return Complex is
   begin
      return C;
   end "+";

   function "-" (C1, C2 : in Complex) return Complex is
   begin
      -- Depends on "+" and "-" operation
      return C1 + (-C2);
   end "-";

   function "*" (C1, C2 : in Complex) return Complex is
      Prod : Complex :=
        Create_Complex
          (Get_Real (C1) * Get_Real (C2) -
           Get_Imaginary (C1) * Get_Imaginary (C2),
           Get_Real (C1) * Get_Imaginary (C2) +
           Get_Imaginary (C1) * Get_Real (C2));
   begin
      return Prod;
   end "*";

   function Reciprocal (C : in Complex) return Complex is
      Denom : Long_Float :=
        Get_Real (C) * Get_Real (C) + Get_Imaginary (C) * Get_Imaginary (C);
      Recip : Complex :=
        Create_Complex
          (A => Get_Real (C) / Denom, B => -Get_Imaginary (C) / Denom);
   begin
      if Denom = 0.0 then
         raise Div_By_Zero with "Cannot take reciprocal of 0.0 + 0.0i";
      end if;
      return Recip;
   end Reciprocal;

   function "/" (C1, C2 : in Complex) return Complex is
   begin
      return C1 * Reciprocal (C2);
   end "/";

end Oedipus.Elementary_Operations;
