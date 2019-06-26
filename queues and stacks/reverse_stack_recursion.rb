def reverse(stack)
  if !stack.empty?
    temp = stack.pop
    reverse stack
    insert_at_bottom temp, stack
  end
end

def insert_at_bottom(x, stack)
  if stack.empty?
    stack.push x
  else
    temp = stack.pop
    insert_at_bottom x, stack
    stack.push temp
  end
end

stack = [1, 2, 3]
reverse stack
p stack == [3, 2, 1]