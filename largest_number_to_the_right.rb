# substitute each number with the largest to the right
# put -1 as the last one as it has nothing to the right

# input [7, 2, 4, 5, 3, 2]
# output [7, 5, 5, 5, 3, -1]

def execute(array)
  return array if array.size < 2

  max = array[array.size - 1]

  (array.size - 2).downto(0).each do |index|
    if array[index] > max
      max = array[index]
    else
      array[index] = max
    end
  end

  array[-1] = -1

  array
end

p execute([7, 2, 4, 5, 3, 2]) == [7, 5, 5, 5, 3, -1]