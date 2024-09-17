def each_pair(items)
  i= 0
  while i < items.size - 1
    yield(items[i], items[i+1])
    i += 1
  end
end

def each_zip(as, bs)
  count = [as.size, bs.size].min
  cs = []
  for i in 0...count
    c = yield(as[i], bs[i])
    cs.push(c)
  end
end

items = [1, 3, 7, -5, -10, -10]
each_pair(items) do |a, b|
  if b > a 
    puts "going up"
  elsif b < a
    puts "going down"
  else 
    puts "steady"
  end
end

each_pair(items) do |a, b|
  puts a + b
  puts "\n"
end

#this allows you to customize the usage of a certain function
#Ruby doesnt really allow for Higher order functions directly but this is how it would be done 
letters =  ['a', 'b', 'c']
zs = each_zip(items, letters) {|x,y| puts "#{x}#{y}"}
puts zs