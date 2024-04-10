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