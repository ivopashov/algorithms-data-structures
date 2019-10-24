# recursive

@max = 1

def maximum_increasing_subsequence_recursive(array)
  recursion_helper(array, array.size - 1)
  @max
end

def recursion_helper(array, n)
  return 1 if n == 0

  max_ending_here = 1

  (0...n).each do |i|
    result = recursion_helper(array, i)

    if (array[i] < array[n] && (result + 1) > max_ending_here)
      max_ending_here = result + 1
    end
  end

  if @max < max_ending_here
    @max = max_ending_here
  end

  return max_ending_here;
end

# DP O(n2)
def maximum_increasing_subsequence_dp(array)
  counts = Array.new(array.size) { 1 }

  (1...array.size).each do |i|
    (0...i).each do |j|
      counts[i] = [counts[i], (counts[j] + 1)].max if array[i] > array[j]
    end
  end

  counts.max
end

# TODO O(nlog(n))

p maximum_increasing_subsequence_dp [10, 22, 9, 33, 21, 50, 41, 60, 80]
p maximum_increasing_subsequence_dp [10, 100, 1000, 20, 11, 12, 13, 14, 15]
p maximum_increasing_subsequence_dp [3, 2, 1]
p maximum_increasing_subsequence_dp [1, 2, 3]

p maximum_increasing_subsequence_recursive [100, 99, 101]
