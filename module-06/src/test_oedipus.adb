with Oedipus, Oedipus.Math, Oedipus.Complex_Text_IO, Ada.Text_IO, Ada
  .Long_Float_Text_IO, Ada.Exceptions;
use Oedipus, Oedipus.Math, Oedipus.Complex_Text_IO, Ada.Text_IO,
  Ada.Long_Float_Text_IO, Ada.Exceptions;

procedure Test_Oedipus is
   U : Complex;
   V : Complex;

begin
   -- User-input complex numbers
   Put_Line ("=== Create complex number U ===");
   Get (U);
   Put ("U = ");
   Put (U);
   Put_Line ("");
   Put_Line ("=== Create complex number V ===");
   Get (V);
   Put ("V = ");
   Put (V);
   Put_Line ("");
   Put_Line ("=== Math operations ===");
   Put ("U+V = ");
   Put (U + V);
   Put_Line ("");
   Put ("U-V = ");
   Put (U - V);
   Put_Line ("");
   Put ("U*V = ");
   Put (U * V);
   Put_Line ("");
   Put ("U/V = ");
   Put (U / V);
   Put_Line ("");

end Test_Oedipus;
