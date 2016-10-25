-- Zach Smialek
-- CSCI 400: Chapter Three
--
-- Compare Guards and Pattern Matching Below

module ChapterThree where

inList :: (Eq a) => (Num a) => a-> [a] -> [a]
inList target num = [ x | x <- num, x == target ]

square :: (Num a) => a -> a
square num = num * num

squareEvenNumbers :: (Eq a, Num a, Integral a) => [a] -> [a]
squareEvenNumbers set = [ square x | x <- set, x `mod` 2 == 0 ]

courseMajor :: String -> String
courseMajor cls@(x:xs:xxs) = cls ++ " is a " ++ [x] ++ [xs] ++ " course"

threshold :: (Num a, Ord a) => a -> a -> a -> String
threshold p qty thrs

    | total < thrs = "Total is low"
    | thrs == 5 && thrs + 1 <= total && total <= thrs+4 = "Total is medium"
    | total >= thrs && total <= thrs + 9 = "Total is medium"
    | total >= thrs + 10 && total <= thrs + 19 = "Total is high"
    | otherwise = "Total is extraordinary"

    where total = p * qty

lactate :: Double -> Double -> String
lactate heart_rate max_hr
      | ratio >= easy && ratio < aerobic = "easy"
      | ratio >= aerobic && ratio < steadyState = "aerobic"
      | ratio >= steadyState && ratio < anaerobic = "steadyState"
      | ratio >= anaerobic && ratio < competitive = "anaerobic"
      | ratio == competitive = "wow, don't do this for long!"
      | otherwise = "warmup"
      where
        ratio = (heart_rate / max_hr)
        easy        = 0.6
        aerobic     = 0.7
        steadyState = 0.8
        anaerobic   = 0.9
        competitive = 1

calcAreas :: (Num a) => [(a,a)] -> [a]
calcAreas xs = [ area l w | (l, w) <- xs ]
  where area length width = (length * width)

calcTriangleAreas :: (Num a, Fractional a) => [(a,a)] -> [a]
calcTriangleAreas xs = [ area b h | (b, h) <- xs ]
  where area base height = (1/2) * (base * height)
        area :: (Num a, Fractional a) => a -> a -> a

orderTwo :: (Num a, Eq a, Ord a) => [a] -> [a]
orderTwo list
    | list == [] = []
    | head list == last list = [ head list, last list ]
    | head list <= last list = [ head list, last list ]
    | otherwise = [last list, head list ]

orderThree :: (Num a, Eq a, Ord a) => [a] -> [a]
orderThree list

    | head sorted < lastNum && last sorted > lastNum = [head sorted, lastNum, last sorted]
    | head sorted < lastNum && last sorted < lastNum = [head sorted,last sorted, lastNum]
    | head sorted > lastNum && last sorted > lastNum = [lastNum, head sorted, last sorted]

    where 
      firstTwo = take 2 list
      lastNum = last list
      sorted = orderTwo firstTwo

{- Pattern matching is generally perfered, it is cleaner and easier to read.  
 
 If you need to check evaluate a certain property using a guard is the better way to go.  

Also use if there are many condictions guards are the more readable way of writing the code.

If there is a need to deconstruct the data pattern matching is the only way of doing that and they also create a bind to the indentifiers.

In the end guards are almost icing on the cake since the are no more the just a cleaner syntax way of writing if then statments that makes the code cleaner.

If you can do it with pattern matching do it but it gets super messy then it is time to try something different. 
-}
