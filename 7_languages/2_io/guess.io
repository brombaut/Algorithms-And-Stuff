tries := 10
guess := nil
secret := (Random value * 100) floor
stdio := File standardInput

while(tries > 0 and guess != secret,
  ("You have " .. (tries asNumber) .. " tries left. Insert number:") println
  guess := stdio readLine asNumber
  if( guess < secret, "Too low" println )
  if( guess > secret, "Too high" println )
  tries = tries - 1
)

if( guess == secret,
  ("You found the secret number! It was " .. secret asString) println,
  ("You failed to find the secret number. It was " .. secret asString) println
)
