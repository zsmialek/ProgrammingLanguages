-- Zach Smialek
-- Chapter 8
-- 11.10.2016

import Control.Monad
import Data.Char

greeting = do
  putStrLn "Enter your name as last, first: "
  input <- getLine
  let lastName = init $ head $ words input
  let firstName = last $ words input
  putStrLn  $ "Hello " ++ firstName
  putStrLn  $ "Do you have any relatives named Joe " ++ lastName ++ " ?"

reverseMe = do
  input <- getLine
  print  $ unwords $ reverse $ words input

sayHi = do
  putStrLn "What is your name? "
  input <- getLine

  when (input == "Bilbo") $ do
    putStrLn "So nice to meet you!"
  putStrLn  "What's up?"

calcArea :: Int -> Int ->Int
calcArea x y = x * y

calcAreas :: [Int] -> [Int] -> [Int]
calcAreas w h = zipWith calcArea w h

printAreas w h = do
  mapM_ print (calcAreas w h)

printDirection dir = do
  when (dir == 'u') $ do 
    putStrLn "UP"
  when (dir == 'd') $ do 
    putStrLn "DOWN"
  when (dir == 'l') $ do 
    putStrLn "LEFT"
  when (dir == 'r') $ do 
    putStrLn "RIGHT"

printDirections xs = do
  forM_ xs (\a -> do 
    putStr $ "You should go "
    printDirection a)
