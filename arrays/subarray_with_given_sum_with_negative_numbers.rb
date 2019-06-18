# Given an unsorted array of integers, find a continous subarray which adds to 0

# use the fact if sum at index i is X and then becomes X again at index j, that means that between j and i the sum is 0

def subarray_with_zero_sum(array, desired_sum)
  return false, 0, 0 if array.size == 0

  if array.size == 1
    return [array[0] == desired_sum, 0, 0]
  end

  sum_at = {}
  sum = 0

  (0...array.size).each do |index|
    sum += array[index]

    if sum_at[sum]
      return [true, sum_at[sum] + 1, index]
    else
      sum_at[sum] = index
    end
  end

  return [false, 0, 0]
end

# Corner cases
p subarray_with_zero_sum([10], 0) == [false, 0, 0]
p subarray_with_zero_sum([0], 0) == [true, 0, 0]
p subarray_with_zero_sum([], 10) == [false, 0, 0]

p subarray_with_zero_sum([1, 4, -2 , -1, -1], 0) == [true, 1, 4]
p subarray_with_zero_sum([1, 4, -2 , -1, 10], 0) == [false, 0, 0]