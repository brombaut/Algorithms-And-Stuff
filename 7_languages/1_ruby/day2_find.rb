# Find out how to access files with and without blocks. What is the benefit of using blocks?
# without block:
f = File.new('day2_file.txt')
text = f.readlines
puts text
f.close

# with block
File.foreach('day2_file.txt') { |s| puts s }

# How do you translate a hash into an array?
hash = { :a => "Hello", :b => "World" }
array = hash.to_a
puts("hash: #{hash.inspect}")
puts("array: #{array.inspect}")

# Can you translate an array into a hash?
array = [ 'a','b','c','d' ]
hashed_array = {}
array.each_with_index { |x, index| hashed_array[index]=x }
puts("array: #{array.inspect}")
puts("hashed_array: #{hashed_array.inspect}")

# Can you iterate through a hash?
hash.each { |k,v| puts "#{k} => #{v}" }

# You can use arrays as stacks. What other data structures can you do?
# Queues, graphs