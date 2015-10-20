def down_from(maximum, increment)
  numbers = [] ; i = 0
  while i < maximum
    puts "A the top i is #{i}"
    numbers.push(i)

    i += increment
    puts "Numbers now: ", numbers
    puts "At the bottom is #{i}"
  end
  return numbers
end

numbers = down_from(6,1)

puts "The numbers:"

# remember you can write this 2 other ways?
numbers.each {|num| puts num }
