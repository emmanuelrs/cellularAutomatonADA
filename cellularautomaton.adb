--------------------------------------------------------------------------------
--                      Lenguajes de Programación                             --
--                Proyecto Número 1 - Emmanuel Rosales Salas                  --
--                     Cellular Automatom - Bitmap                            --
--                            Parte Lógica                                    --
--------------------------------------------------------------------------------

------------------------------> Libraries <-------------------------------------
with Gnat.IO; use GNAT.IO;
with cellularautomaton;
--------------------------------------------------------------------------------

package body cellularautomaton is
   procedure AutomatonLogic(Number:Integer; Time:Integer) is

      type ArrayNumbers is array(1..3) of Integer;  -- comentar todo eso
      Cero:ArrayNumbers:=(0,0,0);
      One:ArrayNumbers:=(0,0,1);
      Two:ArrayNumbers:=(0,1,0);
      Three:ArrayNumbers:=(0,1,1);
      Four:ArrayNumbers:=(1,0,0);
      Five:ArrayNumbers:=(1,0,1);
      Six:ArrayNumbers:=(1,1,0); --Estado
      Seven:ArrayNumbers:=(1,1,1);
      Pattern:ArrayNumbers:=(0,0,0);

      type InputNumbers is array(1..Time) of Integer; -- Valores
      Automaton:InputNumbers; --Estado Actual
      NewAutomaton:InputNumbers; --Cambio

      BinaryNumber:array(1..8) of Integer:=(0,0,0,0,0,0,0,0); --Binario
      Timer:Integer:=Time; --X
      BinaryCounter:Integer:=8; --V
      E:Integer; --cambiar x algo más significativo
      -- intentr un ciclo q disminiya variable y compare solo en binarynumebr

      function Compare(Sec:ArrayNumbers) return Integer is
      begin
         if Sec=Cero then
            if BinaryNumber(8) = 1 then
               return 1;
            end if;
         end if;

         if Sec=One then
            if BinaryNumber(7) = 1 then
               return 1;
            end if;
         end if;
         if Sec=Two then
            if BinaryNumber(6) = 1 then
               return 1;
            end if;
         end if;

         if Sec=Three then
            if BinaryNumber(5) = 1 then
               return 1;
            end if;
         end if;

         if Sec=Four then
            if BinaryNumber(4) = 1 then
               return 1;
            end if;
         end if;

         if Sec=Five then
            if BinaryNumber(3) = 1 then
               return 1;
            end if;
         end if;

         if Sec=Six then
            if BinaryNumber(2) = 1 then
               return 1;
            end if;
         end if;

         if Sec=Seven then
            if BinaryNumber(1) = 1 then
               return 1;
            end if;
         end if;
         return 0;
      end Compare;

      function To_Decimal return Integer is
      begin
         while Timer>0 loop
            BinaryNumber(BinaryCounter):= Timer mod 2;
            Timer:=Timer/2;
            BinaryCounter:=BinaryCounter-1;
         end loop;
         BinaryNumber(BinaryCounter):=Timer;
         return Timer;

      end To_Decimal;

   begin
      E:=To_Decimal;

      for p in 1..Time loop --cambiar contadores
         Automaton(p):= 0;
         NewAutomaton(p):=0;
      end loop;

      Automaton((Time/2)+1):=1;

      for i in 1..Time loop
         Put(Automaton(i));
      end loop;

      for m in 1..(Time/2) loop
         Pattern(3):=Automaton(1);
         Pattern(2):=Automaton(Time);
         Pattern(1):=Automaton(Time-1);
         NewAutomaton(Time):=Compare(Pattern);

         Pattern(3):=Automaton(2);
         Pattern(2):=Automaton(1);
         Pattern(1):=Automaton(Time);
         NewAutomaton(1):=Compare(Pattern);

         for i in 2..(Time-1) loop
            Pattern(1):=Automaton(i-1);
            Pattern(2):=Automaton(i);
            Pattern(3):=Automaton(i+1);
            NewAutomaton(i):=Compare(Pattern);
         end loop;

         New_Line;
         for i in 1..Time loop
            Put(NewAutomaton(i));
         end loop;

         Automaton:=NewAutomaton;
         for p in 1..Time loop
            NewAutomaton(p):=0;
         end loop;

      end loop;
      New_Line;

   end AutomatonLogic;
end cellularautomaton;
