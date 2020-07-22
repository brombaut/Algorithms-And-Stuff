# Fibonacci sequence starts with two 1s, and each subsequent number is the sum of the two number that came before.
# Write a program to find the nth fibonacci number. 
# As a bonus, solve the problem with recursion and with loops
recfib := method(
  n,
  if( n <= 2,
    1,
    recfib(n-1) + recfib(n-2)
  )
)
recfib(4) println

loopfib := method(n,
  if( n <= 2,
    1,
    n_1 := 1
    n_2 := 1
    sum := 2
    for(i, 3, n,
      sum = n_1 + n_2
      n_2 = n_1
      n_1 = sum
    )
    sum
  )
)
loopfib(4) println

# Change / to return 0 if the denominator is zero
prevDivision := Number getSlot("/")
Number / = method( denominator, if(denominator == 0, 0, prevDivision(denominator)) )
(10 / 2) println
(10 / 0) println

# Add up all numbers in a 2-d array
List sum2d := method( reduce( accum, line, accum + line sum, 0  ))
x := list(
  list( 1, 2, 3 ),
  list( 4, 5, 6 ),
  list( 7, 8, 9 )
)
x sum2d println

# Add a slot called myAverage to a list that computes the average of all the numbers in a list.
# What happens if there are no numbers in a list?
List myAverage := method(sum / size)
list(1, 2, 3) myAverage println

# Raise an Io exception if any items in the list are not a number
List strictSum := method(reduce(accum, item,
  if( not (item isKindOf(Number)),  Exception raise("Only numbers allowed") )
  accum + item
))
List strictAverage := method( strictSum / size )
# list(1,2,"a") strictAverage println  # will raise an exception


# Write a prototype for a 2-d list. 
# The dim(x, y) method should allocate a list of y lists that are x elements long. 
List2D := List clone
dim := method(x, y, List2D clone setSize(y) mapInPlace(_, List clone setSize(x)) )
dim(5, 2) println
# set(x, y, value) should set a value, and get(x, y) should return that value.
List2D set := method(x,y,value, at(y) atPut(x,value))
List2D get := method(x,y, at(y) at(x))
l := dim(5,2)
l set(2,1,"foo")
l get(2,1) println

# Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list
List2D transpose := method(
  other := dim(size, at(0) size)
  foreach(y,row, row foreach(x,value, other set(y,x,value)))
  other
)
l := dim(2,2)
l set(0,0,1)
l set(1,0,2)
l set(0,1,3)
l set(1,1,4)
l println
l transpose println


# Write the matrix to a file, and read a matrix from a file
List2D with := method( source,
  result :=dim(source size, source at(0) size)
  source foreach(y,row, row foreach(x,value, result set(x,y,value)))
  result
)
List2D serializeTo := method(path, File open(path) write(serialized) close)
List2D serializeFrom := method(path, with(doFile(path)))
l serializeTo("list.io")
m := List2D serializeFrom("list.io")
l println
m println


# Write a program that gives you 10 tries to guess a random number from 1 - 100. 
# If you like, give a hint of "hotter" or "colder" after the first guess
# see guess.io
