-- FILE: test_oedipus.adb
-- LICENSE: MIT © 2021 Mae Morella

with Oedipus, Oedipus.Elementary_Functions, Oedipus.Complex_Text_IO, Ada
  .Text_IO, Ada.Float_Text_IO, Ada.Exceptions;
use Oedipus, Oedipus.Elementary_Functions, Oedipus.Complex_Text_IO,
  Ada.Text_IO, Ada.Float_Text_IO, Ada.Exceptions;

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
