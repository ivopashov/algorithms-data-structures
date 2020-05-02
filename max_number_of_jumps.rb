# Given an array of integers where each element represents the
# max number of steps that can be made forward from that element.
# The task is to find the minimum number of jumps to reach the end of
# the array (starting from the first element). If an element is 0,
# then cannot move through that element.

# 1 3 5 8 9 2 6 7 6 8 9 => 3
# * *     *             exit

# 2 50 1 1 1 1 1 1 1 1 1 => 2
# *    * * * * * * * * *  exit
# *  *                    exit

def jump(array)
  temp = Array.new(array.size) { nil }

  (array.size - 1).downto(0).each do |index|
    if is_end_reachable?(array, index)
      temp[index] = 1
    else
      temp[index] = calculate_jumps(temp[(index+1)..(index + array[index])])
    end
  end

  temp[0]
end

def is_end_reachable?(array, index)
  (index + array[index]) >= array.size
end

def calculate_jumps(array)
  value = nil
  array.each do |num|
    if num != 0 && (value.nil? || num < value)
      value = num
    end
  end

  return 0 if value.nil?

  value + 1
end

p jump([2, 5, 1, 1, 1, 1]) == 2
p jump([0, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9]) == 0
p jump([1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9]) == 3
