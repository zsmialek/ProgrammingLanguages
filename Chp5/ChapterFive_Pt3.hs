-- Zach Smialek
-- Chapter 5 Pt 3
--
module ChapterFive_Pt3 where

getUserName :: String -> String
getUserName [] = []
getUserName (x:xs) 
  | x /= at = [x] ++ getUserName xs
  | otherwise = []
  where at = '@'

numAs :: [Int] -> Int
numAs scores = length ( filter ( \xs -> xs >= 90 )  scores )

totalDiscount :: (Num a) => a -> [a] -> a
totalDiscount p x = foldl (\acc x -> acc + ( x * p) ) 0 x

totalWithDiscount :: (Num a) => a -> [a] -> a
totalWithDiscount p x = (foldr (\acc x -> acc + x) 0 x) - totalDiscount p x

discountedItems :: (Num a) => a -> [a] -> [a]
discountedItems p x = foldr (\x acc -> (x - x*p):acc) [] x

anyBigNumbers :: Int -> [Int] -> Bool
anyBigNumbers thres x = foldr (\x acc -> if x > thres then True else acc) False x

multTableRow :: Int -> [Int]
multTableRow x = map ($x) [(1*),(2*),(3*),(4*),(5*),(6*),(7*),(8*),(9*),(10*)]

f1 :: (Num a, Fractional a) => a-> a
f1 x = 2*x + 3

f2 :: (Num a, Fractional a) =>a -> a
f2 x = x*x

f3 :: (Num a, Fractional a) => a -> a
f3 x = 0.5*x - 1.5

--testInverses f1 f2  
--  | (f1 . f2) 1 == (f2 . f1) 1 = True
--  | otherwise = False

--testInverses :: f->g -> Bool
testInverses f1 f2 
  | map (f1 .f2) [1,34,56,7,-7,3,3,-2,-1] == map (f2 . f1 ) [1,34,56,7,-7,3,3,-2,-1] = True
  | otherwise = False
-- and_1 (repeat False) returns False while and_2 ( repeat False ) function gets stuck in a loop.
-- Since repeat is an infinte list, foldl cannot reach an empty list to break out of the function
-- call.  
