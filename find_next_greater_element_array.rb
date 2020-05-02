# Given an array A of size N having distinct elements,
# the task is to find the next greater element for each element of
# the array in order of their appearance in the array. If no such element
# exists, output -1
# 1 3 2 4 => 3 4 4 -1

# 4 3 2 1 => -1 -1 -1 -1

def find_next_greater(array)
  return array if array.nil? || array.empty?
  return [-1] if array.size == 1

  stack = []
  stack.push << 0
  aux_array = Array.new(array.size) { 0 }

  for i in (1...array.size)
    if array[i] > array[i - 1]
      while !stack.empty? && stack.last < array[i]
        aux_array[stack.pop] = array[i]
      end

      stack.push i
    else
      stack.push i
    end
  end

  while !stack.empty?
    aux_array[stack.pop] = -1
  end

  aux_array
end

p find_next_greater [1, 3, 2, 4]
p find_next_greater [4, 3, 2, 1]
