-- Write a sort that takes a list and returns a sorted list

module Main where
  mySort [] = []
  mySort list = min:rest
    where min = minimum list
          rest = mySort( filter (/= min) list )
