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
