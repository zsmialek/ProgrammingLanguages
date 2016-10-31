-- Zach Smialek
-- 10.30.2016
-- Chapter Four

module ChapterFour where

minimum' :: (Num a, Ord a) => [a] -> a
minimum' [x] = x
minimum' (a:b:xs) 
  | a < b = minimum'(a:xs) 
  | a > b = minimum'(b:xs)

calcSum :: (Num a) => [a] -> a
calcSum [] = 0
calcSum (x:xs) = x + calcSum xs

count :: (Num a) => [a] -> a
count [] = 0
count (x:xs) = 1 + count xs

makeRange :: (Num a, Eq a, Ord a) => a -> a -> [a]
makeRange srt end
  | srt > end = []
makeRange 0 0 = [0]
makeRange srt end = [srt] ++ makeRange (srt+1) end

makeReverseRange :: (Num a, Eq a, Ord a) => a -> a -> [a]
makeReverseRange srt end
  | srt > end = []
makeReverseRange 0 0 = [0]
makeReverseRange srt end = [end] ++ makeReverseRange srt (end - 1)

notInList :: (Num a, Eq a) => a -> [a] -> Bool
notInList y (x:xs)
  | x == y = False
  | otherwise = notInList y xs
notInList x [] = True

square :: (Num a) => a -> a
square x = x * x

squareAll :: (Num a) => [a] -> [a]
squareAll [] = []
squareAll (x:xs) = [square x] ++ squareAll xs

squareIfEven :: (Num a, Eq a, Integral a) => [a] -> [a]
squareIfEven (x:xs)
  | x `mod` 2 == 0 = [square x] ++ squareIfEven xs
  | otherwise = [x] ++ squareIfEven xs
squareIfEven [] = []

squareOnlyEven :: (Num a, Eq a, Integral a) => [a] -> [a]
squareOnlyEven (x:xs)
  | x `mod` 2 == 0 = [square x] ++ squareOnlyEven xs
  | otherwise = squareOnlyEven xs
squareOnlyEven [] = []

merge :: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
  | x < y = x:merge xs (y:ys)
  | otherwise = y:merge (x:xs) ys

mergeSort :: (Ord a) => [a] -> [a] -> [a]
mergeSort [] [] = []
mergeSort x [] = x
mergeSort [] y = y
mergeSort x y = mergesort (x ++ y)

splitInHalf :: [a] -> ([a], [a])
splitInHalf xs = (take n xs, drop n xs)
  where n = (length xs) `div` 2

mergesort :: (Ord a) => [a] -> [a]
mergesort xs
  | (length xs) > 1 = merge (mergesort ls) (mergesort rs)
  | otherwise = xs
  where (ls, rs) = splitInHalf xs

subList :: Int -> Int -> [Int] -> [Int]
subList x y xs
  | y <= 0 = []
  | x > length xs = []
  | x == length xs = []
subList x y [] = []
subList x y xs = [xs!!x] ++ subList (x+1) (y-1) xs
