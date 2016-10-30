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

squareOnlyEven :: (Num a, Eq a, Integral a) => [a] -> [a]
squareOnlyEven (x:xs)
  | x `mod` 2 == 0 = [square x] ++ squareOnlyEven xs
  | otherwise = [x] ++ squareOnlyEven xs
squareOnlyEven [] = []

