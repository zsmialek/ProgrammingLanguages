-- Zach Smialek 
-- Chapter One
-- CSCI 400

module ChapterOne where

import Data.Char(isUpper)
import Data.List
negsInList set = length [ x | x <- set, x < 0 ]

oddsInList set = length [ x | x <- set, x `mod` 2 /= 0 ]

capsInList letters = length [ l | l <- letters, isUpper l ]

sumOdd set = sum [ x | x <-set, x `mod` 2 /= 0 ]

getQuantities quantities = [fst x | x <- quantities]

getPrices prices = [snd x | x <-prices]

getTotal total =  sum [fst x * snd x | x <-total]

doubleAll double = [[2*val | val<-sublist] | sublist<-double] 

doubleFirstList double = [2*val| val<- head double] 

doubleSecondList set = [2*val | val<-set !! 1]  

sumListItems nested = [ sum [x | x <-subset] | subset <- nested ]

