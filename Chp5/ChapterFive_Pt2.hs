-- Zach Smialek
-- Chapter 5 Part 2
-- 11.5.2016

module ChapterFive_Pt2 where

paper = [["Computer Games as Motivation for Design Patterns"], ["Design Patterns", "Games", "Pedagogy", "Java"]]
papers = [ 
  [["Test-Driven Learning: Intrinsic Integration of Testing into the CS/SE Curriculum"],
    ["Test-driven learning", "test-driven development","extreme programming", "pedagogy", "CS1"]],
  [["Process Improvement of Peer Code Review and Behavior Analysis of its Participants"],
    ["peer code review", "behavior analysis", "software quality assurance",
      "computer science education", "software engineering"]],
  [["Computer Games as Motivation for Design Patterns"],
    ["Design Patterns", "Games", "Pedagogy", "Java"]],
  [["Killer Killer Examples for Design Patterns"],
    ["Object-orientation", "Design Patterns"]],
  [["Test-First Java Concurrency for the Classroom"],
    ["CS education", "Java", "JUnit", "unit testing", "concurrent programming",
      "tools", "software engineering"]],
  [["Teaching Design Patterns in CS1: a Closed Laboratory Sequence based on the Game of Life"],
    ["Design Patterns", "Game of Life", "CS1", "Laboratory"]] 
  ]
getPaperTitle :: [[a]] -> [a]
getPaperTitle x = head x

getPaperKeywords :: [[a]] -> [a]
getPaperKeywords keyword = last keyword

extractAllKeywords :: [[a]] -> [a]
extractAllKeywords [] = []
extractAllKeywords ( (_:a) : b) = a ++ extractAllKeywords b

keywordInList :: (Eq a) => a -> [a] -> Bool
keywordInList word f = elem word f 

existsPaper :: [Char] -> [[[[Char]]]] -> [[[Char]]]
existsPaper key l = filter (elem key) (extractAllKeywords l)

countPapers :: [Char] -> [[[[Char]]]] -> Int
countPapers key l = length (existsPaper key l)
