stack = [1, 2, 3, 4, 5]

def reverse(stack, iterations = stack.size)
  return if iterations.zero?

  num = stack.pop
  iterations -= 1
  put_in_bottom stack, num, iterations
  reverse stack, iterations
end

def put_in_bottom(stack, num, iterations)
  if iterations.zero?
    stack.push num
    return
  end

  temp = stack.pop
  put_in_bottom stack, num, (iterations -=1)
  stack.push temp
end

p stack
reverse stack
p stack
