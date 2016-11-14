import Data.Char

even_cubes l1 = [x*x*x | x <- l1, x `mod` 2 == 0]
only_big collection thresh = [ x | x <- collection, x > thresh]
no_diagonal range = [(i,j) | i <- range, j <- range, i /= j]
diagonal end_point = [(i, j) | i <- [0..end_point], j <- [0..end_point], i==j]
count_odd range = length [x | x <- range, x `mod` 2 /= 0]
even_odd_pairs range collection = [ (even, odd) | even <- range, odd <- collection, even `mod` 2 == 0 && odd `mod` 2 /= 0]
remove_digits str = [s | s <- str, isLetter s || isPunctuation s]
ends collection = [ last sublist | sublist <- collection] 
