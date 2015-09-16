------------------------------------------------------------------------
--                   Lenguajes de Programación                        --
--             Proyecto Número 1 - Emmanuel Rosales Salas             --
--                  Cellular Automatom - Bitmap                       --
--                           Main                                     --
------------------------------------------------------------------------

with GNAT.IO; use GNAT.IO;
with cellularautomaton; use cellularautomaton;

procedure cellularautomaton_main is

------------------------------> Variables <-----------------------------

   Time : Integer;               ---> Stores the number of times

   NumberToCheck : Integer := 0; ---> Users input


------------------------------------------------------------------------

begin
	PUT("Write a number: ");
	GET(NumberToCheck);
	PUT("Write a time: ");
	GET(Time);
	IF NumberToCheck < 256 THEN
		AutomatonLogic(NumberToCheck,(Time * 2 + 1));
	ELSE
		PUT("El número debe ser mayor a 0 y menor a 256");
		New_Line;
	END IF;
end cellularautomaton_main;
