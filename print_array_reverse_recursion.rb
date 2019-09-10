numbers = [1, 2, 3, 4, 5]

def print_in_reverse(array, index)
  next_index = index.succ

  if next_index < array.size
    print_in_reverse(array, next_index)
  end

  p array[index]
end

print_in_reverse numbers, 0
