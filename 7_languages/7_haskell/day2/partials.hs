-- Use a partially applied function to define a function that will return half of a number and another that will append \n to the end of any string

module Main where
  half = (/ 2)
  newlined = tacnoc "\n" -- inverse concat
    where tacnoc tail head = head ++ tail
