-- 1)
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
                | 


-- 7)

todosDigitosIguales :: Int -> Bool

todosDigitosIguales x   | x < 10 = True
                        | otherwise = (((x `mod` 10) == (x `div` 10)) && (todosDigitosIguales (x `div` 10)))