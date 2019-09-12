# this one is very efficient BUT has a few conditions:
# * works only on integer numbers
# * you must know the range in advance

# O(n + k) where k is the range of numbers
# out of place
# stable
# non comparison

# this draws the main idea in a perfect way
# it works also fine if we don't care about stability
# also note that we don't care about the elements but only about their
# values which in the case of integers is fine
def count_sort_overlysimple(array, max)
  count_array = Array.new(max + 1) { 0 }
  sorted_array = []

  array.each do |number|
    count_array[number] += 1
  end

  count_array.each_with_index do |num, index|
    next if num.zero?

    num.times { sorted_array << index }
  end

  sorted_array
end

# this sort is mostly used as part of radix sort so stability is important
# thus the extra index shuffling back and forth
def count_sort(array, max)
  count_array = Array.new(max + 1) { 0 }
  sorted_array = Array.new(array.size) { 0 }

  array.each do |number|
    count_array[number] += 1
  end

  (1...count_array.size).each do |index|
    count_array[index] += count_array[index - 1]
  end

  # we shift right so that we don't mess up with indexes later
  # can skip though and be extra cautious at the next step
  (count_array.size - 1).downto(1).each do |index|
    count_array[index] = count_array[index - 1]
  end

  count_array[0] = 0
  array.each do |number|
    sorted_array[count_array[number]] = number
    count_array[number] += 1
  end

  sorted_array
end

# note that we pass only the max of the range as an argument
# this can get more efficient if we pass the min also.

p count_sort_overlysimple [9, 4, 1, 7, 9, 1, 2, 0], 9
p count_sort [9, 4, 1, 7, 9, 1, 2, 0], 9
