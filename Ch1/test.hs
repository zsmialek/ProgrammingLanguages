negsInList set = length [ x | x <- set, x < 0 ]
sumOdds set = sum [ x | x <-set, x `mod` 2 /= 0 ]
getQuantities receipt = head[ first | first <- receipt]
doubleAll set = [ [2*val | subset<-set] | val <-subset]

