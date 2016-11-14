bigCubes :: [Int] -> [Int]
bigCubes x =filter(>500) $ ( map (^3) x)

lottaBiggest :: [Integer] -> [Integer]
lottaBiggest x = replicate 4 $ maximum x

--powers :: Int -> [Int]
--powers p = 
