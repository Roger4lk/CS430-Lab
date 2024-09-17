
#get first two letters of all items in a list
planets = ["mars", "venus"]
puts planets.map {|a| a[0,2]}

#gets all numbers between 0 and 100
numbers = [-57, 20, 100]
puts numbers.filter {|b| b > 0 && b <= 100}
  