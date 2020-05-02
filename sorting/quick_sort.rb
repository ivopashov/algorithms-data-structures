def quick_sort(array, start, finish)
  return if start > finish

  index = partition(array, start, finish)

  quick_sort(array, start , index - 1)
  quick_sort(array, index + 1, finish)

  array
end

def partition(array, start, finish)
  pivot = array[start..finish].sample

  x = start
  y = finish

  loop do
    break if x >= y

    x += 1 while(array[x] < pivot)
    y -= 1 while(array[y] > pivot)

    array[x] , array[y] = array[y], array[x]
  end

  return y
end

array = [30, 40, 10, 20, 50, 80, 70, 60, 90, 100].shuffle

quick_sort(array, 0, array.length - 1)
