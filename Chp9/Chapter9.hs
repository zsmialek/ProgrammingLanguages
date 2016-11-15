--Zach Smialek
-- Chapter 9
-- 11.12.2016

import Control.Monad
import Data.Char
import System.IO

pigLatin :: [Char] -> [Char]
pigLatin str 
    | head str `elem` vowel = str ++ "way" 
    | otherwise = tail str ++ [head str] ++  "ay"
    where vowel = ['a','i','e','o','y']

lineToPigLatin :: String -> String
lineToPigLatin str = unwords $ map (pigLatin) $ words str

piggly = interact lineToPigLatin

caesar seed ltr = caesar' seed ltr

caesar' seed ltr
    | not $ isAlpha(ltr) = ltr
    | ( ord(ltr) + seed ) > ord('z') = chr $ (( ord(ltr) + seed) `mod` 122) + 96
    | (( ord(ltr) + seed ) < ord('a')) && (( ord(ltr) + seed) > ord('z')) = chr $ (( ord(ltr) + seed) `mod` 90) + 64
    | otherwise = chr $ ord(ltr) + seed

encrypt seed = do
    f <- getContents
    putStrLn $ map (caesar seed) f

encryptFile seed = do
    fStream <- openFile "encryptMe.txt" ReadMode
    toEncrypt <- hGetContents fStream
    putStrLn $ map (caesar seed) toEncrypt
