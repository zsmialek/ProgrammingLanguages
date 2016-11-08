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
