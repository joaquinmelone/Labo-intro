-- Ejercicio 1

--Función auxiliar
longitud :: (Eq t) => [t] -> Int
longitud [] = 0
longitud (x:xs) = longitud xs + 1

--Función auxiliar
sumarLista :: [Int] -> Int
sumarLista [] = 0
sumarLista (x:xs) = sumarLista xs + x

atajaronSuplentes :: [(String, String)] -> [Int] -> Int -> Int
atajaronSuplentes (x:xs) goles totalesGolesTorneo = totalesGolesTorneo - sumarLista(goles)


-- Ejercicio 2

--Función auxiliar
pertenece :: String -> [String] -> Bool
pertenece _ [] = False
pertenece elemento (x:xs)   | elemento == x = True
                            | otherwise = pertenece elemento xs

--Función auxiliar
aplanar :: [(String, String)] -> [String]
aplanar [] = []
aplanar ((x,y):xs) = x : y : (aplanar xs) 

equiposValidos :: [(String, String)] -> Bool
equiposValidos [] = True
equiposValidos ((x,y):xs)   | pertenece x (aplanar xs) || pertenece y (aplanar xs) = False
                            | x == y = False
                            | otherwise = equiposValidos xs


-- Ejercicio 3

--Función auxiliar. Iesima posición de atrás para adelante, arrancando desde 1
iesimaPosicion :: Int -> [Int] -> Int
iesimaPosicion posicion (x:xs)  | posicion == longitud (x:xs) = x
                                | otherwise = iesimaPosicion posicion xs

-- Función auxiliar
division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b

porcentajeDeGoles :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeGoles arq ((x,y):xs) goles  | pertenece (arq) (aplanar [(x,y)]) = division ((iesimaPosicion (longitud ((x,y):xs)) goles) * 100) (sumarLista(goles))
                                        | otherwise = porcentajeDeGoles arq xs goles

-- Ejercicio 4 a

--Función auxiliar
minimoLista :: [Int] -> Int
minimoLista [x] = x
minimoLista (x:xs)  | x <= minimoLista(xs) = x
                    | otherwise = minimoLista(xs)

--Función auxiliar
adjuntarArqueroGoles :: [(String, String)] -> [Int] -> [(String, Int)]
adjuntarArqueroGoles [] _ = []
adjuntarArqueroGoles ((x,y):xs) goles = (y, head(goles)) : adjuntarArqueroGoles xs (tail (goles))

--Función auxiliar
perteneceElementoTupla :: Int -> [(String, Int)] -> String
perteneceElementoTupla _ [(x,y)] = x
perteneceElementoTupla elemento ((x,y):xs)  | elemento == y = x
                                            | otherwise = perteneceElementoTupla elemento xs

vallaMenosVencida :: [(String, String)] -> [Int] -> String
vallaMenosVencida ((x,y):xs) goles = perteneceElementoTupla (minimoLista (goles)) (adjuntarArqueroGoles ((x,y):xs) goles) 