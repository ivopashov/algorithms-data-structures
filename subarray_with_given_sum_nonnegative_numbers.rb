# Given an unsorted array of nonnegative integers, find a continous subarray which adds to a given number.

# use the fact that when you crawl forward the sum can only get larger

def subarray_with_given_sum(array, desired_sum)
  return false, 0, 0 if array.size == 0

  if array.size == 1
    return [array[0] == desired_sum, 0, 0]
  end

  start_index = 0
  sum = array[0]

  (1...array.size).each do |finish_index|
    if sum < desired_sum
      sum += array[finish_index]
    end

    while sum > desired_sum && start_index < finish_index
      sum -= array[start_index]
      start_index += 1
    end

    return [true, start_index, finish_index] if sum == desired_sum
  end

  return false, 0, 0
end

# Corner cases
p subarray_with_given_sum([10], 11) == [false, 0, 0]
p subarray_with_given_sum([10], 10) == [true, 0, 0]

# Sequence in the beginning
p subarray_with_given_sum([1, 2, 3, 4, 5, 6], 6) == [true, 0, 2]

# Sequence at the end
p subarray_with_given_sum([1, 2, 3, 4, 5, 6], 11) == [true, 4, 5]

# Sequence at the middle
p subarray_with_given_sum([1, 2, 3, 4, 5, 6], 7) == [true, 2, 3]

# Whole array
p subarray_with_given_sum([1, 2, 3, 4, 5, 6], 21) == [true, 0, 5]

# Too big of a sum
p subarray_with_given_sum([1, 2, 3, 4, 5, 6], 22) == [false, 0, 0]

# Too small of a sum
p subarray_with_given_sum([10, 20, 30, 40, 50, 60], 1) == [false, 0, 0]