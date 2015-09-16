------------------------------> Libraries <-------------------------------------
with Text_IO,Sequential_IO,Direct_IO;
use Text_IO;
--------------------------------------------------------------------------------

PROCEDURE cellularautomaton_Logic IS
------------------------------> Variables <-------------------------------------

   Time : Integer;               ---> Stores the number of times

   NumberToCheck : Integer := 0; ---> Users input

   BinaryNumber: Integer := 0;   ---> Binary Number of the users input

--------------------------------------------------------------------------------

BEGIN
   automatonLogic(31,30);
END cellularautomaton_Logic;
