def quick_sort(array, start, finish)
  return if start > finish

  index = partition(array, start, finish)
  p "index: #{index}"
  p "array: #{array}"
  quick_sort(array, start , index - 1)
  quick_sort(array, index + 1, finish)

  array
end

def partition(array, start, finish)
  p "partition for #{array[start..finish]}"
  pivot = array[start..finish].sample
  # p "starting with array: #{array}"
  # p "start and finish: #{start} #{finish}"
  p "pivot #{pivot}"

  x = start
  y = finish

  loop do
    break if x >= y

    x += 1 while(array[x] < pivot)
    y -= 1 while(array[y] > pivot)

    # p "swapping #{array[x]} and #{array[y]}"

    array[x] , array[y] = array[y], array[x]
    # p array
  end

  return y
end

array = [30, 40, 10, 20, 50, 80, 70, 60, 90, 100].shuffle

quick_sort(array, 0, array.length - 1)


