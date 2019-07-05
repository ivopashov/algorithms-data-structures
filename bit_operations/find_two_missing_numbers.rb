# array with numbers 1 to n has two missing numbers. Find them
# [1, 2, 3, 4, 6, 7, 9, 10] => 5 and 8 are missing

# 1  ->    1
# 2  ->   10
# 3  ->   11
# 4  ->  100
# 5  ->  101
# 6  ->  110
# 7  ->  111
# 8  -> 1000
# 9  -> 1001
# 10 -> 1010

# after first xor-ing of the array and the the 1..n sequence we get 1101 (5 ^ 8)
# The first set bit position of this is 0 (from the left)
# Numbers with set bit on position 0 from the array are [1, 3, 7, 9] and [1, 3, 5, 7, 9] from the (1..n) sequence
# xor-ing the two yields 5 or the first missing numbers. The second is easy

def find_two_missing_numbers(array, n)
  # after this, we would have the ^ of the two missing numbers
  # as they are different we would have at least one set bit
  # we want to find the first starting from the left
  i = xor_arrays(array, (1..n).to_a)

  set_bit_position = 0

  loop do
    break if ((1 << set_bit_position) & i) != 0
    set_bit_position += 1
  end

  array_numbers_with_bits_set = numbers_from_array_with_bit_set_at_position(array, set_bit_position)
  sequence_numbers_with_bits_set = numbers_from_array_with_bit_set_at_position((1..n), set_bit_position)

  first_missing_number = xor_arrays array_numbers_with_bits_set, sequence_numbers_with_bits_set
  second_missing_number = xor_arrays (array << first_missing_number), (1..n).to_a

  [first_missing_number, second_missing_number].sort
end

def numbers_from_array_with_bit_set_at_position(array, position)
  array.select { |num| (1 << position) & num != 0 }
end

def xor_arrays(array_1, array_2)
  (array_1 + array_2).inject(0) { |result, num| result ^ num }
end

p find_two_missing_numbers([1, 2, 3, 4, 6, 7, 9, 10], 10) == [5, 8]
