# find the n-th fibonacci number

# we will try to save some computation by
# memoization of the already calculated values

# 0 1 1 2 3 5 8 13 21 34

# naive implementation
def fibonacci(n)
  return 0 if n == 1
  return 1 if n == 2

  # check how many times it calculates same value over and over again
  puts "calculating for: #{n}"
  return fibonacci(n - 1) + fibonacci(n - 2)
end

# we use this as a temp store for the already calculated values
$fibonacci_values_hash = {} # avoid global variables outside of coding examples

def fibonacci_with_memoization(n)
  return 0 if n == 1
  return 1 if n == 2
  return $fibonacci_values_hash[n] if $fibonacci_values_hash[n]

  puts "calculating for: #{n}"
  value = fibonacci_with_memoization(n - 1) + fibonacci_with_memoization(n - 2)
  $fibonacci_values_hash[n] = value
  return value
end

puts '=== naive implementation ==='
puts fibonacci 8 # 13

puts '=== optimized implementation ==='
puts fibonacci_with_memoization 8 # 13