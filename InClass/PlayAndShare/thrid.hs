convertToOz :: String -> Int -> Int
convertToOz "gallons" x = x*128
convertToOz "cups" x = x*8
convertToOz "quarts" x = x*32
convertToOz "pints" x = x*16
convertToOz "ounces" x = x
convertToOz x y = 0

firstPair :: [a] -> [b] -> (a,b)
firstPair (x:_) (y:_) = (x,y)

multiFirstTwo :: (Num a) => [a] -> [a]
multiFirstTwo l@(x:y:_) = [x*y] ++ tail ( tail(l) )

area ::  (Show a)=> (Num a)  => (a,a) -> String
area (a,b) = "The area of the rectangle with height " ++ show(b) ++ " and width " ++ show(a) ++ " is " ++ show(a*b)

width :: (Num a) => (a,a) -> a
width (w,_) = w

height :: (Num a) => (a,a) -> a
height (_,h) = h

tellArea :: (Show a) => (a,a) -> String
tellArea (w,h) = 
