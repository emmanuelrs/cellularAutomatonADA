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
      
      -- En este tipo de arreglos vamos a guardar las secuencias del autómata
      -- por lo cual es de tamaño del tiempo que el usuario indica
      TYPE InputNumbers IS ARRAY(1..Time) OF INTEGER;

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
	  
      Automaton: InputNumbers;
      NewAutomaton: InputNumbers;
      NBinary: Integer;
      Numeric:Integer:= Number;

      -- Declaración de variables para ser usadas en la conversión de Binario a
      -- decimal del número que el usuario ingresa.

      BinaryNumber: ARRAY(1..8) OF INTEGER := (0,0,0,0,0,0,0,0);
      BinaryNumberCounter: Integer := 8;

------------------------------------> Functions <-------------------------------
      -- Función que convierte el número que vamos a evaluar
      -- de decimal a binario, con el fin de obtener los patrones
      -- de si pinta o no
      
      FUNCTION To_Decimal RETURN INTEGER IS

      BEGIN
         WHILE Numeric > 0 LOOP
            BinaryNumber(BinaryNumberCounter) := Numeric MOD 2;
            Numeric:= (Numeric/2);
            BinaryNumberCounter := BinaryNumberCounter - 1; -- Se hace para no tener que tener un reverse en el arreglo
         END LOOP;

         BinaryNumber(BinaryNumberCounter) := Number; -- Guarda el último número

         RETURN Number;

      END To_Decimal;

	  -- Esta función revisa el si el patternS que se le envia
	  -- cumple con algun patrón (número del 0 al 7 en binario)
	  -- y busca en el arreglo principal si hay un 1 o un 0
	  -- y determina si hay que pintar (retorna un 1) o no
	  -- (retorna un 0)
      FUNCTION Compare(PatternS:ArrayNumbers) RETURN INTEGER IS
      BEGIN 
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
		 
		 -- Revisa los patrones, primero el de arriba ala derecha
		 -- Luego el número de arriba y luego arriba y finalmente
		 -- el de arriba a la izquierda para obtener el patron de 
		 -- los 3 bits y llamar a la función que determina si pinta
		 -- o no.
		 
         FOR j in 2..(Time - 1) LOOP
            Pattern(1) := Automaton(j - 1);
            Pattern(2) := Automaton(j);
            Pattern(3) := Automaton(j + 1);
            NewAutomaton(j) := Compare(Pattern);
         END LOOP;

         New_Line; -- salto de línea para que todo no quede pegado
         
		 -- Imprime el arreglo con la secuencia
		 -- que se generó después de evaluar los
		 -- casos especiales
         FOR i IN 1..Time LOOP
            PUT(NewAutomaton(i));
         END LOOP;
		 
		 -- Actualiza Automaton para que siga con la siguiente
		 -- fila y no repita el que ya se imprimió
		 Automaton := NewAutomaton;
	     
	     -- Limpia el arreglo para que este en 0
	     -- para la nueva evaluación
         FOR i in 1..Time LOOP
             NewAutomaton(i) := 0;
         END LOOP;

      END LOOP;
	New_Line;
   END automatonLogic;
END cellularautomaton;
