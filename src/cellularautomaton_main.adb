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
	AutomatonLogic(NumberToCheck,(Time * 2 + 1));
end cellularautomaton_main;
