---------------------------------------------------------
--negsInList set = length [ x | x <- set, x < 0 ]
--sumOdds set = sum [ x | x <-set, x `mod` 2 /= 0 ]
--getQuantities receipt = head[ first | first <- receipt]
--doubleAll set =  [[2*val | subset<-set] | val <-subset]
---------------------------------------------------------
inList :: (Eq a) => (Num a) => a-> [a] -> [a]
inList target num = [ x | x <- num, x == target ]

square :: (Num a) => a -> a
square num = num * num

squareEvenNumbers :: (Eq a, Num a, Integral a) => [a] -> [a]
squareEvenNumbers set = [ square x | x <- set, x `mod` 2 == 0 ]

courseMajor :: String -> String
courseMajor cls@(x:xs:xxs) = cls ++ " is a " ++ [x] ++ [xs] ++ " course"

threshold :: (Num a) => a -> a -> a -> String
threshold p qty thrs 
  | total < thrs = "Total is low"
  | total 
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

--orderThree :: (Num a, Eq a Ord a) => [a] -> [a]
--orderThree list
