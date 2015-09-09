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

   BinaryNumber: Integer := 0;   ---> Binary Number of the users input

   -------------------------------------------------------------------------------
   Type MyArray is array(1..3) of Integer;

   procedure initi (Cero:out MyArray) is

     Type BinaryArray is array(1..Time) of Integer;

     Cero: MyArray := (0,0,0);
     One : MyArray := (0,0,1);
     Two : MyArray := (0,1,0);
     Three : MyArray := (0,1,1);
     Four: MyArray := (1,0,0);
     Five: MyArray := (1,0,1);
     Six : MyArray := (1,1,0);
     Seven : MyArray := (1,1,1);
   begin
      null;
   end initi;



begin
   Put("Write a number to check! : ");
   Get(NumberToCheck);
   Put("Write the time: ");
   Get(Time);
   Put(Time);
   New_Line;
   initi;
   --Put(Cero(1));
end Cellularatomatonmain;
