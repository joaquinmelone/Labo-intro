-- Ejercicio 1
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant ==" #-}

hayQueCodificar :: Char -> [(Char, Char)] -> Bool
hayQueCodificar _ [] = False
hayQueCodificar c (x:xs)    | c == fst x = True
                            | otherwise = hayQueCodificar c xs

-- Ejercicio 2

--Función auxiliar
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece elemento (x:xs)   | elemento == x = True
                            | otherwise = pertenece elemento xs

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char, Char)] -> Int
cuantasVecesHayQueCodificar _ [] _ = 0
cuantasVecesHayQueCodificar c (x:xs) ((y,z):zs)     | hayQueCodificar c ((y,z):zs) == False = 0
                                                    | c == x = 1 + cuantasVecesHayQueCodificar c xs ((y,z):zs)
                                                    | otherwise = cuantasVecesHayQueCodificar c xs ((y,z):zs)

-- Ejercicio 3

--Función auxiliar
cuantasVecesPertenece :: Char -> [Char] -> [(Char, Char)] -> Int
cuantasVecesPertenece _ [] _ = 0
cuantasVecesPertenece elemento (x:xs) ((y,z):zs) = cuantasVecesHayQueCodificar elemento (x:xs) ((y,z):zs)

--Función auxiliar
sacarRepetidos :: [Char] -> [Char]
sacarRepetidos [] = []
sacarRepetidos (x:xs)   | pertenece x xs = sacarRepetidos xs
                        | otherwise = x : sacarRepetidos xs


laQueMasHayQueCodificar :: [Char] -> [(Char, Char)] -> Char
laQueMasHayQueCodificar [x1] _ = x1
laQueMasHayQueCodificar (x1:x2:xs) ((y,z):zs)   | cuantasVecesPertenece (head(sacarRepetidos((x1:xs)))) (sacarRepetidos((x1:x2:xs))) ((y,z):zs) < cuantasVecesPertenece (head(sacarRepetidos((x2:xs)))) (sacarRepetidos((x1:x2:xs))) ((y,z):zs) = laQueMasHayQueCodificar (sacarRepetidos((x2:xs))) ((y,z):zs)
                                                | otherwise = laQueMasHayQueCodificar (sacarRepetidos((x1:xs))) ((y,z):zs)


-- Ejercicio 4 a

--Función auxiliar
devuelveSegundaPosicion :: Char -> [(Char, Char)] -> Char
devuelveSegundaPosicion _ [x] = snd x
devuelveSegundaPosicion elemento ((x,y):xs) | elemento == x = y
                                            | otherwise = devuelveSegundaPosicion elemento xs

codificarFrase :: [Char] -> [(Char, Char)] -> [Char]
codificarFrase [] _ = []
codificarFrase (x:xs) ((y,z):zs)    | hayQueCodificar x ((y,z):zs) == False = x : codificarFrase xs ((y,z):zs)
                                    | otherwise = devuelveSegundaPosicion x ((y,z):zs) : codificarFrase xs ((y,z):zs)