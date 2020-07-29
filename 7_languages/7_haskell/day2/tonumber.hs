-- Write a function to convert a string to a numner. The string should be of the form $2,345,678.99 and can possibly have leading zeros

module Main where
  tonumber (_:noDollarSign) = read noCommas :: Float
    where noCommas = filter (/= ',') noDollarSign
