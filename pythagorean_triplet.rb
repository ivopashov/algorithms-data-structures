# Within an array of unsorted integers find if pythagorean triplet is present

def pythagorean_triplet_present?(array)
  # this is N + NLogN for the transofmation and the sort
  squared_sorted_array = array.map { |i| i * i }.sort { |a, b| a <=> b }

  # use that a2 + b2 = c2 so take c2 and try to find a2 + b2 in the remaining sorted array (two_numbers_with_sum_in_sorted_array.rb)
  (array.size - 1).downto(3).each do |index|
    c = squared_sorted_array[index]
    # this is n * n complexity. Potentially go over all possible c (n - 2) and for each iterate remaining array to find and b
    result, a, b = find_two_numbers_with_sum_in squared_sorted_array[0...index], c
    if result
      return [Math.sqrt(a), Math.sqrt(b), Math.sqrt(c)]
    end
  end

  return []
end

def find_two_numbers_with_sum_in(array, sum)
  start = 0
  finish = array.size - 1

  loop do
    return false if start >= finish

    current_sum = array[start] + array[finish]
    return true, array[start], array[finish] if current_sum == sum

    if current_sum > sum
      finish -= 1
    end

    if current_sum < sum
      start += 1
    end
  end

  return false
end

p pythagorean_triplet_present?([1, 10, 4, 8, 3, 1, 2, 5]) == [3.0, 4.0, 5.0] # [3, 4, 5]
p pythagorean_triplet_present?([1, 10, 4, 8, 3, 1, 2, 11]) == []
