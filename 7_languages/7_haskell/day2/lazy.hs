-- Write a function that takes an argument x and returns a lazy sequence that has every third number, starting with x.
-- Then, write a function that includes every fifth number, beginning with y.
-- Combine these functions through composition to return every eighth number, beginning with x+y

module Main where
  every3 x = x:(every3(x + 3))
  every5 y = y:(every5(y + 5))
  every8 x y = zipWith (+) (every3 x) (every5 y)
