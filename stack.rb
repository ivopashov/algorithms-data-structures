class Stack
  def initialize
    @stack = []
  end

  def push(item)
    @stack << item
  end

  def pop
    @stack.pop
  end

  def empty?
    @stack.empty?
  end

  def size
    @stack.size
  end
end