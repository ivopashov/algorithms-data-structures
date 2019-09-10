# find peak element in an array as defined by >= its neighbours
# the naive solution here is to go through them all and see if the condition is fulfilled. That is O(n)
# the trick with this one is to see that binary search can be used which brings the time complexity to nlogn

# get the middle element and if it is peak great. Otherwise if the element on the left if greater, a peak would be found in the
# left subarray. Analogously for the righy one. The really tricky part is to see why. Plot values as a graph and see
# what cases you might have. That makes things very clear.



def find_peak(array, low, high, length)
  return 'empty array' if array.empty?
  middle = low + (high - low) / 2

  if (middle == 0 || array[middle] > array[middle - 1]) && (middle == length - 1 || array[middle] > array[middle + 1])
    return array[middle]
  elsif (middle > 0 && array[middle] < array[middle - 1])
    find_peak array, low, middle - 1, length
  else
    find_peak array, middle + 1, high, length
  end
end

def print_peak(arr)
  p find_peak arr, 0, arr.size - 1, arr.size
end

print_peak [1, 2, 1]
print_peak []
print_peak [1]
print_peak [1, 2]
print_peak [2, 1]





