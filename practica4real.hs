-- 1)
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
fibonacci :: Int -> Int

fibonacci   n | n == 0 = 0
fibonacci   n | n == 1 = 1
fibonacci   n | n > 0 = fibonacci (n - 1) + fibonacci (n - 2)

-- 2)

parteEntera :: Float -> Int

parteEntera  x  | x >= 0 && x < 1 = 0
                | x < 0 && x > -1 = -1
                | x < 0 = parteEntera (x + 1) - 1
                | otherwise = parteEntera (x - 1) + 1

-- 3)

esDivisible :: Int -> Int -> Bool

esDivisible x y | x < y = False
                

-- 4)

sumaImpares :: Int -> Int

sumaImpares x   | x == 1 = 3
                | otherwise = sumaImpares (x - 1) + 3


-- 5)

medioFact :: Int -> Int

medioFact n | n == 0 = 1
            | n == 1 = 1
            | otherwise = medioFact(n - 2) * n


-- Funciones auxiliares

ultimoDigito :: Int -> Int 
ultimoDigito x = mod x 10

sacarUnidadesPos :: Int -> Int 
sacarUnidadesPos x = div x 10

sacarUnidades :: Int -> Int 
sacarUnidades x | x < 0 = -sacarUnidadesPos (-x)
                | otherwise = sacarUnidadesPos x

cantDigitos :: Int -> Int
cantDigitos n | n < 10 = 1
              | otherwise = 1 + cantDigitos ( sacarUltimo n )
              where sacarUltimo n = div n 10

--sacarPrimerDigito :: Int -> Int. Podría agarrar la cantidad de dígitos de N y multiplicarlo por el primer dígito, es decir, que te quede ponele 454 - 400 = 54, entonces estás sacando el primer dígito

-- 6)

sumaDigitos :: Int -> Int

sumaDigitos n   | n < 10 = n
                | otherwise = sumaDigitos(sacarUnidades(n)) + ultimoDigito(n)
              

-- 7)

todosDigitosIguales :: Int -> Bool
todosDigitosIguales x   | x < 10 = True
                        | otherwise = (((x `mod` 10) == (x `div` 10)) && (todosDigitosIguales (x `div` 10)))


-- 8)

iesimoDigito :: Int -> Int -> Int

iesimoDigito n i    | cantDigitos(n) == i = ultimoDigito(n)
                    | otherwise = iesimoDigito (sacarUnidades (n)) i


-- 9)

esCapicua :: Int -> Bool

esCapicua  n    | n < 10 = True
                | n >= 10 && n <= 99 = (sacarUnidades(n) == ultimoDigito(n))