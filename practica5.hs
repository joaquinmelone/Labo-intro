-- Ejercicio 1

-- 1.
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Redundant bracket" #-}

-- Cómo funciona x:xs, por qué x es el primer elemento de la lista que mandes y xs es el resto, si por ejemplo en ghci yo escribo [4,5] : []
-- la devolución es [[4,5]], por qué en este caso se comporta como si fuera un head y un tail, y no simplemente como un constructor de listas

longitud :: [t] -> Int

longitud [] = 0
longitud (x:xs) = 1 + longitud xs

 
-- 2.

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
                    | head lista == head (tail lista) = todosIguales(tail lista)
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

-- 9.

ordenar :: [Integer] -> [Integer]

ordenar lista   | longitud lista == 0 = []
                                    

