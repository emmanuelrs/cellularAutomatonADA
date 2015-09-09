-----------------------------------------------------------------------------
--                   Lenguajes de Programación                             --
--             Proyecto Número 1 - Emmanuel Rosales Salas                  --
--                  Cellular Automatom - Bitmap                            --
------------------------------------------------------------------------------

----------------------------> Libraries <-----------------------------------

WITH GNAT.IO; USE GNAT.IO;

------------------------------------------------------------------------------

procedure Cellularatomatonmain is
   -------------------------> Variables <-------------------------------------

   Time : Integer;               ---> Stores the

   NumberToCheck : Integer := 0; ---> Users input

   BinaryNumber: Inteter := 0;   ---> Binary Number of the users input

   -------------------------------------------------------------------------------

begin
   Put("Write a number to check! : ");
   Get(NumberToCheck);
   Put("Write the time: ");
   Get(Time);
   Put(Time);
   New_Line;
end Cellularatomatonmain;
