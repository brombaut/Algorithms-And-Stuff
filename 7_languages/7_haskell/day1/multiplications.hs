-- Write a list comprehension to build a childhood multiplication table. The table would be a list of three-tuples
-- where the first two are integers from 1 - 12, and the third is the product of the first two.

module Main where
  multiplications = [(a,b,a*b) | a <- [1..12], b <- [1..12]]
