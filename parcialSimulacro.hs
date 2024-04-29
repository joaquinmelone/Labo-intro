import Test.HUnit

--Funcion auxiliar para medir longitud de una lista
longitud :: (Eq t) => [t] -> Int
longitud lista  | lista == [] = 0
                | otherwise = longitud (tail lista) + 1

--Funcion auxiliar que revisa si un elemento pertenece a una lista
pertenece :: (Eq t) => t -> [t] -> Bool

pertenece elemento lista    | longitud lista == 0 = False
                            | elemento == head lista = True
                            | otherwise = pertenece elemento (tail lista)

--Funcion auxiliar que revisa si hay repetidos en una lista adentro de otra lista
hayRepetidos :: [(String, String)] -> Bool

hayRepetidos lista  | longitud lista == 0 = False
                    | pertenece (head lista) (tail lista) = True
                    | pertenece (snd (head lista), fst (head lista)) (tail lista) = True
                    | otherwise = hayRepetidos (tail lista)




relacionesValidas :: [(String, String)] -> Bool
relacionesValidas lista | longitud lista == 0 = True
                        | hayRepetidos lista == True = False
                        | fst (head lista) == snd (head lista) = False
                        | otherwise = relacionesValidas (tail lista)


--Funcion auxiliar que chequea si un elemento pertenece a una tupla dentro de una lista
perteneceTuplaLista :: String -> [(String, String)] -> Bool
perteneceTuplaLista elemento lista  | longitud lista == 0 = False
                                    | elemento == fst (head lista) || elemento == snd (head lista) = True
                                    | otherwise = perteneceTuplaLista elemento (tail lista)

personas :: [(String, String)] -> [String]
personas lista  | longitud lista == 0 = []
                | perteneceTuplaLista (fst (head lista)) (tail lista) && perteneceTuplaLista (snd (head lista)) (tail lista) = personas (tail lista)
                | perteneceTuplaLista (fst (head lista)) (tail lista) = snd (head lista) : personas (tail lista)
                | perteneceTuplaLista (snd (head lista)) (tail lista) = fst (head lista) : personas (tail lista)
                | otherwise = fst (head lista) : snd (head lista) : personas (tail lista)



amigosDe :: String -> [(String, String)] -> [String]
amigosDe persona lista  | longitud lista == 0 = []
                        | perteneceTuplaLista persona [head lista] && persona == fst (head lista) = snd (head lista) : amigosDe persona (tail lista)
                        | perteneceTuplaLista persona [head lista] && persona == snd (head lista) = fst (head lista) : amigosDe persona (tail lista)
                        | otherwise = amigosDe persona (tail lista)


--Función auxiliar
personasEnFormaApariciones :: [(String, String)] -> [(String, Int)]
personasEnFormaApariciones lista    | longitud lista == 0 = []
                                    | otherwise = (fst(head lista), longitud(amigosDe (fst(head lista)) lista)) : (snd(head lista), longitud(amigosDe (snd(head lista)) lista)) : personasEnFormaApariciones (tail lista)

--Función auxiliar
maximo :: [(String, Int)] -> (String, Int)
maximo lista    | longitud lista == 1 = head lista
                | (snd(head lista)) >= (snd (maximo (tail lista))) = head lista
                | otherwise = maximo (tail lista)

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos lista = (fst (maximo (personasEnFormaApariciones lista)))
