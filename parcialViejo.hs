--Ejercicio 2
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use null" #-}
{-# HLINT ignore "Use uncurry" #-}
{-# HLINT ignore "Redundant bracket" #-}

longitud :: (Eq t) => [t] -> Int
longitud lista  | lista == [] = 0
                | otherwise = longitud (tail lista) + 1

perteneceTuplaLista :: String -> [(String, String)] -> Bool
perteneceTuplaLista candidato listaFormulaPresidencial   | longitud listaFormulaPresidencial == 0 = False
                                                    | candidato == fst (head listaFormulaPresidencial) || candidato == snd (head listaFormulaPresidencial) = True
                                                    | otherwise = perteneceTuplaLista candidato (tail listaFormulaPresidencial)

formulasValidas :: [(String, String)] -> Bool
formulasValidas listaFormulaPresidencial    | longitud listaFormulaPresidencial == 0 = True
                                            | fst (head listaFormulaPresidencial) == snd (head listaFormulaPresidencial) = False
                                            | perteneceTuplaLista (fst (head listaFormulaPresidencial)) (tail listaFormulaPresidencial) || perteneceTuplaLista (snd (head listaFormulaPresidencial)) (tail listaFormulaPresidencial) = False
                                            | otherwise = formulasValidas (tail listaFormulaPresidencial)

-- Ejercicio 1

--Función auxiliar
sumarLista :: [Int] -> Int
sumarLista lista    | longitud lista == 0 = 0
                    | otherwise = head lista + sumarLista (tail lista)

votosEnBlanco :: [(String, String)] -> [Int] -> Int -> Int
votosEnBlanco listaFormulaPresidencial listaVotos votosTotales = votosTotales - sumarLista listaVotos

-- Ejercicio 3

--Función auxiliar
maximo :: [Int] -> Int
maximo lista    | longitud lista == 1 = head lista
                | head lista >= maximo (tail lista) = head lista
                | otherwise = maximo (tail lista)

--Función auxiliar
division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos presidente listaFormulaPresidencial listaVotos = division ((maximo listaVotos) * 100) (sumarLista listaVotos)

-- Ejercicio 4

--Función auxiliar
conseguirPosicionLista :: Int -> [(String, String)] -> [Int] -> (String, String)
conseguirPosicionLista numero listaTuplasString listaNumeros    | numero == head listaNumeros = head (listaTuplasString)
                                                                | otherwise = conseguirPosicionLista numero (tail listaTuplasString) (tail listaNumeros)

proximoPresidente :: [(String, String)] -> [Int] -> String
proximoPresidente listaFormulaPresidencial listaVotos = fst (conseguirPosicionLista (maximo listaVotos) (listaFormulaPresidencial) (listaVotos))