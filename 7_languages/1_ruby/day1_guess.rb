#!/usr/bin/env ruby


num = rand(10)
done = false
while not done
  puts 'Enter a number between 1 and 10'
  s = gets
  i = s.to_i
  if i == num
    done = true
  elsif i < num
    puts 'Too low'
  else
    puts 'Too high'
  end

end

puts 'You got it!'