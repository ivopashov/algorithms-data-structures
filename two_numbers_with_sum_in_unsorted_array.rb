# find two numbers in an unsorted array that some up to a specific number

# [10, 1, 30, 40, 20, 50]
# required sum 90

# => [40, 50]

# we will iterate the array and save compliments to the desired
# sum as we go in memory. While iterating the array, we will check if the current number
# has a compliment in the in memory store and of so voila

require 'set'

def find_numbers_with_specific_sum(sequence, desired_sum)
  return [] if sequence.empty? || sequence.size == 1

  compliments = Set.new

  sequence.each do |number|
    return [number, desired_sum - number] if compliments.include?(number)

    compliments.add desired_sum - number
  end
end

# running for [10, 1, 30, 40, 20, 50] with desired sum 90
puts find_numbers_with_specific_sum [10, 1, 30, 40, 20, 50], 90