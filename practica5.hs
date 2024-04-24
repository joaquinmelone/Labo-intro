-- Ejercicio 1

-- 1.
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use even" #-}

-- Cómo funciona x:xs, por qué x es el primer elemento de la lista que mandes y xs es el resto, si por ejemplo en ghci yo escribo [4,5] : []
-- la devolución es [[4,5]], por qué en este caso se comporta como si fuera un head y un tail, y no simplemente como un constructor de listas

longitud :: [t] -> Int

longitud [] = 0
longitud (x:xs) = 1 + longitud xs


-- 2. a

ultimo :: [t] -> t

ultimo x    | longitud x == 1 = head x
            | otherwise = ultimo (tail x)


-- 3.



-- 4.

--Función auxiliar

removerUltimo :: [t] -> [t]

removerUltimo x | longitud x == 1 = []
                | otherwise = head x : removerUltimo (tail x)



reverso :: [t] -> [t]

reverso x   | longitud x == 1 = x
            | longitud x == 0 = []
            | otherwise = ultimo x : reverso (removerUltimo x)


-- Ejercicio 2

-- 1.

-- (Eq t) significa que tiene definido la operación igual, o sea, el tipo "t" que entra en la función tiene que poder compararse. Ej: naturales, enteros, reales, booleanos, etc.
pertenece :: (Eq t) => t -> [t] -> Bool

pertenece elemento lista    | longitud lista == 0 = False
                            | elemento == head lista = True
                            | otherwise = pertenece elemento (tail lista)

-- 2.

todosIguales :: (Eq t) => [t] -> Bool

todosIguales lista  | longitud lista == 2 = (head lista == head (tail lista))
                    | longitud lista == 1 || longitud lista == 0 = True
                    | head lista == head (tail lista) = todosIguales (tail lista)
                    | otherwise = False

-- 3.

todosDistintos :: (Eq t) => [t] -> Bool

todosDistintos lista    | longitud lista == 0 || longitud lista == 1 = True
                        | pertenece (head lista) (tail lista) = False
                        | otherwise = todosDistintos (tail lista)

-- 4.

hayRepetidos :: (Eq t) => [t] -> Bool

hayRepetidos lista  | longitud lista == 0 = False
                    | pertenece (head lista) (tail lista) = True
                    | otherwise = hayRepetidos (tail lista)

-- 5.

quitar :: (Eq t) => t -> [t] -> [t]

quitar elemento lista   | longitud lista == 0 = []
                        | elemento == (head lista) = tail lista
                        | elemento /= (head lista) = (head lista) : quitar elemento (tail lista)

-- 6. 

quitarTodos :: (Eq t) => t -> [t] -> [t]

quitarTodos elemento lista  | longitud lista == 0 = []
                            | elemento /= (head lista) = (head lista) : quitarTodos elemento (tail lista)
                            | otherwise = quitarTodos elemento (tail lista)

-- 7. 

eliminarRepetidos :: (Eq t) => [t] -> [t]

eliminarRepetidos lista | longitud lista == 0 = []
                        | pertenece (head lista) (tail lista) = eliminarRepetidos (quitar (head lista) lista)
                        | otherwise = (head lista) : eliminarRepetidos (tail lista)

-- 8.

--Función auxiliar
cantidadElementos :: [t] -> Int

cantidadElementos lista | longitud lista == 0 = 0
                        | otherwise = cantidadElementos (tail lista) + 1

--Función auxiliar
nesimaPosicionLista :: Int -> [t] -> t

nesimaPosicionLista n lista | (cantidadElementos lista) - 1 == n = ultimo lista
                            | otherwise = nesimaPosicionLista n (removerUltimo lista)



mismosElementos :: (Eq t) => [t] -> [t] -> Bool

mismosElementos lista1 lista2   | longitud (eliminarRepetidos lista1) /= longitud (eliminarRepetidos lista2) = False
                                | longitud lista1 == 0 || longitud lista2 == 0 = True
                                | pertenece (head lista1) lista2 = mismosElementos (quitarTodos (head lista1) lista1) (quitarTodos (head lista1) lista2)
                                | otherwise = False

-- 9. 

capicua :: (Eq t) => [t] -> Bool

capicua lista   | longitud lista == 0 = True
                | longitud lista == 1 = True
                | head lista == ultimo lista = capicua (removerUltimo (tail lista))
                | otherwise = False

-- Ejercicio 3.

-- 1.

sumatoria :: [Integer] -> Integer

sumatoria lista | longitud lista == 0 = 0
                | otherwise = head lista + sumatoria (tail lista)

-- 2.

productoria :: [Integer] -> Integer

productoria lista   | longitud lista == 0 = 1
                    | otherwise = head lista * productoria (tail lista)

-- 3.

maximo :: [Integer] -> Integer

maximo lista    | longitud lista == 0 = 0
                | head lista >= maximo (tail lista) = head lista
                | otherwise = maximo (tail lista)

-- 4.

sumarN :: Integer -> [Integer] -> [Integer]

sumarN n lista  | longitud lista == 0 = []
                | otherwise = (head lista + n) : sumarN n (tail lista)

-- 5.

sumarElPrimero :: [Integer] -> [Integer]

sumarElPrimero lista    | longitud lista == 0 = []
                        | otherwise = sumarN (head lista) lista

-- 6.

sumarElUltimo :: [Integer] -> [Integer]

sumarElUltimo lista | longitud lista == 0 = []
                    | otherwise = sumarN (ultimo lista) lista

-- 7. 

pares :: [Integer] -> [Integer]

pares lista | longitud lista == 0 = []
            | mod (head lista) 2 == 0 = (head lista) : pares (tail lista)
            | otherwise = pares (tail lista)

-- 8. 

multiplosDeN :: Integer -> [Integer] -> [Integer]

multiplosDeN n lista    | longitud lista == 0 = []
                        | mod (head lista) n == 0 = (head lista) : multiplosDeN n (tail lista)
                        | otherwise = multiplosDeN n (tail lista)

-- 9.

ordenar :: [Integer] -> [Integer]

ordenar lista   | longitud lista == 0 = []
                | otherwise = ordenar (quitar (maximo lista) lista) ++ [maximo lista]

-- Ejercicio 4

-- a)

sacarBlancosRepetidos :: [Char] -> [Char]

sacarBlancosRepetidos lista | longitud lista == 0 = []
                            | longitud lista > 1 && (head lista) == ' ' && (head lista) == head (tail lista) = sacarBlancosRepetidos (tail lista)
                            | otherwise = (head lista) : sacarBlancosRepetidos (tail lista)

-- b)

--Funciones auxiliares
sacarBlancoInicioFinal :: [Char] -> [Char]

sacarBlancoInicioFinal lista    | longitud lista == 0 = []
                                | (head lista) == ' ' = sacarBlancoInicioFinal (tail lista)
                                | (ultimo lista) == ' ' = removerUltimo (lista)
                                | otherwise = lista

contarPalabras :: [Char] -> Integer

contarPalabras lista    | longitud lista == 0 = 1
                        | (head (sacarBlancoInicioFinal (sacarBlancosRepetidos (lista)))) == ' ' = contarPalabras (tail (sacarBlancoInicioFinal (sacarBlancosRepetidos (lista)))) + 1
                        | otherwise = contarPalabras (tail (sacarBlancoInicioFinal (sacarBlancosRepetidos (lista))))


-- c)

--Función auxiliar
sacarBlancosRepetidosInicioFinal :: [Char] -> [Char]

sacarBlancosRepetidosInicioFinal lista  | longitud lista == 0 = []
                                        | (head lista) == ' ' = sacarBlancoInicioFinal (sacarBlancosRepetidos (tail lista))
                                        | (ultimo lista) == ' ' = removerUltimo (sacarBlancosRepetidos (lista))
                                        | otherwise = sacarBlancosRepetidos lista

--Función auxiliar


--Por qué cuando devuelvo [[Char]] en ghci aparece ["hola"] (si por ejemplo tendría que aparecer [["hola"]])
palabras :: [Char] -> [[Char]]

palabras lista  | longitud lista == 0 = []
                | (head (sacarBlancoInicioFinal (sacarBlancosRepetidos (lista)))) == ' ' = []
                | otherwise = [head (sacarBlancosRepetidosInicioFinal lista), 'a'] : palabras (tail (sacarBlancosRepetidosInicioFinal lista))

-- d)

palabraMasLarga :: [Char] -> [Char]

palabraMasLarga lista   | longitud lista == 0 = []

-- e)

aplanar :: [[Char]] -> [Char]

aplanar lista   | longitud lista == 0 = []
                | otherwise = head lista ++ aplanar (tail lista)

-- f)

aplanarConBlancos :: [[Char]] -> [Char]

aplanarConBlancos lista     | longitud lista == 0 = []
                            | otherwise = head lista ++ [' '] ++ aplanarConBlancos (tail lista)

-- g)

nBlancos :: Integer -> [Char]

nBlancos n  | n == 0 = [' ']
            | otherwise = ' ' : nBlancos (n - 1)

aplanarConNBlancos :: [[Char]] -> Integer -> [Char]

aplanarConNBlancos lista n  | longitud lista == 0 = []
                            | longitud lista > 1 = head lista ++ nBlancos n ++ aplanarConNBlancos (tail lista) n
                            | otherwise = head lista ++ aplanarConNBlancos (tail lista) n

addVal :: Int -> [Int] -> [[Int]]

addVal i [] = []
addVal i (x:xs) =  [i,x] : addVal i xs