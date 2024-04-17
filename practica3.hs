-- 1. a)

f :: Int -> Int
f 1 = 8
f 4 = 131
f 16 = 16

-- b)

g :: Int -> Int
g 8 = 16
g 16 = 4
g 131 = 1

-- c)

h :: Int -> Int
h x = f (g (x))


k :: Int -> Int
k x = g (f (x))


-- 2. a)

absoluto :: Int -> Int
absoluto x  | x < 0 = x * (-1)
            | otherwise = x

-- b)

maximoabsoluto :: Int -> Int -> Int
maximoabsoluto x y  |   (absoluto x) >= (absoluto y) = (absoluto x)
                    |   (absoluto y) > (absoluto x) = (absoluto y)

-- c)

maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z   | (x >= y) && (x >= z) = x
                | (y >= x) && (y >= z) = y
                | (z >= x) && (z >= y) = z

-- 4. f)

posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (x, y, z)  | (mod x 2) == 0 = 0
                        | (mod y 2) == 0 = 1
                        | (mod z 2) == 0 = 2
                        | otherwise = 4

-- 7.

absolutoFloat :: Float -> Float
absolutoFloat x | x < 0 = x * (-1)
                | otherwise = x

distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (x, y, z) (a, b, c) | True = (absolutoFloat (x - a)) + (absolutoFloat (y - b)) + (absolutoFloat (z - c)) 
