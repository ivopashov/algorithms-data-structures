def sort_recursively(stack)
  if !stack.empty?
    temp = stack.pop
    sort_recursively stack
    insert_sorted temp, stack
  end
end

def insert_sorted(x, stack)
  if stack.empty? || stack[-1] > x #peek
    stack.push x
  else
    temp = stack.pop
    insert_sorted x, stack
    stack.push temp
  end
end

stack = [1, 5, 2, 6, 10]
sort_recursively stack
p stack