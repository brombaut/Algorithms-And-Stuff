-- Write a function that takes a list and returns the same list in reverse
module Main where

  reverse2([]) = []
  reverse2(h:t) = reverse2(t) ++ [h]
