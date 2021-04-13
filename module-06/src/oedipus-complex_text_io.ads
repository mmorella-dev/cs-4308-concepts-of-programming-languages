with Oedipus, Ada.Text_IO;
use Oedipus, Ada.Text_IO;

package Oedipus.Complex_Text_IO is
   -- Overloads the Put function, for printing Complex numbers. Same argument
   -- scheme as Ada.Float_Text_IO.
   Default_Aft  : Field := 1;
   Default_Exp  : Field := 0;
   Default_Fore : Field := 0;

   procedure Put
     (Item : in Complex; Fore : in Field := Default_Fore;
      Aft  : in Field := Default_Aft; Exp : in Field := Default_Exp);

   procedure Get (Item : out Complex);

end Oedipus.Complex_Text_IO;
