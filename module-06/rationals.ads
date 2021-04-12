package Rationals is

  type Rational is private;
  
  Zero_Denominator: exception;
  
  function Create_Rational (N: in Integer) return Rational;
  -- pre: none
  -- post: rational number with numerator n & denominator 1 has been created
  
  function Create_Rational (N: in Integer; D: in Positive) return Rational;
  -- pre: none
  -- post: rational number with number n & denominator d has been created
  
  function "+" (R: in Rational) return Rational;
  -- pre: none
  -- post: R is returned
  
  function "-" (R: in Rational) return Rational;
  -- pre: none
  -- post: negative of R is returned
  
  function "+" (R1, R2: in Rational) return Rational;
  -- pre: none
  -- post: sum of R1 & R2 is returned
  
  function "-" (R1, R2: in Rational) return Rational;
  -- pre: none
  -- post: difference of R1 & R2 is returned
  
  function "*" (R1, R2: in Rational) return Rational;
  -- pre: none
  -- post: product of R1 & R2 is returned
  
  function "/" (R1, R2: in Rational) return Rational;
  -- pre: X is not the zero rational number
  -- post: quotient of R1 & R2 is returned
  -- exceptions: Zero_Denominator is raised if precondition is not met
  
  function "<" (R1, R2: in Rational) return Boolean;
  -- pre: none
  -- post: true is returned if R1 < R2 - false otherwise
  
  function "<=" (R1, R2: in Rational) return Boolean;
  -- pre: none
  -- post: true is returned if R1 <= R2 - false otherwise
  
  function ">" (R1, R2: in Rational) return Boolean;
  -- pre: none
  -- post: true is returned if R1 > R2 - false otherwise
  
  function ">=" (R1, R2: in Rational) return Boolean;
  -- pre: none
  -- post: true is returned if R1 >= R2 - false otherwise
  
  function get_numerator (R: in Rational) return Integer;
  -- pre: none
  -- post: numerator of R is returned
  
  function get_denominator (R: in Rational) return Positive;
  -- pre: none
  -- post: denominator of R is returned

  function Modulus (R: in Rational) return Rational;
  -- pre:  none
  -- post: absolute value of R is returned
  
  private
    type Rational is
      record
        Num: Integer := 0;
        Denom: Positive := 1;
      end record;
      
end Rationals;
