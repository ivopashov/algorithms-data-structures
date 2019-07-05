# given an array with consecutive numbers 1 to n find the missing one
# [1, 2, 3, 5] the missing is 4
# we use the fact that n ^ n is 0

def find_missing(array, n)
  i = 0

  (1..n).each { |number| i = i ^ number }
  array.each { |number| i = i ^ number }

  i
end

p find_missing([1, 2, 3, 5], 5) == 4
p find_missing([2, 3, 4, 5], 5) == 1
p find_missing([1, 2, 3, 4], 5) == 5