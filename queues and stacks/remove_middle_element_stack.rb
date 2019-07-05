def remove_middle_element(stack, l, n = 0)
  if !stack.empty?
    temp = stack.pop
    current = n
    n += 1
    remove_middle_element stack, l, n
    p "#{stack} #{temp} #{n} #{l / 2}"
    stack.push(temp) if current != l / 2
  end
end

stack = [1, 2, 3, 4, 5]
remove_middle_element stack, stack.size
p stack