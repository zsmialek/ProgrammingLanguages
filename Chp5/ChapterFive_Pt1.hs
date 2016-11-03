-- Zach Smialek
-- Chapter Five Pt 1
-- 11.3.2016

module ChapterFive_Pt1 where

convert :: (Num a) => a -> a -> a
convert input factor = input * factor

doMetersToFeet = convert 3.28084
doMilesToKM = convert 1.60934

calcSalesTax :: (Num a, Fractional a) => a -> a -> a
calcSalesTax p t = p * t

doGolden = calcSalesTax 0.03
doBoulder = calcSalesTax 0.0341

swap :: (Num a, Num b) => (a,b) ->(b, a)
swap tup = (snd tup, fst tup)

swapAll :: (Num a,Num b) => [(a,b)] -> [(b,a)]
swapAll xs = map swap xs

applyIfTrue ::(Num a) => (a -> a) -> a -> Bool -> a
applyIfTrue f x d
  | d == True = f (x)
  | otherwise = 0

calcArea :: (Num a) => a -> a ->a
calcArea x y = x * y

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

calcAreas :: (Num a) => [a] -> [a] -> [a]
calcAreas w h = zipWith' calcArea w h  
