# quadratic time so not good as general
# Go through all indexes one by one and figure out the max/min for it
# So we have two nested loops basically

def selection_sort(array)
  # go through the second last as the last one will be sorted by that time

  0.upto(array.size - 2).each do |i|
    local_minimum = i

    (i + 1).upto(array.size - 1).each do |j|
      local_minimum = j if array[j] < array[i]
    end

    swap(array, i, local_minimum) if i != local_minimum
  end

  array
end

def swap(array, i, j)
  array[i], array[j] = array[j], array[i]
end

p selection_sort [5, 1, 2, 5, 1, 6, 8, 10]
