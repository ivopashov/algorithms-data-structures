# find the n-th fibonacci number
# 0 1 1 2 3 5 8 13 21 34

def fibonacci(n)
  return 0 if n == 1
  return 1 if n == 2

  return fibonacci(n -1) + fibonacci(n - 2)
end

puts fibonacci 8 # 13