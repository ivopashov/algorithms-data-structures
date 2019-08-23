def binary_search(array, number)
  return false if array.length == 0

  middle_index = array.length / 2
  middle_element = array[middle_index]

  if number > middle_element
    binary_search(array[(middle_index + 1)..-1], number)
  elsif number > middle_element
    binary_search(array[0...middle_index], number)
  else
    return true
  end
end

p binary_search([1, 2, 3], 1) #true
p binary_search([1, 2, 3], 10) #false