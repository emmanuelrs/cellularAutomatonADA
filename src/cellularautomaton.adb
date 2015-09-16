--------------------------------------------------------------------------------
--                      Lenguajes de Programación                             --
--                Proyecto Número 1 - Emmanuel Rosales Salas                  --
--                     Cellular Automatom - Bitmap                            --
--                            Parte Lógica                                    --
--------------------------------------------------------------------------------

------------------------------> Libraries <-------------------------------------
with Gnat.IO;use GNAT.IO;
WITH cellularautomaton;
--------------------------------------------------------------------------------

PACKAGE BODY cellularautomaton IS

   PROCEDURE automatonLogic(Number:Integer; Time:Integer) IS

------------------------------> Types <-----------------------------------------
      -- Este tipo de arreglo lo vamos a utilizar para guardar los números
      -- del 0 - 7 en binario
      TYPE ArrayNumbers IS ARRAY(1..3) OF INTEGER;

--------------------------------> Variables <-----------------------------------

      Cero:ArrayNumbers := (0,0,0); -- Arreglo con el número 0 en binario
      One:ArrayNumbers := (0,0,1);  -- Arreglo con el número 1 en binario
      Two:ArrayNumbers := (0,1,0);   -- Arreglo con el número 2 en binario
      Three:ArrayNumbers := (0,1,1); -- Arreglo con el número 3 en binario
      Four:ArrayNumbers := (1,0,0);  -- Arreglo con en número 4 en binario
      Five:ArrayNumbers := (1,0,1);  -- Arreglo con el número 5 en binario
      Six:ArrayNumbers := (1,1,0);   -- Arreglo con el número 6 en binario
      Seven:ArrayNumbers := (1,1,1); -- Arreglo con el número 7 en binario

      -- El siguiente arreglo es donde vamos a guardar los patrones de bits
      -- para determinar qué número es el que se está evaluando.
      Pattern:ArrayNumbers := (0,0,0);

      -- En este tipo de arreglos vamos a guardar las secuencias del autómata
      -- por lo cual es de tamaño del tiempo que el usuario indica
      TYPE InputNumbers IS ARRAY(1..Time) OF INTEGER;

      Automaton: InputNumbers;
      NewAutomaton: InputNumbers;
      NBinary: Integer;
      X:Integer:= Number;

      -- Declaración de variables para ser usadas en la conversión de Binario a
      -- decimal del número que el usuario ingresa.

      BinaryNumber: ARRAY(1..8) OF INTEGER := (0,0,0,0,0,0,0,0);
      BinaryNumberCounter: Integer := 8;

------------------------------------> Functions <-------------------------------
      FUNCTION To_Decimal RETURN INTEGER IS

      BEGIN
         WHILE X > 0 LOOP
            BinaryNumber(BinaryNumberCounter) := X MOD 2;
            X:= (X/2);
            BinaryNumberCounter := BinaryNumberCounter - 1; -- Se hace para no tener que tener un reverse en el arreglo
         END LOOP;

         BinaryNumber(BinaryNumberCounter) := Number; -- Guarda el último número

         RETURN Number;

      END To_Decimal;

      FUNCTION Compare(PatternS:ArrayNumbers) RETURN INTEGER IS
      BEGIN -- optimizarlo como dijo chepe leyebdo directamente de binario
         IF (PatternS = Cero) THEN
            IF (BinaryNumber(8) = 1) THEN
               RETURN 1;
            END IF;
         END IF;

         IF (PatternS = One) THEN
            IF (BinaryNumber(7) = 1) THEN
               RETURN 1;
            END IF;
         END IF;
         IF (PatternS = Two) THEN
            IF (BinaryNumber(6) = 1) THEN
               Return 1;
            END IF;
         END IF;
         IF (PatternS = Three) THEN
            IF (BinaryNumber(5) = 1) THEN
               RETURN 1;
            END IF;
         END IF;
         IF (PatternS = Four) THEN
            IF (BinaryNumber(4) = 1) THEN
               RETURN 1;
            END IF;
         END IF;
         IF (PatternS = Five) THEN
            IF (BinaryNumber(3) = 1) THEN
               RETURN 1;
            END IF;
         END IF;
         IF (PatternS = Six) THEN
            IF (BinaryNumber(2) = 1) THEN
               RETURN 1;
            END IF;
         END IF;
         IF (PatternS = Seven) THEN
            IF (BinaryNumber(1) = 1) THEN
               RETURN 1;
            END IF;
         END IF;

       RETURN 0;

      END Compare;

	BEGIN
      NBinary := To_Decimal;
      --Time := Time * 2 + 1;
      -- Llena los arrays en 0's con el tamaño que el usuario indica

      FOR i IN 1..Time LOOP
         Automaton(i) := 0;
         NewAutomaton(i) := 0;
      END LOOP;

      Automaton((Time/2) + 1) := 1; -- Inicializa el primer arreglo en 1

      -- Imprime el primer arreglo con un 1 a la mitad
      FOR i IN 1..Time LOOP
         Put(Automaton(i));
      END LOOP;

      -- Casos especiales (inicio/final) del arreglo
      FOR r IN 1..(Time/2) LOOP
         Pattern(3) := Automaton(1);
         Pattern(2) := Automaton(Time);
         Pattern(1) := Automaton(Time - 1);
         NewAutomaton(Time) := Compare(Pattern);
         Pattern(3) := Automaton(2);
         Pattern(2) := Automaton(1);
         Pattern(1) := Automaton(Time);
         NewAutomaton(1) := Compare(Pattern);

         FOR j in 2..(Time - 1) LOOP
            Pattern(1) := Automaton(j - 1);
            Pattern(2) := Automaton(j);
            Pattern(3) := Automaton(j + 1);
            NewAutomaton(j) := Compare(Pattern);
         END LOOP;

         New_Line;

         FOR i IN 1..Time LOOP
            PUT(NewAutomaton(i));
         END LOOP;

         Automaton := NewAutomaton;

         FOR i in 1..Time LOOP
             NewAutomaton(i) := 0;
         END LOOP;

      END LOOP;
	New_Line;
   END automatonLogic;
END cellularautomaton;
