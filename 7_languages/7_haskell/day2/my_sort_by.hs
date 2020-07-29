-- Write a sort that takes a list and a function that compares its two arguments and then returns a sorted list

module Main where
  import Data.List
  mySortBy _ [] = []
  mySortBy order list = min:rest
    where min = minimumBy order list
          listWithNoMin = filter (/= min) list
          rest = mySortBy order listWithNoMin
