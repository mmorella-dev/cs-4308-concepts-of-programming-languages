with Oedipus; use Oedipus;

package Oedipus.Elementary_Operations is
   Div_By_Zero : exception;

   function "+" (C : in Complex) return Complex;
   -- PRECOND: none
   -- POSTCOND: positive C is returned

   function "-" (C : in Complex) return Complex;
   -- PRECOND: none
   -- POSTCOND: negative of C is returned

   function "+" (C1, C2 : in Complex) return Complex;
   -- PRECOND: none
   -- POSTCOND: sum of C1 & C2 is returned

   function "-" (C1, C2 : in Complex) return Complex;
   -- PRECOND: none
   -- POSTCOND: difference of C1 & C2 is returned

   function "*" (C1, C2 : in Complex) return Complex;
   -- PRECOND: none
   -- POSTCOND: product of C1 & C2 is returned

   function "/" (C1, C2 : in Complex) return Complex;
   -- PRECOND: C2 is not 0+0i. POSTCOND: quotient of C1 & C2 is returned
   -- exceptions: Div_By_Zero is raised if precondition fails

end Oedipus.Elementary_Operations;
