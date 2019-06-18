# You are given a list of n-1 integers and these integers are in the range of 1 to n.
# There are no duplicates in list.
# One of the integers is missing in the list.
# Write an efficient code to find the missing integer.

# Example :
# I/P    [1, 2, 4, ,6, 3, 7, 8]
# O/P    5

def missing_number(sequence)
  # the trick here is to know that the sum of the first n integers is n * (n + 1) / 2
  sum = (sequence.size + 1) * (sequence.size + 2) / 2

  sequence.each do |number|
    sum -= number
  end

  return sum
end

puts "Missing number in {1, 2, 4, 5, 6} sequence is:"
puts missing_number [1, 2, 4, 5, 6]