with Rationals, Ada.Text_IO, Ada.Exceptions;
use Rationals, Ada.Text_IO, Ada.Exceptions;

procedure Test_Rational is

  R1: Rational;
  R2: Rational;
   
   procedure display_rational (r: in Rational) is
      
   begin
      put (Integer'Image(get_numerator (r => r)));
      put ('/');
      put_line (Positive'Image (get_denominator (r => r)));                
   end display_rational;
   
begin
    R1 := Create_Rational (N => 3);
    R2 := Create_Rational(N => 2,  D => 5);
   display_rational (r => r1 + r2);
   New_Line;
   display_rational (r => r1 - r2);
   New_Line;
   display_rational (r => r1 * r2);
   New_Line;
   display_rational (r => r1 / r2);
   New_Line;
exception
   when E: Zero_Denominator =>
      Put_Line (Exception_Message (E));
end Test_Rational;
