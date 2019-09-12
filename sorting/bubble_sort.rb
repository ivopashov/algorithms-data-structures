# O(n2) algo which is slow. Doing it for the exercise

def bubble_sort(array)
  already_sorted = 0

  while already_sorted < array.size - 1 do
    0.upto(array.size - already_sorted - 2).each do |index|
      swap(array, index, index + 1) if array[index] > array[index + 1]
    end

    already_sorted += 1
  end

  array
end

def swap(array, i, j)
  array[i], array[j] = array[j], array[i]
end


p bubble_sort [5, 1, 2, 5, 1, 6, 8, 10]
