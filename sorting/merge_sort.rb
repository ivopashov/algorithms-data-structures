# central idea is to merge two sorted arrays on every step
# as this is O(n)

# next central idea is to split the collection is such a way that
# you are able to have sorted subarrays. This is done in the recursive step
# until we have 1 item collections which are sorted naturally

def merge(array_a, array_b)
  a_index = 0
  b_index = 0
  result = []

  while a_index < array_a.size && b_index < array_b.size do
    if array_a[a_index] > array_b[b_index]
      result << array_b[b_index]
      b_index += 1
    else
      result << array_a[a_index]
      a_index += 1
    end
  end

  (a_index...array_a.size).each { |index| result << array_a[index] }
  (b_index...array_b.size).each { |index| result << array_b[index] }

  return result
end

def merge_sort(array)
  return array if array.size == 1

  left_half = merge_sort array[0...(array.size / 2)]
  right_half = merge_sort array[(array.size / 2)...array.size]

  p "merging #{left_half} #{right_half}"
  return merge left_half, right_half
end

p merge_sort [2, 3, 1, 4]
