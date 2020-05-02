# [9, 9, 1, 2] => [9, 2, 9, 1]

# 1. start from end and find the first index to be swapped for
# smaller number

# 2. swap that index with the max number from the second "half"

# 3. sort the second "half"

def find_no_greater_same_digits(digits)
  return digits if digits.empty? || digits.nil? || digits.size == 1

  index = digits.size - 2

  while index >= 0 && (digits[index] < digits[index + 1])
    index -= 1
  end

  to_be_swapped_index = index > -1 ? index : nil

  return digits if to_be_swapped_index.nil?

  max_index_to_swap = find_max digits, to_be_swapped_index
  digits[to_be_swapped_index], digits[max_index_to_swap] = digits[max_index_to_swap], digits[to_be_swapped_index]
  digits[(to_be_swapped_index + 1)..] = digits[(to_be_swapped_index + 1)..].sort!
  digits
end

def find_max(array, to_be_swapped_index)
  max = nil
  max_index = nil

  for num in ((to_be_swapped_index + 1)...array.length).to_a
    if max.nil? || array[num] > max
      max = array[num]
      max_index = num
    end
  end

  max_index
end

digits = [9, 9, 1, 2] # => [9, 2, 9, 1]

# digits = [1, 2, 3, 4]

p find_no_greater_same_digits digits
