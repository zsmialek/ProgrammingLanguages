module ChapterOne where

import Data.Char

#1.1
negsInList set = length [ x | x <- set, x < 0 ]
#1.2
oddsInList set = length [ x | x <- set, x `mod` 2 /= 0 ]
#1.3
capsInList letters = [ l | l <- letters, isUpper l ]
#1.4
sumOdds set = sum [ x | x <-set, x `mod` 2 /= 0 ]
#2.1
