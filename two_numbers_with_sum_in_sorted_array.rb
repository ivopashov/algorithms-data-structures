# find two numbers in a sorted array that some up to a specific number

# [1, 10, 20, 30, 40, 50]
# required sum 90

# => [40, 50]

# we use the fact that the array is sorted and use
# a technique called two pointer technique to achive
# O(n)

# first pointer starts at the beginning and the second
# starts at the end. Depending on their some we move the first forth
# or the second back depending on how the sum compares to the desired sum

def find_numbers_with_specific_sum(sequence, desired_sum)
  return [] if sequence.empty? || sequence.size == 1

  first_pointer = 0
  second_pointer = sequence.size - 1

  loop do
    break if first_pointer > second_pointer

    sum = sequence[first_pointer] + sequence[second_pointer]
    if sum == desired_sum
      return [sequence[first_pointer], sequence[second_pointer]]
    end

    if sum > desired_sum
      second_pointer -= 1
    else
      first_pointer += 1
    end
  end
end

puts 'running for [1, 10, 20, 30, 40, 50] with desired sum 90'
puts find_numbers_with_specific_sum [1, 10, 20, 30, 40, 50], 90 # 40, 50
puts 'running for [1, 10, 20, 30, 40, 50] with desired sum 11'
puts find_numbers_with_specific_sum [1, 10, 20, 30, 40, 50], 11 # 1, 10
