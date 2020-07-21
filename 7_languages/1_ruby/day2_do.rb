# print the contents of a 16-item array, 4 items at a time, using only each
a = (1..16).to_a
i = 0
a.each do |item|
  p a[i, 4] if(i % 4 == 0)
  i +=1
end

# now do the same with each_slice in Enrumerable
a.each_slice(4) { |x| p x }

# modify the Tree class so it accepts a hash on its creation
class Tree
  attr_accessor :children, :name

  def initialize(hash)
     @name = hash.keys.first
     @children = []
     hash[@name].each { |n,c| @children << Tree.new(n => c) }
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all(&block)}
  end

  def visit(&block)
    block.call self
  end
end

tree = Tree.new(:granpa => {:father => {:child1 => {}, :child2 => {}}, :uncle => {:child3 => {}}})

tree.visit_all { |n| puts n.name }

# write a simple grep. You will need simple regexp matching. Include line numbers if you like

def grep(filename, phrase)
  File.open(filename) do |f|
    f.each { |line| puts "#{f.lineno}: #{line}" if line[phrase] }
  end
end

grep('day2_file.txt', 'always')