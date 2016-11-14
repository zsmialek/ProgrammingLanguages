multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

doubleArea = multThree 2

multThreeF :: (Num a) => a -> a -> a -> a
multThreeF x y z = x * y * z

pctDiscount pct = multThreeF pct

tenPctDiscount = multThreeF 0.1

total :: (Num a) => a -> [a] -> a
total x (y:z:_) = x * y * z

totalTenPct = total 0.1
