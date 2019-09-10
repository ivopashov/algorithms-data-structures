# for each element in an array find the next greater element to the right of it
# for the last element that will always be -1
# if no such element is found just output -1

# Example

# [13, 6, 7, 12]
# 13 -> -1
# 6 -> 12
# 7 -> 13
# 12 -> -1

def next_greater_element(array)
  stack = []
  stack.push array[0]
  results = {}

  (1...array.size).each do |index|
    current = array[index]

    while stack.any? && stack.last < current do
      results[stack.pop] = current
    end

    stack.push current
  end

  stack.each do |element|
    results[element] = -1
  end

  results
end

p next_greater_element [13, 6, 7, 12]