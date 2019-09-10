numbers = [1, 2, 3, 4, 5]

def sum(array, index, total)
  next_index = index.succ

  if next_index < array.size
    total += sum(array, next_index, total)
  end

  return total += array[index]
end

p sum numbers, 0, 0
